import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qurankareem/core/utils/resources/font_manager.dart';

import '../../../../../core/utils/resources/color_manager.dart';
import '../../../../../core/utils/resources/strings_manager.dart';
import '../../../../../core/utils/resources/styles_manager.dart';
import '../../../../../core/utils/resources/values_manager.dart';
import '../../manger/classification_list_cubit/classification_list_cubit.dart';

class CustomClassificationList extends StatelessWidget {
  const CustomClassificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p24,
        horizontal: AppPadding.p12,
      ),
      child: SizedBox(
        height: AppSize.s40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context
                      .read<ClassificationListCubit>()
                      .selectItem(AppStrings.surah);
                },
                child: const CustomContainer(text: AppStrings.surah),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => context
                    .read<ClassificationListCubit>()
                    .selectItem(AppStrings.para),
                child: const CustomContainer(text: AppStrings.para),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context
                      .read<ClassificationListCubit>()
                      .selectItem(AppStrings.page);
                },
                child: const CustomContainer(text: AppStrings.page),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context
                      .read<ClassificationListCubit>()
                      .selectItem(AppStrings.hijb);
                },
                child: const CustomContainer(text: AppStrings.hijb),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.text,
    this.onTap,
  });

  final void Function()? onTap;

  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassificationListCubit, String>(
      builder: (context, selectedText) {
        final isColorDark = Theme.of(context).brightness == Brightness.dark;
        final isSelected = selectedText == text;
        return GestureDetector(
          onTap: () {
            context.read<ClassificationListCubit>().selectItem(text);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Text(
                  text,
                  style: getSemiBoldStyle(
                    fontSize: FontSize.s16,
                    color: isSelected
                        ? (isColorDark
                            ? ColorManager.shadeOfPurple
                            : ColorManager.shadeOfPurple)
                        : (isColorDark
                            ? ColorManager.shadeOfPurple
                            : ColorManager.bluishGray),
                  ),
                ),
              ),
              Container(
                height: AppSize.s3,
                width: double.infinity,
                color: isSelected
                    ? ColorManager.shadeOfPurple
                    : ColorManager.bluishGray,
              ),
            ],
          ),
        );
      },
    );
  }
}
