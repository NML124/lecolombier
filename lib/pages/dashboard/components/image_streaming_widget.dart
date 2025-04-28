import 'package:lecolombier/utils/materials.dart';

class ImageStreamingWidget extends StatelessWidget {
  const ImageStreamingWidget({
    super.key,
    required this.imageUrl,
    required this.height,
  });
  final String imageUrl;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
