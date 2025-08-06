import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class RosService {
  late final WebSocketChannel _channel;

  RosService() {
    _channel = WebSocketChannel.connect(
      Uri.parse('ws://192.168.8.145:9090'),
    );
  }

  void sendCommand(Map<String, dynamic> command) {
    _channel.sink.add(jsonEncode(command));
  }

  void dispose() {
    _channel.sink.close();
  }
}