import 'package:dio/dio.dart';
import 'package:story_app/common/common.dart';
import '../../features/auth_screen/data/data.dart';

class CustomInterceptors extends Interceptor {
  const CustomInterceptors();
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final StorageService storageService = StorageService.instance;
    final UserModel? user = await storageService.getUser();
    if (user != null) {
      options.headers['Authorization'] = 'Bearer ${user.token}';
    }

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    return super.onError(err, handler);
  }
}
