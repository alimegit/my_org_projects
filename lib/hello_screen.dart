import 'package:default_project/utils/app_text_style.dart';
import 'package:flutter/material.dart';

import 'all_country.dart';
import 'countries_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controllerContinent1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Country",style: TextStyle(color: Colors.white,fontSize: 25),),
        backgroundColor: Colors.deepPurple,  // AppBar rangini o'zgartirish
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _styledTextButton(
                title: "All Country",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AllCounty();
                  }));
                },
              ),
              _styledTextButton(
                title: "Europe",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const CountriesScreen(
                      continent: 'EU',
                      title: 'Europe',
                    );
                  }));
                },
              ),
              _styledTextButton(
                title: "Asia",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const CountriesScreen(
                      continent: 'AS',
                      title: 'Asia',
                    );
                  }));
                },
              ),
              _styledTextButton(
                title: "Africa",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const CountriesScreen(
                      continent: 'AF',
                      title: 'Africa',
                    );
                  }));
                },
              ),
              _styledTextButton(
                title: "North America",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const CountriesScreen(
                      continent: 'NA',
                      title: 'North America',
                    );
                  }));
                },
              ),
              _styledTextButton(
                title: "South America",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const CountriesScreen(
                      continent: 'SA',
                      title: 'South America',
                    );
                  }));
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _styledTextButton({required String title, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
