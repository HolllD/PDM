import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import '../constants.dart';

import 'profile_list_item.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent();

  Future<ParseUser?> getUser() async {
    var currentUser = await ParseUser.currentUser() as ParseUser?;
    return currentUser;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(414.0, 896.0));

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
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
                      color: Colors.lightGreen[300],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: kSpacingUnit.w * 1.5,
                      widthFactor: kSpacingUnit.w * 1.5,
                      child: Icon(
                        LineAwesomeIcons.pen,
                        color: kDarkPrimaryColor,
                        size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          FutureBuilder<ParseUser?>(
              future: getUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "${snapshot.data!.username}",
                    style: kTitleTextStyle,
                  );
                } else {
                  return const Text("Usuário!");
                }
              }),

          // Text(
          //   '$}',
          //   style: kTitleTextStyle,
          // ),
          SizedBox(height: kSpacingUnit.w * 0.5),
          FutureBuilder<ParseUser?>(
              future: getUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "${snapshot.data!.emailAddress}",
                    style: kCaptionTextStyle,
                  );
                } else {
                  return const Text("Email!");
                }
              }),
          // Text(
          //   'nicolasadams@gmail.com',
          //   style: kCaptionTextStyle,
          // ),
          SizedBox(height: kSpacingUnit.w * 2),
        ],
      ),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 3),
        profileInfo,
        SizedBox(width: kSpacingUnit.w * 3),
      ],
    );

    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              header,
              const ProfileListItem(
                icon: LineAwesomeIcons.school,
                text: 'Alterar semestre',
                key: null,
              ),
              const ProfileListItem(
                icon: LineAwesomeIcons.chalkboard_teacher,
                text: 'Alterar modo de ajuda',
                key: null,
              ),
              const ProfileListItem(
                icon: LineAwesomeIcons.user_shield,
                text: 'Privacidade',
                key: null,
              ),
              const ProfileListItem(
                icon: LineAwesomeIcons.question_circle,
                text: 'Ajuda & Suporte',
                key: null,
              ),
              const ProfileListItem(
                icon: LineAwesomeIcons.user_plus,
                text: 'Convidar um amigo',
                key: null,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const ProfileListItem(
                  icon: LineAwesomeIcons.alternate_sign_out,
                  text: 'Sair',
                  hasNavigation: false,
                  key: null,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void init(BuildContext context) {}
}
