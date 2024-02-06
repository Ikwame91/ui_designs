import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 75,
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              //shop tile
              MyListTile(
                icon: Icons.home,
                text: 'Shop',
                onTap: () => Navigator.pop(context),
              ),
              MyListTile(
                icon: Icons.shopping_cart,
                text: 'Cart',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: MyListTile(
              icon: Icons.logout,
              text: 'Exit',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/intro_page');
              },
            ),
          ),
        ],
      ),
    );
  }
}
