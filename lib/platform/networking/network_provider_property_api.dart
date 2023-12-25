import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'network_provider_property_api.g.dart';

@RestApi(baseUrl: "this url will be ignored if baseUrl is passed")
abstract class NetworkProviderPropertyApi {
  factory NetworkProviderPropertyApi(Dio dio, {String baseUrl}) = _NetworkProviderPropertyApi;
}
