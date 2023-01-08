part of 'shop_bloc.dart';

@immutable
abstract class ShopState {}

class ShopInitial extends ShopState {}

class LoadingDataInProgressState extends ShopState {}

class ShopDataLoadedState extends ShopState {
  final Shop shop;
  final String message;
  ShopDataLoadedState(this.shop,this.message);
}
