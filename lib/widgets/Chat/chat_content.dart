// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_typing_uninitialized_variables, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'chat.dart';
import 'titlebar.dart';
import 'inputbar.dart';

var mock_data_text = "        Lorem ipsum dolor sit amet, consectetur adipiscing elit. In consequat quam erat, in faucibus mi aliquam sit amet.";

var mock_data_text_longer = "        Lorem ipsum dolor sit amet, consectetur adipiscing elit. In consequat quam erat, in faucibus mi aliquam sit amet. Praesent eu dignissim ante.;";

void main(){
  runApp(ChatContent());
}


class ChatContent extends StatefulWidget {  @override
  State<ChatContent> createState() => _ChatContentState();
}

class _ChatContentState extends State<ChatContent> {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: CustomAppBar(),

          backgroundColor: Colors.grey,
          body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [

            ChatBubble(local_user: false, data: ChatData(text: mock_data_text, sender: "Usuário 1", user: false)),
            ChatBubble(local_user: true, data: ChatData(text: mock_data_text_longer, sender: "Usuário 2", user: false)),
            ChatBubble(local_user: false, data: ChatData(text: mock_data_text, sender: "Usuário 1", user: false)),
            ChatBubble(local_user: true, data: ChatData(text: mock_data_text, sender: "Usuário 2", user: false)),
            ChatBubble(local_user: false, data: ChatData(text: mock_data_text, sender: "Usuário 1", user: false)),
            ChatBubble(local_user: true, data: ChatData(text: mock_data_text, sender: "Usuário 2", user: false)),

            Spacer(),

            InputBar(),

          ]),
        ),
      );
    throw UnimplementedError();
  }}
