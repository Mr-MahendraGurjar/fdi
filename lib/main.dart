import 'package:FdisTesting/database_helper/database_helper.dart';
import 'package:FdisTesting/pages/login_page.dart';
import 'package:FdisTesting/providers/audit_provider.dart';
import 'package:FdisTesting/providers/client_provider.dart';
import 'package:FdisTesting/providers/login_provider.dart';
import 'package:FdisTesting/providers/setting_provider.dart';
import 'package:FdisTesting/providers/toon_audit_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final dbHelper = DBHelper();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dbHelper.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => LoginProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ClientProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => SettingProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => AuditProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ToonAuditProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fdi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
