import { describe, expect, it } from 'vitest'

import {
  UserValidationError,
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
