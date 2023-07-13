import './models/models.dart';

abstract class BaseCoinsRepository {
  set currencyFilter(String newValue);
  set coiunsFilter(List<String> newValue);
  set requestType(String newValue);
  addCoinFilter(String coin);
  removeCoinFilter(String coin);
  Future<List<CryptoCoin>> getCoinsList();
  Future<CryptoCoin> getCoinDetails(String currencyCode);
}
