import 'dart:async';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'repositories/crypto_coins/crypto_coins.dart';
import 'package:get_it/get_it.dart';
import 'app.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton<Talker>(talker);
  GetIt.I<Talker>().debug("Talker started");

  await Hive.initFlutter();
  Hive.registerAdapter(CryptoCoinAdapter());
  Hive.registerAdapter(CryptoCoinDetailAdapter());

  final cryptoCoinsBox = await Hive.openBox<CryptoCoin>('crypto_coins_box');

  final dio = Dio();
  dio.options.headers = {
    'authorization':
        'Apikey b1a0e7c43766a74c2b9b013b0dacc6aea44e8723fd9628d6a47af9533ae89cd6'
  };
  dio.interceptors.add(TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(printResponseData: false)));

  Bloc.observer = TalkerBlocObserver(
      talker: talker,
      settings: const TalkerBlocLoggerSettings(
          printStateFullData: false, printEventFullData: false));

  GetIt.I.registerSingleton<BaseCoinsRepository>(
      CryptoCoinsRepository(dio: dio, cryptoCoinsBox: cryptoCoinsBox));

  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  runZonedGuarded(() => runApp(const MyApp()),
      (error, stack) => GetIt.I<Talker>().handle(error, stack));
  // Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
}
