import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';
import 'package:yemek_app/constants/ui_constants.dart';
import 'package:yemek_app/features/home/pages/discovery_page.dart';
import 'package:yemek_app/features/home/pages/home_page.dart';
import 'package:yemek_app/features/home/pages/notification_page.dart';
import 'package:yemek_app/features/home/pages/profile_page.dart';
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

    final int selectedIndex = ref.watch(bottomNavigationBarProvider);
    return Scaffold(
      extendBody: true,
      appBar: UiConstants.appBar(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          ref.read(bottomNavigationBarProvider.notifier).state = index;
        },
        children: const [
          HomePage(),
          DiscoverPage(),
          ProfilePage(),
          NotificationsPage(),
        ],
      ),
      bottomNavigationBar: ResponsiveNavigationBar(
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
          _goToPage(p0);
        },
        // backgroundColor: Colors.transparent,
        backgroundOpacity: 0.3,
        backgroundBlur: 2.5,
        showActiveButtonText: false,
        activeIconColor: Palette.whiteColor,
        backgroundColor: Palette.greenColor,
        inactiveIconColor: Palette.blackColor,
      ),
    );
  }
}
