import 'package:flutter/material.dart';

class CryptoListError extends StatelessWidget {
  const CryptoListError({super.key, required this.reload});

  final dynamic reload;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Something wen wrong',
            style:
                theme.textTheme.headlineMedium?.copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 16,
          ),
          Text('Plese try again later',
              style: theme.textTheme.labelSmall?.copyWith(fontSize: 16)),
          const SizedBox(height: 30),
          TextButton(onPressed: reload, child: const Text('Try again'))
        ],
      ),
    );
  }
}
