import '../../../utils/materials.dart';

class BirdhouseCard extends StatefulWidget {
  const BirdhouseCard({super.key});

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
          child: Column(
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
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ), // Remplacez 10.0 par le rayon souhaité
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://cdn.britannica.com/39/226539-050-D21D7721/Portrait-of-a-cat-with-whiskers-visible.jpg',
                          ),
                          fit:
                              BoxFit
                                  .cover, // Assurez-vous que l'image remplit bien le conteneur
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Stack(
                      children: [
                        Transform.translate(
                          offset: Offset(17, 20),
                          child: SvgPicture.asset(
                            birdInBirdHousePath,
                            width: 15,
                          ),
                        ),
                        SvgPicture.asset(birdHousePath, width: 50),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                spacing: paddingSMedium,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [SvgPicture.asset(recordPath), Text("Recording")],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
