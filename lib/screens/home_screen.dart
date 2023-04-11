import 'package:flutter/material.dart';
import 'package:lospollos/screens/offer_screen.dart';
import 'about_screen.dart';
import 'cart_screen.dart';
import 'login_screen.dart';
import 'menu_screen.dart';
import 'history_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const MenuScreen(),
    const OfferScreen(),
    const HistoryScreen(),
    const AboutScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Los Pollos Hermanos",
              style: TextStyle(
                fontFamily: 'Burrito',
                fontSize: 35.0,
              )),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartScreen()));
            },
          )
        ],
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0XFFCF112B),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Color(0XFFCF112B),
            icon: Icon(Icons.restaurant_menu),
            label: 'Menüler',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0XFFCF112B),
            icon: Icon(Icons.local_offer),
            label: 'Kampanyalar',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0XFFCF112B),
            icon: Icon(Icons.history),
            label: 'Tarihçemiz',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0XFFCF112B),
            icon: Icon(Icons.info_outline),
            label: 'Hakkında',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
