import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mnet_corporate/generated/l10n.dart';
import 'package:mnet_corporate/provider/LanguageChangeProvider.dart';
import 'package:mnet_corporate/provider/noticeProvider.dart';
import 'package:mnet_corporate/res/color/app_color.dart';
import 'package:mnet_corporate/util/connection_status.dart';
import 'package:mnet_corporate/util/route_generator.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await GlobalConfiguration().loadFromAsset('configurations');
    ConnectionStatusSingleton connectionStatus =
        ConnectionStatusSingleton.getInstance();
    connectionStatus.initialize();

    HttpOverrides.global = MyHttpOverrides();
  } catch (e) {}

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LanguageChangeProvider>(
            create: (context) => LanguageChangeProvider())
      ],
      child: Builder(builder: (context) {
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: AppColor.primary,
              statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ));
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (context) => S.of(context).title,
          onGenerateRoute: RouteGenerator.generateRoute,
          theme: ThemeData(
            primarySwatch: Colors.teal,
            textTheme:
                GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme),
            // appBarTheme: Theme.of(context)
            //     .appBarTheme
            //     .copyWith(backgroundColor: Colors.amber),
          ),
          locale: Provider.of<LanguageChangeProvider>(context, listen: true)
              .currentLocale,
          initialRoute: '/SignIn',
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        );
      }),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
