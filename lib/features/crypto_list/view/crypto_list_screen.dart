import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_example/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../widgets/widgets.dart';
import '../../../repositories/crypto_coins/crypto_coins.dart';

@RoutePage()
class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  //List<CryptoCoin>? _cryptoCoinsList;

  final _cryptoListBloc = CryptoListBloc(GetIt.I<BaseCoinsRepository>());

  void handleReloadCoins(Completer? completer) async {
    _cryptoListBloc.add(LoadCryptoList(completer: completer));
  }

  @override
  void initState() {
    handleReloadCoins(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto currencies list'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        TalkerScreen(talker: GetIt.I<Talker>())));
              },
              icon: const Icon(Icons.document_scanner_outlined))
        ],
      ),
      body: RefreshIndicator(
          backgroundColor: Colors.black45,
          onRefresh: () async {
            final completer = Completer();
            handleReloadCoins(completer);
            return completer.future;
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
            bloc: _cryptoListBloc,
            builder: (context, state) {
              if (state is CryptoListLoaded) {
                return ListView.separated(
                    padding: const EdgeInsets.only(top: 16),
                    itemCount: state.coinsList.length,
                    separatorBuilder: (context, index) =>
                        Divider(color: theme.dividerColor),
                    itemBuilder: (context, i) {
                      final coin = state.coinsList[i];
                      return CryptoListItem(coin: coin);
                    });
              }
              if (state is CryptoListLoadingFailure) {
                return CryptoListError(
                    reload: () =>
                        _cryptoListBloc.add(LoadCryptoList(completer: null)));
              }
              return const Center(child: CircularProgressIndicator());
            },
          )),
    );
  }
}
