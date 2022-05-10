import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:request/layout/cubit/cubit.dart';
import 'package:request/layout/cubit/states.dart';
import 'package:request/shared/styles/colors.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  return Scaffold(
    //   //  body: Center(child: defaultButton(function: (){
    //   //    SignOut(context);
    //   //  }, text: 'Sign OUT'))
    //  );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),

        // BlocProvider(create: (context) => ProfileCubit()..getProfile(USERID!)),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          PersistentTabController _controller;

          _controller = PersistentTabController(initialIndex: 0);

          var cubit = AppCubit.get(context);
          return Scaffold(
            body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: PersistentTabView(
              context,
              controller: _controller,
              screens: cubit.buildScreens(),
              items: cubit.navBarsItems(),
              confineInSafeArea: true,
              backgroundColor: Colors.white, // Default is Colors.white.
              handleAndroidBackButtonPress: true, // Default is true.
              resizeToAvoidBottomInset:
                  true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
              stateManagement: true, // Default is true.
              hideNavigationBarWhenKeyboardShows:
                  true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
              decoration: NavBarDecoration(
                borderRadius: BorderRadius.circular(10.0),
                colorBehindNavBar: Colors.white,
              ),
              popAllScreensOnTapOfSelectedTab: true,
              popActionScreens: PopActionScreensType.all,
              itemAnimationProperties: ItemAnimationProperties(
                // Navigation Bar's items animation properties.
                duration: Duration(milliseconds: 200),
                curve: Curves.ease,
              ),
              screenTransitionAnimation: ScreenTransitionAnimation(
                // Screen transition animation on change of selected tab.
                animateTabTransition: true,
                curve: Curves.ease,
                duration: Duration(milliseconds: 200),
              ),
              navBarStyle: NavBarStyle
                  .style1, // Choose the nav bar style with this property.
            ),
          );
        },
      ),
    );
  }
}
