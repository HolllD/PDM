import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() => runApp(const SupportApp());

class SupportApp extends StatelessWidget {
  const SupportApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SupportScreen(),
      },
    );
  }
}

class SupportScreen extends StatelessWidget {
  const SupportScreen();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Suporte"),
            // backgroundColor: Color.fromARGB(255, 24, 24, 24),
            elevation: 20,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    // 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
                    'https://images.unsplash.com/photo-1509023464722-18d996393ca8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Inicio'),
                Tab(icon: Icon(Icons.list_alt), text: 'Feed'),
                Tab(icon: Icon(Icons.person), text: 'Conta'),
                Tab(icon: Icon(Icons.settings), text: 'Configurações'),
              ],
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // Implementar redirecionamento para outra página
              },
            ),
            // actions: [
            //   IconButton(
            //     icon: Icon(Icons.notifications_none),
            //     onPressed: () {},
            //   ),
            //   IconButton(
            //     icon: Icon(Icons.search),
            //     onPressed: () {},
            //   ),
            // ],
          ),
          body: Center(
            child: SupportContent(),
          ),
        )
    );
  }

  Widget SupportContent() {
    return Column(
      children: [
        BuildSupportButtons(),
      ],
    );
  }

  Widget BuildSupportButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SupportButton("Hello, I'm under the water!"),
        SupportButton("Hello, I'm under the water!"),
        SupportButton("Hello, I'm under the water!"),
        SupportButton("Hello, I'm under the water!"),
        SupportButton("Hello, I'm under the water!"),
        SupportButton("Hello, I'm under the water!"),
      ],
    );
  }

  Widget SupportButton(String text) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black12),
      ),
      onPressed: () {},
      child: Text(
        '$text',
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
