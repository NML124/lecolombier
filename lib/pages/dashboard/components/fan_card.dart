import '../../../utils/materials.dart';

class FanCard extends StatefulWidget {
  const FanCard({super.key, required this.habitatLowTech});
  final HabitatLowTechModel? habitatLowTech;
  @override
  State<FanCard> createState() => _FanCardState();
}

class _FanCardState extends State<FanCard> {
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
          
          widget.habitatLowTech==null?
          Column(
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
          :
          Column(
            spacing: paddingSMedium,
            children: [
              Text(
                'Fan',
                style: TextStyle(
                  fontSize: textSizeNormal,
                  fontWeight: FontWeight.w500,
                ),
              ),
              containerSize > 155
                  ? DataRow(habitatLowTech: widget.habitatLowTech!)
                  : DataColumn(habitatLowTech: widget.habitatLowTech!),
              Row(
                mainAxisAlignment:
                    containerSize > 155
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.center,
                children: [
                  Switch.adaptive(
                    activeColor: primary,
                    value: widget.habitatLowTech!.isFanOn,
                    onChanged: (value) {
                      setState(() {
                        isActivated = !isActivated;
                      });
                    },
                  ),
                ],
              ),
              (containerSize > 156 && widget.habitatLowTech!.temperature > 30)
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
