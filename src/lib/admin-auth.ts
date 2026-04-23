import { cookies } from 'next/headers'

const ADMIN_COOKIE_NAME = 'abubae_admin'

export function getAdminMasterKey() {
  return process.env.ADMIN_MASTER_KEY || 'master'
}

export async function isAdminSession() {
  const cookieStore = await cookies()
  return cookieStore.get(ADMIN_COOKIE_NAME)?.value === getAdminMasterKey()
}

export async function setAdminSession() {
  const cookieStore = await cookies()
  cookieStore.set(ADMIN_COOKIE_NAME, getAdminMasterKey(), {
    httpOnly: true,
    sameSite: 'lax',
    secure: process.env.NODE_ENV === 'production',
    path: '/admin',
    maxAge: 60 * 60 * 8,
  })
}

export async function clearAdminSession() {
  const cookieStore = await cookies()
  cookieStore.delete(ADMIN_COOKIE_NAME)
}
