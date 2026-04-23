'use server'

import { redirect } from 'next/navigation'
import { clearAdminSession, getAdminMasterKey, setAdminSession } from '@/lib/admin-auth'

export async function loginAdmin(formData: FormData) {
  const code = String(formData.get('code') || '').trim()

  if (code !== getAdminMasterKey()) {
    redirect('/admin/login?error=invalid')
  }

  await setAdminSession()
  redirect('/admin')
}

export async function logoutAdmin() {
  await clearAdminSession()
  redirect('/admin/login')
}
