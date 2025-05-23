import 'package:flutter/material.dart';

class PokemonTypeBadge extends StatelessWidget {
  final String type;

  const PokemonTypeBadge({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final typeColor = _getTypeColor(type);
    // Determine text color based on the brightness of the type color
    final textColor =
        typeColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: typeColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        type.toUpperCase(),
        style: TextStyle(
          color: textColor, // Dynamically set text color
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// Returns color based on pokemon type
  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'normal':
        return Colors.grey.shade500;
      case 'fire':
        return Colors.red.shade600;
      case 'water':
        return Colors.blue.shade600;
      case 'electric':
        return Colors.amber.shade500;
      case 'grass':
        return Colors.green.shade600;
      case 'ice':
        return Colors.cyan.shade300;
      case 'fighting':
        return Colors.brown.shade600;
      case 'poison':
        return Colors.purple.shade600;
      case 'ground':
        return Colors.amber.shade800;
      case 'flying':
        return Colors.indigo.shade300;
      case 'psychic':
        return Colors.pink.shade400;
      case 'bug':
        return Colors.lightGreen.shade700;
      case 'rock':
        return Colors.amber.shade700;
      case 'ghost':
        return Colors.purple.shade800;
      case 'dragon':
        return Colors.indigo.shade600;
      case 'dark':
        return Colors.grey.shade800;
      case 'steel':
        return Colors.blueGrey.shade400;
      case 'fairy':
        return Colors.pink.shade300;
      default:
        return Colors.grey.shade500;
    }
  }
}
