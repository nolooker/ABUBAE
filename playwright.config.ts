import { defineConfig, devices } from '@playwright/test'

type E2EEnvironment = {
  CI?: string
  E2E_BASE_URL?: string
  MASTER_TEST_EMAIL?: string
  MASTER_TEST_PASSWORD?: string
}

export function createPlaywrightConfig(environment: E2EEnvironment = {
  CI: process.env.CI,
  E2E_BASE_URL: process.env.E2E_BASE_URL,
  MASTER_TEST_EMAIL: process.env.MASTER_TEST_EMAIL,
  MASTER_TEST_PASSWORD: process.env.MASTER_TEST_PASSWORD,
}) {
  const hasMasterTestCredentials = Boolean(environment.MASTER_TEST_EMAIL && environment.MASTER_TEST_PASSWORD)
  const baseURL = environment.E2E_BASE_URL ?? 'http://127.0.0.1:3000'

  return {
    testDir: './tests/e2e',
    forbidOnly: Boolean(environment.CI),
    retries: environment.CI ? 2 : 0,
    reporter: 'list' as const,
    use: {
      baseURL,
      trace: 'retain-on-failure' as const,
    },
    webServer: hasMasterTestCredentials && !environment.E2E_BASE_URL ? {
      command: 'npm run dev',
      url: baseURL,
      reuseExistingServer: !environment.CI,
      timeout: 120_000,
    } : undefined,
    projects: [
      { name: 'chromium', use: { ...devices['Desktop Chrome'] } },
    ],
  }
}

export default defineConfig(createPlaywrightConfig())
