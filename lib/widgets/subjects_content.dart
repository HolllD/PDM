import 'package:flutter/material.dart';

class SubjectContent extends StatefulWidget {
  @override
  State<SubjectContent> createState() => _SubjectContentState();
}


class _SubjectContentState extends State<SubjectContent> {
  final List<Item> items = [
    Item(header: 'Semestre 1', body: 'Algoritmos e Linguagem de Programação\nArquitetura e Organização de Computadores\nHistória da Ciência e da Tecnologia\nInglês Técnico\nMatemática Discreta'),
    Item(header: 'Semestre 2', body: 'Cálculo\nComunicação e Expressão\nInteração Humano Computador\nEstatística\nDescritiva\nIntrodução à Administração\nProgramação\nOrientada a Objetos\nRedes de Computadores'),
    Item(header: 'Semestre 3', body: 'Banco de Dados\nDesenvolvimento Web\nEngenharia de Software\nEstatística\nAnalítica\nEstrutura de Dados\nEmpreendedorismo Aplicado'),
    Item(header: 'Semestre 4', body: 'Introdução à Inteligência Computacional\nEngenharia de Software Aplicada\nLaboratório de Banco de Dados\nMetodologia da Pesquisa Científica e Tecnológica\nSistemas Operacionai'),
    Item(header: 'Semestre 5', body: 'Arquitetura e Programação de Software\nEletiva I\nGerenciamento de Sistemas Operacionais Servidores\nTeste de Software\nProgramação para Dispositivos Móveis'),
    Item(header: 'Semestre 6', body: 'Auditoria e Segurança de Sistemas\nEletiva II\nGestão e Governança de Tecnologia da Informação\nProjeto\nTópicos Especiais'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Semestres',
      home: SingleChildScrollView(
        child: ExpansionPanelList (
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              items [index].isExpanded = !isExpanded;});
          },
          children: items
              .map((item) => ExpansionPanel(
            canTapOnHeader: true,
            isExpanded: item.isExpanded,
            headerBuilder: (context, isExpanded) => ListTile(
              title: Text(
                item.header,
                style: TextStyle(fontSize: 20),
              ),
            ),
            body: ListTile(
              title: Text(item.body, style: TextStyle(fontSize: 15),),
            ),
          ))
              .toList(),
        ),
      ),
    );
  }
}

class Item {
  final String header;
  final String body;
  bool isExpanded;

  Item({
    required this.header,
    required this.body,
    this.isExpanded = false,
  });
}