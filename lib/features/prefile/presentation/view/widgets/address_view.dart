import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/widgets/3.3%20custom_text_field.dart';
import 'package:green_souq/core/utiles/widgets/customeLinearButton.dart';
import 'package:green_souq/features/prefile/data/cashLocation.dart';
import 'package:green_souq/features/prefile/presentation/cubits/saved/getlocation/getlocation_cubit.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';

class AddressView extends StatefulWidget {
  const AddressView({super.key});

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  late TextEditingController address;
  final key = GlobalKey<FormState>();
  @override
  void initState() {
    address = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView(
            children: [
              CustomTextField(
                validator: (text) {
                  if (text!.isEmpty) return 'field is required';
                  return null;
                },
                hintText: 'enter shopping address',
                onFieldSubmitted: (text) async {
                  await CashLocation().cashLocation(location: text);
                },
                controller: address,
              ),
              SizedBox(height: context.getHeight(context: context) / 2),
              Customelinearbutton(
                onTap: () {
                  BlocProvider.of<GetlocationCubit>(context).accessLocation();
                },
                child: const Text(
                  'Access current location',
                  style: FontStyle.f16w500white,
                ),
                width: double.infinity,
                height: 50,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
