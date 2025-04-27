import 'package:flutter/material.dart';
import 'package:lecolombier/utils/constants.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: EdgeInsets.all(paddingNormal),
      child: child,
    );
  }
}
