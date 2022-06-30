import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        banner(context),
        Spacer(),
      ],
    );
  }

  Widget banner(BuildContext context) {
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
          color: Color.fromARGB(255, 37, 150, 190),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              FutureBuilder<ParseUser?>(
                  future: getUser(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        "Olá, ${snapshot.data!.username}.",
                        style: kLightThemeTitle,
                      );
                    } else {
                      return const Text("Olá, usuário!");
                    }
                  }),
              Text(
                "Estudante de ADS do 5° período",
                style: kLightThemeTitle,
              ),
              Row(
                children: [
                  RichText(

                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.black
                      ),
                      children: [
                        TextSpan(
                          text: "Você está no modo: "
                        ),
                        TextSpan(
                          text: "Estudar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        )
                      ]
                    )

                  ),
                  Icon(LineAwesomeIcons.pen_fancy)
                ],
              ),
            ],
          ),
          Column(
            children: [
              CircleAvatar(
                  radius: kSpacingUnit.w * 4,
                  backgroundImage: const NetworkImage(
                      'https://i.stack.imgur.com/JfrKO.jpg?s=192&g=1')),
              Row(
                children: [
                  const Text(
                    "Disponível",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Switch(value: globals.isAvailable, onChanged: (value) {
                    setState(() {
                      globals.isAvailable = value;
                    });
                  },
                  activeColor: Colors.lightGreen,
                    activeTrackColor: Colors.white,
                    inactiveThumbColor: Colors.red[400],
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
}
