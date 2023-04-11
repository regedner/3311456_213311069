import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'order_summary_screen.dart';
import 'package:lospollos/model/cart_model.dart';
import 'package:provider/provider.dart';

class OrderForm extends StatefulWidget {
  const OrderForm({Key? key}) : super(key: key);

  @override
  _OrderFormState createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _name;

  late String _surname;

  late String _address;

  String? _payment;
  bool _isCreditCardSelected = false;
  late String _cardNumber = '';
  late String _cvv = '';
  late String _expireDate = '';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String _selectedPaymentMethod = "";

  void completeOrder() {
    if (_formKey.currentState!.validate()) {
      _name = _nameController.text;
      _surname = _surnameController.text;
      _address = _addressController.text;
      _selectedPaymentMethod = _payment!;

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => OrderSummaryScreen(
            name: _name,
            surname: _surname,
            address: _address,
            paymentMethod: _selectedPaymentMethod,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sipariş Oluştur'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Kişisel Bilgiler',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'İsim',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen isminizi girin';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
                controller: _nameController,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Soyisim',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen soyisminizi girin';
                  }
                  return null;
                },
                onSaved: (value) {
                  _surname = value!;
                },
                controller: _surnameController,
              ),
              const SizedBox(height: 16),
              const Text(
                'Adres',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Adres',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen adresinizi girin';
                  }
                  return null;
                },
                onSaved: (value) {
                  _address = value!;
                },
                controller: _addressController,
              ),
              const SizedBox(height: 16),
              const Text(
                'Ödeme Bilgileri',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text('Kapıda Ödeme'),
                      value: 'Kapıda Ödeme',
                      groupValue: _payment,
                      onChanged: (value) {
                        setState(() {
                          _payment = value;
                          _selectedPaymentMethod = _payment!;
                          _isCreditCardSelected = false;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text('Kredi Kartı'),
                      value: 'Kredi Kartı',
                      groupValue: _payment,
                      onChanged: (value) {
                        setState(() {
                          _payment = value;
                          _selectedPaymentMethod = _payment!;
                          _isCreditCardSelected = true;
                        });
                      },
                    ),
                  ),
                ],
              ),
              if (_isCreditCardSelected) ...[
                const SizedBox(height: 16),
                const Text(
                  'Kredi Kartı Bilgileri',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Kart Numarası',
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen kart numaranızı girin';
                    } else if (value.length != 16) {
                      return 'Kart numaranız 16 haneli olmalıdır';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _cardNumber = value!;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'CVV',
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen CVV kodunuzu girin';
                          } else if (value.length != 3) {
                            return 'CVV kodunuz 3 haneli olmalıdır';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          _cvv = value!;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Son Kullanma Tarihi (MM/YY)',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Lütfen son kullanma tarihinizi girin';
                            } else if (!RegExp(r'^\d{2}/\d{2}$')
                                .hasMatch(value)) {
                              return 'Geçersiz son kullanma tarihi formatı';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            _expireDate = value!;
                          }),
                    ),
                  ],
                ),
              ],
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
                      subtitle: Text(
                          '${cartItem.quantity} x ${cartItem.menu.price} ₺'),
                      trailing:
                          Text('${cartItem.menu.price * cartItem.quantity} ₺'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
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
              completeOrder();
            },
            child: const Text('Siparişi Tamamla'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
