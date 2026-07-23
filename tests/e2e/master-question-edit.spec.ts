import { expect, test, type Locator, type Page } from '@playwright/test'

const testEmail = process.env.MASTER_TEST_EMAIL
const testPassword = process.env.MASTER_TEST_PASSWORD
const questionPath = '/exam/jeongchogi/questions/written/2021/1'

type OriginalQuestion = {
  content: string
  choices: string[]
  correctChoices: boolean[]
  explanation: string
}

test.describe('master inline question editing', () => {
  test.skip(!testEmail || !testPassword, 'requires MASTER_TEST_EMAIL and MASTER_TEST_PASSWORD')

  test('edits a question, grades with the new answer, and restores the original content', async ({ page }) => {
    await loginAsMaster(page)
    await page.goto(questionPath)
    await page.getByRole('button', { name: 'Edit question', exact: true }).click()

    const editDialog = questionEditDialog(page)
    await expect(editDialog).toBeVisible()
    const original = await readOriginalQuestion(editDialog)

    const replacementContent = `[E2E] Master edit ${Date.now()}`
    const replacementAnswerIndex = original.correctChoices.findIndex((isCorrect) => !isCorrect)
    if (replacementAnswerIndex < 0) {
      throw new Error('The E2E question must have at least one incorrect choice to verify grading.')
    }

    try {
      await editDialog.getByLabel('Question', { exact: true }).fill(replacementContent)
      await setCorrectChoice(editDialog, replacementAnswerIndex)
      await editDialog.getByRole('button', { name: 'Save', exact: true }).click()
      await expect(editDialog).toBeHidden()

      await page.reload()
      await expect(page.getByRole('heading', { level: 1 })).toContainText(replacementContent)

      await page.getByRole('radio').nth(replacementAnswerIndex).check()
      await page.locator('button.ab-btn-orange').first().click()
      await page.getByRole('dialog').locator('button.ab-btn-orange').click()

      const gradedQuestion = page.locator('article').filter({
        has: page.locator('h3', { hasText: replacementContent }),
      })
      await expect(gradedQuestion.locator('.border-emerald-300')).toBeVisible()
    } finally {
      await restoreOriginalQuestion(page, original)
    }
  })
})

async function loginAsMaster(page: Page) {
  await page.goto('/login')
  await page.locator('input[type="email"]').fill(testEmail!)
  await page.locator('input[type="password"]').fill(testPassword!)
  await page.locator('form button[type="submit"]').click()
  await page.waitForURL('**/mypage')
}

function questionEditDialog(page: Page) {
  return page.getByRole('dialog').filter({ has: page.getByLabel('Question', { exact: true }) })
}

async function readOriginalQuestion(dialog: Locator): Promise<OriginalQuestion> {
  return {
    content: await dialog.getByLabel('Question', { exact: true }).inputValue(),
    choices: await Promise.all([1, 2, 3, 4].map((number) => dialog.getByLabel(`Choice ${number}`, { exact: true }).inputValue())),
    correctChoices: await Promise.all([1, 2, 3, 4].map((number) => dialog.getByLabel(`Correct choice ${number}`, { exact: true }).isChecked())),
    explanation: await dialog.getByLabel('Explanation', { exact: true }).inputValue(),
  }
}

async function setCorrectChoice(dialog: Locator, answerIndex: number) {
  for (const index of [0, 1, 2, 3]) {
    await dialog.getByLabel(`Correct choice ${index + 1}`, { exact: true }).setChecked(index === answerIndex)
  }
}

async function restoreOriginalQuestion(page: Page, original: OriginalQuestion) {
  await page.goto(questionPath)
  await page.getByRole('button', { name: 'Edit question', exact: true }).click()

  const dialog = questionEditDialog(page)
  await expect(dialog).toBeVisible()
  await dialog.getByLabel('Question', { exact: true }).fill(original.content)
  for (const [index, choice] of original.choices.entries()) {
    await dialog.getByLabel(`Choice ${index + 1}`, { exact: true }).fill(choice)
  }
  for (const [index, isCorrect] of original.correctChoices.entries()) {
    await dialog.getByLabel(`Correct choice ${index + 1}`, { exact: true }).setChecked(isCorrect)
  }
  await dialog.getByLabel('Explanation', { exact: true }).fill(original.explanation)
  await dialog.getByRole('button', { name: 'Save', exact: true }).click()
  await expect(dialog).toBeHidden()

  await page.reload()
  await expect(page.getByRole('heading', { level: 1 })).toContainText(original.content)
}
