import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/core/constants/constants.dart';

class Utils {
  static Size findratio({
    required double height,
    required double width,
  }) {
    double rWidth = Get.width * width / mobile;
    double rHeight = Get.width * height / mobile;

    return Size(rWidth, rHeight);
  }
}
