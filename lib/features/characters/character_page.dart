import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CharacterPage extends HookWidget {
  const CharacterPage({super.key, this.id});

  final String? id;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(id ?? ""),
        ),
        body: Text("hello world"),
      ),
    );
  }
}
