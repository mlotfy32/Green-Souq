import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/features/home/presentation/cubits/changetap/changetap_cubit.dart';
import 'package:green_souq/features/home/presentation/view/widgets/homeTap.dart';
import 'package:green_souq/features/home/presentation/view/widgets/cutomBottomNavBar.dart';

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
                height: context.getHeight(context: context) - 96,
                child: BlocBuilder<ChangetapCubit, ChangetapState>(
                  builder: (context, state) {
                    final cubit = BlocProvider.of<ChangetapCubit>(
                      context,
                    ).newTap;
                    return
                    // cubit == 0
                    // ?
                    const HomeTap();
                    // : cubit == 1
                    // ? const Searchtap()
                    // : const SaveView();
                  },
                ),
              ),

              SizedBox(
                height: 60,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: BlocProvider<ChangetapCubit>(
                    create: (context) => ChangetapCubit(),
                    child: const Cutombottomnavbar(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
