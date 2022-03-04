import 'package:e_commerce/authentication/login_screen/login_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeScreenDrawer extends StatelessWidget {
  HomeScreenDrawer({Key? key}) : super(key: key);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Name'),
            accountEmail: Text('Email@gmail.com'),
            currentAccountPicture: Icon(
              Icons.account_circle,
              size: 75,
              color: Colors.white,
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.inventory_2),
            title: const Text(
              "All Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.shopping_cart),
            title: const Text(
              "Cart",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.shopping_bag),
            title: const Text(
              "Orders",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.local_offer),
            title: const Text(
              "Offers",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.settings),
            title: const Text(
              "Settings",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
          height: size.height / 4.5,
          ),
          ListTile(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Get.to(() => const LoginScreen());
            },
            leading: const Icon(Icons.logout),
            title: const Text(
              "Log Out",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
