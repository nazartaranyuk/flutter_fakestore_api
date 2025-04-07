import 'package:fakestore_api/feature/main_screen/presentation/main_screen.dart';
import 'package:fakestore_api/feature/main_screen/presentation/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        child: const MainScreen(),
        create: (_) => MainViewModel(),
      ),
    );
  }
}
