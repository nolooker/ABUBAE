import { describe, expect, it } from 'vitest'

import {
  UserValidationError,
  validateCreateUserInput,
  validateMembershipInput,
  validateSuspensionInput,
  validateUserId,
} from './user-admin'

describe('validateUserId', () => {
  it('accepts a UUID', () => {
    expect(validateUserId('d7d68087-a5a8-4b6e-a0aa-550a4f5937a1')).toBe('d7d68087-a5a8-4b6e-a0aa-550a4f5937a1')
  })

  it.each(['not-a-uuid', '00000000-0000-0000-0000-00000000000z', 42, null])('rejects malformed ids: %o', (id) => {
    expect(() => validateUserId(id)).toThrow('id must be a UUID')
  })
})

describe('validateMembershipInput', () => {
  it.each(['free', 'standard', 'premium'])('accepts a valid membership type: %s', (membershipType) => {
    expect(validateMembershipInput({ membershipType })).toEqual({ membershipType })
  })

  it.each([
    [{ membershipType: 'gold' }, 'membershipType must be'],
    [{ membershipType: 'free', extra: 'nope' }, 'unknown field'],
    [{}, 'membershipType must be'],
  ])('rejects invalid membership payloads: %o', (input, message) => {
    expect(() => validateMembershipInput(input)).toThrow(UserValidationError)
    expect(() => validateMembershipInput(input)).toThrow(message)
  })

  it.each([null, undefined, 'string', 42, []])('rejects non-object payloads: %o', (input) => {
    expect(() => validateMembershipInput(input)).toThrow('payload must be an object')
  })
})

describe('validateSuspensionInput', () => {
  it.each([true, false])('accepts a valid suspended flag: %s', (suspended) => {
    expect(validateSuspensionInput({ suspended })).toEqual({ suspended })
  })

  it.each([
    [{ suspended: 'yes' }, 'suspended must be a boolean'],
    [{ suspended: true, extra: 'nope' }, 'unknown field'],
  ])('rejects invalid suspension payloads: %o', (input, message) => {
    expect(() => validateSuspensionInput(input)).toThrow(UserValidationError)
    expect(() => validateSuspensionInput(input)).toThrow(message)
  })
})

describe('validateCreateUserInput', () => {
  it('accepts a valid payload and trims email/nickname', () => {
    expect(validateCreateUserInput({
      email: '  runner@example.com  ',
      password: 'password123',
      nickname: '  아부배러너  ',
      role: 'user',
    })).toEqual({
      email: 'runner@example.com',
      password: 'password123',
      nickname: '아부배러너',
      role: 'user',
    })
  })

  it('accepts a master role and a null nickname', () => {
    expect(validateCreateUserInput({
      email: 'master@example.com',
      password: 'password123',
      nickname: null,
      role: 'master',
    })).toEqual({
      email: 'master@example.com',
      password: 'password123',
      nickname: null,
      role: 'master',
    })
  })

  it('defaults a missing nickname to null', () => {
    expect(validateCreateUserInput({
      email: 'runner@example.com',
      password: 'password123',
      role: 'user',
    })).toEqual({
      email: 'runner@example.com',
      password: 'password123',
      nickname: null,
      role: 'user',
    })
  })

  it.each([
    [{ password: 'password123', role: 'user' }, 'email is required'],
    [{ email: '  ', password: 'password123', role: 'user' }, 'email is required'],
    [{ email: 'runner@example.com', password: '123', role: 'user' }, 'password must be at least 6 characters'],
    [{ email: 'runner@example.com', role: 'user' }, 'password must be at least 6 characters'],
    [{ email: 'runner@example.com', password: 'password123', nickname: 42, role: 'user' }, 'nickname must be a string'],
    [{ email: 'runner@example.com', password: 'password123', role: 'owner' }, 'role must be'],
    [{ email: 'runner@example.com', password: 'password123' }, 'role must be'],
    [{ email: 'runner@example.com', password: 'password123', role: 'user', extra: 'nope' }, 'unknown field'],
  ])('rejects invalid create-user payloads: %o', (input, message) => {
    expect(() => validateCreateUserInput(input)).toThrow(UserValidationError)
    expect(() => validateCreateUserInput(input)).toThrow(message)
  })
})
