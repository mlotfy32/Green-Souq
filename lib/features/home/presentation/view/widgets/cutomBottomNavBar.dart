import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_souq/core/utiles/styles/appImages.dart';
import 'package:green_souq/features/home/presentation/cubits/changetap/changetap_cubit.dart';

class Cutombottomnavbar extends StatelessWidget {
  const Cutombottomnavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: AppImages.bottomNavBar.asMap().entries.map((value) {
          return BlocBuilder<ChangetapCubit, ChangetapState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<ChangetapCubit>(context).newTap;
              return InkWell(
                onTap: () {
                  BlocProvider.of<ChangetapCubit>(
                    context,
                  ).changeTap(tap: value.key);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.zero,
                      child: SvgPicture.asset(
                        AppImages.bottomNavBar[value.key],
                        width: 25,
                        height: 25,
                        color: cubit == value.key
                            ? const Color(0xffFF01B252)
                            : Colors.grey,
                      ),
                    ),
                    Text(
                      featuresNames[value.key],
                      style: TextStyle(
                        fontSize: 13,
                        color: cubit == value.key
                            ? const Color(0xffFF01B252)
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

List<String> featuresNames = ['Home', 'Service', 'Cart', 'Profile'];
