import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Product {
  Product(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price,
      required this.image});
  late final String id;
  late final String title;
  RxInt selectedVolume = 0.obs;
  late final String quantity;
  late final String price;
  late final String image;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    selectedVolume = json['selected_volume'];
    quantity = json['quantity'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['selected_volume'] = selectedVolume;
    _data['quantity'] = quantity;
    _data['price'] = price;
    _data['image'] = image;
    return _data;
  }
}
