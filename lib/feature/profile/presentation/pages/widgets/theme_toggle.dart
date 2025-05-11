

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_task/core/theme/bloc/theme_bloc.dart';

class ThemeToggleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Dark mode',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            Switch.adaptive(
              value: themeState.themeMode == AppThemeMode.dark,
              onChanged: (value) {
                context.read<ThemeBloc>().add(const ThemeEvent.toggleTheme());
              },
            ),
          ],
        );
      },
    );
  }
}
