import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quiz_app/controller/homepagecontroller.dart';
import 'package:quiz_app/view/homepage.dart';

class Result extends StatelessWidget {
  int result;
  HomePageController controller = Get.find();

  Result({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getText();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller.resultText,
              style: const TextStyle(fontSize: 50, color: Colors.blue),
            ),
            const Text(
              "Your Score Is",
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            Text(
              "${result.toString()} / 50",
              style: const TextStyle(fontSize: 30, color: Colors.black),
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.blue,
              onPressed: () {
                controller.inde = 0;
                controller.result = 0;
                controller.update();
                Get.off(() => HomePage());
              },
              child: const Text(
                "Restart",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
