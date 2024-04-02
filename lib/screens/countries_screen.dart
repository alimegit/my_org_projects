import 'package:default_project/utils/app_text_style.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/country_cubit.dart';
import '../cubit/country_state.dart';
import '../data/models/countries_model.dart';
import '../data/models/form_status.dart';
class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back_ios_sharp),),
          title: Text(
            "Countries",
            style: AppTextStyle.robotoThin.copyWith(
              color: const Color(0xFF14213d),
            ),
          ),
          backgroundColor: AppColors.c_C4C4C4,
        ),
        body: BlocBuilder<CountryCubit, CountryState>(builder: (BuildContext context, state) {
          if (state.formStatus == FormStatus.loading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state.formStatus == FormStatus.error) {
            return Center(child: Text(state.errorText));
          }
          return ListView.builder(
              itemCount: state.countries.length,
              itemBuilder: (context, index) {
                CountryModel countryModel = state.countries[index];
                return ListTile(
                  title: Text(
                    countryModel.name,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  trailing: Text(
                    countryModel.emoji,
                    style: TextStyle(
                      fontSize: 30.sp,
                    ),
                  ),
                  subtitle: Text("Code ${countryModel.code}"),
                );
              });
        }));
  }
}
