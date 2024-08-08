import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class Customsearchfeald extends StatelessWidget {
  final TextEditingController? controller;
  const Customsearchfeald({
    this.controller,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      controller: controller,
    );
  }
}
