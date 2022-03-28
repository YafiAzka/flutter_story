import 'package:flutter/material.dart';
import 'package:flutter_adobe_xd/model/product_models.dart';
import 'package:flutter_adobe_xd/shared/theme.dart';
import 'package:flutter_adobe_xd/ui/widgets/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ionicons/ionicons.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

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

    Widget products() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.all(defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StaggeredGridView.countBuilder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              staggeredTileBuilder: (int index) => StaggeredTile.count(1, 1.5),
              itemCount: shoesList.length,
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              itemBuilder: (BuildContext context, int index) => ProductCard(
                id: shoesList[index].id,
                name: shoesList[index].name,
                image: shoesList[index].image,
                price: shoesList[index].price,
                rating: shoesList[index].rating,
              ),
            ),
          ],
        ),
      );
    }

    Widget bottomText() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 90),
        alignment: Alignment.center,
        child: Text("You've reached the end", style: greyTextStyle),
      );
    }

    return Container(
      color: darkBlue,
      child: ListView(
        children: [
          header(),
          products(),
          bottomText(),
        ],
      ),
    );
  }
}
