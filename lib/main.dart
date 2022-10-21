// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:linhas_ipigua/views/android/android.app.dart';
import 'package:linhas_ipigua/views/ios/iosApp.app.dart';





void main() {
  runApp(Platform.isIOS ? IosApp() : AndroidApp());
}



