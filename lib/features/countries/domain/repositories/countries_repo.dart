import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:countries_clean_arch/core/domain/failure/failure.dart';
import 'package:countries_clean_arch/features/countries/data/remote/data_sources/countries_remote_data_source.dart';
import 'package:countries_clean_arch/features/countries/domain/entities/country.dart';
import 'package:injectable/injectable.dart';

abstract interface class CountriesRepo {
  Future<Either<Failure, List<Country>>> getCountries();
}
