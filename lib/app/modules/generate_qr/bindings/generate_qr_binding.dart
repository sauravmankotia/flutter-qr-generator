import 'package:get/get.dart';

import '../controllers/generate_qr_controller.dart';

class GenerateQrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenerateQrController>(
      () => GenerateQrController(),
    );
  }
}
