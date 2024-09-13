import 'package:catbreeds/src/ui/pages/home_page.dart';
import 'package:catbreeds/src/ui/pages/splash_page.dart';
import 'package:catbreeds/src/data/catbreed_repository.dart';
import 'package:catbreeds/src/providers/catbreed_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CatbreedsListProvider(CatbreedRepositoryImpl()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Catbreeds',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:
            //const SplashPage(),
            const HomePage(),
      ),
    );
  }
}
