import 'package:flutter/material.dart';
import 'package:shopping_app/components/models/product.dart';
import 'package:shopping_app/pages/checkout.dart';
import 'package:shopping_app/pages/products.dart';

class Home extends StatefulWidget {
  static const path = '/home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final Map<Product, int> _checkoutItems = {};

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addProductToCheckout(Product product) {
    setState(() {
      if (_checkoutItems.containsKey(product)) {
        _checkoutItems[product] = _checkoutItems[product]! + 1;
      } else {
        _checkoutItems[product] = 1;
      }
    });
  }

  void _updateProductQuantity(Product product, int quantity) {
    setState(() {
      if (quantity > 0) {
        _checkoutItems[product] = quantity;
      } else {
        _checkoutItems.remove(product);
      }
    });
  }

  void _removeProduct(Product product) {
    setState(() {
      _checkoutItems.remove(product);
    });
  }

  int _getTotalItems() {
    int total = 0;
    _checkoutItems.forEach((key, value) {
      total += value;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: _selectedIndex == 0
          ? OurProducts(onAddToCart: _addProductToCheckout)
          : Checkout(
              checkoutItems: _checkoutItems,
              updateProductQuantity: _updateProductQuantity,
              removeProduct: _removeProduct,
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart),
                if (_getTotalItems() > 0)
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: Text(
                        '${_getTotalItems()}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
              ],
            ),
            label: 'Checkout',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
