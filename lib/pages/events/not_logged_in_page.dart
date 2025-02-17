import 'package:flutter/material.dart';

import '/components/animated_button.dart';
import '/components/online_scaffold.dart';
import '/pages/login/terms_of_service.dart';
import '/services/app_navigator.dart';
import '/theme/theme.dart';

// TODO: Redundant? Could provide header to LoginPage and make it reusable
class NotLoggedInPage extends StaticPage {
  const NotLoggedInPage({
    super.key,
  });

  void onTap() {
    AppNavigator.navigateToPage(const TermsOfServicePage());
  }

  @override
  Widget content(BuildContext context) {
    // TODO: implement content
    final padding = MediaQuery.of(context).padding + const EdgeInsets.symmetric(horizontal: 25);
    return Padding(
      padding: EdgeInsets.only(left: padding.left, right: padding.right),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Logg inn for å se dine Arrangementer',
            style: OnlineTheme.header(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          AnimatedButton(
            onTap: onTap,
            childBuilder: (context, hover, pointerDown) {
              return Container(
                alignment: Alignment.center,
                height: OnlineTheme.buttonHeight,
                decoration: BoxDecoration(
                    color: OnlineTheme.green.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(5),
                    border: const Border.fromBorderSide(BorderSide(color: OnlineTheme.green, width: 2))),
                child: Text(
                  'Logg Inn',
                  style: OnlineTheme.textStyle(weight: 5, color: OnlineTheme.green),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
