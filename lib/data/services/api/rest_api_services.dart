import 'package:chopper/chopper.dart';
part 'rest_api_services.chopper.dart';

@ChopperApi(baseUrl: "/api/v1")
abstract class RestApiService extends ChopperService {
 


@Get(path: 'shops/')
Future<Response> getShop( );


@Get(path: 'shop_status/')
Future<Response> getShopStatus(@Body() Map<String, dynamic> body);
   

  static RestApiService create([ChopperClient? client]) =>
      _$RestApiService(client);
}
