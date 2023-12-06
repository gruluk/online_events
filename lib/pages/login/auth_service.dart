import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:online_events/main.dart';

class Appconstants {
  static const String endpoint = "https://cloud.appwrite.io/v1";
  static const String projectid = "65706141ead327e0436a";
}

class AppProvider extends ChangeNotifier {
  Client client = Client();
  late Account account;
  AppProvider() {
    loggedIn = true;
    initialize();
  }
  initialize() {
    client
      ..setProject(Appconstants.projectid)
      ..setEndpoint(Appconstants.endpoint);
    account = Account(client);
    checkLogin();
  }
  checkLogin() async {
    try {
      await account.get();
    } catch (_) {
      loggedIn = false;
      notifyListeners();
    }
  }
  socialSignIn(String provider, context) async {
    await account
        .createOAuth2Session(
      provider: provider,
      success: "suksee",
      failure: "feil",
    )
        .then((response) {
      loggedIn = true;
      notifyListeners();
    }).catchError((e) {
      loggedIn = false;
      notifyListeners();
    });
  }
}