import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_test/screens/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi databaseFactory
  databaseFactory = databaseFactoryFfi;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ListNotesPage(),
    );
  }
}
