// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_api_services.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$RestApiService extends RestApiService {
  _$RestApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RestApiService;

  @override
  Future<Response<dynamic>> getShop() {
    final Uri $url = Uri.parse('/api/v1/shops/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getShopStatus(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/v1/shop_status/');
    final $body = body;
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
