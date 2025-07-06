import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  // final List<Map<String, String>> _messages = [
  //   {
  //     'text': 'App 339 yang diperukan untuk membuat ini',
  //     'sender': 'other',
  //   },
  //   {
  //     'text': 'Morder AI',
  //     'sender': 'other',
  //   },
  //   {
  //     'text': 'Untuk membuat soto diperukan bunibu baktoshokala',
  //     'sender': 'other',
  //   },
  //   {
  //     'text': 'Nebitali morder supermart kamu dapat mendopitkan',
  //     'sender': 'other',
  //   },
  //   {
  //     'text': 'Bakter-halmat supermart',
  //     'sender': 'other',
  //   },
  //   {
  //     'text': '1. ayam dengan hanga 15000',
  //     'sender': 'other',
  //   },
  //   {
  //     'text': 'biblioblad',
  //     'sender': 'other',
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSidebar(),
      drawerEdgeDragWidth: 0, // Nonaktifkan geser dari edge
      drawerScrimColor: Colors.transparent,
      resizeToAvoidBottomInset:
          true, // Membuat scaffold menyesuaikan tinggi saat keyboard muncul
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Builder(
          builder: (context)=> IconButton(
          icon: const Icon(Icons.menu, size: 30, color: Colors.black),
          onPressed: () {
            Scaffold.of(context).openDrawer(); // Buka drawer saat diklik
          },
        )
        ),
        title: const Text(
          'Morket AI',
          style: TextStyle(color: Color(0xFF425BD7), fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                reverse: false,
                // itemCount: _messages.length,
                itemBuilder: (context, index) {
                  // final message = _messages[index];
                  return Align(
                    // alignment: message['sender'] == 'me'
                    // ? Alignment.centerRight
                    // : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        // color: message['sender'] == 'me'
                        // ? Colors.blue[100]
                        // : Colors.grey[200],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        "",
                        // message['text']!,
                        style:  TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: "Type your message",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      minLines: 1,
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: () {
                        if (_messageController.text.isNotEmpty) {
                          setState(() {
                            // _messages.add({
                            //   'text': _messageController.text,
                            //   'sender': 'me',
                            // });
                            _messageController.clear();
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  Widget _buildSidebar() {
    return Drawer(
      width: 250, // Lebar sidebar
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Row(children: [
              Icon(Icons.person, size: 70,),
              Text('Arr',
                style: TextStyle(color: Colors.black, fontSize: 20))
            ],)
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('06/07/2025'),
            onTap: () {},
          ),
            ListTile(
            leading: const Icon(Icons.history),
            title: const Text('05/07/2025'),
            onTap: () {},
          ),
            ListTile(
            leading: const Icon(Icons.history),
            title: const Text('04/07/2025'),
            onTap: () {},
          ),
            ListTile(
            leading: const Icon(Icons.history),
            title: const Text('03/07/2025'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red,),
            title: const Text('Logout', style: TextStyle(color: Colors.red),),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
