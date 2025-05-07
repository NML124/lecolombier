import '../../../utils/materials.dart';

class FanCard extends StatelessWidget {
  FanCard({super.key, required this.habitatLowTech, this.limitWidth = LIMIT_WIDTH});
  final HabitatLowTechModel? habitatLowTech;
  int limitHeight = 160;
  final int limitWidth;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double widthScreen = size.width;
    double containerSize =
        (widthScreen - (2 * paddingNormal) - paddingSMedium) / 2;

    return SizedBox(
      width:
          widthScreen < limitWidth
              ? widthScreen - (2 * paddingNormal)
              : containerSize,
      height: containerSize > limitHeight ? 220 : 255,
      child: ContainerWidget(
        child:
            habitatLowTech == null
                ? Column(
                  spacing: paddingSMedium,
                  children: [
                    Text(
                      'Fan',
                      style: TextStyle(
                        fontSize: textSizeNormal,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    NoDataWidget(),
                  ],
                )
                : Column(
                  spacing: paddingSMedium,
                  children: [
                    Text(
                      'Fan',
                      style: TextStyle(
                        fontSize: textSizeNormal,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    containerSize > limitHeight
                        ? DataRow(habitatLowTech: habitatLowTech!)
                        : DataColumn(habitatLowTech: habitatLowTech!),
                    Row(
                      mainAxisAlignment:
                          containerSize > limitHeight
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.center,
                      children: [
                        Switch.adaptive(
                          activeColor: primary,
                          value: habitatLowTech!.isFanOn,
                          onChanged: (value) {
                            context.read<SensorBloc>().add(
                              SetValue(actuator: "isFanOn", value: value),
                            );
                          },
                        ),
                      ],
                    ),
                    (containerSize > limitHeight &&
                            habitatLowTech!.temperature > 34)
                        ? Row(
                          spacing: paddingSMedium,
                          children: [
                            Icon(Icons.warning_amber_outlined, color: red),
                            SizedBox(
                              width: containerSize - 70,
                              child: AutoSizeText(
                                "The temperature is high",
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
    );
  }
}

class DataColumn extends StatelessWidget {
  const DataColumn({super.key, required this.habitatLowTech});
  final HabitatLowTechModel habitatLowTech;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: paddingSMedium,
      children: [
        Row(
          spacing: paddingSMedium,
          children: [
            SvgPicture.asset(thermometerPath, width: 20, height: 20),
            Text(
              "${habitatLowTech.temperature}°C",
              style: TextStyle(fontSize: textSizeNormal),
            ),
          ],
        ),
        Row(
          spacing: paddingSMedium,
          children: [
            SvgPicture.asset(dropWaterPath, width: 20, height: 20),
            Text(
              "${habitatLowTech.humidity}%",
              style: TextStyle(fontSize: textSizeNormal),
            ),
          ],
        ),
        SvgPicture.asset(fanPath, width: 50, height: 50),
      ],
    );
  }
}

class DataRow extends StatelessWidget {
  const DataRow({super.key, required this.habitatLowTech});
  final HabitatLowTechModel habitatLowTech;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          spacing: paddingSMedium,
          children: [
            Row(
              spacing: paddingSMedium,
              children: [
                SvgPicture.asset(thermometerPath, width: 20, height: 20),
                Text(
                  "${habitatLowTech.temperature}°C",
                  style: TextStyle(fontSize: textSizeNormal),
                ),
              ],
            ),
            Row(
              spacing: paddingSMedium,
              children: [
                SvgPicture.asset(dropWaterPath, width: 20, height: 20),
                Text(
                  "${habitatLowTech.humidity}%",
                  style: TextStyle(fontSize: textSizeNormal),
                ),
              ],
            ),
          ],
        ),
        SvgPicture.asset(fanPath, width: 50, height: 50),
      ],
    );
  }
}
