import 'package:flutter/material.dart';
import 'package:green_souq/core/utiles/widgets/3.3%20custom_text_field.dart';

class HireWorkersForm extends StatelessWidget {
  const HireWorkersForm({
    super.key,
    required this.location,
    required this.type,
    required this.houres,
    required this.formKey,
  });
  final TextEditingController location;
  final TextEditingController type;
  final TextEditingController houres;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 10),
          CustomTextField(
            controller: location,
            hintText: 'Your location',
            validator: (val) {
              if (val!.isEmpty) return 'location is required';
              return null;
            },
            prefixIcon: const Icon(
              Icons.location_on_outlined,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          CustomTextField(
            controller: type,
            validator: (val) {
              if (val!.isEmpty) return 'type is required';
              return null;
            },
            hintText: 'Type of work',
            prefixIcon: const Icon(Icons.webhook_rounded, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          CustomTextField(
            controller: houres,
            validator: (val) {
              if (val!.isEmpty) return 'houres is required';
              return null;
            },
            hintText: 'Working houres',
            keyboardType: TextInputType.number,
            prefixIcon: const Icon(
              Icons.access_time_rounded,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
