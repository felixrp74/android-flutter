

import 'package:android/models/celular_model.dart';
import 'package:get/get.dart';

class DetalleController extends GetxController {

   Celular _celular; 
   Celular get celular => _celular;
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("argumentos ${Get.arguments}");
    this._celular = Get.arguments as Celular;
  }

}