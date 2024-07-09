import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InputFieldWidget extends StatefulWidget {
  const InputFieldWidget({super.key});

  @override
  State<InputFieldWidget> createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  late final TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        isDense: true,
        labelText: 'Search',
        prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(Icons.cancel),
        border: OutlineInputBorder(),
      ),
    );
  }
}
