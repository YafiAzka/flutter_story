import 'package:flutter/material.dart';
import 'package:flutter_adobe_xd/shared/theme.dart';
import 'package:flutter_adobe_xd/ui/pages/detail_product.dart';
import 'package:flutter_adobe_xd/model/product_models.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

class MainForm extends StatelessWidget {
  final String hint;
  MainForm({
    Key? key,
    this.hint = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      height: 42,
      child: TextFormField(
        style: whiteTextStyle,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 20,
          ),
          hintText: hint,
          hintStyle: greyTextStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          fillColor: grey4.withOpacity(0.2),
          filled: true,
        ),
      ),
    );
  }
}

class AdsBanner extends StatelessWidget {
  final String title;
  final String image;
  final Color? color;
  const AdsBanner({
    Key? key,
    this.title = '',
    this.image = '',
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 278,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(left: defaultMargin),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: whiteTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  fixedSize: Size(90, 26),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    side: BorderSide(
                      width: 1,
                      color: white,
                    ),
                  ),
                ),
                child: Text(
                  'Grab it Now',
                  style: whiteTextStyle.copyWith(fontSize: 10),
                ),
              ),
            ],
          ),
          Container(
            height: 124,
            width: 98,
            margin: EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String category;
  final IconData? icon;
  const CategoryButton({
    Key? key,
    this.category = '',
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 20, bottom: 8),
          decoration: BoxDecoration(
            color: grey4.withOpacity(0.2),
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          child: Icon(
            icon,
            color: white,
          ),
        ),
        Text(
          category,
          style: whiteTextStyle.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  // final ProductModel shoeList
  // final int id;
  // final String name;
  // final String image;
  // final double rating;
  // final double price;
  final bool readonly;
  final ProductModel product;
  ProductCard({
    Key? key,
    // this.id = 0,
    // this.name = '',
    // this.image = '',
    // this.rating = 0,
    // this.price = 0,
    required this.product,
    this.readonly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => readonly == false
          ? Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailProduct(product),
              ),
            )
          : {},
      child: Container(
        width: 164,
        height: 260,
        decoration: BoxDecoration(
          color: grey4.withOpacity(0.2),
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        padding: EdgeInsets.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.image),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    overflow: TextOverflow.ellipsis,
                    style: whiteTextStyle.copyWith(fontWeight: bold),
                  ),
                  // NOTE : Rating
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: product.rating,
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
                      SizedBox(width: 2),
                      Text(
                        '(16)',
                        style: greyTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                  // NOTE : Price
                  SizedBox(height: 4),
                  Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'IDR ',
                      decimalDigits: 0,
                    ).format(
                      product.price,
                    ),
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  const NotificationTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order #20181111123 has arrived!',
                style: purpleTextStyle.copyWith(fontWeight: bold),
              ),
              SizedBox(height: 8),
              Text(
                "What you've been waiting for has arrived! Don't forget to confirm on the history page!",
                style: whiteTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Ionicons.time_outline,
                    color: grey1,
                    size: 12,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '09-04-2021 17:51',
                    style: greyTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(color: grey1),
      ],
    );
  }
}

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 42,
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
              color: white,
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
    );
  }
}
