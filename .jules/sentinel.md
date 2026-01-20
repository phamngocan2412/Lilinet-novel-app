## 2026-01-20 - Network Logging in Production
**Vulnerability:** Detailed network logging (headers, bodies) was enabled unconditionally, exposing sensitive data (auth tokens, PII) in production logs.
**Learning:** Development tools like `PrettyDioLogger` are convenient but dangerous if not guarded.
**Prevention:** Always wrap debug-only logic (loggers, inspectors) in `if (kDebugMode)` or strip them from release builds.
