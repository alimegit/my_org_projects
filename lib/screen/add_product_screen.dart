import 'package:default_project/data/models/product_model.dart';
import 'package:default_project/data/network/api_provider.dart';
import 'package:default_project/data/repositories/product_repo.dart';
import 'package:default_project/utils/app_text_style.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key, this.onSet});
  final VoidCallback? onSet;

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  ProductModel productModel = ProductModel.getDefaultProduct();
  ApiProvider apiProvider = ApiProvider();
  ProductRepo repo = ProductRepo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             Padding(
              padding: const EdgeInsets.all(8.0),
              child:  TextField(
                controller: nameController,
                  decoration: const InputDecoration(
                hintText: "Product nomi",
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: priceController,
                  decoration: const  InputDecoration(
                    hintText: "Product narxi",
              )),
            ),
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: TextField(
                controller: descriptionController,
                  decoration: const InputDecoration(
                hintText: "Product haqida",
              ),),
            ),Padding(
              padding:  EdgeInsets.all(8.0),
              child: TextField(
                controller: imageUrlController,
                  decoration: const InputDecoration(
                hintText: "Product haqida",
              ),),
            ),
        
        
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async  {
                  if (descriptionController.text.isNotEmpty &&
                      imageUrlController.text.isNotEmpty &&
                      nameController.text.isNotEmpty &&
                      priceController.text.isNotEmpty) {
                   ProductModel  productModel = ProductModel(
                      description: descriptionController.text,
                      price: double.parse(priceController.text),
                      productName: nameController.text,
                      image: imageUrlController.text, productId: "",
                    );
                   repo.addProduct(productModel);
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.c_C4C4C4,
                    borderRadius: BorderRadius.circular(16.r)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Center(child: Text("Qo'shing",style: AppTextStyle.robotoBold.copyWith(color: AppColors.white,fontSize: 16.sp),)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
