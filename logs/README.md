# Test chat logging

New requests require explicit consent to public test-log publication. The main UI sends a session UUID; reset or difficulty change starts a new session. D1 stores one event per user turn and generated reply, including hint requests separately. Logs are saved before sending the API response, with pending/error states for failures. API keys matching common Groq/GitHub patterns and the exact game password are redacted. Do not enter personal information; this is not a general PII scrubber.

The ChatGPT automation "بکاپ گفت‌وگوهای فاکسلی" copies unsynced events hourly to chat-backup.txt using the connected Cloudflare and GitHub apps. It requires those connections to remain active. Larger files rotate at 500KB. Initial pipeline tests are marked synthetic=1. No GitHub credential is placed in the Worker.

password_disclosed means the exact current password appeared in a server-generated chat reply. It does not certify a fair win and does not detect every encoding or partial leak. A session with no disclosure may still be ongoing. hint_used indicates a completed helper request was seen for that session. Client-submitted history and IDs are not authoritative anti-cheat state.

Logs start at activation. Older browser history is not retroactively imported. All accepted user turns are logged independently of the rolling model context. This is a dataset for review, not automatic model training. Future prompt changes must bump prompt_version.

Schema: schema.sql. Binding: LOG_DB / foxley-chat-logs.
