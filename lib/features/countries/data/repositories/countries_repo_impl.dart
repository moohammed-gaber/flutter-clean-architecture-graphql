import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:countries_clean_arch/core/domain/failure/failure.dart';
import 'package:countries_clean_arch/features/countries/data/remote/data_sources/countries_remote_data_source.dart';
import 'package:countries_clean_arch/features/countries/domain/entities/country.dart';
import 'package:countries_clean_arch/features/countries/domain/repositories/countries_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CountriesRepo)
class CountriesRepoImpl implements CountriesRepo {
  CountriesRepoImpl(this._remoteDataSource);

  final CountriesRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<Country>>> getCountries() async {
    final result = await _remoteDataSource.getCountries();
    return right(result);
  }
}
