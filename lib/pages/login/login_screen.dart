import 'package:lecolombier/pages/login/components/login_widget.dart';

import '../../utils/materials.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(paddingNormal),
          child: Column(
            spacing: paddingNormal,
            children: [Image.asset(logoColorPath, height: 104), LoginWidget()],
          ),
        ),
      ),
    );
  }
}
