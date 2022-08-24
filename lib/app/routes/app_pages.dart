import 'package:get/get.dart';

import 'package:qr_generator/app/modules/generate_qr/bindings/generate_qr_binding.dart';
import 'package:qr_generator/app/modules/generate_qr/views/generate_qr_view.dart';
import 'package:qr_generator/app/modules/home/bindings/home_binding.dart';
import 'package:qr_generator/app/modules/home/views/home_view.dart';
import 'package:qr_generator/app/modules/scan_qr/bindings/scan_qr_binding.dart';
import 'package:qr_generator/app/modules/scan_qr/views/scan_qr_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.GENERATE_QR,
      page: () => GenerateQrView(),
      binding: GenerateQrBinding(),
    ),
    GetPage(
      name: _Paths.SCAN_QR,
      page: () => ScanQrView(),
      binding: ScanQrBinding(),
    ),
  ];
}
