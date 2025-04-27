import '../../utils/materials.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: grey,
        body: Padding(
          padding: const EdgeInsets.all(paddingNormal),
          child: Column(
            spacing: paddingLargeMedium,
            children: [
              WelcomeWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [FanCard()],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
