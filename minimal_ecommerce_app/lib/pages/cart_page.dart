import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/components/my_button.dart';
import 'package:minimal_ecommerce_app/models/product.dart';
import 'package:minimal_ecommerce_app/models/shop.dart';
import 'package:minimal_ecommerce_app/utils/textstyle.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
              backgroundColor: Colors.white,
              content: const Text('Remove This Item To Your Cart'),
              actions: [
                //cancel button
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);

                    context.read<Shop>().removeCart(product);
                  },
                  child: const Text('yes'),
                )
              ],
            ));
  }

  void userPay(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Text('User Wants To Pay'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    Style mystyle = Style();
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Cart Page',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? Center(
                    child: Text(
                    'You Have No Items Here',
                    style: mystyle.secondStyle,
                  ))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: ((context, index) {
                      final item = cart[index];
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                width: 4,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary),
                            color: Theme.of(context).colorScheme.secondary),
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.all(15),
                        child: ListTile(
                          title: Text(
                            item.name,
                            style: mystyle.secondStyle,
                          ),
                          subtitle: Text(
                            item.price.toString(),
                            style: mystyle.secondStyle,
                          ),
                          trailing: IconButton(
                            onPressed: () => removeItemFromCart(context, item),
                            icon: const Icon(
                              Icons.remove_circle,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      );
                    })),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: MyButton(
              child: const Text(
                'Pay Now',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () => userPay(context),
            ),
          )
        ],
      ),
    );
  }
}
