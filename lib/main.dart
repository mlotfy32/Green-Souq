import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:green_souq/core/utiles/7.1%20bloc_observer.dart';
import 'package:green_souq/core/utiles/constanse.dart';
import 'package:green_souq/core/utiles/setup_service_locator.dart';
import 'package:green_souq/core/utiles/shared_pref/shared_pref.dart';
import 'package:green_souq/features/cart/data/models/cart_model.dart';
import 'package:green_souq/features/prefile/data/models/saved_model.dart';
import 'package:green_souq/firebase_options.dart';
import 'package:green_souq/green_souq.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

var prefs = SharedPref.preferences;
void main() async {
  await dotenv.load(fileName: ".env");
  final supabaseUrl = await dotenv.env['SUPABASE_URL'];
  final supabaseAnonKey = await dotenv.env['SUPABASE_ANON_KEY'];
  SetupServiceLocator();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Supabase.initialize(url: supabaseUrl!, anonKey: supabaseAnonKey!);
  await SharedPref().instantiatePreferences();
  Bloc.observer = AppBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(CartModelAdapter());
  await Hive.openBox<CartModel>(Constanse.kCartBox);
  Hive.registerAdapter(SavedModelAdapter());
  await Hive.openBox<SavedModel>(Constanse.kSavedBox);
  runApp(const GreenSouq());
}
