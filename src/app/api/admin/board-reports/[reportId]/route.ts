import { BoardValidationError, validateBoardId } from '@/lib/board'
import { BoardNotFoundError, createBoardRepository } from '@/lib/board-repository'
import { MasterAuthorizationError, requireMaster, type MasterAuthClient } from '@/lib/master-auth'
import { createClient } from '@/lib/supabase/server'

type Context = {
  params: Promise<{ reportId: string }>
}

export async function PATCH(_request: Request, context: Context) {
  try {
    const reportId = validateBoardId((await context.params).reportId)
    const supabase = await createClient()
    try {
      await requireMaster(supabase as unknown as MasterAuthClient)
    } catch (error) {
      if (error instanceof MasterAuthorizationError) {
        return Response.json(
          { error: error.role === 'anonymous' ? 'authentication required' : 'master access is required' },
          { status: error.role === 'anonymous' ? 401 : 403 },
        )
      }
      throw error
    }

    const repository = createBoardRepository(supabase)
    return Response.json(await repository.resolveReport(reportId))
  } catch (error) {
    if (error instanceof BoardValidationError) {
      return Response.json({ error: error.message }, { status: 400 })
    }
    if (error instanceof BoardNotFoundError) {
      return Response.json({ error: 'report not found' }, { status: 404 })
    }
    return Response.json({ error: 'unable to resolve the report' }, { status: 500 })
  }
}
