import 'package:flutter/material.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/features/home/presentation/view/widgets/customAppBar.dart';
import 'package:green_souq/features/services/presentation/view/widget/servicesItem.dart';

class ServicesTabViewBody extends StatelessWidget {
  const ServicesTabViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 55,
              child: CustomAppBar(title: 'Services', isSearch: true),
            ),
            SizedBox(
              height: context.getHeight(context: context) - 159,
              child: CustomScrollView(
                slivers: [
                  SliverGrid.builder(
                    itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 250,
                          crossAxisSpacing: 4,
                        ),
                    itemBuilder: (context, index) => ServicesItem(index: index),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
