    import 'package:flutter/material.dart';

    import 'package:get/get.dart';

    import '../controllers/onboard_controller.dart';

    class OnboardView extends GetView<OnboardController> {

      @override
      final OnboardController controller = Get.put(OnboardController());
      @override
      Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: TweenAnimationBuilder(
              duration: Duration(seconds: 5),
              tween: Tween<double>(begin: 0, end: 1),
              builder: (context, double value, child) {
                return Opacity(
                  opacity: value,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'asset/icon.png',
                        height: 120,
                      ),
                      const SizedBox(height: 16),
                      
                    ],
                  ),
                );
              },
            ),
          ),
        );
      }
    }
