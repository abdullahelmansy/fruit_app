import 'package:fruit_app/core/utils/app_images.dart';

class NavBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  NavBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

List<NavBarEntity> get bottmNavBarItem => [
      NavBarEntity(
        activeImage: Assets.imagesVuesaxBoldHome,
        inActiveImage: Assets.imagesVuesaxOutlineHome,
        name: 'الرئيسيية',
      ),
      NavBarEntity(
        activeImage: Assets.imagesVuesaxBoldProducts,
        inActiveImage: Assets.imagesVuesaxOutlineProducts,
        name: 'المنتجات',
      ),
      NavBarEntity(
        activeImage: Assets.imagesVuesaxBoldShoppingCart,
        inActiveImage: Assets.imagesVuesaxOutlineShoppingCart,
        name: 'سلة التسوق',
      ),
      NavBarEntity(
        activeImage: Assets.imagesVuesaxBoldUser,
        inActiveImage: Assets.imagesVuesaxOutlineUser,
        name: 'حسابي',
      ),
    ];
