import 'dart:convert';

import 'package:dio/dio.dart';

import '../common.dart';

class ApiService {
  late Dio _dio;

  ApiService._() {
    _init();
  }

  static final instance = ApiService._();

  Future<void> _init() async {
    _dio = Dio();
    _dio.options.connectTimeout = const Duration(milliseconds: 5000);
    _dio.options.baseUrl = URL.baseUrl;
    _dio.interceptors.add(const CustomInterceptors());
    _dio.interceptors.add(PrettyDioLogger());
  }

  BaseResponse parseResponse(Response response, String? dataKey) {
    try {
      final BaseResponse baseResponse =
          BaseResponse.fromJson(response.data, dataKey);
      if (!baseResponse.error) {
        return baseResponse;
      }
      throw ServerException(baseResponse.message);
    } catch (e) {
      rethrow;
    }
  }

  dynamic parseError(DioException e) {
    if (e.type == DioExceptionType.badResponse) {
      BadResponse badResponse = BadResponse.fromJson(e.response?.data);
      throw ServerException(badResponse.message ?? '');
    }
    if (e.type == DioExceptionType.connectionTimeout) {
      throw const ServerFailure('check your connection');
    }

    if (e.type == DioExceptionType.receiveTimeout) {
      throw const ServerFailure('unable to connect to the server');
    }

    if (e.type == DioExceptionType.unknown) {
      throw const ServerFailure('Something went wrong');
    }
  }

  Future<BaseResponse> post(
    String endpoints,
    Map<String, dynamic> body, {
    String? dataKey,
  }) async {
    try {
      final Response response =
          await _dio.post(endpoints, data: jsonEncode(body));
      return parseResponse(response, dataKey);
    } on DioException catch (e) {
      return parseError(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse> get(
    String endpoints, {
    String? dataKey,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final Response response =
          await _dio.get(endpoints, queryParameters: queryParams);
      return parseResponse(response, dataKey);
    } on DioException catch (e) {
      return parseError(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse> formData(
    String url,
    UploadFormDataModel uploadFormData, {
    String? dataKey,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        uploadFormData.fileKey: MultipartFile.fromBytes(
          uploadFormData.fileBytes,
          filename: uploadFormData.fileName,
          contentType: uploadFormData.contentType,
        ),
        ...uploadFormData.data,
      });

      final Map<String, dynamic> headers = {
        'Content-Type': 'multipart/form-data'
      };

      final Response response = await _dio.post(
        url,
        data: formData,
        options: Options(
          headers: headers,
        ),
      );
      return parseResponse(response, dataKey);
    } on DioException catch (e) {
      return parseError(e);
    } catch (e) {
      rethrow;
    }
  }
}
