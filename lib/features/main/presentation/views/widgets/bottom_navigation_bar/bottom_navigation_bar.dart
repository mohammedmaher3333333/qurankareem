import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qurankareem/core/utils/resources/assets_manager.dart';
import '../../../../../../core/utils/resources/color_manager.dart';
import '../../../manger/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarCubit, int>(
      builder: (context, currentIndex) {
        return BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            context.read<BottomNavigationBarCubit>().changeIndex(index);
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageAssets.book,
                colorFilter: ColorFilter.mode(
                  currentIndex == 0
                      ? ColorManager.shadeOfPurple
                      : ColorManager.bluishGray,
                  BlendMode.srcIn,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageAssets.light,
                colorFilter: ColorFilter.mode(
                  currentIndex == 1
                      ? ColorManager.shadeOfPurple
                      : ColorManager.bluishGray,
                  BlendMode.srcIn,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageAssets.prostration,
                colorFilter: ColorFilter.mode(
                  currentIndex == 2
                      ? ColorManager.shadeOfPurple
                      : ColorManager.bluishGray,
                  BlendMode.srcIn,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageAssets.prayer,
                colorFilter: ColorFilter.mode(
                  currentIndex == 3
                      ? ColorManager.shadeOfPurple
                      : ColorManager.bluishGray,
                  BlendMode.srcIn,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageAssets.favorite,
                colorFilter: ColorFilter.mode(
                  currentIndex == 4
                      ? ColorManager.shadeOfPurple
                      : ColorManager.bluishGray,
                  BlendMode.srcIn,
                ),
              ),
              label: '',
            ),
          ],
        );
      },
    );
  }
}
