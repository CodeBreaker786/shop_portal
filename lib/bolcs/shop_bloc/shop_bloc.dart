import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:meta/meta.dart';
import 'package:shop_portal/data/services/api/api_client.dart';
import 'package:shop_portal/data/services/api/rest_api_services.dart';
import 'package:shop_portal/models/data_response_model.dart';
import 'package:shop_portal/models/shop_model.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final chopper = ApiClient.chopper.getService<RestApiService>();
  ShopBloc() : super(ShopInitial()) {
    on<LoadShopDataEvent>(
        (event, emit) => mapLoadShopDataEventToState(event, emit));
    on<CheckShopAvailibiltyEvent>(
        (event, emit) => mapCheckShopAvailibiltyEventToState(event, emit));
  }

  mapLoadShopDataEventToState(
      LoadShopDataEvent event, Emitter<ShopState> emit) async {
    emit(LoadingDataInProgressState());
    Response response = await chopper.getShop();
    DataResponseModel dataResponseModel = (response.isSuccessful
        ? response.body
        : response.error) as DataResponseModel;
    if (dataResponseModel.status) {
      Shop shop = Shop.fromJson(dataResponseModel.data[0]);
      emit(ShopDataLoadedState(shop,''));
    }
  }
  mapCheckShopAvailibiltyEventToState(
      CheckShopAvailibiltyEvent event, Emitter<ShopState> emit) async {
    Response response = await chopper.getShopStatus({'date':event.dateTime.toLocal().toString()});
     DataResponseModel dataResponseModel = (response.isSuccessful
        ? response.body
        : response.error) as DataResponseModel;
    if (dataResponseModel.status) {
      
      emit(ShopDataLoadedState(event.shop,dataResponseModel.data));
    }
  }
}



