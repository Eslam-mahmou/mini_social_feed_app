import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_social_feed/core/common/responsive_height_width.dart';
import 'package:mini_social_feed/core/di/injectable_initializer.dart';
import 'package:mini_social_feed/core/widget/custom_dialog.dart';
import 'package:mini_social_feed/presentation/layout/manager/home_teb_cubit/home_tab_stste.dart';
import 'package:mini_social_feed/presentation/layout/manager/home_teb_cubit/home_tab_view_model.dart';
import 'package:mini_social_feed/presentation/layout/widget/custom_post_item.dart';
import 'package:mini_social_feed/domain/entity/past_response_Entity.dart';

import '../../../core/utils/app_colors.dart';
import '../widget/custom_suggest_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = getIt.get<HomeTabViewModel>();
    final theme = Theme.of(context);
    return BlocConsumer<HomeTabViewModel, HomeTabState>(
      bloc: viewModel..loadInitialData(),
      listener: (context, state) {
        if (state is HomeTabErrorState) {
          DialogUtils.showMessage(
            context: context,
            message: state.message,
            title: "Error",
            negativeActionName: "Close",
            postActionName: "Retry",
            postAction: () {
              viewModel.loadInitialData();
            },
          );
        } else if (state is HomeTabLikeErrorState) {
          DialogUtils.showMessage(
            context: context,
            message: state.message,
            title: "Like Error",
            negativeActionName: "Close",
            postActionName: "OK",
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            // Suggested Users - ثابت بدون refresh
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.widthResponsive),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.heightResponsive),
                  Text("Suggested", style: theme.textTheme.bodyMedium),
                  SizedBox(height: 8.heightResponsive),
                  _buildSuggestedUsers(viewModel, state, theme),
                ],
              ),
            ),
            SizedBox(height: 16.heightResponsive),
            // Posts - مع refresh
            _buildPostsList(viewModel, state, theme),
          ],
        );
      },
    );
  }

  Widget _buildSuggestedUsers(
    HomeTabViewModel viewModel,
    HomeTabState state,
    ThemeData theme,
  ) {
    if (state is HomeTabLoadingState) {
      return Center(
        child: CircularProgressIndicator(color: AppColors.primaryColor),
      );
    }

    if (viewModel.users.isNotEmpty) {
      return SizedBox(
        height: 200.heightResponsive,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: viewModel.users.length,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.widthResponsive),
              child: CustomSuggestItem(usersDataEntity: viewModel.users[index]),
            );
          },
        ),
      );
    }

    return Text("No Suggested people", style: theme.textTheme.bodyMedium);
  }

  Widget _buildPostsList(
    HomeTabViewModel viewModel,
    HomeTabState state,
    ThemeData theme,
  ) {
    if (state is HomeTabLoadingState) {
      return Expanded(
        child: Center(
          child: CircularProgressIndicator(color: AppColors.primaryColor),
        ),
      );
    }

    return Expanded(
      child: StreamBuilder<List<PostResponseEntity>>(
        stream: viewModel.postsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              !snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 48, color: Colors.red),
                  SizedBox(height: 16),
                  Text(
                    "Error: ${snapshot.error}",
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          final posts = snapshot.data ?? [];

          if (posts.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.post_add,
                    size: 48,
                    color: AppColors.secondaryColor,
                  ),
                  SizedBox(height: 16),
                  Text("No Posts Found", style: theme.textTheme.bodyMedium),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              // إعادة تحميل المنشورات فقط
              await viewModel.loadInitialData();
            },
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.widthResponsive),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return CustomPostItem(
                  post: posts[index],
                  isLiked: viewModel.isLiked(posts[index]),
                  onLikePressed: () {
                    final currentUserId =
                        FirebaseAuth.instance.currentUser?.uid;
                    if (currentUserId != null) {
                      viewModel.toggleLike(posts[index].postId, currentUserId);
                    }
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
