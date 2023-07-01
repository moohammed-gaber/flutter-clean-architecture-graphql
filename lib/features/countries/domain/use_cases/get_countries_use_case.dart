import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:countries_clean_arch/core/domain/failure/failure.dart';
import 'package:countries_clean_arch/core/domain/use_cases/use_case.dart';
import 'package:countries_clean_arch/features/countries/domain/entities/country.dart';
import 'package:countries_clean_arch/features/countries/domain/repositories/countries_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetCountriesUseCase implements UseCase<NoParams, List<Country>> {
  GetCountriesUseCase(this._repo);

  final CountriesRepo _repo;

  @override
  Future<Either<Failure, List<Country>>> call(NoParams params) {
    return _repo.getCountries();
  }
}
