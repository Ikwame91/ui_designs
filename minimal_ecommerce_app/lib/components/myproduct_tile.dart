import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/product.dart';
import 'package:minimal_ecommerce_app/models/shop.dart';
import 'package:minimal_ecommerce_app/utils/textstyle.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  const MyProductTile({super.key, required this.product});
  final Product product;

//add to cart
  void addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        backgroundColor: Colors.white,
        content: const Text('Add This Item To Your Cart'),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().addToCart(product);
            },
            child: const Text('yes'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Style mystyle = Style();
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //product Image
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(
                    product.imageDescription,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //product name
              Text(product.name, style: mystyle.customStyle),
              //product description
              Text(
                product.description,
                style: mystyle.secondStyle,
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: mystyle.secondStyle,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: IconButton(
                  onPressed: () => addToCart(context),
                  icon: const Icon(Icons.add),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
