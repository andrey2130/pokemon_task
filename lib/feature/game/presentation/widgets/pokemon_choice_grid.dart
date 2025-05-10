import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_task/feature/game/domain/entities/pokemon_entity.dart';
import 'package:pokemon_task/feature/game/presentation/bloc/pokemon_game_bloc.dart';

class PokemonChoiceGrid extends StatelessWidget {
  final List<PokemonEntity> pokemons;

  const PokemonChoiceGrid({super.key, required this.pokemons});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: pokemons.length,
      itemBuilder: (context, index) {
        final pokemon = pokemons[index];
        return ElevatedButton(
          onPressed: () {
            context.read<PokemonGameBloc>().add(
              PokemonGameEvent.makeGuess(pokemon.name),
            );
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            _formatPokemonName(pokemon.name),
            style: const TextStyle(fontSize: 16),
          ),
        );
      },
    );
  }

  /// Formats a pokemon name by capitalizing parts and replacing hyphens with spaces
  String _formatPokemonName(String name) {
    return name
        .split('-')
        .map((part) => part.substring(0, 1).toUpperCase() + part.substring(1))
        .join(' ');
  }
}
