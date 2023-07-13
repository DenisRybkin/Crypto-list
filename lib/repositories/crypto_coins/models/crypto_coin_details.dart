import 'package:equatable/equatable.dart';
import 'package:flutter_app_example/repositories/crypto_coins/crypto_coins.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_details.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class CryptoCoinDetail extends Equatable {
  const CryptoCoinDetail({
    required this.priceInUSD,
    required this.imageUrl,
    required this.toSymbol,
    required this.lastUpdate,
    required this.hight24Hour,
    required this.low24Hours,
  });

  @HiveField(0)
  @JsonKey(name: 'TOSYMBOL')
  final String toSymbol;

  @HiveField(1)
  @JsonKey(name: 'LASTUPDATE', toJson: _date2time, fromJson: _time2date)
  final DateTime lastUpdate;

  @HiveField(2)
  @JsonKey(name: 'HIGH24HOUR')
  final double hight24Hour;

  @HiveField(3)
  @JsonKey(name: 'LOW24HOUR')
  final double low24Hours;

  @HiveField(4)
  @JsonKey(name: 'PRICE')
  final double priceInUSD;

  @HiveField(5)
  @JsonKey(name: 'IMAGEURL')
  final String imageUrl;

  String get fullImageUrl => baseImageUrl + imageUrl;

  factory CryptoCoinDetail.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinDetailToJson(this);

  static int _date2time(DateTime time) => time.millisecondsSinceEpoch;
  static DateTime _time2date(int milliseconds) =>
      DateTime.fromMillisecondsSinceEpoch(milliseconds);

  @override
  List<Object> get props =>
      [priceInUSD, imageUrl, toSymbol, lastUpdate, hight24Hour, low24Hours];
}
