import 'package:default_project/data/models/my_response.dart';
import 'package:default_project/data/models/product_model.dart';
import 'package:default_project/data/repositories/product_repo.dart';
import 'package:default_project/screen/update.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'add_product_screen.dart';

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
                setState(() {});
                return Future<void>.delayed(const Duration(seconds: 2));
              },
              child: GridView.count(crossAxisCount: 2, children: [
                ...List.generate(products.length, (index) {
                  var product = products[index];
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: InkWell(
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('O\'chirishni hoxlaysizmi?'),
                              content: Text('Bu ma\'lumotni o\'chirishga ishonchingiz komilmi?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Yo\'q'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    productRepo.deleteProduct(product.productId);
                                    if (context.mounted) {
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Text('Ha'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 10,
                              blurRadius: 5,
                              offset: const Offset(0, 0), // shadow position changes (x, y)
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              product.image,
                              width: 60,
                            ),
                            Row(
                              children: [
                                Text(
                                  product.price.toString(),
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                IconButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  const UpdateScreen(),),);
                                }, icon: const  Icon(Icons.edit,color: Colors.green,),)

                              ],
                            ),
                            Text(
                              product.productName,
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black,
                              ),
                            ),
                          const   Spacer(),
                          ],
                        ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddProductScreen(onSet: (){setState(() {

          });},)));
        },
        child: Icon(Icons.plus_one),
      ),
    );
  }
}
