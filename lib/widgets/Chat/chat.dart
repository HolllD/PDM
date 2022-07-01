// ignore_for_file: must_be_immutable, non_constant_identifier_names, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

/*
    Desenvolver classe Chatbox, com função para adicionar chatBubble, essa classe vai funcionar como um container e vai implementar a rolagem de conteúdo
   */

// Arrumar para ser stateful
// class ChatBox extends StatefulWidget {

// }

class ChatData {
  late String text;
  late String sender;
  late bool user;

  ChatData({required this.text, required this.sender, required this.user});
}


// TODO: Criar uma caixa de texto que seja rolável ao usuário
// url: https://yourowncodes.com/how-to-create-scrolling-content-screen-in-flutter/#:~:text=%205%20Ways%20to%20Make%20Scrollable%20Screen%20in,for%20grid%20types%20of%20contents%20like...%20More%20


/*
    IMPORTANTE
    ESSA CLASSE RETORNA MENSAGENS DE CHAT, NÃO O CONTAINER ONDE ELAS FICAM.
   */

class ChatBubble extends StatelessWidget {

  var local_user = false;
  var box_width = 300.0;
  var box_height = 150.0;
  var box_color;

  late ChatData data;

  ChatBubble({required this.local_user, required this.data});

  @override
  Widget build(BuildContext context) {

    double screen_width = MediaQuery.of(context).size.width;

    if (local_user == true){
      box_color = Color(0xffb0bfb4);
    } else {
      box_color = Color(0xffc7b4b4);
    }


    // Padding deve ser trocado por SingleChildScrollView

    return Padding(
      padding: EdgeInsets.all(1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          if (local_user == true) ...{
            Spacer(),
          },

          /*
                  IMPORTANTE

                  TODO: Converter Container para Column para usar data.sender e data.user

                 */

          // Chatbox
          Flexible(

            child: Container(
              width: screen_width/3,
              // height: box_height,
              decoration: BoxDecoration(
                color: box_color,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 3,
                  ),
                ],
              ),


              /*

                    MENSAGEM DE CHAT BUBBLE

                   */
              // TODO: fazer com que os tamanhos sejam proporcionais a tela
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.text,
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w100,
                      ),
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    // children: [
                    //   Text("Enviado por: " + data.sender,
                    //     style: TextStyle(
                    //       fontSize: 10,

                    //     ),
                    //   ),

                    // ],

                    // )

                  ],
                ),

              ),
            ),
          )
        ],
      ),
    );
  }
}