import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/features/cart/presentation/view/cart_tap.dart';
import 'package:green_souq/features/home/presentation/cubits/changetap/changetap_cubit.dart';
import 'package:green_souq/features/home/presentation/view/widgets/homeTap.dart';
import 'package:green_souq/features/home/presentation/view/widgets/cutomBottomNavBar.dart';
import 'package:green_souq/features/prefile/presentation/view/profile_tap.dart';
import 'package:green_souq/features/services/presentation/view/servicesTab.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: ListView(
            children: [
              SizedBox(
                height: context.getHeight(context: context) - 104,
                child: BlocBuilder<ChangetapCubit, ChangetapState>(
                  builder: (context, state) {
                    final cubit = BlocProvider.of<ChangetapCubit>(
                      context,
                    ).newTap;
                    return cubit == 0
                        ? const HomeTap()
                        : cubit == 1
                        ? const ServicesTab()
                        : cubit == 2
                        ? const CartTap()
                        : const ProfileTap();
                  },
                ),
              ),

              const SizedBox(
                height: 67,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Cutombottomnavbar(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
