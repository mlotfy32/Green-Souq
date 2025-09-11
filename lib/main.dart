import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:green_souq/core/utiles/7.1%20bloc_observer.dart';
import 'package:green_souq/core/utiles/shared_pref/shared_pref.dart';
import 'package:green_souq/green_souq.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPref().instantiatePreferences();
  await Hive.initFlutter();
  Bloc.observer = AppBlocObserver();
  runApp(const GreenSouq());
}
