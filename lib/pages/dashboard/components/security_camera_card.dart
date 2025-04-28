import '../../../utils/materials.dart';

class SecurityCameraCard extends StatelessWidget {
  SecurityCameraCard({super.key, required this.habitatLowTechModel});
  final HabitatLowTechModel? habitatLowTechModel;
  bool isActivated = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 200,
      child: ContainerWidget(
        child:
            habitatLowTechModel == null
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: paddingSMedium,
                  children: [
                    Text(
                      'Security camera',
                      style: TextStyle(
                        fontSize: textSizeNormal,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    NoDataWidget(),
                  ],
                )
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: paddingSMedium,
                  children: [
                    Text(
                      'Security camera',
                      style: TextStyle(
                        fontSize: textSizeNormal,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: paddingSMedium,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                spacing: paddingSMedium,
                                children: [
                                  Icon(Icons.people_outline, color: primary),
                                  Text(
                                    "${habitatLowTechModel!.numberOfPeopleInHabitatLowTech} people",
                                  ),
                                ],
                              ),
                              habitatLowTechModel!
                                      .isHabitatLowTechCameraRecording
                                  ? recordingWidget()
                                  : SizedBox(),
                              Switch.adaptive(
                                activeColor: primary,
                                value:
                                    habitatLowTechModel!
                                        .isHabitatLowTechCameraRecording,
                                onChanged: (value) {
                                  context.read<SensorBloc>().add(
                                    SetValue(
                                      actuator: "isHabitatCameraRecording",
                                      value: value,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: ImageStreamingWidget(
                            height: 130,
                            imageUrl:
                                habitatLowTechModel!
                                    .habitatCameraImageUrl,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
      ),
    );
  }
}
