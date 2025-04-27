import '../../../utils/materials.dart';

class WelcomeWidget extends StatelessWidget {
  WelcomeWidget({super.key});
  UserModel userLogged = UserModel(
    id: "1",
    name: "Pierre",
    email: "pierrexxx@gmail.com",
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: paddingSMedium,
          children: [
            IconButtonCustom(icon: Icons.settings_outlined),
            RichText(
              text: TextSpan(
                style: TextStyle(color: black, fontSize: textSizeLarge),
                children: [
                  TextSpan(text: "Hello "),
                  TextSpan(
                    text: userLogged.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: ",\nWelcome to\n"),
                  TextSpan(
                    text: "the Colombier !!",
                    style: TextStyle(color: primary),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 200,
          child: Image.asset(dashboardBlobPath, fit: BoxFit.contain),
        ),
      ],
    );
  }
}
