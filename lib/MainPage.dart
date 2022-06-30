import 'package:aula_pdm/widgets/profile_content.dart';
import 'package:aula_pdm/widgets/start_content.dart';
import 'package:aula_pdm/widgets/subjects_content.dart';
import 'package:aula_pdm/widgets/support_content.dart';
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
    new Tab(icon: const Icon(Icons.home), text: 'Inicio'),
    new Tab(icon: const Icon(Icons.list_alt), text: 'Matérias'),
    new Tab(icon: const Icon(Icons.person), text: 'Conta'),
    new Tab(icon: const Icon(Icons.settings), text: 'Configurações'),
  ];

  TabController? _tabController;

  

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
  }

  selectContent(indexContent) {
    if (indexContent == 4) {
      return const SupportContent();
    }
    // else {
    //   return Center(child: Text(tab.text ?? ""));
    // }
  }

  @override
  Widget build(BuildContext context) {

    _tabController?.addListener(() {
      setState(() {});
    });

    return DefaultTabController(
        length: 4,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(myTabs[_tabController?.index ?? 0].text ?? ""),
              // backgroundColor: Color.fromARGB(255, 24, 24, 24),
              elevation: 20,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
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
              ),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications_none),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
              ],
            ),
            body: TabBarView(
              controller: _tabController,
              children: [
                StartContent(),
                SubjectContent(),
                ProfileContent(),
                SupportContent(),
              ]
            )
        )
    );
  }


}
