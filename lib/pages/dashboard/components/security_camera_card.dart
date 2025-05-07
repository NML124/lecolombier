import '../../../utils/materials.dart';

class SecurityCameraCard extends StatelessWidget {
  SecurityCameraCard({super.key, required this.habitatLowTechModel});
  final HabitatLowTechModel? habitatLowTechModel;
  bool isActivated = false;
  int limitWidth = 310;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double containerWidth = width - (2 * paddingNormal);
    return SizedBox(
      width: width,
      height: containerWidth > limitWidth ? 200 : 280,
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
                    containerWidth > limitWidth
                        ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: paddingSMedium,
                          children: [
                            PeopleRecordingWidget(
                              habitatLowTechModel: habitatLowTechModel,
                              containerWidth: containerWidth,
                              limitWidth: limitWidth,
                            ),
                            CameraInLibraryWidget(
                              habitatLowTechModel: habitatLowTechModel,
                              containerWidth: containerWidth,
                              limitWidth: limitWidth,
                            ),
                          ],
                        )
                        : Column(
                          spacing: paddingSMedium,
                          children: [
                            CameraInLibraryWidget(
                              habitatLowTechModel: habitatLowTechModel,
                              containerWidth: containerWidth,
                              limitWidth: limitWidth,
                            ),
                            PeopleRecordingWidget(
                              habitatLowTechModel: habitatLowTechModel,
                              containerWidth: containerWidth,
                              limitWidth: limitWidth,
                            ),
                          ],
                        ),
                  ],
                ),
      ),
    );
  }
}

class CameraInLibraryWidget extends StatelessWidget {
  const CameraInLibraryWidget({
    super.key,
    required this.habitatLowTechModel,
    required this.containerWidth,
    required this.limitWidth,
  });

  final HabitatLowTechModel? habitatLowTechModel;
  final double containerWidth;
  final int limitWidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          containerWidth > limitWidth
              ? (containerWidth - (2 * paddingNormal) - paddingSMedium) * 2 / 3
              : containerWidth,
      child: ImageStreamingWidget(
        height: 130,
        imageUrl: habitatLowTechModel!.habitatCameraImageUrl,
      ),
    );
  }
}

class PeopleRecordingWidget extends StatelessWidget {
  const PeopleRecordingWidget({
    super.key,
    required this.habitatLowTechModel,
    required this.containerWidth,
    required this.limitWidth,
  });

  final HabitatLowTechModel? habitatLowTechModel;
  final double containerWidth;
  final int limitWidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          containerWidth > limitWidth
              ? (containerWidth - (2 * paddingNormal) - paddingSMedium) / 3
              : (containerWidth),
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
          habitatLowTechModel!.isHabitatLowTechCameraRecording
              ? recordingWidget()
              : SizedBox(),
          Switch.adaptive(
            activeColor: primary,
            value: habitatLowTechModel!.isHabitatLowTechCameraRecording,
            onChanged: (value) {
              context.read<SensorBloc>().add(
                SetValue(actuator: "isHabitatCameraRecording", value: value),
              );
            },
          ),
        ],
      ),
    );
  }
}
