import { describe, expect, it } from 'vitest'

import { createPlaywrightConfig } from './playwright.config'

describe('createPlaywrightConfig', () => {
  it('does not start a web server when either master E2E credential is missing', () => {
    expect(createPlaywrightConfig({}).webServer).toBeUndefined()
    expect(createPlaywrightConfig({ MASTER_TEST_EMAIL: 'master@example.com' }).webServer).toBeUndefined()
    expect(createPlaywrightConfig({ MASTER_TEST_PASSWORD: 'password' }).webServer).toBeUndefined()
  })

  it('starts a local server only when credentials are complete and no external URL is supplied', () => {
    const config = createPlaywrightConfig({
      MASTER_TEST_EMAIL: 'master@example.com',
      MASTER_TEST_PASSWORD: 'password',
    })

    expect(config.webServer).toMatchObject({ url: 'http://127.0.0.1:3000' })
  })
})
