import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qurankareem/core/widgets/custom_app_bar.dart';
import 'package:qurankareem/features/bookmarks/presentation/views/widgets/bookmarks_build_add_collection.dart';
import 'package:qurankareem/features/bookmarks/presentation/views/widgets/bookmarks_build_new_collection.dart';

import '../../../../core/utils/resources/assets_manager.dart';
import '../../../../core/utils/resources/routes_manager.dart';
import '../../../../core/utils/resources/strings_manager.dart';
import '../../../../core/utils/resources/values_manager.dart';
import '../manger/build_bookmarks_collection_cubit/build_bookmarks_collection_cubit.dart';

class BookmarksView extends StatelessWidget {
  const BookmarksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(
          title: AppStrings.bookmarks,
          imagePathSuffix: ImageAssets.searchLine,
          imagePathPrefix: ImageAssets.menu2line,
        ),
        const SizedBox(height: AppSize.s24),
        const BookmarksBuildAddCollection(),
        const SizedBox(height: AppSize.s32),
        Expanded(
          child: BlocBuilder<BuildBookmarksCollectionCubit,
              BuildBookmarksCollectionState>(
            builder: (context, state) {
              if (state is BuildBookmarksCollectionLoaded &&
                  state.collections.isNotEmpty) {
                return ListView.builder(
                  itemCount: state.collections.length,
                  itemBuilder: (context, index) {
                    final collection = state.collections[index];
                    return Dismissible(
                      key: Key(collection['name']),
                      background: Container(color: Colors.red),
                      onDismissed: (direction) {
                        context
                            .read<BuildBookmarksCollectionCubit>()
                            .removeCollection(index);
                      },
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context)
                              .push('${AppRouter.kCollectionView}/$index');
                        },
                        child: BookmarksBuildNewCollection(
                          name: collection['name'],
                          index: index,
                        ),
                      ),
                    );
                  },
                );
              }
              return const Center(child: Text('No Collections'));
            },
          ),
        ),
      ],
    );
  }
}
