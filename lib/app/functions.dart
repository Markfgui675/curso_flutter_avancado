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
        var build = await deviceInfoPlugin.androidInfo;
        name = build.brand + " "+ build.model;
        identifier = build.id;
        version = build.version.codename;
        break;
      case TargetPlatform.iOS:
        var build = await deviceInfoPlugin.iosInfo;
        name = build.name + " "+ build.model;
        identifier = build.identifierForVendor!;
        version = build.systemVersion;
        break;
    }
  } on PlatformException{
    // return default configs
  }

  return DeviceInfo(name, identifier, version);

}