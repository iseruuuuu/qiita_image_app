// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import '../../component/app_button.dart';
import 'image_create_screen_controller.dart';

class ImageCreateScreen extends StatelessWidget {
  const ImageCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageCreateScreenController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF4ABE03),
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Qiitaのタイトル',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text(
                '説明\n'
                'あああ',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: TextField(
                  onChanged: controller.onTitleChanged,
                  maxLines: 2,
                  maxLength: 40,
                  inputFormatters: [
                    TextInputFormatter.withFunction(
                        (TextEditingValue oldValue, TextEditingValue newValue) {
                      int numLines = '\n'.allMatches(newValue.text).length;
                      if (numLines > 1) {
                        return oldValue;
                      }
                      return newValue;
                    }),
                  ],
                  minLines: 1,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              AppButton(
                onTap: controller.onSubmit,
                title: '生成する',
                buttonColor: const Color(0xFF4ABE03),
                titleColor: Colors.white,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
