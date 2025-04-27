import 'package:lecolombier/pages/dashboard/components/bird_house_card.dart';
import 'package:lecolombier/pages/dashboard/components/light_card.dart';
import 'package:lecolombier/pages/dashboard/components/water_tank_card.dart';

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
                children: [FanCard(), LightCard()],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: paddingSMedium,
                children: [WaterTankCard(), BirdhouseCard()],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
