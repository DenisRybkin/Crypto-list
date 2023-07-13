import 'package:dio/dio.dart';
import 'package:flutter_app_example/repositories/crypto_coins/crypto_coins.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:talker_flutter/talker_flutter.dart';

const String baseUrl = 'https://min-api.cryptocompare.com/';
const String baseImageUrl = 'https://www.cryptocompare.com/';

class CryptoCoinsRepository implements BaseCoinsRepository {
  CryptoCoinsRepository({required this.dio, required this.cryptoCoinsBox});

  final Dio dio;
  final Box<CryptoCoin> cryptoCoinsBox;
  String _requestType = 'pricemultifull';

  String _currencyFilter = 'tsyms=USD';
  List<String> _coinsFilter = [
    'BTC',
    'ETH',
    'BNB',
    'YFI',
    'MKR',
    'PAXG',
    'AVAX',
    'BNB',
    'SOL',
    'TRX',
    'LTC',
    'XAUT',
    'ANT',
    'MATIC',
    'DOT'
  ];

  String _getCoins() => 'fsyms=${_coinsFilter.join(',')}';

  @override
  set coiunsFilter(List<String> newValue) => _coinsFilter = newValue;

  @override
  set currencyFilter(String newValue) => _currencyFilter = newValue;

  @override
  set requestType(String newValue) => _requestType = newValue;

  @override
  addCoinFilter(String coin) => _coinsFilter.add(coin);

  @override
  removeCoinFilter(String coin) =>
      _coinsFilter.removeWhere((item) => item == coin);

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    try {
      List<CryptoCoin> cryptoCoinsList = await _fetchCoinsList();
      cryptoCoinsList
          .sort((a, b) => b.details.priceInUSD.compareTo(a.details.priceInUSD));
      final coinsMap = {for (var coin in cryptoCoinsList) coin.name: coin};
      await cryptoCoinsBox.putAll(coinsMap);
      return cryptoCoinsList;
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      final coinsList = cryptoCoinsBox.values.toList();
      coinsList
          .sort((a, b) => b.details.priceInUSD.compareTo(a.details.priceInUSD));
      return coinsList;
    }
  }

  Future<List<CryptoCoin>> _fetchCoinsList() async {
    final Response response = await dio.get(
        '${baseUrl}data/$_requestType?fsyms=${_getCoins()}&$_currencyFilter');

    final data = response.data as Map<String, dynamic>;
    final dataRow = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRow.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final details = CryptoCoinDetail.fromJson(usdData);
      return CryptoCoin(name: e.key, details: details);
    }).toList();
    return cryptoCoinsList;
  }

  @override
  Future<CryptoCoin> getCoinDetails(String currencyCode) async {
    try {
      final coinDetails = await _fetchCoinDetails(currencyCode);
      cryptoCoinsBox.put(currencyCode, coinDetails);
      return coinDetails;
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      return cryptoCoinsBox.get(currencyCode)!;
    }
  }

  Future<CryptoCoin> _fetchCoinDetails(String currencyCode) async {
    final response = await dio.get(
        '${baseUrl}data/$_requestType?fsyms=$currencyCode&$_currencyFilter');

    final data = response.data as Map<String, dynamic>;
    final dataRow = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRow[currencyCode] as Map<String, dynamic>;
    final usdData =
        coinData[_currencyFilter.substring(6, _currencyFilter.length)];
    final details = CryptoCoinDetail.fromJson(usdData);

    return CryptoCoin(name: currencyCode, details: details);
  }
}
