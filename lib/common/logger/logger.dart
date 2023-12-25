abstract class Logger {
  void info(String message, [Map<String, Object?> context = const {}]);
  void warn(String message, [Map<String, Object?> context = const {}]);
  void error(String message, [Map<String, Object?> context = const {}]);
  void debug(String message, [Map<String, Object?> context = const {}]);
}
