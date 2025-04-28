import 'package:lecolombier/bloc/bloc/sensor_bloc.dart';
import 'package:lecolombier/pages/dashboard/components/fan_card.dart';
import 'package:lecolombier/providers/notification/toastification_service.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../utils/materials.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  final NotificationService notificationService = ToastificationServiceImpl();
  HabitatLowTechModel? habitatLowTechData;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: grey,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(paddingNormal),
          child: BlocListener<SensorBloc, SensorState>(
            listener: (context, state) {
              if (state is SensorError) {
                notificationService.showError(state.message);
              }
            },
            child: BlocBuilder<SensorBloc, SensorState>(
              builder: (context, state) {
                if (state is SensorLoaded) {
                  habitatLowTechData = state.sensorModel;
                } else if (state is SensorLoading) {
                  isLoading = true;
                } else {
                  isLoading = false;
                }
                return Skeletonizer(
                  enabled: isLoading,
                  child: Column(
                    spacing: paddingLarge,
                    children: [
                      WelcomeWidget(),
                      Row(
                        spacing: paddingSMedium,
                        children: [
                          FanCard(habitatLowTech: habitatLowTechData),
                          LightCard(habitatLowTechModel: habitatLowTechData),
                        ],
                      ),
                      Row(
                        spacing: paddingSMedium,
                        children: [
                          WaterTankCard(
                            habitatLowTechModel: habitatLowTechData,
                          ),
                          BirdhouseCard(
                            habitatLowTechModel: habitatLowTechData,
                          ),
                        ],
                      ),
                      SecurityCameraCard(
                        habitatLowTechModel: habitatLowTechData,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
