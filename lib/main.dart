import 'package:lecolombier/utils/materials.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LeColombier',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: primary)),
      home: DashboardScreen(),
    );
  }
}
