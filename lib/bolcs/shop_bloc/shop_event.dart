part of 'shop_bloc.dart';

@immutable
abstract class ShopEvent {}

class LoadShopDataEvent extends ShopEvent {}

class CheckShopAvailibiltyEvent extends ShopEvent {
  final DateTime dateTime;
   final Shop shop;
  CheckShopAvailibiltyEvent(this.dateTime,this.shop);
}
