import 'package:flutter/material.dart';
import 'package:qurankareem/core/utils/resources/styles_manager.dart';
import 'package:qurankareem/core/utils/resources/values_manager.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});

  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24),
      child: Center(
        child: Text(
          errMessage,
          style: getRegularStyle(
            color: Colors.red,
            fontSize: AppSize.s18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
