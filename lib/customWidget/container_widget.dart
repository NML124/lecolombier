import 'package:flutter/material.dart';
import 'package:lecolombier/utils/constants.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.child,
    this.borderRadiusValue,
    this.paddingValue,
  });
  final Widget child;
  final double? borderRadiusValue, paddingValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(borderRadiusValue ?? borderRadius),
      ),
      padding: EdgeInsets.all(paddingValue ?? paddingNormal),
      child: child,
    );
  }
}
