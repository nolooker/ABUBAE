# Auth session bridge report

## Review follow-up — 2026-07-28

The login boundary now requires `application/json` and same-site provenance before it creates a Supabase client. A supplied `Origin` must exactly match the request origin; when `Origin` is absent, the route accepts only `Sec-Fetch-Site: same-origin` or `same-site`. Cross-site and `none` fetch metadata are rejected.

Resolved Supabase Auth errors are classified without returning provider messages: only `code: invalid_credentials` returns `401`; rate limits return `429`; provider `5xx` errors return `503`; unclassified and rejected errors return a redacted `500` response. The client navigates only for the exact JSON payload `{ "ok": true }`.

The route constructs a `NextResponse` before the server-side sign-in and wires the SSR client cookie `setAll` callback to that response. The focused route test uses a fake SSR client that invokes this callback and verifies the returned response includes the session cookie. A credential-backed browser E2E login remains intentionally unavailable: no live Supabase credentials or database access were used.

### TDD evidence

- RED: `npm test -- src/app/api/auth/login/route.test.ts src/components/auth/AuthForm.test.tsx` reported five intended failures: missing route response cookie, missing request provenance/media-type guard, rate-limit misclassification, and two malformed `2xx` response navigations.
- GREEN: the same focused command passed with 2 files and 16 tests.

### Verification

- `npm test`: 28 files, 194 tests passed.
- `npm run lint`: passed.
- `npx tsc --noEmit`: passed.
- `npm run build`: compiled and completed TypeScript with local credentials temporarily hidden, then failed as expected while prerendering `/admin/login` because Supabase URL/API key configuration was intentionally absent. The local environment file was restored. The build also emitted the pre-existing multi-lockfile Turbopack-root warning.
- `git diff --check`: passed before the review-fix commit.

## Safe-next follow-up — 2026-07-28

The client now rejects ASCII control characters in both raw and percent-decoded `next` values. It also resolves accepted paths against `window.location.origin` and falls back to `/mypage` unless the result stays on the application origin. Valid internal paths and queries continue to navigate normally.

- RED: raw and encoded LF, CR, and tab values (including `/%0A//attacker.example`) each bypassed the previous protocol-relative-path check.
- GREEN: `npm test -- src/components/auth/AuthForm.test.tsx` passed with 17 tests.
- Final verification: `npm test` passed with 28 files and 200 tests; `npm run lint`, `npx tsc --noEmit`, and `git diff --check` passed.
