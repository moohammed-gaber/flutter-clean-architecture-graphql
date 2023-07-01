import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:countries_clean_arch/core/domain/failure/failure.dart';


abstract interface class UseCase<P, R> {
  Future<Either<Failure, R>> call(P params);
}

class NoParams {}
