import 'dart:convert';

import 'package:countries_clean_arch/core/infrastructure/io/assets_reader.dart';
import 'package:flutter/material.dart';
import 'package:countries_clean_arch/core/infrastructure/remote/app_graphql_client.dart';
import 'package:countries_clean_arch/features/countries/data/remote/models/country_model.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

abstract interface class CountriesRemoteDataSource {
  Future<List<CountryModel>> getCountries();
}

@LazySingleton(as: CountriesRemoteDataSource)
class CountriesRemoteDataImpl implements CountriesRemoteDataSource {
  CountriesRemoteDataImpl(this._client, this._assetsReader);
  final GraphQLClient _client;
  final AssetsReader _assetsReader;

  @override
  Future<List<CountryModel>> getCountries() async {
    final query = (await _assetsReader
        .loadFile(['graphql', 'queries', 'get-countries.graphql']));
    final result = await _client.query(QueryOptions(
      document: gql(query),
    ));
    final countries = (result.data!['countries'] as List);
    return countries.map((e) => CountryModel.fromJson(e)).toList();
  }
}
