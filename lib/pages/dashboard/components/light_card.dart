import '../../../utils/materials.dart';

class LightCard extends StatelessWidget {
  LightCard({super.key, required this.habitatLowTechModel});
  final HabitatLowTechModel? habitatLowTechModel;
  bool isActivated = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double widthScreen = size.width;
    double containerSize = (widthScreen / 2) - 30;
    return Flexible(
      flex: 1,
      child: SizedBox(
        height: containerSize > 155 ? 220 : 255,
        child: ContainerWidget(
          child:
              habitatLowTechModel == null
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: paddingSMedium,
                    children: [
                      Text(
                        'Light',
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
                        'Light',
                        style: TextStyle(
                          fontSize: textSizeNormal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SvgPicture.asset(lightPath),
                      Switch.adaptive(
                        activeColor: primary,
                        value: habitatLowTechModel!.isLightOn,
                        onChanged: (value) {
                          context.read<SensorBloc>().add(
                                SetValue(actuator: "isLightOn", value: value),
                              );
                        },
                      ),
                      (containerSize > 156 &&
                              habitatLowTechModel!.luminosity < 300)
                          ? Row(
                            spacing: paddingSMedium,
                            children: [
                              Icon(Icons.warning_amber_outlined, color: red),
                              SizedBox(
                                width: containerSize - 70,
                                child: AutoSizeText(
                                  "Low luminosity detected",
                                  maxLines: 1,
                                  minFontSize: textSizeSmall,
                                  style: TextStyle(color: red),
                                ),
                              ),
                            ],
                          )
                          : SizedBox(),
                    ],
                  ),
        ),
      ),
    );
  }
}
