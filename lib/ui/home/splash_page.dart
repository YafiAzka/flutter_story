import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_adobe_xd/shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushNamed(context, '/login'),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/story_icon.png'),
                ),
              ),
            ),
            Text(
              'Toko Online',
              style: whiteTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
