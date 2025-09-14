import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_souq/core/utiles/styles/appImages.dart';
import 'package:green_souq/features/home/presentation/cubits/changetap/changetap_cubit.dart';

class Cutombottomnavbar extends StatelessWidget {
  const Cutombottomnavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: double.infinity,
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: AppImages.bottomNavBar.asMap().entries.map((value) {
          return BlocBuilder<ChangetapCubit, ChangetapState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<ChangetapCubit>(context).newTap;
              return IconButton(
                onPressed: () {
                  BlocProvider.of<ChangetapCubit>(
                    context,
                  ).changeTap(tap: value.key);
                },
                icon: SvgPicture.asset(
                  AppImages.bottomNavBar[value.key],
                  width: 30,
                  height: 30,
                  color: cubit == value.key
                      ? const Color(0xffFF01B252)
                      : Colors.black,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
