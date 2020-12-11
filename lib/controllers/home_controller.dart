
import 'package:android/api/celular_api.dart';
import 'package:android/models/celular_model.dart';
import 'package:android/pages/home_pages_widgets/detalle_page.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Celular> _celular = [];

  List<Celular> get celular => _celular;
 
  @override
  void onReady(){
    super.onReady();
    print("estaba en club ");
    this.loadCelular();
  }

  Future<void> loadCelular() async { 
    CelularAPI celularAPI= new CelularAPI(); 
    final data = await celularAPI.getCelular();
    this._celular = data;
    update(['celular']);
  }

  detalle( Celular celular){
    // Get.to(
    //   DetallePage(),
    //   arguments: celular,
    // );
  }
}