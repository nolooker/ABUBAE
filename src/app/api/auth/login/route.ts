import { createClient } from '@/lib/supabase/server'

type LoginPayload = {
  email: string
  password: string
}

function loginPayload(body: unknown): LoginPayload | undefined {
  if (!body || typeof body !== 'object' || Array.isArray(body)) return undefined

  const entries = Object.entries(body)
  if (entries.length !== 2 || entries.some(([key]) => key !== 'email' && key !== 'password')) return undefined

  const { email, password } = body as Record<string, unknown>
  if (typeof email !== 'string' || !email.trim() || typeof password !== 'string' || !password) return undefined

  return { email: email.trim(), password }
}

export async function POST(request: Request) {
  let body: unknown
  try {
    body = await request.json()
  } catch {
    return Response.json({ error: 'request body must be valid JSON' }, { status: 400 })
  }

  const payload = loginPayload(body)
  if (!payload) {
    return Response.json({ error: 'email and password are required' }, { status: 400 })
  }

  try {
    const supabase = await createClient()
    const { error } = await supabase.auth.signInWithPassword(payload)
    if (error) {
      return Response.json({ error: 'Invalid email or password' }, { status: 401 })
    }

    return Response.json({ ok: true })
  } catch {
    return Response.json({ error: 'Unable to sign in. Please try again.' }, { status: 500 })
  }
}
