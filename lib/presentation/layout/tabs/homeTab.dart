import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_feed/core/common/responsive_height_width.dart';
import 'package:mini_social_feed/core/di/injectable_initializer.dart';
import 'package:mini_social_feed/core/widget/custom_dialog.dart';
import 'package:mini_social_feed/presentation/layout/manager/home_teb_cubit/home_tab_stste.dart';
import 'package:mini_social_feed/presentation/layout/manager/home_teb_cubit/home_tab_view_model.dart';

import '../../../core/utils/app_colors.dart';
import '../widget/custom_suggest_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = getIt.get<HomeTabViewModel>();
    final theme = Theme.of(context);
    return BlocConsumer<HomeTabViewModel, HomeTabState>(
      bloc: viewModel..getUserData(),
      listener: (context, state) {
        if (state is GetUserDataErrorState) {
          DialogUtils.showMessage(
            context: context,
            message: state.message,
            title: "Error",
            negativeActionName: "Close",
            postActionName: "Retry",
            postAction: () {},
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.widthResponsive),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.heightResponsive),
              Text("Suggested", style: theme.textTheme.bodyMedium),
              SizedBox(height: 8.heightResponsive),
              state is GetUserDataLoadingState
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : state is GetUserDataSuccessState &&
                        viewModel.users.isNotEmpty
                  ? SizedBox(
                      height: 200.heightResponsive,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.users.length,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.widthResponsive,
                            ),
                            child: CustomSuggestItem(
                              usersDataEntity: viewModel.users[index],
                            ),
                          );
                        },
                      ),
                    )
                  : Text(
                      "No Suggested people",
                      style: theme.textTheme.bodyMedium,
                    ),
            ],
          ),
        );
      },
    );
  }
}
