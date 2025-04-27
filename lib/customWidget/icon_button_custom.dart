import 'package:lecolombier/utils/materials.dart';

class IconButtonCustom extends StatelessWidget {
  const IconButtonCustom({
    super.key,
    required this.icon
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return grey; // Grey when pressed
            }
            return white; // White when idle
          },
        ),
      ),
      onPressed: () {},
      icon: Icon(icon),
    );
  }
}