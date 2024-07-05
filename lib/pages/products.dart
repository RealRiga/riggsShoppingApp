import 'package:flutter/material.dart';
import 'package:shopping_app/components/models/product.dart';

class OurProducts extends StatelessWidget {
  final void Function(Product product) onAddToCart;

  OurProducts({required this.onAddToCart});

  final List<Product> products = [
    Product(
      id: '1',
      name: 'Nike Air',
      price: 99.99,
      imageUrl: 'assets/images/shoe.png',
    ),
    Product(
      id: '2',
      name: 'Nike Low Show',
      price: 39.99,
      imageUrl: 'assets/images/shoe2.png',
    ),
    Product(
      id: '3',
      name: 'Nike Air Force',
      price: 199.99,
      imageUrl: 'assets/images/shoe3.png',
    ),
    Product(
      id: '4',
      name: 'Rainbow Air',
      price: 39.99,
      imageUrl: 'assets/images/shoe4.png',
    ),
    Product(
      id: '5',
      name: 'Italian Shoe',
      price: 84.99,
      imageUrl: 'assets/images/shoe5.png',
    ),
    Product(
      id: '6',
      name: 'Nike Air Max',
      price: 99.99,
      imageUrl: 'assets/images/shoe6.jpg',
    ),
    Product(
      id: '7',
      name: 'White Nike',
      price: 39.99,
      imageUrl: 'assets/images/shoe7.jpg',
    ),
    Product(
      id: '8',
      name: 'Nike Sneaker',
      price: 199.99,
      imageUrl: 'assets/images/shoe8.jpg',
    ),
    Product(
      id: '9',
      name: 'Adiddas',
      price: 39.99,
      imageUrl: 'assets/images/shoe9.jpg',
    ),
    Product(
      id: '10',
      name: 'Short Sneaker',
      price: 84.99,
      imageUrl: 'assets/images/shoe10.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rigg's FootWear"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        '\$${product.price}',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 8.0),
                      ElevatedButton(
                        onPressed: () {
                          onAddToCart(product);
                        },
                        child: Text('Add to Cart'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
