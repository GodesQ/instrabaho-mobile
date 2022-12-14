import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instrabaho/bloc/auth_toggle/auth_toggle_bloc.dart';
import 'package:instrabaho/component/unknown_page.dart';
import 'package:instrabaho/router/router.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthToggleBloc>(
          create: (context) => AuthToggleBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Instrabaho',
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(
              builders: {TargetPlatform.android: ZoomPageTransitionsBuilder()}),
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: routes,
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) => const UnknownPage(),
          );
        },
      ),
    );
  }
}
