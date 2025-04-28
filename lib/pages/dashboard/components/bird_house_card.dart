import '../../../utils/materials.dart';

class BirdhouseCard extends StatefulWidget {
  const BirdhouseCard({super.key, required this.habitatLowTechModel});
  final HabitatLowTechModel? habitatLowTechModel;
  @override
  State<BirdhouseCard> createState() => _BirdhouseCardState();
}

class _BirdhouseCardState extends State<BirdhouseCard> {
  bool isActivated = false;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: SizedBox(
        height: 200,
        child: ContainerWidget(
          child:
              widget.habitatLowTechModel == null
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
                                  widget
                                      .habitatLowTechModel!
                                      .birdHouseCameraImageUrl,
                            ),
                          ),
                          BirdWidget(
                            isBirdInHouse:
                                widget.habitatLowTechModel!.isBirdDetected,
                          ),
                        ],
                      ),
                      widget.habitatLowTechModel!.isBirdCameraRecording
                          ? recordingWidget()
                          : SizedBox(),
                    ],
                  ),
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
    return Flexible(
      flex: 1,
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
