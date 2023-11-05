import 'package:flutter/material.dart';
import 'package:online_events/pages/profile/profile_page.dart';
import 'package:online_events/services/app_navigator.dart';

import '/pages/upcoming_events/upcoming_events_page.dart';
import '/pages/upcoming_events/profile_button.dart';
import '/pages/login/forgotten_password_page.dart';
import 'package:online_events/theme.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return OnlineScaffold(
//       scrollable: false,
//       content: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           const Text(
//             'Logg Inn',
//             style: OnlineTheme.loginPageHeader,
//           ),
//           const SizedBox(height: 24),
//           const Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SizedBox(
//                 height: 30,
//                 child: Text(
//                   'Email',
//                   style: OnlineTheme.loginPageEmail,
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//                 child: TextField(
//                   obscureText: false,
//                   autocorrect: false,
//                   style: OnlineTheme.loginPageEmail,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: OnlineTheme.gray14,
//                     hintText: 'fredrik@stud.ntnu.no',
//                     hintStyle: OnlineTheme.logInnPageInput,
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(color: OnlineTheme.gray15),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: OnlineTheme.gray15),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 24),
//           const Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SizedBox(
//                 height: 30,
//                 child: Text(
//                   'Passord',
//                   style: OnlineTheme.loginPageEmail,
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//                 child: TextField(
//                   obscureText: true,
//                   autocorrect: false,
//                   style: OnlineTheme.loginPageEmail,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: OnlineTheme.gray14,
//                     hintText: 'fredrik_er_b0b0',
//                     hintStyle: OnlineTheme.logInnPageInput,
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(color: OnlineTheme.gray15),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: OnlineTheme.gray15),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 24),
//           Row(
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     loggedIn = true;
//                     AppNavigator.navigateTo(const ProfilePage(), additive: false);
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //       builder: (context) => const UpcomingEventsPage()), // Replace with your page class
//                     // );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: OnlineTheme.white,
//                     backgroundColor: OnlineTheme.green3, // Set the text color to white
//                     minimumSize: const Size(double.infinity, 50), // Set the button to take the full width
//                   ),
//                   child: const Text(
//                     'Logg Inn',
//                     style: TextStyle(
//                       fontFamily: OnlineTheme.font,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 24),
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     AppNavigator.navigateTo(const ForgottenPasswordPage(), additive: false);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: OnlineTheme.white,
//                     backgroundColor: OnlineTheme.red1, // Set the text color to white
//                     minimumSize: const Size(double.infinity, 50), // Set the button to take the full width
//                   ),
//                   child: const Text(
//                     'Glemt Passord',
//                     style: TextStyle(
//                       fontFamily: OnlineTheme.font,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           // const SizedBox(height: 100),
//         ],
//       ),
//     );
//   }
// }

class LoginPage extends Menu {
  // @override
  // Widget build(BuildContext context) {
  //   return OnlineScaffold(
  //     scrollable: false,
  //     content: Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       children: [
  //         const Text(
  //           'Logg Inn',
  //           style: OnlineTheme.loginPageHeader,
  //         ),
  //         const SizedBox(height: 24),
  //         const Column(
  //           crossAxisAlignment: CrossAxisAlignment.stretch,
  //           children: [
  //             SizedBox(
  //               height: 30,
  //               child: Text(
  //                 'Email',
  //                 style: OnlineTheme.loginPageEmail,
  //               ),
  //             ),
  //             SizedBox(
  //               height: 40,
  //               child: TextField(
  //                 obscureText: false,
  //                 autocorrect: false,
  //                 style: OnlineTheme.loginPageEmail,
  //                 decoration: InputDecoration(
  //                   filled: true,
  //                   fillColor: OnlineTheme.gray14,
  //                   hintText: 'fredrik@stud.ntnu.no',
  //                   hintStyle: OnlineTheme.logInnPageInput,
  //                   border: OutlineInputBorder(
  //                     borderSide: BorderSide(color: OnlineTheme.gray15),
  //                   ),
  //                   enabledBorder: OutlineInputBorder(
  //                     borderSide: BorderSide(color: OnlineTheme.gray15),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 24),
  //         const Column(
  //           crossAxisAlignment: CrossAxisAlignment.stretch,
  //           children: [
  //             SizedBox(
  //               height: 30,
  //               child: Text(
  //                 'Passord',
  //                 style: OnlineTheme.loginPageEmail,
  //               ),
  //             ),
  //             SizedBox(
  //               height: 40,
  //               child: TextField(
  //                 obscureText: true,
  //                 autocorrect: false,
  //                 style: OnlineTheme.loginPageEmail,
  //                 decoration: InputDecoration(
  //                   filled: true,
  //                   fillColor: OnlineTheme.gray14,
  //                   hintText: 'fredrik_er_b0b0',
  //                   hintStyle: OnlineTheme.logInnPageInput,
  //                   border: OutlineInputBorder(
  //                     borderSide: BorderSide(color: OnlineTheme.gray15),
  //                   ),
  //                   enabledBorder: OutlineInputBorder(
  //                     borderSide: BorderSide(color: OnlineTheme.gray15),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 24),
  //         Row(
  //           mainAxisSize: MainAxisSize.max,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             Expanded(
  //               child: ElevatedButton(
  //                 onPressed: () {
  //                   loggedIn = true;
  //                   AppNavigator.navigateTo(const ProfilePage(), additive: false);
  //                   // Navigator.push(
  //                   //   context,
  //                   //   MaterialPageRoute(
  //                   //       builder: (context) => const UpcomingEventsPage()), // Replace with your page class
  //                   // );
  //                 },
  //                 style: ElevatedButton.styleFrom(
  //                   foregroundColor: OnlineTheme.white,
  //                   backgroundColor: OnlineTheme.green3, // Set the text color to white
  //                   minimumSize: const Size(double.infinity, 50), // Set the button to take the full width
  //                 ),
  //                 child: const Text(
  //                   'Logg Inn',
  //                   style: TextStyle(
  //                     fontFamily: OnlineTheme.font,
  //                     fontSize: 16,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(width: 24),
  //             Expanded(
  //               child: ElevatedButton(
  //                 onPressed: () {
  //                   AppNavigator.navigateTo(const ForgottenPasswordPage(), additive: false);
  //                 },
  //                 style: ElevatedButton.styleFrom(
  //                   foregroundColor: OnlineTheme.white,
  //                   backgroundColor: OnlineTheme.red1, // Set the text color to white
  //                   minimumSize: const Size(double.infinity, 50), // Set the button to take the full width
  //                 ),
  //                 child: const Text(
  //                   'Glemt Passord',
  //                   style: TextStyle(
  //                     fontFamily: OnlineTheme.font,
  //                     fontSize: 16,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //         // const SizedBox(height: 100),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget content(BuildContext context, Animation<double> animation) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Logg Inn',
            style: OnlineTheme.loginPageHeader,
          ),
          const SizedBox(height: 24),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 30,
                child: Text(
                  'Email',
                  style: OnlineTheme.loginPageEmail,
                ),
              ),
              SizedBox(
                height: 40,
                child: TextField(
                  obscureText: false,
                  autocorrect: false,
                  style: OnlineTheme.loginPageEmail,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: OnlineTheme.gray14,
                    hintText: 'fredrik@stud.ntnu.no',
                    hintStyle: OnlineTheme.logInnPageInput,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: OnlineTheme.gray15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: OnlineTheme.gray15),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 30,
                child: Text(
                  'Passord',
                  style: OnlineTheme.loginPageEmail,
                ),
              ),
              SizedBox(
                height: 40,
                child: TextField(
                  obscureText: true,
                  autocorrect: false,
                  style: OnlineTheme.loginPageEmail,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: OnlineTheme.gray14,
                    hintText: 'fredrik_er_b0b0',
                    hintStyle: OnlineTheme.logInnPageInput,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: OnlineTheme.gray15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: OnlineTheme.gray15),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    loggedIn = true;
                    AppNavigator.pop();
                    AppNavigator.iosNavigateTo(const ProfilePage());
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: OnlineTheme.white,
                    backgroundColor: OnlineTheme.green3, // Set the text color to white
                    minimumSize: const Size(double.infinity, 50), // Set the button to take the full width
                  ),
                  child: const Text(
                    'Logg Inn',
                    style: TextStyle(
                      fontFamily: OnlineTheme.font,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    AppNavigator.pop();
                    AppNavigator.iosNavigateTo(const ForgottenPasswordPage());
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: OnlineTheme.white,
                    backgroundColor: OnlineTheme.red1, // Set the text color to white
                    minimumSize: const Size(double.infinity, 50), // Set the button to take the full width
                  ),
                  child: const Text(
                    'Glemt Passord',
                    style: TextStyle(
                      fontFamily: OnlineTheme.font,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // const SizedBox(height: 100),
        ],
      ),
    );
  }
}
