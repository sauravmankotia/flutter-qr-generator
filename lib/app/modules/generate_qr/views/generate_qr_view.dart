
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../controllers/generate_qr_controller.dart';

GlobalKey previewContainer = GlobalKey();

class GenerateQrView extends GetView<GenerateQrController> {

  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Generate & Share")),
      body: Column(
        children: [
         Obx(() =>  TextFormField(
           controller: controller.textEditingController.value,
           onFieldSubmitted: (value){
             controller.message(value.toString());
             controller.textEditingController.value.clear();
           },
         ),),
          Divider(),
          Container(
            child: Screenshot(
              controller: screenshotController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(
                    child: Container(
                      width: 300,
                      child: Obx(()=>CustomPaint(
                        size: Size.square(300),
                        painter: QrPainter(
                          data: controller.message.value,
                          version: QrVersions.auto,
                          eyeStyle: const QrEyeStyle(
                            eyeShape: QrEyeShape.square,
                            color: Color(0xff128760),
                          ),
                          dataModuleStyle: const QrDataModuleStyle(
                            dataModuleShape: QrDataModuleShape.square,
                            color: Color(0xff1a5441),
                          ),
                        ),
                      )),
                    ),
                  ),
                  Obx(() =>Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20)
                        .copyWith(bottom: 40),
                    child: Text(controller.message.value),
                  ),)
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: capture,
        child: Text("Share"),
      ),
    );
  }

  void capture() async {
    await screenshotController
        .capture(delay: const Duration(milliseconds: 10))
        .then((image) async {
      if (image != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/image.png').create();
        await imagePath.writeAsBytes(image);
        await Share.shareFiles([imagePath.path]);
      }
    });
  }
}
