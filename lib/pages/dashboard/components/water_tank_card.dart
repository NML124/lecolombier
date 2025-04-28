import '../../../utils/materials.dart';

class WaterTankCard extends StatefulWidget {
  const WaterTankCard({super.key});

  @override
  State<WaterTankCard> createState() => _WaterTankCardState();
}

class _WaterTankCardState extends State<WaterTankCard> {
  bool isActivated = false;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: SizedBox(
        height: 200,
        child: ContainerWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: paddingSMedium,
            children: [
              AutoSizeText(
                'Water Tank',
                minFontSize: textSizeSMedium,
                maxLines: 1,
                style: TextStyle(
                  fontSize: textSizeNormal,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SvgPicture.asset(waterTankPath, width: 50, height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: paddingSMedium,
                children: [
                  SvgPicture.asset(dropWaterPath, width: 15),
                  SizedBox(
                    width: 50,
                    child: AutoSizeText(
                      "Full 30L",
                      maxLines: 1,
                      minFontSize: textSizeSmall,
                      style: TextStyle(color: blueDark),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
