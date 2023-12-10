import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:asthma/Screens/loading/loading_screen.dart';


import 'package:asthma/Screens/HomeScreen/home_screen.dart';


import 'package:asthma/blocs/asthma_bloc/asthma_bloc.dart';
import 'package:asthma/blocs/auth_bloc/auth_bloc.dart';
import 'package:asthma/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'Services/networking_api.dart';
import 'blocs/user_bloc/user_bloc.dart';
import 'helper/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  SupabaseNetworking().getSupabaseInitialize;
  Bloc.observer = MyBlocObserver();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(CheckLoginEvent()),
        ),
        BlocProvider(
            create: (context) => AsthmaBloc()..add(getHospitalDataEvent())),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            useMaterial3: false,
            scaffoldBackgroundColor: ColorPaltte().newDarkBlue),
        debugShowCheckedModeBanner: false,
        home: const LoadingScreen(),
      ),
    );
  }
}
