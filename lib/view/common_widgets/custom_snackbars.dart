import 'package:flutter/material.dart';

class SnackBars{

  static showSnackBar({required String message})
{
  return SnackBar(content: Text(message),);
}


}