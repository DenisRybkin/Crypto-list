part of 'crypto_list_bloc.dart';

abstract class CryptoListEvent extends Equatable {}

class LoadCryptoList extends CryptoListEvent {
  final dynamic completer;
  LoadCryptoList({
    this.completer,
  });

  @override
  List<Object?> get props => [completer];
}
