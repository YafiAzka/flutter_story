import 'package:flutter/material.dart';
import 'package:flutter_adobe_xd/shared/theme.dart';
import 'package:ionicons/ionicons.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        height: 42,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Row(
          children: [
            Container(
              height: 42,
              width: 42,
              margin: EdgeInsets.only(right: defaultMargin),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: grey4.withOpacity(0.2),
              ),
              child: Icon(
                Ionicons.chevron_back,
                color: grey1,
              ),
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  prefixIcon: Icon(
                    Ionicons.search,
                    color: grey1,
                  ),
                  hintStyle: greyTextStyle,
                  hintText: "I'm Searching For...",
                  fillColor: grey4.withOpacity(0.2),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                  ),
                ),
              ),
            ),
            Container(
              height: 42,
              width: 42,
              margin: EdgeInsets.only(left: defaultMargin),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: grey4.withOpacity(0.2),
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Center(
                    child: Icon(
                      Ionicons.cart_outline,
                      color: grey1,
                    ),
                  ),
                  Container(
                    height: 12,
                    width: 12,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 8, right: 6),
                    decoration: BoxDecoration(
                      color: red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      '2',
                      style: whiteTextStyle.copyWith(
                        fontSize: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      color: darkBlue,
      child: ListView(
        children: [
          header(),
        ],
      ),
    );
  }
}
