import 'package:flutter/material.dart';
import 'package:fruit_app/core/widgets/search_text_feild.dart';
import 'package:fruit_app/feature/home/presentation/view/widgets/best_seller/best_selling_grid_view.dart';
import 'package:fruit_app/feature/home/presentation/view/widgets/best_seller/best_selling_header.dart';
import 'package:fruit_app/feature/home/presentation/view/widgets/custom_home_app_bar.dart';
import 'package:fruit_app/feature/home/presentation/view/widgets/featured/featured_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 16),
                CustomHomeAppBar(),
                SizedBox(height: 16),
                SearchTextFeild(),
                SizedBox(height: 12),
                FeaturedList(),
                SizedBox(height: 12),
                BestSellingHeader(),
                SizedBox(height: 8),
              ],
            ),
          ),
          BestSellingGridView(),
        ],
      ),
    );
  }
}
