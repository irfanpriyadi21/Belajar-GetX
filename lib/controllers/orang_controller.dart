import 'package:get/get.dart';
import 'package:get_x_tutorial/model/orang.dart';


class OrangController extends GetxController{
  var orang = Orang(nama: "Agus Halim", umur: 20).obs;


  void changeUpercase(){
   orang.update((_) {
       orang.value.nama = orang.value.nama.toUpperCase();
    });
  }
  void changeLowercase(){
    orang.update((_) {
        orang.value.nama = orang.value.nama.toLowerCase();
     });
  }
}