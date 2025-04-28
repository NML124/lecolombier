import '../../../utils/materials.dart';

class LightCard extends StatefulWidget {
  const LightCard({super.key});

  @override
  State<LightCard> createState() => _LightCardState();
}

class _LightCardState extends State<LightCard> {
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
          child: Column(
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
                value: isActivated,
                onChanged: (value) {
                  setState(() {
                    isActivated = !isActivated;
                  });
                },
              ),
              (containerSize > 156)
                  ? Row(
                    spacing: paddingSMedium,
                    children: [
                      Icon(Icons.warning_amber_outlined, color: red),
                      SizedBox(
                        width: containerSize - 70,
                        child: AutoSizeText(
                          "Lighting is excessive",
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
