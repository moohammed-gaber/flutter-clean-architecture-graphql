import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries_clean_arch/core/infrastructure/injection/injection.dart';
import 'package:countries_clean_arch/features/countries/presentation/manager/countries_bloc.dart';

class _CountriesPage extends StatelessWidget {
  const _CountriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Countries')),
      body: BlocBuilder<CountriesBloc, CountriesState>(
        builder: (context, state) {
          return state.map(
              initial: (_) => const Center(child: CircularProgressIndicator()),
              loadInProgress: (_) =>
                  const Center(child: CircularProgressIndicator()),
              loadSuccess: (_) {
                final countries = _.countries;
                return ListView.builder(
                    itemCount: countries.length,
                    itemBuilder: (_, index) {
                      final country = countries[index];
                      return ListTile(
                        title: Text(country.name),
                        leading:
                            Text(country.emoji, style: TextStyle(fontSize: 30)),
                        subtitle: Text(country.capital ?? ''),
                      );
                    });
              },
              loadFailure: (_) => Text('Error'));
        },
      ),
    );
  }
}

class CountriesPage extends StatelessWidget {
  const CountriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CountriesBloc>()..add(const CountriesEvent.loaded()),
      child: const _CountriesPage(),
    );
  }
}
