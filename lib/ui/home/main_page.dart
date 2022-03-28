import 'package:flutter/material.dart';
import 'package:flutter_adobe_xd/shared/theme.dart';
import 'package:flutter_adobe_xd/ui/home/home_page.dart';
import 'package:flutter_adobe_xd/ui/home/notification_page.dart';
import 'package:flutter_adobe_xd/ui/home/product_page.dart';
import 'package:flutter_adobe_xd/ui/home/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Widget pageView() {
      switch (index) {
        case 0:
          return HomePage();
        case 1:
          return ProductPage();
        case 2:
          return NotificationPage();
        case 3:
          return ProfilePage();

        default:
          return HomePage();
      }
    }

    Widget bottomNavBar() {
      navIcon(int id, String image, String title) {
        return InkWell(
          onTap: () {
            setState(() {
              index = id;
            });
          },
          child: Container(
            width: 70,
            height: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  margin: EdgeInsets.only(bottom: 4),
                  child: Image.asset(
                    image,
                    color: id == index ? white : grey4.withOpacity(0.5),
                  ),
                ),
                Text(
                  title,
                  style: whiteTextStyle.copyWith(
                    fontSize: 10,
                    color: id == index ? white : grey4.withOpacity(0.5),
                  ),
                )
              ],
            ),
          ),
        );
      }

      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            height: 70,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            decoration: BoxDecoration(
              color: darkBlue,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                navIcon(0, 'assets/home_icon.png', 'Home'),
                navIcon(1, 'assets/product_icon.png', 'Product'),
                navIcon(2, 'assets/notification_icon.png', 'Notification'),
                navIcon(3, 'assets/profile_icon.png', 'Profile'),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          pageView(),
          bottomNavBar(),
        ],
      ),
    );
  }
}
