import 'package:flutter/material.dart';
import 'package:countries_clean_arch/core/domain/use_cases/use_case.dart';
import 'package:countries_clean_arch/core/infrastructure/injection/injection.dart';
import 'package:countries_clean_arch/features/countries/domain/use_cases/get_countries_use_case.dart';
import 'package:countries_clean_arch/features/countries/presentation/pages/countries_page.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getIt<GetCountriesUseCase>().call(NoParams());
    return MaterialApp(
      title: 'Countries',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CountriesPage(),
    );
  }
}
