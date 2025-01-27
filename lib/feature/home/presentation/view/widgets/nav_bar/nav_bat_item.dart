import 'package:flutter/material.dart';
import 'package:fruit_app/feature/home/domain/entities/nav_bar_entity.dart';
import 'package:fruit_app/feature/home/presentation/view/widgets/nav_bar/active_item.dart';
import 'package:fruit_app/feature/home/presentation/view/widgets/nav_bar/inactive_item.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem(
      {super.key, required this.isSelected, required this.navBarEntity});
  final bool isSelected;
  final NavBarEntity navBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: navBarEntity.activeImage,
            text: navBarEntity.name,
          )
        : InActiveItem(image: navBarEntity.inActiveImage);
  }
}
