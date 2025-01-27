import 'package:flutter/material.dart';
import 'package:fruit_app/feature/home/presentation/view/widgets/home_view_body.dart';
import 'package:fruit_app/feature/home/presentation/view/widgets/nav_bar/custom_nav_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: HomeViewBody(),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
