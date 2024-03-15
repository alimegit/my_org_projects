import 'package:default_project/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/model/country_model/countrys_model.dart';
import '../view_models/country_view_model.dart';
class CountryScreen extends StatelessWidget {
  const CountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<CountryViewModel>().countries.isNotEmpty
          ? ListView(
        children: [
          ...List.generate(
            context.watch<CountryViewModel>().countries.length,
                (index) {
             CountryModel countryModel = context.watch<CountryViewModel>().countries[index];
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const  Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.network(
                                  countryModel.flagsModel.png,width: 120,
                                ),
                              const SizedBox(width: 20,),
                              Text(countryModel.region,style: AppTextStyle.robotoMedium.copyWith(color: Colors.black,fontWeight: FontWeight.w700),),
                              const Spacer(),
                              Image.network(
                                countryModel.coatOfArmsModel.png,width: 120,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ),
                ),
              );
            },
          ),
        ],
      )
          : const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
