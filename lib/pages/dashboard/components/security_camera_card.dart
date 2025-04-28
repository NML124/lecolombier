import '../../../utils/materials.dart';

class SecurityCameraCard extends StatefulWidget {
  const SecurityCameraCard({super.key, required this.habitatLowTechModel});
  final HabitatLowTechModel? habitatLowTechModel;
  @override
  State<SecurityCameraCard> createState() => _SecurityCameraCardState();
}

class _SecurityCameraCardState extends State<SecurityCameraCard> {
  bool isActivated = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 200,
      child: ContainerWidget(
        child:
            widget.habitatLowTechModel == null
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
                                    "${widget.habitatLowTechModel!.numberOfPeopleInHabitatLowTech} people",
                                  ),
                                ],
                              ),
                              widget
                                      .habitatLowTechModel!
                                      .isHabitatLowTechCameraRecording
                                  ? recordingWidget()
                                  : SizedBox(),
                              Switch.adaptive(
                                activeColor: primary,
                                value:
                                    widget
                                        .habitatLowTechModel!
                                        .isHabitatLowTechCameraRecording,
                                onChanged: (value) {
                                  setState(() {
                                    isActivated = !isActivated;
                                  });
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
                                widget
                                    .habitatLowTechModel!
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
