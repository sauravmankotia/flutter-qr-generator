import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class GenerateQrController extends GetxController {
  Rx<TextEditingController> textEditingController=TextEditingController().obs;

  RxString message = jsonEncode({
    'id': 1,
    "booked_tickets": [1, 2, 3, 4],
    'time': "2:00"
  }).obs;


}
