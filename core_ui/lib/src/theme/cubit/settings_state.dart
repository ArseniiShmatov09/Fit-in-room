import 'package:flutter/material.dart';

class SettingsState {
  final Brightness brightness;
  final double fontScaleFactor;

  const SettingsState({
    required this.brightness,
    required this.fontScaleFactor,
  });

  SettingsState copyWith({
    Brightness? brightness,
    double? fontScaleFactor,
  }) {
    return SettingsState(
      brightness: brightness ?? this.brightness,
      fontScaleFactor: fontScaleFactor ?? this.fontScaleFactor,
    );
  }

  List<Object> get props => <Object>[brightness, fontScaleFactor];
}

