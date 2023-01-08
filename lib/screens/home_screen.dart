import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:shop_portal/bolcs/shop_bloc/shop_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<ShopBloc>(context).add(LoadShopDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: BlocBuilder<ShopBloc, ShopState>(builder: (context, state) {
        return BlocListener<ShopBloc, ShopState>(
            listener: (context, state) {
              if (state is ShopDataLoadedState) {
                if (state.message != '') {
                  ScaffoldMessenger.of(context).showMaterialBanner(
                      MaterialBanner(content: Text(state.message), actions: [
                    TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).clearMaterialBanners();
                        },
                        child: const Text('Ok'))
                  ]));
                }
              }
            },
            child: state is ShopDataLoadedState
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 20),
                        child: Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: EdgeInsets.zero,
                          child: Container(
                            constraints: const BoxConstraints(
                                maxHeight: 330,
                                maxWidth: 430,
                                minWidth: 300,
                                minHeight: 200),
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
                            child: InkWell(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Stack(
                                    alignment: Alignment.topRight,
                                    children: <Widget>[
                                      Container(
                                        height: 200,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                state.shop.mainPhoto!),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          right: 16,
                                          top: 16,
                                          child: Container(
                                            height: 12,
                                            width: 12,
                                            decoration: BoxDecoration(
                                                color: state.shop.isShopOpen
                                                    ? Colors.green
                                                    : Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                          ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12,
                                            right: 12,
                                            top: 12,
                                            bottom: 12 / 2),
                                        child: Text(
                                          state.shop.name!,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12, bottom: 12 / 2),
                                    child: Text(
                                      state.shop.address!,
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                              color:
                                                  Theme.of(context).hintColor),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12, bottom: 12 / 2),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          backgroundColor:
                                              Theme.of(context).primaryColor),
                                      onPressed: () {
                                        DatePicker.showDateTimePicker(context,
                                            showTitleActions: true,
                                            minTime: DateTime.now(),
                                            maxTime: DateTime(2019, 6, 7),
                                            onChanged: (date) {},
                                            onConfirm: (value) {
                                          BlocProvider.of<ShopBloc>(context)
                                              .add(CheckShopAvailibiltyEvent(
                                            value,
                                            state.shop,
                                          ));
                                        },
                                            currentTime: DateTime.now(),
                                            locale: LocaleType.en);
                                      },
                                      child: Text(
                                        "Check Availability",
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : const Center(child: CircularProgressIndicator()));
      }),
    );
  }
}
