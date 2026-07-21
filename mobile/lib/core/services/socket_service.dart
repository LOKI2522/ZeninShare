import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  SocketService();

  void connect() {
    socket = IO.io(
      'http://10.33.69.186:3000',
      <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      },
    );

    socket.connect();

    socket.onConnect((_) {
      print("✅ Connected to Server");
    });

    socket.onDisconnect((_) {
      print("❌ Disconnected from Server");
    });

    socket.onConnectError((error) {
      print("🚫 Connection Error: $error");
    });
  }
}