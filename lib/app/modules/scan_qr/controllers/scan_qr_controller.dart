import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class ScanQrController extends GetxController {
  RxString barcodeResults="".obs;
  Future scan() async {
    try {
      String barcodeScanRes =  await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', false, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException catch (e) {
      barcodeResults('Unknown error: $e');
    } on FormatException{
      barcodeResults('null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      barcodeResults('Unknown error: $e');
    }
  }
}
