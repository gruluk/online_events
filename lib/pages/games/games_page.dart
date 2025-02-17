import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online/pages/games/roulette_page.dart';

import '/components/animated_button.dart';
import '/components/online_scaffold.dart';
import '/pages/games/spin_line_page.dart';
import '/services/app_navigator.dart';
import '/theme/theme.dart';
import 'bits/bits_home_page.dart';
import 'dice.dart';
import 'songs/songs.dart';

class GamesPage extends ScrollablePage {
  const GamesPage({super.key});

  @override
  Widget content(BuildContext context) {
    final padding = MediaQuery.of(context).padding + OnlineTheme.horizontalPadding;

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const DrikkeSanger(),
          const SizedBox(height: 24),
          const SizedBox(height: 24),
          Text('Spill', style: OnlineTheme.header()),
          const SizedBox(height: 24),
          CarouselSlider(
            items: [
              GameCard(
                name: 'Terning',
                imageSource: 'assets/images/diceHeader.jpg',
                onTap: () {
                  AppNavigator.navigateToPage(const DicePage());
                },
              ),
              GameCard(
                name: 'SpinLine',
                imageSource: 'assets/images/SpinLine.png',
                onTap: () {
                  AppNavigator.navigateToPage(const SpinLinePage());
                },
              ),
              GameCard(
                name: 'Bits',
                imageSource: 'assets/images/bits.png',
                onTap: () {
                  AppNavigator.navigateToPage(const BitsHomePage());
                },
              ),
              GameCard(
                name: 'Roulette',
                imageSource: 'assets/images/roulette.png',
                onTap: () {
                  AppNavigator.navigateToPage(const RoulettePage());
                },
              ),
            ],
            options: CarouselOptions(
              height: 200,
              enableInfiniteScroll: true,
              padEnds: true,
              enlargeCenterPage: true,
              viewportFraction: 0.7,
              enlargeFactor: 0.2,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  final String name;
  final String imageSource;

  final void Function() onTap;

  const GameCard({
    super.key,
    required this.name,
    required this.imageSource,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onTap: onTap,
      childBuilder: (context, hover, pointerDown) {
        return Container(
          decoration: const BoxDecoration(
            border: Border.fromBorderSide(
              BorderSide(width: 2, color: OnlineTheme.grayBorder),
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 2, color: OnlineTheme.grayBorder),
                    ),
                  ),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      imageSource,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(name, style: OnlineTheme.subHeader()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
