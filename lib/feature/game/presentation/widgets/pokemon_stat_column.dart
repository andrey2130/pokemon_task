import 'package:flutter/material.dart';

class PokemonStatColumn extends StatelessWidget {
  final String label;
  final int value;

  const PokemonStatColumn({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color:
                theme.textTheme.bodySmall?.color ??
                theme.colorScheme.onSurface.withOpacity(0.7),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color:
                theme.textTheme.titleMedium?.color ??
                theme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
