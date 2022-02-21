import 'package:blog_mobile/Class/Counter/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final CounterController cc = Get.put(CounterController());

class Counter extends StatelessWidget {
  const Counter({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text('Clicks: ${cc.count}')
        )
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Count'),
            onPressed: cc.increment
        )
      ),
    );
  }
}