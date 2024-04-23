import 'package:flutter/material.dart';

class User {
  final String id;
  final String email;
  final String username;
  final Image? avatar;

  const User({
    required this.id,
    required this.email,
    required this.username,
    this.avatar,
  });

}
