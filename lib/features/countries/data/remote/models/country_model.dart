import 'package:flutter/material.dart';
import 'package:countries_clean_arch/features/countries/domain/entities/country.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'country_model.g.dart';

@JsonSerializable()
class CountryModel extends Country {
  const CountryModel(
      {required super.name, super.capital, required super.emoji});
  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);
}
