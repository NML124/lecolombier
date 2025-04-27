import 'package:lecolombier/customWidget/components/validator.dart';

import '../utils/materials.dart';

class TextFormFieldCustom extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final validator = ValidatorFactory.getValidator(type);
    return TextFormField(
      decoration: InputDecoration(label: Text(label)),
      controller: controller,
      obscureText: type == TypeForm.password,
      validator: (value) {
        return validator.validate(value);
      },
    );
  }
}
