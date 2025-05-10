/// Utility class for formatting pokemon names
class PokemonNameFormatter {
  /// Formats a pokemon name by capitalizing parts and replacing hyphens with spaces
  static String formatPokemonName(String name) {
    return name
        .split('-')
        .map((part) => part.substring(0, 1).toUpperCase() + part.substring(1))
        .join(' ');
  }
}
