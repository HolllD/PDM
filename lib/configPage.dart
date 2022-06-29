import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

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
                    // 'https://images.unsplash.com/photo-1509023464722-18d996393ca8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'
                    // 'https://wallpaperaccess.com/download/dark-green-forest-3483001'
                    // 'https://wallpaperaccess.com/download/dark-green-forest-1516567'
                        'https://wallpaperaccess.com/download/dark-green-forest-4641381'
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
            actions: [
              IconButton(
                icon: Icon(Icons.notifications_none),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
          body: TabBarView(
            children: [
              Center(
                  child: Text("Hello world 1!")
              ),
              Center(
                  child: Text("Hello world 2!")
              ),
              Center(
                  child: Text("Hello world 3!")
              ),
              Center(
                  child: SupportContent()
              ),
            ],
          )
        )
    );
  }

  Widget SupportContent() {
    return SettingsList(
      sections: [
        SettingsSection(
          title: Text('Interface'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(Icons.language),
              title: Text('Linguagem'),
              value: Text('Português - Brasil'),
            ),
            SettingsTile.switchTile(
              onToggle: (value) {},
              initialValue: false,
              leading: Icon(Icons.format_paint),
              title: Text('Modo escuro'),
            ),
          ],
        ),
      ],
    );
  }

  Widget BuildSupportButtons() {
    return SettingsList(
      sections: [
        SettingsSection(
          title: Text('Common'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(Icons.language),
              title: Text('Language'),
              value: Text('English'),
            ),
            SettingsTile.switchTile(
              onToggle: (value) {},
              initialValue: true,
              leading: Icon(Icons.format_paint),
              title: Text('Enable custom theme'),
            ),
          ],
        ),
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
