import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemu_free/Shared/Network/Remotly/DioHelper.dart';

import 'Shared/Bloc_Observer.dart';
import 'Shared/bloc/cubit.dart';
import 'modules/Welcome_Screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
DioHelper.init();
  BlocOverrides.runZoned(
        () {
          runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        primarySwatch: Colors.deepOrange,
      ),

      home: WelcomeScreen(),
    );
  }
}


