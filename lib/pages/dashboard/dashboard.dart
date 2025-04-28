import '../../utils/materials.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: grey,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(paddingNormal),
          child: Column(
            spacing: paddingLarge,
            children: [
              WelcomeWidget(),
              Row(spacing: paddingSMedium, children: [FanCard(), LightCard()]),
              Row(
                spacing: paddingSMedium,
                children: [WaterTankCard(), BirdhouseCard()],
              ),
              SecurityCameraCard(),
            ],
          ),
        ),
      ),
    );
  }
}
