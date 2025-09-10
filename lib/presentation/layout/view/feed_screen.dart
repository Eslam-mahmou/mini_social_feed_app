import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_feed/core/app_provider/app_config_provider.dart';
import 'package:mini_social_feed/core/routes/routes_page.dart';
import 'package:mini_social_feed/core/utils/appAssets.dart';
import 'package:mini_social_feed/presentation/layout/manager/layout_cubit/layout_state.dart';
import 'package:mini_social_feed/presentation/layout/manager/layout_cubit/layout_view_model.dart';


class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutViewModel(),
      child: BlocBuilder<LayoutViewModel, LayoutState>(
        builder: (context, state) {
          var viewModel = context.read<LayoutViewModel>();

          return Scaffold(
            appBar: AppBar(
              title: viewModel.currentIndex == 0
                  ? const Text('Connect')
                  : viewModel.currentIndex == 3
                  ? const Text('Profile')
                  : const Text(""),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(AssetImage(AppAssets.photoIcon)),
                ),
              ],
            ),
            drawer: Drawer(),
            body: viewModel.tabs[viewModel.currentIndex],
            floatingActionButton:viewModel.currentIndex == 0 ? FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesPage.postScreen);
              },
              child: Text("+"),
            ):null,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: viewModel.currentIndex,
              onTap: (index) {
                viewModel.changeBottomNav(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AppAssets.homeIcon)),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AppAssets.vectorIcon)),
                  label: "Vector",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AppAssets.notificationIcon)),
                  label: "Notification",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AppAssets.profileIcon)),
                  label: "Profile",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
