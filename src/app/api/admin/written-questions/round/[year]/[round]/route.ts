import { MasterAuthorizationError, requireMaster, type MasterAuthClient } from '@/lib/master-auth'
import { createClient } from '@/lib/supabase/server'

type Context = {
  params: Promise<{ year: string; round: string }>
}

type RpcError = {
  code?: unknown
  message?: unknown
  details?: unknown
  hint?: unknown
}

type AuthenticatedSupabaseClient = MasterAuthClient & {
  rpc: (fn: string, args: Record<string, unknown>) => Promise<{ data: unknown; error: RpcError | null }>
}

const EXAM_SLUG = 'jeongchogi'

function parsePositiveInteger(value: string): number | undefined {
  if (!/^[1-9]\d*$/.test(value)) return undefined
  const parsed = Number(value)
  return Number.isSafeInteger(parsed) ? parsed : undefined
}

function errorText(error: RpcError): string {
  return [error.message, error.details, error.hint]
    .filter((value): value is string => typeof value === 'string')
    .join(' ')
    .toLowerCase()
}

function rpcFailure(error: RpcError): Response {
  const details = errorText(error)

  if (details.includes('written round not found') || details.includes('exam not found')) {
    return Response.json({ error: 'round not found' }, { status: 404 })
  }
  return Response.json({ error: 'unable to delete round' }, { status: 500 })
}

export async function DELETE(_request: Request, { params }: Context) {
  try {
    const { year, round } = await params
    const parsedYear = parsePositiveInteger(year)
    const parsedRound = parsePositiveInteger(round)
    if (!parsedYear || !parsedRound) {
      return Response.json({ error: 'year and round must be positive integers' }, { status: 400 })
    }

    const supabase = await createClient() as unknown as AuthenticatedSupabaseClient
    try {
      await requireMaster(supabase)
    } catch (error) {
      if (error instanceof MasterAuthorizationError) {
        return Response.json(
          { error: error.role === 'anonymous' ? 'authentication required' : 'master access is required' },
          { status: error.role === 'anonymous' ? 401 : 403 },
        )
      }
      throw error
    }

    const { error } = await supabase.rpc('delete_written_round', {
      p_exam_slug: EXAM_SLUG,
      p_year: parsedYear,
      p_round: parsedRound,
    })
    if (error) return rpcFailure(error)

    return new Response(null, { status: 204 })
  } catch {
    return Response.json({ error: 'unable to delete round' }, { status: 500 })
  }
}
