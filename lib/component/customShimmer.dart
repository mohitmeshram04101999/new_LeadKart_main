import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  Widget child;
  bool active;
  CustomShimmer({required this.child,this.active = false,super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      enabled: active,
      gradient: LinearGradient(
        colors: [
          Colors.grey,
          Colors.grey.shade300
        ]
      ),
      child: child,
    );
  }
}
