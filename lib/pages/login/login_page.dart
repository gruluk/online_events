import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:online_events/components/animated_button.dart';
import 'package:online_events/components/online_header.dart';
import 'package:online_events/theme/theme.dart';

class LoginPage extends StatelessWidget {
  final Client _client = Client();

  LoginPage({Key? key}) : super(key: key) {
    _client
      .setEndpoint('https://cloud.appwrite.io/v1') // Your Appwrite Endpoint
      .setProject('65706141ead327e0436a'); // Your project ID
  }

  void _login(BuildContext context) async {
    final account = Account(_client);
    try {
      await account.createOAuth2Session(
        provider: 'openid', // Your provider
        success: 'https://cloud.appwrite.io/v1/account/sessions/oauth2/callback/oidc/65706141ead327e0436a',
        // Remove the failure URL and handle errors in catch block
      );
      // Handle the success, such as navigating to a different page
    } catch (e) {
      // Handle error within the app
      print(e);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('An error occurred during login. Please try again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget? header(BuildContext context) {
    return OnlineHeader();
  }

  @override
  Widget content(BuildContext context) {
    final padding = MediaQuery.of(context).padding + const EdgeInsets.symmetric(horizontal: 25);

    final headerStyle = OnlineTheme.textStyle(
      size: 20,
      weight: 7,
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(left: padding.left, right: padding.right),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Logg Inn', style: headerStyle),
            const SizedBox(height: 24),
            AnimatedButton(
              onTap: () {
                //TODO
              },
              childBuilder: (context, hover, pointerDown) {
                return Container(
                  height: OnlineTheme.buttonHeight,
                  decoration: BoxDecoration(
                    gradient: OnlineTheme.greenGradient,
                    borderRadius: OnlineTheme.buttonRadius,
                  ),
                  child: Center(
                    child: Text(
                      'Logg Inn med NTNU',
                      style: OnlineTheme.textStyle(),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LoginPage();
  }
}
