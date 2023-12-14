import 'package:retro_flutter/api_service.dart';
import 'package:retro_flutter/pexel_response.dart';

class Repository {
  final apiService = ApiService(buildDioClient('https://api.pexels.com/v1'));

  Future<List<Photos>?> getPhotos() async {
    final response = await apiService.getImages(100);
    return response.photos;
  }
}