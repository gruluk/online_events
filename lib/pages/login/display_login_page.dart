import 'package:flutter/material.dart';
import 'package:online_events/pages/login/login_page.dart';
import 'package:online_events/pages/profile/profile_page.dart';
import 'package:online_events/components/online_header.dart';
import '/components/online_scaffold.dart';


class LoginPageDisplay extends StaticPage {
  const LoginPageDisplay({super.key});
  @override
  Widget content(BuildContext context) {
    return LoginPage();
  }
}
