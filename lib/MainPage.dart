import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:aula_pdm/profile.dart';

void main() => runApp(const SupportApp());

class SupportApp extends StatelessWidget {
  const SupportApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SupportScreen(),
      },
    );
  }
}

class SupportScreen extends StatefulWidget {
  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen>
    with SingleTickerProviderStateMixin {
  var titleName = "teste";

  final List<Tab> myTabs = <Tab>[
    new Tab(icon: Icon(Icons.home), text: 'Inicio'),
    new Tab(icon: Icon(Icons.list_alt), text: 'Feed'),
    new Tab(icon: Icon(Icons.person), text: 'Conta'),
    new Tab(icon: Icon(Icons.settings), text: 'Configurações'),
  ];

  late TabController _tabController;

  

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
  }

  selectContent(indexContent) {
    if (indexContent == 4) {
      return SupportContent();
    }
    // else {
    //   return Center(child: Text(tab.text ?? ""));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(myTabs[_tabController.index].text ?? ""),
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
                controller: _tabController,
                tabs: myTabs,
                onTap: (_) {
                  setState((){});
                },
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
              controller: _tabController,
              children: [
                Center(
                  child: Text("Inicio"),
                ),
                Center(
                  child: Text("Feed"),
                ),
                profileContent(),
                SupportContent(),
              ]
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

  Widget profileContent() {
    return Text("Conta");
  }

}
