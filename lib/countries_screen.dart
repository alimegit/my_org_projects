import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/country_bloc.dart';
import 'bloc/country_event.dart';
import 'bloc/country_state.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key, required this.continent, required this.title});

  final String continent;
  final String title;

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  void initState() {
    context
        .read<CountriesBloc>()
        .add(FetchCountriesByContinent(continent: widget.continent));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<CountriesBloc, CountriesState>(
        builder: (context, state) {
          if (state is CountriesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CountriesError) {
            return Center(child: Text(state.errorMessage));
          }

          if (state is CountriesSuccess) {
            return ListView(
              children: List.generate(
                state.countries.length,
                    (index) => ListTile(
                  title: Text(state.countries[index].name),
                  trailing: Text(state.countries[index].emoji),
                  subtitle: Text(state.countries[index].continentName),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
