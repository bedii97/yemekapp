import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';
import 'package:yemek_app/constants/ui_constants.dart';
import 'package:yemek_app/core/utils/size_utils.dart';
import 'package:yemek_app/features/home/pages/explore_page.dart';
import 'package:yemek_app/features/home/pages/home_page.dart';
import 'package:yemek_app/features/home/pages/notification_page.dart';
import 'package:yemek_app/features/home/pages/profile_page.dart';
import 'package:yemek_app/routes/app_routes.dart';
import 'package:yemek_app/theme/palette.dart';

final bottomNavigationBarProvider = StateProvider<int>((ref) {
  return 0;
});

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void _goToPage(int index) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }

    void _appBarClick(int value) {
      ref.watch(bottomNavigationBarProvider.notifier).state = value;
      _goToPage(value);
    }

    // FocusScope.of(context).requestFocus(FocusNode());
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    // final int selectedIndex = ref.watch(bottomNavigationBarProvider);
    return Scaffold(
      extendBody: true,
      appBar: UiConstants.appBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _getFloatingActionButton(context),
      body: Theme(
        data: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Palette.greenColor),
        ),
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            ref.read(bottomNavigationBarProvider.notifier).state = index;
          },
          children: _getPageViewChildrens,
        ),
      ),
      // bottomNavigationBar:
      //     _getBottomNavigationBar(selectedIndex, ref, _goToPage),
      bottomNavigationBar: _getBottomAppBar(ref, _appBarClick),
    );
  }

  FloatingActionButton _getFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Palette.greenColor.withOpacity(1),
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.createPost);
      },
      child: const Icon(Icons.add),
    );
  }

  BottomAppBar _getBottomAppBar(
      WidgetRef ref, void Function(int index) appBarClick) {
    return BottomAppBar(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      shape: const CircularNotchedRectangle(),
      height: 0.08.ofSafeHeight,
      color: Palette.greenColor.withOpacity(1),
      notchMargin: 5,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Palette.whiteColor,
              size: 35,
            ),
            onPressed: () {
              appBarClick(0);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.public,
              color: Palette.whiteColor,
              size: 35,
            ),
            onPressed: () {
              appBarClick(1);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Palette.whiteColor,
              size: 35,
            ),
            onPressed: () {
              appBarClick(2);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.person,
              color: Palette.whiteColor,
              size: 35,
            ),
            onPressed: () {
              appBarClick(3);
            },
          ),
        ],
      ),
    );
  }

  List<Widget> get _getPageViewChildrens {
    return [
      const HomePage(),
      ExplorePage(),
      const NotificationsPage(),
      ProfilePage(),
    ];
  }

  ResponsiveNavigationBar _getBottomNavigationBar(
      int selectedIndex, WidgetRef ref, void Function(int index) goToPage) {
    return ResponsiveNavigationBar(
      selectedIndex: selectedIndex,
      navigationBarButtons: const [
        NavigationBarButton(
          text: "Home",
          icon: Icons.home,
          backgroundColor: Palette.greenColor,
        ),
        NavigationBarButton(
          text: "Discovery",
          icon: Icons.public,
          backgroundColor: Palette.greenColor,
        ),
        NavigationBarButton(
          text: "Create Post",
          icon: Icons.add,
          backgroundColor: Palette.greenColor,
        ),
        NavigationBarButton(
          text: "Likes",
          icon: Icons.favorite,
          backgroundColor: Palette.greenColor,
        ),
        NavigationBarButton(
          text: "Profile",
          icon: Icons.person,
          backgroundColor: Palette.greenColor,
        ),
      ],
      onTabChange: (p0) {
        ref.watch(bottomNavigationBarProvider.notifier).state = p0;
        goToPage(p0);
      },
      // backgroundColor: Colors.transparent,
      backgroundOpacity: 0.3,
      backgroundBlur: 2.5,
      showActiveButtonText: false,
      activeIconColor: Palette.whiteColor,
      backgroundColor: Palette.greenColor,
      inactiveIconColor: Palette.blackColor,
    );
  }
}
