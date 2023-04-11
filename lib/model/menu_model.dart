import 'package:flutter/cupertino.dart';

class Menu {
  String name;
  String description;
  double price;
  int id;
  ImageProvider image;

  Menu(
      {required this.name,
      required this.description,
      required this.price,
      required this.image,
      required this.id});
}

final List<Menu> menus = [
  Menu(
      name: 'Kajun Kova Menü',
      description: 'İçi çıtır kajun parçaları dolu aile boy kova menü!',
      price: 180.0,
      id: 1,
      image: const AssetImage(
        'assets/images/menu1.png',
      )),
  Menu(
      name: "Çıtır 10'lu Nugget Menü",
      description: 'Albuquerque tavuklarından gelen enfes nugget lezzeti!',
      price: 70.0,
      id: 2,
      image: const AssetImage(
        'assets/images/menu2.png',
      )),
  Menu(
      name: 'Slaw Goodman',
      description:
          'Çıtır tavuklarımızla enfes uyum sağlayan meşhur lahana salatası!',
      price: 40.0,
      id: 3,
      image: const AssetImage(
        'assets/images/menu3.png',
      )),
  Menu(
      name: 'Mevlana Şekeri',
      description:
          'Diğer adıyla Konya şekerinin lezzeti sınırları aşıyor ve dünyanın damak tadına eşsiz lezzetler bırakıyor.',
      price: 35.0,
      id: 4,
      image: const AssetImage(
        'assets/images/menu4.png',
      )),
];
