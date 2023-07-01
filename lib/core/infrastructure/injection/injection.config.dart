// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql_flutter/graphql_flutter.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

import '../../../features/countries/data/remote/data_sources/countries_remote_data_source.dart'
    as _i6;
import '../../../features/countries/data/repositories/countries_repo_impl.dart'
    as _i8;
import '../../../features/countries/domain/repositories/countries_repo.dart'
    as _i7;
import '../../../features/countries/domain/use_cases/get_countries_use_case.dart'
    as _i9;
import '../../../features/countries/presentation/manager/countries_bloc.dart'
    as _i10;
import '../io/assets_reader.dart' as _i3;
import '../remote/app_graphql_client.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AssetsReader>(() => _i3.AssetsReaderImpl());
    gh.lazySingleton<_i4.GraphQLClient>(() => _i5.AppGraphqlClient());
    gh.lazySingleton<_i6.CountriesRemoteDataSource>(
        () => _i6.CountriesRemoteDataImpl(
              gh<_i4.GraphQLClient>(),
              gh<_i3.AssetsReader>(),
            ));
    gh.lazySingleton<_i7.CountriesRepo>(
        () => _i8.CountriesRepoImpl(gh<_i6.CountriesRemoteDataSource>()));
    gh.lazySingleton<_i9.GetCountriesUseCase>(
        () => _i9.GetCountriesUseCase(gh<_i7.CountriesRepo>()));
    gh.factory<_i10.CountriesBloc>(
        () => _i10.CountriesBloc(gh<_i9.GetCountriesUseCase>()));
    return this;
  }
}
