import 'package:all_my_apps/layout/todo%20screen/todo_screen.dart';
import 'package:all_my_apps/modules/login_screen/login_screen.dart';
import 'package:all_my_apps/shared/components/components.dart';
import 'package:flutter/material.dart';
import '../counter/counter.dart';
import '../messenger/messenger.dart';
import '../whats_app/whatsapp.dart';
import '../bmi/bmi_screen.dart';

class allApps extends StatefulWidget {
  const allApps({Key? key}) : super(key: key);

  @override
  State<allApps> createState() => _allAppsState();
}

class _allAppsState extends State<allApps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Apps'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          allAppsWidject(
            screen: counterScreen(),
            text: 'counter',
            imagePath: 'images/plus_minus.png',
            context: context,
          ),
          allAppsWidject(
            screen: messengerApp(),
            text: 'MESSENGER',
            imagePath: 'images/messenger.png',
            context: context,
          ),
          allAppsWidject(
            screen: whatsApp(),
            text: 'whatsapp',
            imagePath: 'images/whatsapp.png',
            context: context,
          ),
          allAppsWidject(
            screen: login_screen(),
            text: 'login screen',
            imagePath: 'images/login.png',
            context: context,
          ),
          allAppsWidject(
            screen: BmiScreen(),
            text: 'BMI CALCULATOR',
            imagePath: 'images/fit.png',
            context: context,
          ),
          allAppsWidject(
            screen: todo_screen(),
            imagePath: 'images/todo.png',
            text: 'todo app',
            context: context,
          ),
        ],
      ),
    );
  }
}
