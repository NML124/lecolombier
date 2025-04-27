import 'package:lecolombier/customWidget/components/validator.dart';

import '../utils/materials.dart';

class TextFormFieldCustom extends StatefulWidget {
  const TextFormFieldCustom({
    super.key,
    required this.label,
    required this.type,
    required this.controller,
  });
  final String label;
  final String type;
  final TextEditingController controller;

  @override
  State<TextFormFieldCustom> createState() => _TextFormFieldCustomState();
}

class _TextFormFieldCustomState extends State<TextFormFieldCustom> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final validator = ValidatorFactory.getValidator(widget.type);
    return TextFormField(
      decoration: InputDecoration(
        label: Text(widget.label),
        suffixIcon:
            widget.type == TypeForm.password
                ? IconButton(
                  icon: Icon(
                    isPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: primary,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                )
                : null,
      ),
      controller: widget.controller,
      obscureText: !isPasswordVisible,
      validator: (value) {
        return validator.validate(value);
      },
    );
  }
}
