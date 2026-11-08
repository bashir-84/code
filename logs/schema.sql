CREATE TABLE IF NOT EXISTS chat_events (
id TEXT PRIMARY KEY, session_id TEXT NOT NULL, created_at TEXT NOT NULL,
level TEXT NOT NULL, kind TEXT NOT NULL, model TEXT NOT NULL,
prompt_version TEXT NOT NULL, user_text TEXT NOT NULL,
assistant_text TEXT NOT NULL DEFAULT '', status TEXT NOT NULL DEFAULT 'pending',
password_disclosed INTEGER NOT NULL DEFAULT 0, hint_used INTEGER NOT NULL DEFAULT 0,
synthetic INTEGER NOT NULL DEFAULT 0, github_synced INTEGER NOT NULL DEFAULT 0
);
CREATE INDEX IF NOT EXISTS chat_events_unsynced ON chat_events(github_synced,created_at);
CREATE INDEX IF NOT EXISTS chat_events_session ON chat_events(session_id,created_at);