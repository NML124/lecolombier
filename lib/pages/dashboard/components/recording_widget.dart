import '../../../utils/materials.dart';

class recordingWidget extends StatelessWidget {
  const recordingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: paddingSMedium,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [SvgPicture.asset(recordPath), Text("Recording")],
    );
  }
}