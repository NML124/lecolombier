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

class dataColumn extends StatelessWidget {
  const dataColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: paddingSMedium,
      children: [
        Row(
          spacing: paddingSMedium,
          children: [
            SvgPicture.asset(thermometerPath, width: 20, height: 20),
            Text("30°C", style: TextStyle(fontSize: textSizeNormal)),
          ],
        ),
        Row(
          spacing: paddingSMedium,
          children: [
            SvgPicture.asset(dropWaterPath, width: 20, height: 20),
            Text("75 %", style: TextStyle(fontSize: textSizeNormal)),
          ],
        ),
        SvgPicture.asset(fanPath, width: 50, height: 50),
      ],
    );
  }
}

class dataRow extends StatelessWidget {
  const dataRow({super.key});

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
                Text("30°C", style: TextStyle(fontSize: textSizeNormal)),
              ],
            ),
            Row(
              spacing: paddingSMedium,
              children: [
                SvgPicture.asset(dropWaterPath, width: 20, height: 20),
                Text("75 %", style: TextStyle(fontSize: textSizeNormal)),
              ],
            ),
          ],
        ),
        SvgPicture.asset(fanPath, width: 50, height: 50),
      ],
    );
  }
}
