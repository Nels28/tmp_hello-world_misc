import 'dart:io';

Future<void> main() async {
  var server = await HttpServer.bind('0.0.0.0', 8080);
  print('Listening on localhost:${server.port}');

  await for (var request in server) {
    request.response
      ..write('Hello World')
      ..close();
  }
}
