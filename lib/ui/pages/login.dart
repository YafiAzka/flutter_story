import 'package:flutter/material.dart';
import 'package:flutter_adobe_xd/shared/theme.dart';
import 'package:flutter_adobe_xd/ui/home/main_page.dart';
import 'package:flutter_adobe_xd/ui/widgets/widgets.dart';
import 'package:ionicons/ionicons.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var remember = false;

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
            MainForm(hint: "Email"),
            MainForm(hint: "Password"),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        remember = !remember;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          remember == false
                              ? Ionicons.radio_button_off_outline
                              : Ionicons.radio_button_on_outline,
                          color: primaryColor,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Remember Me',
                          style: whiteTextStyle.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  'Forgot Password?',
                  style: whiteTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
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
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainPage(),
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
              ),
              child: Text(
                'Login',
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
              Navigator.pushNamed(context, '/register');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have account? ",
                  style: whiteTextStyle.copyWith(fontSize: 12),
                ),
                Text(
                  "Register",
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
