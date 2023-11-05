import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// This class is a service provider. Helping the user navigate the app is the service it provides.
class AppNavigator {
  static GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

  static const Duration transitionDuration = Duration(milliseconds: 0); // 250
  static const Duration reverseDuration = Duration(milliseconds: 0); // 250

  /// Navigates to target widget.
  static void navigateTo(Widget target, {required bool additive}) {
    final route = PageRouteBuilder(
      transitionDuration: transitionDuration,
      reverseTransitionDuration: reverseDuration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Animation is for animating to
        // Secondary animation is for animating from
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      pageBuilder: ((context, animation, secondaryAnimation) {
        return target;
      }),
    );

    navigateToRoute(route, additive: additive);
  }

  static void navigateToRoute(Route route, {required bool additive}) {
    navigator.currentState!.push(route).then((value) {
      if (!additive) navigator.currentState!.pushAndRemoveUntil(route, (route) => false);
    });
  }

  static void iosNavigateTo(Widget target) {
    AppNavigator.navigateToRoute(
      CupertinoPageRoute(
        builder: (context) {
          return target;
        },
        maintainState: false,
        fullscreenDialog: false,
      ),
      additive: true,
    );
  }

  static void pop() {
    navigator.currentState!.pop();
  }
}

abstract class Menu extends ModalRoute<void> {
  Widget content(BuildContext context, Animation<double> animation);

  @override
  Color? get barrierColor => Colors.black.withOpacity(0.8);

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    final query = MediaQuery.of(context);
    final padding = query.padding;

    const blur = 10.0;

    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: blur,
        sigmaY: blur,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: padding,
          child: Center(
            child: content(
              context,
              animation,
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get maintainState => false;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);
}
