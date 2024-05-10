import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  late IO.Socket socket;

  @override
  void initState() {
    super.initState();
    // Connect to Socket.IO server
    socket = IO.io(
        'https://ideal-couscous-grv5v76r6p7hvpp-3000.app.github.dev',
        <String, dynamic>{
          'transports': ['websocket'],
        });

    socket.on('connect', (_) {
      // Emit 'joinRoom' event to join the room
      socket.emit('joinRoom', {'userId': '5f90f435ebfc15e219c0a46d'});
      print("helo");
    });
    socket.onError((error) {
      print(error);
    });

    socket.on("roomJoined", (data) {
      print('joined: $data');
    });
    socket.on('newMessage', (data) {
      print('New message received: $data');
      setState(() {
        //_messages.add(data['content']);
      });
    });

    socket.onError((error) {
      print(error);
    });
  }

  @override
  void dispose() {
    socket.dispose();
    super.dispose();
  }

  void _sendMessage() async {
    final message = _controller.text.trim();
    if (message.isNotEmpty) {
      // Send message to backend
      final response = await http.post(
        Uri.parse(
            'https://ideal-couscous-grv5v76r6p7hvpp-3000.app.github.dev/chat/send'),
        body: json.encode({
          'sender': '5f90f435ebfc15e219c0a46d', // Replace with actual user ID
          'recipient':
              '5f90f435ebfc15e219c0a46d', // Replace with actual user ID
          'message': message,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        print('Message sent: $message');
        // setState(() {
        //   _messages.add(message);
        // });
      } else {
        print('Failed to send message');
        print(response.statusCode);
        print(response.body);
      }
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    print(socket.connected);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

