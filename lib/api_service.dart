import 'package:dio/dio.dart' hide Headers;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retro_flutter/pexel_response.dart';
import 'package:retrofit/http.dart';

// https://api.pexels.com/v1/curated

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @Headers({
    "Authorization": "563492ad6f91700001000001dc912faa4865445694b8ccc566067984"
  })
  @GET('/curated')
  Future<PexelResponse> getImages(@Query("per_page") int perPage);
}

Dio buildDioClient(String base) {
  final dio = Dio()..options = BaseOptions(baseUrl: base);
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));
  return dio;
}
