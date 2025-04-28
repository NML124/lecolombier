import 'package:lecolombier/bloc/bloc/sensor_bloc.dart';

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
          child: BlocListener<SensorBloc,SensorState>(
            listener: (context, state) {
              if(state is SensorError){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                  content: Text(state.message), 
                  backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: BlocBuilder<SensorBloc, SensorState>(
              builder: (context, state) {
                return Column(
                  spacing: paddingLarge,
                  children: [
                    WelcomeWidget(),
                    Row(
                      spacing: paddingSMedium,
                      children: [FanCard(), LightCard()],
                    ),
                    Row(
                      spacing: paddingSMedium,
                      children: [WaterTankCard(), BirdhouseCard()],
                    ),
                    SecurityCameraCard(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
