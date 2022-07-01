// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  @override
  Widget? get title => Row(children: [
    // Retornar
    IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        size: 22,
        color: Colors.grey,
      ),
      // TODO: Implementar retorno para tela passada
      onPressed: () {},
    ),

    // icone de conta
    Icon(
      Icons.account_circle_rounded,
      size: 50,
      color: Colors.grey,
    ),

    // Lorem Ipsum
    Padding(padding: EdgeInsets.only(left:15),
      child: Text(
        'Lorem Ipsum',
        style: TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.grey,
          fontSize: 18,
        ),
      ),
    ),
  ]
  );

  @override
  Color? get backgroundColor => Colors.white;

  @override
  List<Widget>? get actions => [
    // Reportar
    IconButton(
      icon: const Icon(
        Icons.report,
        color: Colors.grey,
      ),
      onPressed: () {},
    ),

    // Menu vertical
    IconButton(
      icon: const Icon(
        Icons.more_vert,
        color: Colors.grey,
      ),
      onPressed: () {},
    ),
  ];

}