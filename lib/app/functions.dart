import 'dart:html';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../domain/model/model.dart';

Future<DeviceInfo> getDeviceDetails() async {

  String name = "Unknown";
  String identifier = "Unknown";
  String version = "Unknown";

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  try{
    switch(defaultTargetPlatform){
      case TargetPlatform.android:
        break;
      case TargetPlatform.iOS:
        // TODO: Handle this case.
        break;
    }
  } on PlatformException{
    // return default configs
  }

  return DeviceInfo(name, identifier, version);

}