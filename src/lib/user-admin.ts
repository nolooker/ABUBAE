export type MembershipType = 'free' | 'standard' | 'premium'

export type AdminUserSummary = {
  id: string
  email: string
  nickname: string | null
  membershipType: MembershipType
  role: 'user' | 'master'
  createdAt: string
  suspended: boolean
}

export type MembershipInput = {
  membershipType: MembershipType
}

export type SuspensionInput = {
  suspended: boolean
}

export class UserAdminError extends Error {
  constructor(message = 'user data is unavailable') {
    super(message)
    this.name = 'UserAdminError'
  }
}

export class UserNotFoundError extends UserAdminError {
  constructor() {
    super('user not found')
    this.name = 'UserNotFoundError'
  }
}

export class UserValidationError extends Error {
  readonly name = 'UserValidationError'
}

const uuid = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i

type RecordValue = Record<string, unknown>

function isValidMembershipType(value: unknown): value is MembershipType {
  return value === 'free' || value === 'standard' || value === 'premium'
}

function recordValue(value: unknown): RecordValue {
  if (typeof value !== 'object' || value === null || Array.isArray(value)) {
    throw new UserValidationError('payload must be an object')
  }
  return value as RecordValue
}

export function isValidUserId(value: unknown): value is string {
  return typeof value === 'string' && uuid.test(value)
}

export function validateUserId(value: unknown): string {
  if (!isValidUserId(value)) throw new UserValidationError('id must be a UUID')
  return value
}

export function validateMembershipInput(value: unknown): MembershipInput {
  const input = recordValue(value)
  const expectedKeys = ['membershipType']

  for (const key of Object.keys(input)) {
    if (!expectedKeys.includes(key)) throw new UserValidationError(`unknown field: ${key}`)
  }
  if (!isValidMembershipType(input.membershipType)) {
    throw new UserValidationError('membershipType must be "free", "standard", or "premium"')
  }

  return { membershipType: input.membershipType }
}

export function validateSuspensionInput(value: unknown): SuspensionInput {
  const input = recordValue(value)
  const expectedKeys = ['suspended']

  for (const key of Object.keys(input)) {
    if (!expectedKeys.includes(key)) throw new UserValidationError(`unknown field: ${key}`)
  }
  if (typeof input.suspended !== 'boolean') {
    throw new UserValidationError('suspended must be a boolean')
  }

  return { suspended: input.suspended }
}
