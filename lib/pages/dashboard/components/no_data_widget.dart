import '../../../utils/materials.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      'No data available',
      minFontSize: textSizeSMedium,
      maxLines: 1,
      style: TextStyle(fontSize: textSizeMedium),
    );
  }
}
