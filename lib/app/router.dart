import 'package:event_ticket_task/app/router_paths.dart';
import 'package:event_ticket_task/core/utils/import.dart';
import 'package:event_ticket_task/core/utils/spacer.dart';
import 'package:event_ticket_task/core/widgets/extended_image.dart';
import 'package:event_ticket_task/features/auth/screens/home.dart';
import 'package:event_ticket_task/features/auth/screens/purchase_success.dart';
import 'package:event_ticket_task/features/auth/screens/splashscreen.dart';
import 'package:event_ticket_task/features/auth/screens/ticket_details.dart';
import 'package:event_ticket_task/resources/colors.dart';
import 'package:event_ticket_task/resources/resources.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final rootScaffoldStateKey = GlobalKey<ScaffoldState>();

final router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  navigatorKey: rootNavigatorKey,
  // initialLocation: AppPath.timeline.goRoute,
  observers: [FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)],
  routes: [
    GoRoute(
      path: AppPath.splash.goRoute,
      name: AppPath.splash.path,
      builder: (context, state) => SplashScreen(),
      routes: [
        GoRoute(
          path: AppPath.splash.home.goRoute,
          name: AppPath.splash.home.path,
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: AppPath.splash.purchaseSuccess.goRoute,
          name: AppPath.splash.purchaseSuccess.path,
          builder: (context, state) => PurchaseSuccessScreen(),
        ),
        GoRoute(
          path: AppPath.splash.ticketDetails.goRoute,
          name: AppPath.splash.ticketDetails.path,
          builder: (context, state) => TicketDetailsScreen(),
        ),
      ],
    ),

    // StatefulShellRoute.indexedStack(
    //   builder:
    //       (context, state, navigationShell) =>
    //           ScaffoldWithNestedNavigation(navigationShell: navigationShell),
    //   branches: [
    //     StatefulShellBranch(
    //       routes: [
    //         GoRoute(
    //           path: AppPath.home.goRoute,
    //           name: AppPath.home.path,
    //           //builder: (context, state) => const HomeScreen(),
    //         ),
    //       ],
    //     ),
    //     // StatefulShellBranch(
    //     //   routes: [GoRoute(path: AppPath.pay.goRoute, name: AppPath.pay.path)],
    //     // ),
    //     // StatefulShellBranch(
    //     //   routes: [
    //     //     GoRoute(path: AppPath.cards.goRoute, name: AppPath.cards.path),
    //     //   ],
    //     // ),
    //     // StatefulShellBranch(
    //     //   routes: [
    //     //     GoRoute(
    //     //       path: AppPath.shop.goRoute,
    //     //       name: AppPath.shop.path,
    //     //       // builder: (context, state) => const ShopScreen(),
    //     //     ),
    //     //   ],
    //     // ),
    //     // StatefulShellBranch(
    //     //   routes: [
    //     //     GoRoute(
    //     //       path: AppPath.profile.goRoute,
    //     //       name: AppPath.profile.path,
    //     //       //  builder: (context, state) => const ProfileScreen(),
    //     //     ),
    //     //   ],
    //     // ),
    //   ],
    // ),
  ],
);

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) => navigationShell.goBranch(
    index,
    initialLocation: index == navigationShell.currentIndex,
  );

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavigationBar(
      body: navigationShell,
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: _goBranch,
    );
  }
}

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
    super.key,
  });

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        key: rootScaffoldStateKey,
        body: body,
        bottomNavigationBar: BottomNavWidget(
          currentIndex: selectedIndex,
          onTap: onDestinationSelected,
        ),
      ),
    );
  }
}

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.skyWhite,
      height: 85,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                onTap(0);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                children: [
                  SvgPicture.asset(
                    currentIndex == 0
                        ? SvgIcons.homeActive
                        : SvgIcons.homeInactive,
                  ),
                  YMargin(4),
                  Text(
                    FlutterI18n.translate(context, "Home"),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color:
                          currentIndex == 0
                              ? AppColors.primaryLight
                              : AppColors.darkNeutral,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                onTap(1);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                children: [
                  SvgPicture.asset(
                    currentIndex == 1
                        ? SvgIcons.giftApproved
                        : SvgIcons.giftInactive,
                  ),
                  YMargin(4),
                  Text(
                    FlutterI18n.translate(context, "Gift Card"),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color:
                          currentIndex == 1
                              ? AppColors.primaryLight
                              : AppColors.darkNeutral,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                onTap(2);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                children: [
                  SvgPicture.asset(
                    currentIndex == 2 ? SvgIcons.cardActive : SvgIcons.cards,
                  ),
                  YMargin(4),
                  Text(
                    FlutterI18n.translate(context, "Cards"),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color:
                          currentIndex == 2
                              ? AppColors.primaryLight
                              : AppColors.darkNeutral,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                onTap(3);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                children: [
                  SvgPicture.asset(
                    currentIndex == 3
                        ? SvgIcons.solarShopBold
                        : SvgIcons.solarShopLinear,
                  ),
                  YMargin(4),
                  Text(
                    FlutterI18n.translate(context, "Store"),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color:
                          currentIndex == 3
                              ? AppColors.primaryLight
                              : AppColors.darkNeutral,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                onTap(4);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        width: 2,
                        color:
                            currentIndex == 4
                                ? AppColors.primaryLight
                                : AppColors.darkNeutral,
                      ),
                    ),
                    child: ExtendedImageWidget.network(
                      "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                      width: 24,
                      height: 24,
                      borderRadius: 12.0,
                    ),
                  ),
                  YMargin(4),
                  Text(
                    FlutterI18n.translate(context, "Profile"),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color:
                          currentIndex == 4
                              ? AppColors.primaryLight
                              : AppColors.darkNeutral,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
