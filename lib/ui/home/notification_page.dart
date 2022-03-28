import 'package:flutter/material.dart';
import 'package:flutter_adobe_xd/shared/theme.dart';
import 'package:flutter_adobe_xd/ui/widgets/widgets.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 20),
        child: Text(
          'Notifications',
          style: whiteTextStyle.copyWith(
            fontWeight: bold,
            fontSize: 16,
          ),
        ),
      );
    }

    Widget notification() {
      return Container(
        margin: EdgeInsets.only(top: 35),
        child: Column(
          children: [
            NotificationTile(),
            NotificationTile(),
            NotificationTile(),
          ],
        ),
      );
    }

    return Container(
      color: darkBlue,
      child: ListView(
        children: [
          title(),
          notification(),
        ],
      ),
    );
  }
}
