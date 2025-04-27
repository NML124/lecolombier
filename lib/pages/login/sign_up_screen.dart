import '../../utils/materials.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(paddingNormal),
          child: Column(
            spacing: paddingNormal,
            children: [Image.asset(logoColorPath, height: 104), SignUpWidget()],
          ),
        ),
      ),
    );
  }
}
