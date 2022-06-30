import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../constants.dart';
import 'globals.dart';

class StartContent extends StatefulWidget {
  const StartContent();

  @override
  State<StartContent> createState() => _StartContentState();
}

class _StartContentState extends State<StartContent> {
  bool isSwitched = true;

  Future<ParseUser?> getUser() async {
    var currentUser = await ParseUser.currentUser() as ParseUser?;
    return currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              _banner(context),
              _currentClassesSection(context),
              _addMoreClassesSection(context),
              _classesSelection(context),
              _messageSection(context),
            ],
          ),
        )
      ],
    );
  }

  Widget _banner(BuildContext context) {
    String available = "Disponível";
    ScreenUtil.init(context, designSize: const Size(414.0, 896.0));
    bool isSwitched;
    isSwitched = true;

    return Container(
      padding: const EdgeInsets.all(10),
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width,
        minHeight: 100,
      ),
      decoration: BoxDecoration(
          color: Colors.lightGreen[400],
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 5.0,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              FutureBuilder<ParseUser?>(
                  future: getUser(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Text(
                            "Olá, ${snapshot.data!.username}.",
                            style: kLightThemeTitle,
                          ),
                          Text(
                            "Estudante de ADS do ${snapshot.data!.get("semester")}° período",
                            style: kLightThemeTitle,
                          ),
                        ],
                      );
                    } else {
                      return const Text("Olá, usuário!");
                    }
                  }),
              Row(
                children: [
                  RichText(
                      text: const TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                        TextSpan(text: "Você está no modo: "),
                        TextSpan(
                            text: "Estudar",
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ])),
                  const Icon(LineAwesomeIcons.pen)
                ],
              ),
            ],
          ),
          Column(
            children: [
              Material(
                borderRadius: BorderRadius.circular(40),
                elevation: 15,
                child: CircleAvatar(
                    radius: kSpacingUnit.w * 4,
                    backgroundImage: const NetworkImage(
                        'https://i.stack.imgur.com/JfrKO.jpg?s=192&g=1')),
              ),
              Row(
                children: [
                  const Text(
                    "Disponível",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Switch(
                    value: globals.isAvailable,
                    onChanged: (value) {
                      setState(() {
                        globals.isAvailable = value;
                      });
                    },
                    activeColor: Colors.lightBlue[300],
                    activeTrackColor: Colors.white,
                    inactiveThumbColor: Colors.red[200],
                    inactiveTrackColor: Colors.white,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _currentClassesSection(BuildContext context) {
    List<dynamic>? enrolledList;
    List<Widget> list = <Widget>[];

    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          _sectionTitle(context, "Matérias atuais"),
          FutureBuilder<ParseUser?>(
              future: getUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  enrolledList = snapshot.data!.get<List>("enrolledClasses");

                  var enrolledLength = enrolledList?.length.toInt() ?? 0;

                  for (var i = 0; i < enrolledLength; i++) {
                    list.add(Text(enrolledList![i].toString()));
                  }

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for ( var i in enrolledList! ) Text(i.toString(),
                        style: kTitleTextStyle,
                      ),
                    ],
                  );
                } else {
                  return const Text("Olá, usuário!");
                }
              }),
        ],
      ),
    );
  }

  Widget _addMoreClassesSection(BuildContext context) {
    return Column(
      children: [
        _sectionTitle(context, "Adicionar mais matérias"),
        _searchBox(context),
      ],
    );
  }

  Widget _searchBox(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextFormField(
            maxLength: 20,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: Icon(
                LineAwesomeIcons.search_plus,
                color: Colors.grey,
              ),
              labelText: 'Digite a disciplina',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            onChanged: (value) {},
          ),
        )
      ],
    );
  }

  Widget _classesSelection(BuildContext context) {
    return Container(
        height: 300,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          children: [
            _sectionTitle(context, "Matérias"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _classForSelection(context, "ADS"),
                _classForSelection(context, "Pesquisas"),
                _classForSelection(context, "Disciplinas"),
              ],
            ),
          ],
        ));
  }

  Widget _classForSelection(BuildContext context, String name) {
    var widthSize = MediaQuery.of(context).size.width;
    var heightSize = MediaQuery.of(context).size.height;

    return Container(
      // cirno
      margin: EdgeInsets.fromLTRB(widthSize * 0.025, 0, widthSize * 0.025, 0),
      height: heightSize * 0.3,
      width: widthSize * 0.25,
      child: Center(
          child: Text(
        "${name}",
        style: kTitleTextStyle,
      )),

      decoration: BoxDecoration(
          color: Colors.lightGreen[300],
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: const [
            BoxShadow(
                color: Colors.black, blurRadius: 10.0, offset: Offset(-2, 2))
          ]),
    );
  }

  Widget _sectionTitle(BuildContext context, String name) {
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "${name}",
          style: kSectionTitle,
        ),
      ),
    );
  }

  Widget _messageSection(BuildContext context) {
    return Column(
      children: [
        _sectionTitle(context, "Mensagens"),
        _messageContainer(context),
      ],
    );
  }

  Widget _messageContainer(BuildContext context) {
    return Column(
      children: [
        _message(context, "Pedro", "Obrigado!", true),
        _message(context, "Paula", "Ok", false),
        _message(context, "Marcela", "Valeu!", false),
        _message(context, "Gustavo", "Sim.", true),
      ],
    );
  }

  Widget _message(
      BuildContext context, String sender, String messageSent, bool isOn) {
    return Row(
      children: [
        _avatarWithStatus(context, isOn),
        _messageBody(sender, messageSent),
      ],
    );
  }

  Widget _avatarWithStatus(BuildContext context, bool isOn) {
    var colorUsed = Colors.grey;

    if (isOn) {
      colorUsed = Colors.lightGreen;
    } else {
      colorUsed = Colors.grey;
    }

    return Container(
      height: kSpacingUnit.w * 7,
      width: kSpacingUnit.w * 7,
      margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
      child: Stack(
        children: <Widget>[
          CircleAvatar(
              radius: kSpacingUnit.w * 5,
              backgroundImage: const NetworkImage(
                  'https://i.stack.imgur.com/JfrKO.jpg?s=192&g=1')),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: kSpacingUnit.w * 2.5,
              width: kSpacingUnit.w * 2.5,
              decoration: BoxDecoration(
                  color: colorUsed,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 10.0,
                        offset: Offset(-2, 2))
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _messageBody(String sender, String messageSent) {
    return Container(
        // color: Colors.lightGreen,
        margin: EdgeInsets.all(15),
        child: Align(
          // alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${sender}",
                style: kTitleTextStyle,
              ),
              Text(
                "${messageSent}",
                style: kMessageBody,
              ),
            ],
          ),
        ));
  }
}
