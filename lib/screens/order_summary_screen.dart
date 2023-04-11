import 'package:flutter/material.dart';
import 'package:lospollos/model/cart_model.dart';
import 'package:provider/provider.dart';

class OrderSummaryScreen extends StatelessWidget {
  final String name;
  final String surname;
  final String address;
  final String paymentMethod;

  const OrderSummaryScreen({
    super.key,
    required this.name,
    required this.surname,
    required this.address,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sipariş Özeti'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sipariş Bilgileri',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'İsim Soyisim: $name $surname',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Adres: $address',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Ödeme Yöntemi: $paymentMethod',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Sepet Ürünleri',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final cartItem = cart.items[index];
                  return ListTile(
                    leading: cart.items[index].menu.image != null
                        ? Image(image: cart.items[index].menu.image)
                        : Image.network('https://via.placeholder.com/150'),
                    title: Text(cartItem.menu.name),
                    subtitle:
                        Text('${cartItem.quantity} x ${cartItem.menu.price} ₺'),
                    trailing:
                        Text('${cartItem.menu.price * cartItem.quantity} ₺'),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                cart.clear();
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text('Tamam'),
            ),
          ],
        ),
      ),
    );
  }
}
