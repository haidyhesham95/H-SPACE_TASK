import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/farma_app.dart';

import 'core/services/shared_preference/shared_preference_helper.dart';
import 'core/utils/abb_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedPrefHelper().instantiatePreferences();
  runApp(
    FarmaApp(),
  );
}
