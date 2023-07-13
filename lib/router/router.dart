import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_example/features/crypto_coin/view/crypto_coin_screen.dart';
import 'package:flutter_app_example/features/crypto_list/crypto_list.dart';
import 'package:flutter_app_example/repositories/crypto_coins/crypto_coins.dart';
part 'router.gr.dart';

// final routes = {
//   CryptoListScreen.route: (context) =>
//       const CryptoListScreen(title: 'Crypto currencies list'),
//   CryptoCoinScreen.route: (context) => const CryptoCoinScreen(),
// };

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CryptoListRoute.page, path: '/'),
        AutoRoute(page: CryptoCoinRoute.page)
      ];
}
