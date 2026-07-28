This is a [Next.js](https://nextjs.org) project bootstrapped with [`create-next-app`](https://nextjs.org/docs/app/api-reference/cli/create-next-app).

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

## Admin Access

The admin shell is available at `/admin`. Sign in with the normal Supabase login; only users whose server-managed `public.users.role` is `master` can access it.

## Supabase Data Flow

The written-exam flow reads published questions through the server-only
`src/lib/written-question-repository.ts` repository and its service-role
Supabase client. Correct answers are never sent by the public question page;
grading also runs on the server.

Some legacy pages still use `src/lib/data.ts`. Under the final question and
choice RLS rules, that legacy browser client cannot read those protected
tables and may fall back to `src/lib/mock-data.ts`. It is not the data path for
the written-exam runner.

Setup order:

1. Open the Supabase project.
2. Go to SQL Editor.
3. Paste and run `supabase-setup.sql`.
4. Add real rows to `exams`, `questions`, `choices`, and `resources`.
5. Configure the required server and public environment variables, then
   refresh the local site. The written-exam pages use the server repository;
   legacy pages may continue to show mock fallback data.

Main tables used by the current UI:

```txt
exams
questions
choices
resources
```

You can start editing the page by modifying `app/page.tsx`. The page auto-updates as you edit the file.

This project uses [`next/font`](https://nextjs.org/docs/app/building-your-application/optimizing/fonts) to automatically optimize and load [Geist](https://vercel.com/font), a new font family for Vercel.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying) for more details.
