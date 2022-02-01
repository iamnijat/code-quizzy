import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:quiz_programming/domain/repositories/score_store_repository.dart';
import 'domain/repositories/quiz_repository.dart';
import 'logic/cubit/counter_cubit.dart';
import 'app.dart';
import 'config/constants/palette.dart';
import 'domain/repositories/server_repository.dart';
import 'domain/repositories/shared_preferences_store.dart';
import 'domain/services/get_it/index.dart';
import 'domain/services/navigation/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt getIt = GetIt.instance;
  setupLocator(getIt);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppPalette.transparentColor,
  ));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => getIt.get<CounterCubit>(),
          ),
        ],
        child: MultiProvider(
          providers: [
            Provider(create: (_) => getIt.get<NavigationService>()),
            Provider(create: (_) => getIt.get<ServerRepository>()),
            Provider(create: (_) => getIt.get<SharedPreferencesStore>()),
            ChangeNotifierProvider(create: (_) => getIt.get<QuizRepository>()),
            Provider(create: (_) => getIt.get<ScoreStoreRepository>()),
          ],
          child: const MyApp(),
        ),
      ),
    );
  });
}
