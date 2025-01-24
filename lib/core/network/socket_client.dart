import 'dart:async';

import 'package:web_socket_channel/io.dart';

class WebSocketClient {
  final String url;
  late IOWebSocketChannel _channel;
  late StreamController<dynamic> _controller;

  WebSocketClient({required this.url}) {
    _controller = StreamController.broadcast();
    connect();
  }

  Future<void> connect() async {
    try {
      _channel = IOWebSocketChannel.connect(url);
      _channel.stream.listen(
        (message) {
          _controller.add(message);
        },
        onError: (error) {
          _controller.addError(error);
        },
        onDone: () {
          // Handle disconnection
        },
      );
    } catch (e) {
      _controller.addError(e);
    }
  }

  Stream<dynamic> getStream() {
    return _controller.stream;
  }

  Future<void> send(String message) async {
    _channel.sink.add(message);
  }

  Future<void> close() async {
    await _channel.sink.close();
  }
}
