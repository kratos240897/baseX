import 'package:basex/app/data/models/category.dart';
import 'package:basex/app/data/models/product.dart';

class DummyData {
  static List<Product> products = [
    Product(
        id: '1',
        title: 'Baskin Robins Honey Tub',
        quantity: '750ml',
        image: 'lib/assets/honey_tub.png',
        price: '240'),
    Product(
        id: '2',
        title: 'Baskin Robins Butterscotch Tub',
        image: 'lib/assets/butterscotch_tub.png',
        quantity: '750ml',
        price: '240'),
    Product(
        id: '3',
        title: 'Baskin Robins Chocolate Cone',
        quantity: '1Nos',
        image: 'lib/assets/chocolate_cone.png',
        price: '240'),
    Product(
        id: '4',
        title: 'Baskin Robins Japanese Cone',
        image: 'lib/assets/japanese_cone.png',
        quantity: '1Nos',
        price: '240'),
    Product(
        id: '5',
        title: 'Baskin Robins Honey Cup',
        quantity: '1Nos',
        image: 'lib/assets/japanese_cup.png',
        price: '240'),
    Product(
        id: '6',
        title: 'Baskin Robins Mango Cone',
        image: 'lib/assets/mango.png',
        quantity: '1Nos',
        price: '240'),
    Product(
        id: '7',
        title: 'Baskin Robins Rainbow Cone',
        quantity: '1Nos',
        image: 'lib/assets/rainbow_cone.png',
        price: '240'),
    Product(
        id: '8',
        title: 'Baskin Robins Rainbow Cup',
        image: 'lib/assets/rainbow_cup.png',
        quantity: '1Nos',
        price: '240'),
  ];

  static List<Category> categories = [
    Category(
        id: '1',
        name: 'Fruits and Veggies',
        image:
            'https://www.freepnglogos.com/uploads/vegetables-png/fruits-and-vegetables-png-transparent-fruits-and-19.png'),
    Category(
        id: '1',
        name: 'Dairy, Bread and Eggs',
        image:
            'https://www.freepnglogos.com/uploads/vegetables-png/fruits-and-vegetables-png-transparent-fruits-and-19.png'),
    Category(
        id: '1',
        name: 'Rice, Atta and Dals',
        image:
            'https://www.freepnglogos.com/uploads/vegetables-png/fruits-and-vegetables-png-transparent-fruits-and-19.png'),
    Category(
        id: '1',
        name: 'Munchies',
        image:
            'https://www.freepnglogos.com/uploads/vegetables-png/fruits-and-vegetables-png-transparent-fruits-and-19.png'),
    Category(
        id: '1',
        name: 'Biscuits',
        image:
            'https://www.freepnglogos.com/uploads/vegetables-png/fruits-and-vegetables-png-transparent-fruits-and-19.png'),
    Category(
        id: '1',
        name: 'Cools Drinks and Juices',
        image:
            'https://www.freepnglogos.com/uploads/vegetables-png/fruits-and-vegetables-png-transparent-fruits-and-19.png'),
    Category(
        id: '1',
        name: 'Tea, Coffee and More',
        image:
            'https://www.freepnglogos.com/uploads/vegetables-png/fruits-and-vegetables-png-transparent-fruits-and-19.png'),
    Category(
        id: '1',
        name: 'Ice Creams',
        image:
            'https://www.freepnglogos.com/uploads/vegetables-png/fruits-and-vegetables-png-transparent-fruits-and-19.png'),
  ];
}
