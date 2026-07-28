import { createServerClient } from '@supabase/ssr'
import { NextRequest, NextResponse } from 'next/server'

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

function requestRejection(request: NextRequest): NextResponse | undefined {
  const mediaType = request.headers.get('content-type')?.split(';', 1)[0]?.trim().toLowerCase()
  if (mediaType !== 'application/json') {
    return NextResponse.json({ error: 'content type must be application/json' }, { status: 415 })
  }

  const origin = request.headers.get('origin')
  const fetchSite = request.headers.get('sec-fetch-site')
  if (fetchSite === 'cross-site' || fetchSite === 'none') {
    return NextResponse.json({ error: 'cross-site login requests are not allowed' }, { status: 403 })
  }

  if (origin) {
    if (origin === request.nextUrl.origin) return undefined
    return NextResponse.json({ error: 'cross-origin login requests are not allowed' }, { status: 403 })
  }

  if (fetchSite === 'same-origin' || fetchSite === 'same-site') return undefined
  return NextResponse.json({ error: 'login request provenance is required' }, { status: 403 })
}

function authFailure(error: unknown): NextResponse {
  const candidate = error && typeof error === 'object' ? error as { code?: unknown, status?: unknown } : undefined
  const code = typeof candidate?.code === 'string' ? candidate.code : undefined
  const status = typeof candidate?.status === 'number' ? candidate.status : undefined

  if (code === 'invalid_credentials') {
    return NextResponse.json({ error: 'Invalid email or password' }, { status: 401 })
  }
  if (status === 429 || code?.includes('rate_limit')) {
    return NextResponse.json({ error: 'Too many sign-in attempts. Please try again later.' }, { status: 429 })
  }
  if (status !== undefined && status >= 500) {
    return NextResponse.json({ error: 'Unable to sign in. Please try again later.' }, { status: 503 })
  }
  return NextResponse.json({ error: 'Unable to sign in. Please try again later.' }, { status: 500 })
}

export async function POST(request: NextRequest) {
  const rejectedRequest = requestRejection(request)
  if (rejectedRequest) return rejectedRequest

  let body: unknown
  try {
    body = await request.json()
  } catch {
    return NextResponse.json({ error: 'request body must be valid JSON' }, { status: 400 })
  }

  const payload = loginPayload(body)
  if (!payload) {
    return NextResponse.json({ error: 'email and password are required' }, { status: 400 })
  }

  try {
    const response = NextResponse.json({ ok: true })
    const supabase = createServerClient(
      process.env.NEXT_PUBLIC_SUPABASE_URL!,
      process.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY!,
      {
        cookies: {
          getAll() {
            return request.cookies.getAll()
          },
          setAll(cookiesToSet) {
            cookiesToSet.forEach(({ name, value, options }) => response.cookies.set(name, value, options))
          },
        },
      },
    )
    const { error } = await supabase.auth.signInWithPassword(payload)
    if (error) {
      return authFailure(error)
    }

    return response
  } catch (error) {
    return authFailure(error)
  }
}
