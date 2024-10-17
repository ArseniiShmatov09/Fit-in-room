import 'package:flutter/material.dart';

class ThemeState {
  const ThemeState(this.brightness);

  final Brightness brightness;


  List<Object> get props => <Object>[brightness];
}