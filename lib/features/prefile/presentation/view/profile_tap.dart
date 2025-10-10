import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_souq/features/prefile/presentation/cubits/saved/getlocation/getlocation_cubit.dart';
import 'package:green_souq/features/prefile/presentation/view/widgets/profile_view_body.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetlocationCubit(),
      child: const ProfileViewBody(),
    );
  }
}
