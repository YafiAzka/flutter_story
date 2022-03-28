import 'package:flutter/material.dart';
import 'package:flutter_adobe_xd/shared/theme.dart';
import 'package:flutter_adobe_xd/ui/widgets/widgets.dart';
import 'package:ionicons/ionicons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Text(
              'Profile',
              style: whiteTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 16,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 36, bottom: 16),
              width: 110,
              height: 110,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/me.jpg',
                ),
              ),
            ),
            Text(
              'Azka',
              style: whiteTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    Widget historySection() {
      return Container(
        margin: EdgeInsets.only(
          top: 26,
          right: defaultMargin,
          left: defaultMargin,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order History',
                  style: whiteTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'See All',
                  style: greyTextStyle.copyWith(
                    fontWeight: bold,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryButton(
                  category: 'Pending',
                  icon: Ionicons.clipboard_outline,
                ),
                CategoryButton(
                  category: 'Packed',
                  icon: Ionicons.cube_outline,
                ),
                CategoryButton(
                  category: 'On The Way',
                  icon: Ionicons.airplane_outline,
                ),
                CategoryButton(
                  category: 'Arrived',
                  icon: Ionicons.bag_check_outline,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget buttonLink() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Column(
          children: [
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Edit Profile',
                    style: whiteTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 16,
                    ),
                  ),
                  Icon(
                    Ionicons.chevron_forward,
                    color: white,
                  ),
                ],
              ),
            ),
            Divider(color: grey1, height: 3),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Address',
                    style: whiteTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 16,
                    ),
                  ),
                  Icon(
                    Ionicons.chevron_forward,
                    color: white,
                  ),
                ],
              ),
            ),
            Divider(color: grey1, height: 3),
          ],
        ),
      );
    }

    Widget logoutBtn() {
      return Container(
        margin: EdgeInsets.only(top: 28),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
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
            'Logout',
            style: whiteTextStyle.copyWith(
              fontWeight: bold,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    return Container(
      color: darkBlue,
      child: ListView(
        children: [
          header(),
          historySection(),
          buttonLink(),
          logoutBtn(),
        ],
      ),
    );
  }
}
