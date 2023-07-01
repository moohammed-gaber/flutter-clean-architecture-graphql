import 'package:bloc/bloc.dart';
import 'package:countries_clean_arch/core/domain/failure/failure.dart';
import 'package:countries_clean_arch/core/domain/use_cases/use_case.dart';
import 'package:countries_clean_arch/features/countries/domain/entities/country.dart';
import 'package:countries_clean_arch/features/countries/domain/use_cases/get_countries_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'countries_event.dart';
part 'countries_state.dart';
part 'countries_bloc.freezed.dart';

@Injectable()
class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  CountriesBloc(this._getCountriesUseCase)
      : super(const CountriesState.initial()) {
    on<CountriesEvent>(
        (event, emit) => event.map(loaded: (_) => _onLoaded(_, emit)));
  }

  final GetCountriesUseCase _getCountriesUseCase;

  Object? _onLoaded(_Loaded value, Emitter<CountriesState> emit) =>
      _getCountriesUseCase(NoParams()).then((failureOrCountries) {
        print(failureOrCountries);
        emit(failureOrCountries.fold(
          (failure) => (CountriesState.loadFailure(failure)),
          (countries) => (CountriesState.loadSuccess(countries)),
        ));
      });
}
