import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/scan_qr_controller.dart';

class ScanQrView extends GetView<ScanQrController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('QR Code Scanner'),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    splashColor: Colors.blueGrey,
                    onPressed: controller.scan,
                    child: const Text('START CAMERA SCAN')
                ),
              )
              ,
              Obx(() => Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text('${controller.barcodeResults.value}', textAlign: TextAlign.center,),
              ))
              ,
            ],
          ),
        ));
  }

}

