import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_tutorial/controllers/orang_controller.dart';
import './controllers/counter_controller.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
   final counterC = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return  Obx(
      ()=> MaterialApp(
        theme: counterC.isDark.value ? ThemeData.dark() : ThemeData.light(),
        home: HomePage(),
      )
    );
  }
}

class HomePage extends StatelessWidget {
    HomePage({super.key});
  final c = Get.find<CounterController>();
  final orangC = Get.put(OrangController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Belajar GetX"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50),
            child: Obx(
                () => Text(
                "Angka Menggunakan Obx ${c.counter}",
                style: const TextStyle(
                  fontSize: 20
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap:()=> c.dexrement(),
                child: const CircleAvatar(
                  child: Icon(
                    Icons.minimize_rounded
                  ),
                ),
              ),
              GestureDetector(
                onTap: ()=> c.increment(),
                child: const CircleAvatar(
                  child: Icon(
                    Icons.add
                  ),
                ),
              )
            ],
          ),
           Container(
            padding: EdgeInsets.only(top: 20),
            child: Obx(
                () => Text(
                "Nama Kamu ${orangC.orang.value.nama}",
                style: const TextStyle(
                  fontSize: 20
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: ()=> orangC.changeUpercase(),
                child: const CircleAvatar(
                  child: Text("ABC")
                ),
              ),
              GestureDetector(
                onTap: ()=> orangC.changeLowercase(),
                child: const CircleAvatar(
                  child: Text("abc")
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 30),
            child: GetX<CounterController>(
              init: CounterController(),
              builder: (controller) => Text(
                "Angka Menggunakan GetX ${controller.counter.value}",
                style: const TextStyle(
                  fontSize: 20
                ),
              ),
            
            )
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap:()=> Get.find<CounterController>().dexrement(),
                child: const CircleAvatar(
                  child: Icon(
                    Icons.minimize_rounded
                  ),
                ),
              ),
              GestureDetector(
                onTap: ()=> Get.find<CounterController>().dexrement(),
                child: const CircleAvatar(
                  child: Icon(
                    Icons.add
                  ),
                ),
              )
            ],
          ),
          
        ],       
      ),
      ), 
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> c.changeTheme(),
      ),
    );
  }
}

