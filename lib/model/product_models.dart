class ProductModel {
  int id;
  String name;
  String image;
  double rating;
  double price;
  String description;

  ProductModel({
    this.id = 0,
    this.name = '',
    this.image = '',
    this.rating = 0,
    this.price = 0,
    this.description = '',
  });

  get length => null;
}

List productList = [
  ProductModel(
    id: 1,
    name: 'Nike Air Force X-AC Girl Style',
    image: 'assets/products/product1.png',
    rating: 4,
    price: 1650000,
  ),
  ProductModel(
    id: 2,
    name: 'Smartwatch 2.0',
    image: 'assets/products/product2.png',
    rating: 4,
    price: 4500000,
  ),
  ProductModel(
    id: 3,
    name: 'Philips LED Wi-Fi',
    image: 'assets/products/product3.png',
    rating: 4,
    price: 85000,
  ),
  ProductModel(
    id: 4,
    name: 'Garnier Pure Action',
    image: 'assets/products/product4.png',
    rating: 4,
    price: 27839,
  ),
  ProductModel(
    id: 5,
    name: 'Rexus Headphone',
    image: 'assets/products/product5.png',
    rating: 4,
    price: 743200,
  ),
  ProductModel(
    id: 6,
    name: 'Airpods',
    image: 'assets/products/product6.png',
    rating: 4,
    price: 5500000,
  ),
];

List shoesList = [
  ProductModel(
    id: 1,
    name: 'Nike Air Force X-AC Girl Style',
    image: 'assets/products/product1.png',
    rating: 4,
    price: 1650000,
  ),
  ProductModel(
    id: 2,
    name: 'Nike Air X-203F Man Style',
    image: 'assets/products/shoes1.png',
    rating: 4,
    price: 4500000,
  ),
  ProductModel(
    id: 3,
    name: 'Nike Yezzy T-2000',
    image: 'assets/products/shoes2.png',
    rating: 4,
    price: 85000,
  ),
  ProductModel(
    id: 4,
    name: 'Nike P-Y671 Excute',
    image: 'assets/products/shoes3.png',
    rating: 4,
    price: 27839,
  ),
  ProductModel(
    id: 5,
    name: 'Nike Kenzy Nice',
    image: 'assets/products/shoes4.png',
    rating: 4,
    price: 743200,
  ),
];
