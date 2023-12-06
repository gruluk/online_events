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
        success: 'YOUR_SUCCESS_REDIRECT_URL', // Replace with your success URL
        // No failure URL, handling error in catch block
      );
      // On successful login, navigate to a different page or update the state
      // e.g., Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      // Handle error within the app
      _showErrorDialog(context, e.toString());
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Login Failed'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your other widgets...
            ElevatedButton(
            onPressed: () => _login(context),
            child: Text('Log in with OpenID Connect'),
            ),
          ],
        ),
      ),
    );
  }
}
