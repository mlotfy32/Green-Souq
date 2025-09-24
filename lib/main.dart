import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:green_souq/core/utiles/7.1%20bloc_observer.dart';
import 'package:green_souq/core/utiles/constanse.dart';
import 'package:green_souq/core/utiles/setup_service_locator.dart';
import 'package:green_souq/core/utiles/shared_pref/shared_pref.dart';
import 'package:green_souq/features/services/domain/entites/images_entite.dart';
import 'package:green_souq/firebase_options.dart';
import 'package:green_souq/green_souq.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

var prefs = SharedPref.preferences;
void main() async {
  await dotenv.load(fileName: ".env");
  SetupServiceLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(ImagesEntiteAdapter());
  await Hive.openBox<ImagesEntite>(Constanse.kImagesBox);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Supabase.initialize(
    url: "https://tnoyqwewkojfisfbgkme.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRub3lxd2V3a29qZmlzZmJna21lIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTcxOTU4MjYsImV4cCI6MjA3Mjc3MTgyNn0.BKbNlrYvAK7QabGH04rPiUgwjb_qWzS4xbhsittT9PA",
  );
  await SharedPref().instantiatePreferences();
  Bloc.observer = AppBlocObserver();

  runApp(const GreenSouq());
}
