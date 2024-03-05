import 'package:default_project/data/models/my_response.dart';
import 'package:default_project/data/models/product_model.dart';
import 'package:default_project/data/network/api_provider.dart';
import 'package:default_project/data/repositories/product_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductRepo productRepo = ProductRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<MyResponse>(
        future: productRepo.getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }
          if (snapshot.hasData) {
            List<ProductModel> products = (snapshot.data as MyResponse).data as List<ProductModel>;
            return RefreshIndicator(
                onRefresh: () {
                  setState(() {

                  });
                  return Future<void>.delayed(const Duration(seconds: 2));

                },

              child: GridView.count(crossAxisCount: 2, children: [
                ...List.generate(products.length, (index) {
                  var product = products[index];
                  return  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(product.image,width: 70,),
                          Text(product.price.toString(),style: TextStyle(fontSize: 18.sp,color: Colors.black,),),
                          Text(product.productName,style: TextStyle(fontSize: 18.sp,color: Colors.black,),),

                        ],
                      ),
                    ),
                  );
                })
              ]),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){
      //   Navigator.push(context, MaterialPageRoute(builder: (context)=> AddProductScreen()));
      // },
      // child: Icon(Icons.plus_one),
      // ),
    );
  }
}
