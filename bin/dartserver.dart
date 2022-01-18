import 'dart:io';

Future<void> main() async {
  final server = await createServer();
  print('Server started: ${server.address} port ${server.port}');
  await handleRequests(server);
}

Future<HttpServer> createServer() async {
  const port = 8080;
  return await HttpServer.bind("0.0.0.0", port);
}

Future<void> handleRequests(HttpServer server) async {
  await for (HttpRequest request in server) {
    request.response.write('Hello from a Dart server');
    await request.response.close();
  }
}