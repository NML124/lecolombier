import 'package:flutter/material.dart';
import 'package:lecolombier/utils/constants.dart';

class ElevatedButtonCustom extends StatelessWidget {
  const ElevatedButtonCustom({
    super.key,
    required this.onPress,
    required this.label,
    required this.isLoading,
  });
  final VoidCallback onPress;
  final String label;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 35,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          shape: WidgetStateProperty.resolveWith<RoundedRectangleBorder?>((
            Set<WidgetState> states,
          ) {
            if (isLoading) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              );
            } else if (states.contains(WidgetState.pressed)) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              );
            } else if (states.contains(WidgetState.hovered)) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              );
            }
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            );
          }),
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((
            Set<WidgetState> states,
          ) {
            if (isLoading) {
              return greyDark;
            } else if (states.contains(WidgetState.pressed)) {
              return primaryLight;
            }
            return primary;
          }),
        ),
        onPressed: () => onPress.call(),
        child:
            isLoading
                ? Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: white,
                  ),
                )
                : Text(label, style: TextStyle(color: white)),
      ),
    );
  }
}
