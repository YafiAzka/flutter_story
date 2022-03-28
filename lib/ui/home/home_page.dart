import 'package:flutter/material.dart';
import 'package:flutter_adobe_xd/model/product_models.dart';
import 'package:flutter_adobe_xd/shared/theme.dart';
import 'package:flutter_adobe_xd/ui/widgets/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List ads = [
    {
      'title': 'New Arrival\nItem Up to 30%',
      'image': 'assets/illustration1.png',
      'color': primaryColor
    },
    {
      'title': 'Flash Deal\n12.12 Grab Now',
      'image': 'assets/illustration2.png',
      'color': green
    }
  ];

  int index = 4;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        height: 42,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  prefixIcon: Icon(
                    Ionicons.search,
                    color: grey1,
                    size: 20,
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
            SizedBox(width: defaultMargin),
            CartIcon(),
          ],
        ),
      );
    }

    Widget adsTile() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: ads
                .map(
                  (e) => AdsBanner(
                    title: e['title'],
                    image: e['image'],
                    color: e['color'],
                  ),
                )
                .toList(),
          ),
        ),
      );
    }

    Widget category() {
      return Container(
        margin: EdgeInsets.only(
          top: 24,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Categories',
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
                  category: 'Stationary',
                  icon: Ionicons.clipboard_outline,
                ),
                CategoryButton(
                  category: 'Electronic',
                  icon: Ionicons.camera_outline,
                ),
                CategoryButton(
                  category: 'Houseware',
                  icon: Ionicons.briefcase_outline,
                ),
                CategoryButton(
                  category: 'Collection',
                  icon: Ionicons.headset_outline,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget products() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 32,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Something You Like',
              style: whiteTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 16,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 100),
              child: StaggeredGridView.countBuilder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                staggeredTileBuilder: (int index) =>
                    StaggeredTile.count(1, 1.5),
                itemCount: productList.length,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                itemBuilder: (BuildContext context, int index) {
									final ProductModel product = productList[index];
									return ProductCard(
										product: product,
									);
								} 
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
          adsTile(),
          category(),
          products(),
        ],
      ),
    );
  }
}
