import 'package:fakestore_api/core/db/database.dart';
import 'package:fakestore_api/feature/main_screen/presentation/main_screen.dart';
import 'package:fakestore_api/feature/main_screen/presentation/main_view_model.dart';
import 'package:fakestore_api/main_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() async {
  MainAppService service = MainAppService();
  service.setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await GetIt.instance.get<MainDatabase>().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static var locator = GetIt.instance;

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return MaterialApp(
      theme: ThemeData(splashColor: Colors.transparent),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (_) => locator.get<MainViewModel>(),
          child: MainScreen(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          showSelectedLabels: true,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          elevation: 0,
          backgroundColor: Colors.black,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/cart_icon.svg"),
              label: 'Bucket',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/wishlist_icon.svg", color: Colors.white,),
              label: 'Favorites',
            ),
          ],
        ),
      ),
    );
  }
}
