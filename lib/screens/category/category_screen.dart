import 'package:default_project/data/repositories/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/network/network_response.dart';
import '../../data/models/smart_model.dart';
import '../../utils/app_text_style.dart';
import '../../utils/appcolors.dart';
import '../categories.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoryRepository categoryRepository = CategoryRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.c_028090,
        title: Text("Categories",
            style: AppTextStyle.condensedMedium
                .copyWith(color: AppColors.white, fontSize: 24.sp)),
      ),
      body: FutureBuilder(
        future: categoryRepository.getAllCategory(),
        builder: (
          BuildContext context,
          AsyncSnapshot<NetworkResponse> snapshot,
        ) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            List<SmartModel> categories =
                (snapshot.data as NetworkResponse).data as List<SmartModel>;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 15.h,
                  crossAxisSpacing: 15.w,
                  children: [
                    ...List.generate(categories.length, (index)
                    {
                      SmartModel smartModel = categories[index];
                      return InkWell(
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder:(context)=>InfoScreen(id:smartModel.id)));},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: AppColors.c_2A3256,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  child: Padding(
                                    padding:  EdgeInsets.all(8.0),
                                    child: Image.network(smartModel.image_url),
                                  ),
                                ),
                                Text(smartModel.name,style: TextStyle(color: AppColors.c_1A72DD,fontSize: 18.sp),),
                                Text("ID:${smartModel.id}",style: TextStyle(color: AppColors.c_1A72DD,fontSize: 18.sp),),
                                Text("Created at ${smartModel.created_at}",style: TextStyle(color: AppColors.c_1A72DD,fontSize: 14.sp),),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    )
                  ],
                ),
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
