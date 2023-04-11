import 'package:flutter/material.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/coupon_icon.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 30),
            const Text(
              'Kupon Bulunamadı',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Kupon Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
