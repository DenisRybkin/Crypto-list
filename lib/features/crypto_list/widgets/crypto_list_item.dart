import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_example/router/router.dart';
import '../../../repositories/crypto_coins/models/crypto_coin.dart';

class CryptoListItem extends StatelessWidget {
  const CryptoListItem({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ListTile(
      leading: Image.network(coin.details.fullImageUrl),
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text(
        coin.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text('${coin.details.priceInUSD}\$',
          style: theme.textTheme.labelSmall),
      onTap: () {
        AutoRouter.of(context).push(CryptoCoinRoute(coin: coin));
      },
    );
  }
}
