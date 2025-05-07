import '../../../utils/materials.dart';

class BirdhouseCard extends StatelessWidget {
  const BirdhouseCard({
    super.key,
    required this.habitatLowTechModel,
    this.limitWidth = LIMIT_WIDTH,
  });
  final HabitatLowTechModel? habitatLowTechModel;
  final int limitWidth;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double widthScreen = size.width;
    double containerSize =
        (widthScreen - (2 * paddingNormal) - paddingSMedium) * 2 / 3;
    return SizedBox(
      width:
          widthScreen < limitWidth
              ? widthScreen - (2 * paddingNormal)
              : containerSize,
      height: 220,
      child: ContainerWidget(
        child:
            habitatLowTechModel == null
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: paddingSMedium,
                  children: [
                    Text(
                      'Birdhouse',
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
                      'Birdhouse',
                      style: TextStyle(
                        fontSize: textSizeNormal,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      spacing: paddingSMedium,
                      children: [
                        Flexible(
                          flex: 3,
                          child: ImageStreamingWidget(
                            height: 100,
                            imageUrl:
                                habitatLowTechModel!.birdHouseCameraImageUrl,
                          ),
                        ),
                        BirdWidget(
                          isBirdInHouse: habitatLowTechModel!.isBirdDetected,
                        ),
                      ],
                    ),
                    habitatLowTechModel!.isBirdCameraRecording
                        ? recordingWidget()
                        : SizedBox(),
                  ],
                ),
      ),
    );
  }
}

class BirdWidget extends StatelessWidget {
  const BirdWidget({super.key, required this.isBirdInHouse});
  final bool isBirdInHouse;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Transform.translate(
            offset: isBirdInHouse ? Offset(17, 20) : Offset(17, 30),
            child: SvgPicture.asset(birdInBirdHousePath, width: 15),
          ),
          SvgPicture.asset(birdHousePath, width: 50),
        ],
      ),
    );
  }
}
