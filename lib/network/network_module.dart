import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @Named('BaseUrl')
  String get baseUrl => 'https://rickandmortyapi.com/api/';

  @Named('PrettyLogger')
  Interceptor providePrettyLogger() => PrettyDioLogger();

  @singleton //Instância única na aplicação
  Dio provideDio(
    @Named('BaseUrl') String baseUrl,
    @Named('PrettyLogger') Interceptor interceptor,
  ) =>
      Dio(
        BaseOptions(baseUrl: baseUrl),
      )..interceptors.add(interceptor);
}
