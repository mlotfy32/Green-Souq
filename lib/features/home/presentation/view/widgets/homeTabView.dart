import 'package:flutter/material.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/styles/appImages.dart';
import 'package:green_souq/core/utiles/widgets/customeLinearButton.dart';
import 'package:green_souq/features/home/presentation/view/widgets/customAppBar.dart';
import 'package:green_souq/features/home/presentation/view/widgets/customSearchRow.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:green_souq/features/home/presentation/view/widgets/customerService.dart';
import 'package:green_souq/features/home/presentation/view/widgets/featuredItem.dart';
import 'package:green_souq/features/home/presentation/view/widgets/featuredText.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  SliverGridDelegateWithFixedCrossAxisCount delegate =
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 250,
        crossAxisSpacing: 4,
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: CustomAppBar()),
          const SliverToBoxAdapter(child: CustomSearchRow()),
          const SliverToBoxAdapter(child: CustomerService()),
          const SliverToBoxAdapter(child: FeaturesText()),
          SliverGrid.builder(
            itemBuilder: (context, index) => const FeaturedProductItem(),
            itemCount: 10,
            gridDelegate: delegate,
          ),
        ],
      ),
    );
  }
}
