import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/homepagecontroller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  HomePageController controller = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<HomePageController>(builder: (controller) {
          return Column(
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Expanded(
                flex: 2,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      controller.quiz[controller.inde].question,
                      style: const TextStyle(fontSize: 20),
                    )),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 6,
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                      child: MaterialButton(
                        minWidth: 200,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: controller.color == true &&
                                controller
                                        .quiz[controller.inde].answers[index] ==
                                    controller.quiz[controller.inde].correct
                            ? Colors.green
                            : Colors.blue,
                        onPressed: () {
                          controller.changeInde(index);
                        },
                        child: Text(
                          controller.quiz[controller.inde].answers[index],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Expanded(
                flex: 2,
                child: SizedBox(),
              ),
            ],
          );
        }),
      ),
    );
  }
}
