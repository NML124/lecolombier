import '../../../utils/materials.dart';

class WaterTankCard extends StatelessWidget {
  const WaterTankCard({super.key, required this.habitatLowTechModel,this.limitWidth=LIMIT_WIDTH});
  final HabitatLowTechModel? habitatLowTechModel;
  final int limitWidth;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double widthScreen = size.width;
    double containerSize =
        (widthScreen - (2 * paddingNormal) - paddingSMedium) / 3;
    return SizedBox(
      width: widthScreen < limitWidth
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
                    AutoSizeText(
                      'Water Tank',
                      minFontSize: textSizeSMedium,
                      maxLines: 1,
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
                        containerSize > 120
                            ? SvgPicture.asset(dropWaterPath, width: 15)
                            : SizedBox.shrink(),
                        SizedBox(
                          width: containerSize > 120 ? 50 : 45,
                          child: AutoSizeText(
                            habitatLowTechModel!.isTankFilled
                                ? "The tank is full"
                                : "The tank is not full.",
                            maxLines: 2,
                            minFontSize: textSizeSmall,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: blueDark),
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
