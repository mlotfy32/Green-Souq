import 'package:flutter/material.dart';
import 'package:green_souq/features/services/presentation/view/widget/customIconButton.dart';

class CustomCountRow extends StatefulWidget {
  const CustomCountRow({super.key, required this.servicesType});
  final String servicesType;
  @override
  State<CustomCountRow> createState() => _CustomCountRowState();
}

class _CustomCountRowState extends State<CustomCountRow> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          icon: Icons.remove,
          onPressed: () {
            count > 1 ? --count : count;
            setState(() {});
          },
        ),
        Text(' $count ${widget.servicesType} '),
        CustomIconButton(
          icon: Icons.add,
          onPressed: () {
            ++count;
            setState(() {});
          },
        ),
      ],
    );
  }
}
