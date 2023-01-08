import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:shop_portal/configs/constants.dart';
import 'package:shop_portal/data/services/api/intercepoter_f.dart';
import 'package:shop_portal/data/services/api/rest_api_services.dart';

 

class ApiClient {
  static const String baseUrl = AppConfig.localHost;
  static ChopperClient chopper = ChopperClient(
     
      baseUrl: Uri.tryParse(baseUrl),
      services: [RestApiService.create()],
      interceptors: [
      
        HttpLoggingInterceptor(),
      ],
      errorConverter: ErrorResponseToDataModelConverter(),
      converter: const ResponseToDataModelConverter());
}

 
