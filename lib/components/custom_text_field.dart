import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.filter,
    required this.name,
    required this.error,
    required this.values,
    required this.handleChange,
  });

  final TextInputFormatter filter;
  final String name;
  final Map<String, dynamic> values;
  final String? error;
  final Function handleChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        inputFormatters: [filter],
        initialValue: values[name],
        onChanged: (value) => handleChange(name, value),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: '${name.split("_").join(" ")}...',
          errorText: error,
        ),
      ),
    );
  }
}
