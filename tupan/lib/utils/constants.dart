import 'dart:io';
import 'package:flutter/material.dart';

class APIConstants {
  static const String apiUrl = 'http://192.168.100.141:8030/api';
  // static const String apiUrl = 'https://adroyoyo.es:8445/api';
  // static const String apiUrl = 'https://centscompany.com:8445/api';
}

class Credentials {
  static String? id;
  static String? token;
  static String? tokenRefresh;
  static String? password;
  static String? email;
  static String? username;
  static String? firstName;
  static String? lastName;
}
