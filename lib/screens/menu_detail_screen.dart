import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/cart_model.dart';
import '../model/menu_model.dart';

class MenuDetails extends StatelessWidget {
  final Menu menu;

  const MenuDetails(this.menu, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Menü Detayı'),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 400,
              child: Image(
                image: menu.image,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              menu.name,
              textAlign: TextAlign.center, // metin hizalama
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              menu.description,
              textAlign: TextAlign.center, //
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              '${menu.price}₺',
              textAlign: TextAlign.center, //
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<CartModel>(context, listen: false).addItem(menu);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ürün sepete eklendi')),
                );
              },
              child: const Text('Sepete Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
