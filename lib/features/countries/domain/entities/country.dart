import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Country extends Equatable {
  const Country({
    required this.name,
    this.capital,
    required this.emoji,
  });

  final String name;
  final String? capital;
  final String emoji;

  @override
  List<Object?> get props => [name, capital, emoji];
}
