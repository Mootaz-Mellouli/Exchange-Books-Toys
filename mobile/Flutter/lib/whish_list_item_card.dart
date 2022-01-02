import 'package:flutter/material.dart';

class WishListItemCard extends StatelessWidget {
  String category, description;
  int quantity;
  WishListItemCard(
      {Key? key,
      required this.category,
      required this.description,
      required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListTile(
            title: Text(
              category,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "\nDescription:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    description,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "\nQuantity: " + quantity.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
