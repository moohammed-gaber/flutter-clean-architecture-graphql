import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: GraphQLClient)
class AppGraphqlClient extends GraphQLClient {
  static const _host = 'https://countries.trevorblades.com/graphql';
  AppGraphqlClient() : super(link: HttpLink(_host), cache: GraphQLCache());
}
