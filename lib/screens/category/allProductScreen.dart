import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/all_products_modul.dart';
import '../../data/network/network_response.dart';
import '../../data/repositories/product_repository.dart';
import '../../utils/app_text_style.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  final ALLProductRepository aLLProductRepository = ALLProductRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_480ca8,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.c_028090,
        title: Text("AllProduct",
            style: AppTextStyle.condensedMedium
                .copyWith(color: AppColors.white, fontSize: 24.sp)),
      ),
      body: FutureBuilder(
        future: aLLProductRepository.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            List<AllProductModel> products =
                snapshot.data as List<AllProductModel>;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 15.h,
                // childAspectRatio: 0.8,
                children: [
                  ...List.generate(
                    products.length,
                    (index) => Container(
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: Image.network(products[index].imageUrl)),
                            Text("${products[index].category_id}",style: TextStyle(color: AppColors.c_1A72DD,fontSize: 18.sp,fontWeight: FontWeight.w700),),

                            Text(products[index].name,style: TextStyle(color: AppColors.c_1A72DD,fontSize: 18.sp,fontWeight: FontWeight.w700),),
                            Text("ID:${products[index].price}",style: TextStyle(color: AppColors.c_1A72DD,fontSize: 14.sp,fontWeight: FontWeight.w400),)

                          ],
                        ),
                      ),
                    ),
                  ),
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
