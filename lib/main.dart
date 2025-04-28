import 'package:lecolombier/bloc/bloc/sensor_bloc.dart';
import 'package:lecolombier/bloc/repository/firebase_sensor_repository.dart';
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
    return ToastificationWrapper(
      child: MaterialApp(
        title: 'LeColombier',
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: primary)),
        home: RepositoryProvider<ISensorRepository>(
          create: (context) => FirebaseSensorRepository(),
          child: BlocProvider<SensorBloc>(
            create:
                (context) =>
                    SensorBloc(repository: context.read<ISensorRepository>())
                      ..add(SensorStarted()),
            child: DashboardScreen(),
          ),
        ),
      ),
    );
  }
}
