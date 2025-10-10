import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_souq/features/home/presentation/cubits/changetap/changetap_cubit.dart';
import 'package:green_souq/features/home/presentation/view/widgets/homeViewBody.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangetapCubit>(
      create: (context) => ChangetapCubit(),
      child: const HomeViewBody(),
    );
  }
}
