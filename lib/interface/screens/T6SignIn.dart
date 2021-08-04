// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_theme/main/utils/authentication/applicationstate.dart';
import 'package:fitness_theme/main/utils/authentication/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fitness_theme/main/utils/AppWidget.dart';
import 'package:fitness_theme/interface/utils/T6Colors.dart';
import 'package:fitness_theme/interface/utils/T6Constant.dart';
import 'package:fitness_theme/interface/utils/T6Images.dart';
import 'package:fitness_theme/interface/utils/T6Strings.dart';
import 'package:fitness_theme/interface/utils/T6Widget.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class T6SignIn extends StatefulWidget {
  static String tag = '/T6SignIn';

  @override
  T6SignInState createState() => T6SignInState();
}

class T6SignInState extends State<T6SignIn> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: height,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: CachedNetworkImage(
                      placeholder: placeholderWidgetFn() as Widget Function(
                          BuildContext, String)?,
                      imageUrl: t6_ic_logo,
                      width: width / 2.2),
                ),
                SizedBox(
                  height: 30,
                ),
                Consumer<ApplicationState>(
                  builder: (context, appState, _) => Authentication(
                    email: appState.email,
                    loginState: appState.loginState,
                    startLoginFlow: appState.startLoginFlow,
                    verifyEmail: appState.verifyEmail,
                    signInWithEmailAndPassword:
                        appState.signInWithEmailAndPassword,
                    cancelRegistration: appState.cancelRegistration,
                    registerAccount: appState.registerAccount,
                    signOut: appState.signOut,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    alignment: Alignment.center,
                    child: text(t6_lbl_or_with,
                        textAllCaps: true, textColor: t6colorPrimary)),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: t6form_google),
                      width: width / 7.5,
                      height: width / 7.5,
                      padding: EdgeInsets.all(width / 28),
                      child: SvgPicture.asset(
                        t6_google_fill,
                        color: t6white,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: t6form_facebook),
                      width: width / 7.5,
                      height: width / 7.5,
                      padding: EdgeInsets.all(width / 28),
                      child: SvgPicture.asset(
                        t6_facebook_fill,
                        color: t6white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
