## 2024-05-21 - Sensitive Data Exposure via Logging
**Vulnerability:** The `PrettyDioLogger` was unconditionally enabled in `lib/core/network/dio_client.dart`, causing request headers and bodies (potentially containing sensitive user data like passwords or tokens) to be logged to the console in all environments, including production.
**Learning:** Logging is essential for debugging, but developer tools are often left enabled by default without environmental checks.
**Prevention:** Always wrap debug-only logic (like verbose loggers, inspection tools) in `if (kDebugMode)` or checks for build flavor/environment variables. Review initialization code for "always-on" debugging tools before release.
