// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:linhas_ipigua/views/android/android.app.dart';
import 'package:linhas_ipigua/views/ios/iosApp.app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // connecta com o firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // inicia o app
  runApp(Platform.isIOS ? IosApp() : AndroidApp());
}
