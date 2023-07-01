part of 'countries_bloc.dart';

@freezed
class CountriesState with _$CountriesState {
  const factory CountriesState.initial() = _Initial;
  const factory CountriesState.loadInProgress() = _LoadInProgress;
  const factory CountriesState.loadSuccess(List<Country> countries) = _LoadSuccess;
  const factory CountriesState.loadFailure(Failure failure) = _LoadFailure;
}
