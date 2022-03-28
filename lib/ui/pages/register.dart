import 'package:flutter/material.dart';
import 'package:flutter_adobe_xd/shared/theme.dart';
import 'package:flutter_adobe_xd/ui/widgets/widgets.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/story_icon.png'),
              ),
            ),
          ),
          SizedBox(height: 24),
          Text(
            "Let's Sign You In.",
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: bold,
            ),
          ),
        ],
      );
    }

    Widget forms() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        child: Column(
          children: [
            MainForm(hint: "Name"),
            MainForm(hint: "Email"),
            MainForm(hint: "Password"),
            MainForm(hint: "Re-Type Password"),
          ],
        ),
      );
    }

    Widget footer() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            width: double.infinity,
            height: 46,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
              ),
              child: Text(
                'Register',
                style: whiteTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have account? ",
                  style: whiteTextStyle.copyWith(fontSize: 12),
                ),
                Text(
                  "Login",
                  style:
                      purpleTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: darkBlue,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            header(),
            forms(),
            footer(),
          ],
        ),
      ),
    );
  }
}
