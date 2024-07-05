import 'package:flutter/material.dart';
import 'package:shopping_app/components/models/product.dart';
import 'package:shopping_app/pages/order.dart';

class Checkout extends StatefulWidget {
  final Map<Product, int> checkoutItems;
  final void Function(Product product, int quantity) updateProductQuantity;
  final void Function(Product product) removeProduct;

  Checkout({
    required this.checkoutItems,
    required this.updateProductQuantity,
    required this.removeProduct,
  });

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  double getTotalPrice() {
    return widget.checkoutItems.entries.fold(0.0, (sum, entry) {
      return sum + entry.key.price * entry.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: ListView.builder(
        itemCount: widget.checkoutItems.length,
        itemBuilder: (context, index) {
          final product = widget.checkoutItems.keys.elementAt(index);
          final quantity = widget.checkoutItems[product]!;
          return Card(
            child: Column(
              children: [
                Image.asset(product.imageUrl),
                ListTile(
                  title: Text(product.name),
                  subtitle: Text('\$${product.price} x $quantity'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        widget.updateProductQuantity(product, quantity - 1);
                      },
                    ),
                    Text('$quantity'),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        widget.updateProductQuantity(product, quantity + 1);
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        widget.removeProduct(product);
                      },
                      child: Text('Remove'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: \$${getTotalPrice().toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Order(),
                  ),
                );
              },
              child: Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
