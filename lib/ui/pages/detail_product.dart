import 'package:flutter/material.dart';
import 'package:flutter_adobe_xd/model/product_models.dart';
import 'package:flutter_adobe_xd/shared/theme.dart';
import 'package:flutter_adobe_xd/ui/widgets/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

class DetailProduct extends StatefulWidget {
  ProductModel? shoeList;
  DetailProduct(this.shoeList, {Key? key}) : super(key: key);

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  int selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        width: double.infinity,
        height: 386,
        child: Stack(
          children: [
            // NOTE : Image

            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/products/product1.png'),
                ),
              ),
            ),

            // NOTE : Icon
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: grey4.withOpacity(0.2),
                      ),
                      child: Center(
                        child: Icon(
                          Ionicons.chevron_back,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                  CartIcon(),
                ],
              ),
            ),

            // NOTE : Indicator
            Container(
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(width: 4),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: grey1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      Widget variations(int id, int size) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedSize = id;
            });
          },
          child: Container(
            height: 56,
            width: 56,
            margin: EdgeInsets.only(top: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: grey4.withOpacity(0.2),
              border: selectedSize == id
                  ? Border.all(
                      width: 2,
                      color: primaryColor,
                    )
                  : Border(),
            ),
            child: Text(
              size.toString(),
              style: whiteTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
          ),
        );
      }

      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 28),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nike Air Force X-AC Girl Style',
              style: whiteTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 12),
            RatingBar.builder(
              initialRating: 4.5,
              ignoreGestures: true,
              minRating: 1,
              unratedColor: grey4,
              direction: Axis.horizontal,
              itemSize: 16,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.only(right: 2),
              itemBuilder: (context, _) => Icon(
                Ionicons.star,
                color: Color(0xffCFEA5F),
              ),
              onRatingUpdate: (rating) {},
            ),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  NumberFormat.currency(
                    locale: 'id',
                    symbol: 'IDR ',
                    decimalDigits: 0,
                  ).format(
                    1650000,
                  ),
                  style: whiteTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  NumberFormat.currency(
                    locale: 'id',
                    symbol: 'IDR ',
                    decimalDigits: 0,
                  ).format(
                    3850000,
                  ),
                  style: greyTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Choose Variations',
              style: whiteTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 16,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                variations(0, 36),
                variations(1, 37),
                variations(2, 38),
                variations(3, 39),
                variations(4, 40),
              ],
            ),
            SizedBox(height: 28),
            Text(
              'Description',
              style: whiteTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'This shoes material is canvas press with foam mat, bring back your high school moment with this shoes. Choose your size and just wait for it.',
              style: whiteTextStyle,
            ),
          ],
        ),
      );
    }

    Widget relatedProducts() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        margin: EdgeInsets.only(top: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Related Products',
              style: whiteTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
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
                readonly: true,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: darkBlue,
      body: ListView(
        children: [
          header(),
          content(),
          relatedProducts(),
        ],
      ),
    );
  }
}
