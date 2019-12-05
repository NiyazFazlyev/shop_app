import 'package:flutter/material.dart';

import '../screens/orders_screen.dart';
import '../screens/user_products_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello!'),
          ),
          Divider(),
          buildListTile('Shop', Icons.shop, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          Divider(),
          buildListTile('Orders', Icons.payment, () {
            Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
          }),
          Divider(),
          buildListTile('Manage Products', Icons.edit, () {
            Navigator.of(context)
                .pushReplacementNamed(UserProductsScreen.routeName);
          }),
        ],
      ),
    );
  }
}
