import 'package:flutter/material.dart';
import 'menu_detail_screen.dart';
import '../model/menu_model.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: menus.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: const Color(0xFFFDDB00),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuDetails(menus[index]),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // center align name and description
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: menus[index].image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      menus[index].name,
                      textAlign: TextAlign.center, // center align name
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      menus[index].description,
                      textAlign: TextAlign.center, // center align description
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${menus[index].price}₺',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
