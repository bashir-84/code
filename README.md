# Foxley Holmes — Persian chat prototype

Small RTL chat page connected to Groq through a Cloudflare Worker.

## Recommended deployment

1. In Cloudflare Workers, import this GitHub repository (`bashir-84/code`).
2. Build command: leave empty. Deploy command: `npx wrangler deploy`.
3. Add Worker secrets `GROQ_API_KEY` (your Groq API key) and `GAME_PASSWORD` (a fictional password chosen for this test). Never commit keys.
4. Open the resulting workers.dev URL. Leave the endpoint field blank: the page uses its own `/api/chat` route.

Alternatively deploy with Wrangler locally: `npx wrangler secret put GROQ_API_KEY`, `npx wrangler secret put GAME_PASSWORD`, then `npx wrangler deploy`.

## GitHub Pages option

The page is `public/index.html`. To use Pages, publish the contents of `public` with a Pages workflow, then enter the deployed Worker origin in the page. Add the exact Pages origin to `ALLOWED_ORIGINS` if different. Repository name `code` does not automatically create `/nex/` on an existing domain.

## Scope and limitations

This is a manual testing prototype, not a public competition. Transcript is sent by the browser and can be edited; it is not authoritative game state. The fictional test password is fixed per Worker deployment. No official win scoring, server sessions, replay protection, or durable rate limiting is implemented. CORS is not authentication. Before public sharing add server-side usage limits and authenticated/encrypted session state. No real secrets other than the Groq key should be configured.

Only final model text is returned; reasoning is excluded. Model behaviour and live API connection have not been verified with an API key. The four prompts are experimental. Browser transcript is cleared on reload or difficulty change; endpoint alone is stored locally.
