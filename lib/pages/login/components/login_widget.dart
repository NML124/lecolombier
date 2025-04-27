import '../../../utils/materials.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formSignUpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formSignUpKey,
      child: ContainerWidget(
        child: Column(
          spacing: paddingMedium,
          children: [
            Text(
              "Login",
              style: TextStyle(
                color: primary,
                fontSize: textSizeNormal,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextFormFieldCustom(
              label: "Email",
              type: TypeForm.email,
              controller: emailController,
            ),
            TextFormFieldCustom(
              label: "Password",
              type: TypeForm.password,
              controller: passwordController,
            ),
            SizedBox(height: paddingLarge),
            ElevatedButtonCustom(
              onPress: () {},
              label: "Login",
              isLoading: false,
            ),
            SizedBox(height: paddingSMedium),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "I don't have an account/",
                  style: TextStyle(color: greyDark),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Sign Up", style: TextStyle(color: primary)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
