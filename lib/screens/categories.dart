import 'package:default_project/data/models/input_categories_models.dart';
import 'package:default_project/utils/app_text_style.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/network/network_response.dart';
import '../data/repositories/input_categories_repository.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key, required this.id});

  final int id;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final InputCategoriesRepository inputCategoriesRepository =
      InputCategoriesRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.c_028090,
        title: Text("Info",
            style: AppTextStyle.condensedMedium
                .copyWith(color: AppColors.white, fontSize: 24.sp)),
      ),
      body: FutureBuilder(
        future: inputCategoriesRepository.getInputCategories(widget.id),
        builder: (
          BuildContext context,
          AsyncSnapshot<NetworkResponse> snapshot,
        ) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }
          if (snapshot.hasData) {
            List<InputCategoriesModels> users =
                snapshot.data!.data as List<InputCategoriesModels>;

            return GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 15.w,
              mainAxisSpacing: 15.h,
              // childAspectRatio: 0.8,
              children: [
                ...List.generate(
                  users.length,
                  (index) => Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Image.network(users[index].imageUrl)),
                          Text(
                            "ID:${users[index].name}",
                            style: TextStyle(color: AppColors.black),
                          ),
                          Text(
                            "categoryID ${users[index].categoryId}",
                            style: TextStyle(color: AppColors.black),
                          ),
                          Text(
                            "price: ${users[index].price}",
                            style: TextStyle(color: AppColors.black),
                          ),
                          Expanded(
                            child: Text(
                              "Description: ${users[index].description}",
                              style: TextStyle(color: AppColors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
