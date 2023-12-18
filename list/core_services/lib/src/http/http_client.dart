import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../models/response.model.dart';
import '../repositories/login.repository.dart';
import 'interceptors/core_header_interceptor.dart';

CoreResponse<T> helperFromJsonError<T>(dynamic data) {
  var response = CoreResponse<T>();
  response.success = false;

  if (data is DioError) {
    var erro = data.response?.data["error_description"];

    erro ??= data.message;
    response.fail(erro);
  }

  return response;
}

abstract class IRequester {
  List<Interceptor> get interceptors;

  Future auth({
    required String url,
    body,
    required Function(dynamic p1) fromJson,
    required Function(dynamic p1) fromJsonError,
  });

  Future delete({
    required String url,
    body,
    required Function(dynamic p1) fromJson,
    required Function(dynamic p1) fromJsonError,
  });

  Future fetch({
    required String url,
    required Function(dynamic p1) fromJson,
    required Function(dynamic p1) fromJsonError,
  });

  Future post({
    required String url,
    body,
    required Function(dynamic p1) fromJson,
    required Function(dynamic p1) fromJsonError,
  });

  Future put({
    required String url,
    body,
    required Function(dynamic p1) fromJson,
    required Function(dynamic p1) fromJsonError,
  });
}

class CoreHttpClient implements IRequester {
  final List<Interceptor> customInterceptors;

  CoreHttpClient({
    required this.customInterceptors,
  });

  @override
  List<Interceptor> get interceptors => customInterceptors;

  @override
  Future delete({
    required String url,
    body,
    required Function(dynamic p1) fromJson,
    required Function(dynamic p1) fromJsonError,
  }) async {
    return _invokeRequest(
      url: url,
      fromJson: fromJson,
      fromJsonError: fromJsonError,
      invokeDio: (dio) async {
        return await dio.delete(url, data: body);
      },
    );
  }

  @override
  Future fetch({
    required String url,
    required Function(dynamic p1) fromJson,
    required Function(dynamic p1) fromJsonError,
  }) async {
    return _invokeRequest(
      url: url,
      fromJson: fromJson,
      fromJsonError: fromJsonError,
      invokeDio: (dio) async {
        return await dio.get(url);
      },
    );
  }

  @override
  Future post({
    required String url,
    body,
    required Function(dynamic p1) fromJson,
    required Function(dynamic p1) fromJsonError,
  }) async {
    return _invokeRequest(
      url: url,
      fromJson: fromJson,
      fromJsonError: fromJsonError,
      invokeDio: (dio) async {
        return await dio.post(url, data: body);
      },
    );
  }

  @override
  Future put({
    required String url,
    body,
    required Function(dynamic p1) fromJson,
    required Function(dynamic p1) fromJsonError,
  }) async {
    return _invokeRequest(
      url: url,
      fromJson: fromJson,
      fromJsonError: fromJsonError,
      invokeDio: (dio) async {
        return await dio.put(url, data: body);
      },
    );
  }

  Future _invokeRequest({
    required String url,
    required Future<Response<dynamic>> Function(Dio) invokeDio,
    required Function(dynamic p1) fromJson,
    required Function(dynamic p1) fromJsonError,
  }) async {
    var dio = _setOptions(
      url,
    );

    await _addToken(dio);

    late Response<dynamic> response;
    try {
      response = await invokeDio(dio);

      if (response.statusCode == 200 || response.statusCode == 204) {
        return fromJson(response.data);
      } else {
        return fromJsonError(response.data);
      }
    } catch (e) {
      return fromJsonError(e);
    } finally {
      dio.close();
    }
  }

  Future<void> _addToken(Dio dio) async {
    final userData = await LoginRepository().get();

    if (userData.data != null) {
      dio.options.headers
          .addAll({'Authorization': 'Bearer ${userData.data!.accessToken}'});
    }
  }

  Dio _setOptions(String url) {
    var dio = Dio();

    dio.interceptors.add(CoreHeaderInterceptor());
    dio.interceptors.addAll(interceptors);

    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        request: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        requestBody: true,
        error: true,
        maxWidth: 90,
        compact: true,
      ));
    }

    dio.options.baseUrl = url;
    return dio;
  }

  @override
  Future auth({
    required String url,
    body,
    required Function(dynamic p1) fromJson,
    required Function(dynamic p1) fromJsonError,
  }) async {
    var dio = Dio();
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        request: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        requestBody: true,
        error: true,
        maxWidth: 90,
        compact: true,
      ));
    }

    dio.options.baseUrl = url;

    try {
      Response<dynamic> response = await dio.post(
        url,
        data: body,
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );

      if (response.statusCode == 200) {
        return fromJson(response.data);
      } else {
        return fromJsonError(response.data);
      }
    } catch (e) {
      return fromJsonError(e);
    } finally {
      dio.close();
    }
  }
}
