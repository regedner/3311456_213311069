import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/cart_model.dart';
import 'order_Screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepet'),
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: ValueKey(cart.items[index].menu.id),
                onDismissed: (_) {
                  cart.removeAllItems(cart.items[index].menu);
                  List<CartItem> newItems = List.from(cart.items);
                  newItems.removeAt(index);
                  cart.setItems(newItems);
                },
                confirmDismiss: (_) async {
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Emin misiniz?"),
                        content: const Text(
                            "Ürünü sepetinizden silmek istediğinize emin misiniz?"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: const Text("Geri Dön",
                                style: TextStyle(color: Color(0XFFCF112B))),
                          ),
                          TextButton(
                            onPressed: () {
                              cart.removeAllItems(cart.items[index].menu);
                              Navigator.of(context).pop(true);
                            },
                            child: const Text("Sil",
                                style: TextStyle(color: Color(0XFFCF112B))),
                          ),
                        ],
                      );
                    },
                  );
                },
                background: Container(
                  color: const Color(0XFFCF112B),
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
                child: ListTile(
                  leading: cart.items[index].menu.image != null
                      ? Image(image: cart.items[index].menu.image)
                      : Image.network('https://via.placeholder.com/150'),
                  title: Text(cart.items[index].menu.name),
                  subtitle: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          cart.items[index].decrement();
                          cart.notifyListeners();
                        },
                      ),
                      Text('${cart.items[index].quantity}'),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          cart.items[index].increment();
                          cart.notifyListeners();
                        },
                      ),
                    ],
                  ),
                  trailing: Text(
                    '${cart.items[index].menu.price * cart.items[index].quantity}\₺',
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return Text(
                'Toplam Fiyat: ${cart.totalPrice}₺',
                style: const TextStyle(fontSize: 24),
              );
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OrderForm()),
              );
            },
            child: const Text('Siparişi Tamamla'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
