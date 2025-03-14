import "package:serverpod/serverpod.dart";

// ignore: do_not_use_environment
const token = String.fromEnvironment("TOKEN");

void assertAuth(Session session) {
  if (session is! MethodCallSession) {
    throw Exception("Session is not a MethodCallSession.");
  }

  final thisToken = session.httpRequest.headers.value("Authorization");

  if (thisToken == null) {
    throw Exception("No authorization header found.");
  }

  if (!thisToken.startsWith("Bearer ")) {
    throw Exception("Invalid authorization header.");
  }

  session.serverpod.loadCustomPasswords([
    (alias: "TOKEN", envName: "TOKEN"),
  ]);
  final token = session.serverpod.getPassword("TOKEN");

  if (thisToken.replaceFirst("Bearer ", "") != token) {
    throw Exception("Invalid authorization token.");
  }
}
