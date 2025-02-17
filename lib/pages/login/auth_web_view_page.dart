import 'package:flutter/material.dart';
import '/main.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '/core/client/client.dart';
import '/pages/login/auth_service.dart';
import '/pages/profile/profile_page.dart';
import '/services/app_navigator.dart';

class LoginWebView extends StatefulWidget {
  const LoginWebView({super.key});

  @override
  LoginWebViewState createState() => LoginWebViewState();
}

class LoginWebViewState extends State<LoginWebView> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      // ..setBackgroundColor(OnlineTheme.background)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(AuthService.redirectUri)) {
              _handleRedirectUri(request.url);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(AuthService.authorizationUrl));
  }

  Future<void> _handleRedirectUri(String url) async {
    Uri uri = Uri.parse(url);
    final code = uri.queryParameters['code'];
    if (code == null) {
      print('No authorization code received');
      return;
    }

    try {
      final tokenData = await AuthService.exchangeCodeForToken(code);
      if (tokenData == null) {
        print('Token exchange failed');
        return;
      }

      Client.setAccessToken(tokenData['access_token']);
      Client.setRefreshToken(tokenData['refresh_token']);
      Client.setExpiresIn(tokenData['expires_in']);
      setState(() => loggedIn = true);
      // AppNavigator.pop();
      // print(tokenData);
      AppNavigator.replaceWithPage(const ProfilePageDisplay());
    } catch (e) {
      print('Error during token exchange: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: WebViewWidget(controller: controller),
    );
  }
}
