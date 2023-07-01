part of 'countries_bloc.dart';

@freezed
class CountriesEvent with _$CountriesEvent {
  const factory CountriesEvent.loaded() = _Loaded;
}
