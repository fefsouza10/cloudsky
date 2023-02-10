import 'package:cloudsky/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => Scaffold(
            appBar: AppBar(
              title: const Text('CloudSky'),
            ),
            body: Center(
                child: Column(
              children: [
                Text(
                    controller.realtimeWeatherModel!.current!.condition!.text ??
                        ''),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${controller.realtimeWeatherModel!.current!.tempC!.toStringAsFixed(0)}°' ??
                          '-',
                      style: const TextStyle(fontSize: 32),
                    ),
                    Image.network(
                        'http:${controller.realtimeWeatherModel!.current!.condition!.icon}')
                  ],
                ),
                Text(controller.realtimeWeatherModel!.location!.name ??
                    'Sem local'),
              ],
            ))),
        onLoading: const Center(child: CircularProgressIndicator()));
  }
}
