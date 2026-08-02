import { mkdirSync, writeFileSync } from 'node:fs'
import { dirname, join } from 'node:path'
import { fileURLToPath } from 'node:url'

import { loadRoundsMatching, renderSeedSql } from './generate-written-seed.mjs'

const scriptDirectory = dirname(fileURLToPath(import.meta.url))
const repositoryDirectory = dirname(scriptDirectory)
const outputDirectory = join(repositoryDirectory, 'supabase', 'seeds')

export function loadNewRounds() {
  return loadRoundsMatching(/^20(2[2-6])-\d+\.candidates\.json$/)
}

export function outputFileFor(round) {
  return join(outputDirectory, `${round.year}-${round.round}-written.sql`)
}

export function main() {
  const rounds = loadNewRounds()
  const questionCount = rounds.reduce((total, round) => total + round.questions.length, 0)
  const choiceCount = questionCount * 4

  mkdirSync(outputDirectory, { recursive: true })
  for (const round of rounds) {
    writeFileSync(outputFileFor(round), renderSeedSql([round]), 'utf8')
  }

  console.log(`generated ${rounds.length} files (one per round), ${questionCount} questions and ${choiceCount} choices -> ${outputDirectory}`)
}

const currentFile = fileURLToPath(import.meta.url)
if (process.argv[1] && process.argv[1] === currentFile) main()
