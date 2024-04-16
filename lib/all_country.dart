import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/country_bloc.dart';
import 'bloc/country_event.dart';
import 'bloc/country_state.dart';

class AllCounty extends StatefulWidget {
  const AllCounty({super.key});

  @override
  State<AllCounty> createState() => _AllCountyState();
}

class _AllCountyState extends State<AllCounty> {
  @override
  void initState() {
    context
        .read<CountriesBloc>()
        .add(FetchCountries());
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("All Country"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: TextField(
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    context.read<CountriesBloc>().add(SearchCountries(searchQuery: value));
                  } else {
                    context.read<CountriesBloc>().add(FetchCountries());
                  }
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1,), // Yozuv rangi qizil
                  ),
                ),
              ),
            ),
            BlocBuilder<CountriesBloc, CountriesState>(
              builder: (context, state) {
                if (state is CountriesLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is CountriesError) {
                  return Center(child: Text(state.errorMessage));
                }

                if (state is CountriesSuccess) {
                  return SizedBox(
                    height: 600,
                    child: ListView(
                        children: [
                          ...List.generate(
                            state.countries.length,
                                (index) => ListTile(
                              title: Text(state.countries[index].name),
                              trailing: Text(state.countries[index].emoji),
                              subtitle: Text(state.countries[index].continentName),
                            ),
                          ),
                        ]
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}



