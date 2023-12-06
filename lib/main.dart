import 'package:flutter/material.dart';
import 'package:online_events/core/models/article_model.dart';
import 'package:online_events/pages/home/home_page.dart';
import 'package:online_events/services/env.dart';
import 'package:online_events/services/secure_storage.dart';
import '/components/online_scaffold.dart';
import '/services/app_navigator.dart';
import 'core/client/virgin_client.dart';
import 'core/models/event_model.dart';
import 'theme/theme.dart';
import 'package:appwrite/appwrite.dart';

Client appwriteClient = Client();
bool loggedIn = false;

Future main() async {
  runApp(const MainApp());

  appwriteClient
      .setEndpoint('https://cloud.appwrite.io/v1') // Your Appwrite Endpoint
      .setProject('65706141ead327e0436a'); // Your project ID
  await Env.initialize();
  SecureStorage.initialize();

  Future.wait([VirginClient.getEvents(), VirginClient.getArticles()])
      .then((responses) {
    final events = responses[0] as List<EventModel>?;
    final articles = responses[1] as List<ArticleModel>?;

    if (events != null) {
      eventModels.addAll(events);
    }

    if (articles != null) {
      articleModels.addAll(articles);
    }

    PageNavigator.navigateTo(const HomePage());
  });
}

final List<EventModel> eventModels = [];
final List<ArticleModel> articleModels = [];

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.navigator,
      title: 'Online Events',
      debugShowCheckedModeBanner: false,
      color: OnlineTheme.background,
      home: const OnlineScaffold(),
    );
  }
}
