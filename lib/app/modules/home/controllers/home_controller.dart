import 'package:basex/app/data/dummy_data.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final productList = DummyData.products.obs;
  final index = 0.obs;

  void addVolume(String id) {
    productList.where((product) => product.id == id).first.selectedVolume++;
  }

  void reduceVolume(String id) {
    var selectedVolume =
        productList.where((product) => product.id == id).first.selectedVolume;
    if (selectedVolume.value != 0) {
      selectedVolume--;
    }
  }
}
