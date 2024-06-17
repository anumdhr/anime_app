import 'package:anime_fever/config/theme/app_theme.dart';
import 'package:anime_fever/cubit/toogle_theme_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool darkMode = false;
    // final themeCubit = context.read<ThemeCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Is Dark Mode"),
                BlocBuilder<ThemeCubit, bool>(
                  builder: (context, state) {
                    return CupertinoSwitch(
                      onChanged: (value) {
                        context.read<ThemeCubit>().toggleTheme(value);
                        print(state);
                      },
                      value: state,
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
