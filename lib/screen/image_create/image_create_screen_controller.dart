// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

// Project imports:
import '../image_editor/image_editor_screen.dart';

class ImageCreateScreenController extends GetxController {
  String text = '';

  void onTitleChanged(String value) {
    text = value;
  }

  void onSubmit() async {
    if (text.isNotEmpty) {
      EasyLoading.show(status: 'loading...');
      await Future.delayed(const Duration(seconds: 3));
      EasyLoading.dismiss();
      await Future.delayed(const Duration(seconds: 1));
      Get.to(
        () => ImageEditorScreen(title: text),
      );
    } else {
      Get.snackbar(
        '画像生成失敗',
        'タイトルを入力してください！',
        backgroundColor: const Color(0xFF4ABE03),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
      );
    }
  }
}
