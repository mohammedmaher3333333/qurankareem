import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qurankareem/core/utils/resources/color_manager.dart';
import 'package:qurankareem/core/utils/resources/font_manager.dart';
import 'package:qurankareem/core/utils/resources/strings_manager.dart';
import 'package:qurankareem/core/utils/resources/styles_manager.dart';
import 'package:qurankareem/core/utils/resources/values_manager.dart';

import '../../../../../core/utils/resources/assets_manager.dart';
import '../../../../../core/utils/resources/routes_manager.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              AppStrings.quranApp,
              style: getBoldStyle(
                color: ColorManager.shadeOfPurple,
                fontSize: FontSize.s28,
              ),
            ),
            const SizedBox(
              height: AppSize.s16,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: getRegularStyle(
                  color: ColorManager.desaturatedLavender,
                  fontSize: FontSize.s18,
                ),
                children: const [
                  TextSpan(
                    text: '${AppStrings.learnQuranAnd}\n',
                  ),
                  TextSpan(text: AppStrings.reciteEveryday),
                ],
              ),
            ),
            const SizedBox(
              height: AppSize.s49,
            ),
            Center(
              child: SizedBox(
                height: AppSize.s480,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      ImageAssets.splashImage,
                    ),
                    Positioned(
                      bottom: AppSize.s0,
                      right: AppSize.s62,
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).go(AppRouter.kMainView);
                        },
                        child: Container(
                          width: AppSize.s185,
                          height: AppSize.s60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.s30),
                            color: ColorManager.softCoral,
                          ),
                          child: Center(
                            child: Text(
                              AppStrings.getStarted,
                              style: getSemiBoldStyle(
                                color: ColorManager.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
