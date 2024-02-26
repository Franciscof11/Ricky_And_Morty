import 'package:flutter/material.dart';

class DefaultTryAgainWidget extends StatelessWidget {
  const DefaultTryAgainWidget({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Ops, somethjing wrong happened!',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: onPressed, child: const Text('Try Again'))
        ],
      ),
    );
  }
}
