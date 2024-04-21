import 'package:default_project/screens/product_screen.dart';
import 'package:default_project/utils/app_text_style.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../bloc/qr_bloc.dart';
import '../../bloc/qr_event.dart';
import '../../bloc/qr_state.dart';
import '../../data/model/form_status.dart';
import '../../data/model/product_model.dart';
import '../../utils/app_images.dart';
import '../qr_screen.dart';

class GenerateScreen extends StatefulWidget {
  const GenerateScreen({super.key});

  @override
  State<GenerateScreen> createState() => _GenerateScreenState();
}

class _GenerateScreenState extends State<GenerateScreen> {
  final GlobalKey _globalKey = GlobalKey();
  TextEditingController createQrController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF333333),
      appBar: AppBar(
        backgroundColor: const Color(0xFF333333),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration:
                BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(8.r)),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.amber,
              ),
            ),
          ),
        ),
        title: Text(
          "Text",
          style: AppTextStyle.robotoMedium.copyWith(color: Colors.white, fontSize: 20.sp),
        ),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.status == FormStatus.loading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state.status == FormStatus.error) {
            return Center(
              child: Text(state.statusText),
            );
          }

          return Column(
            children: [
              SizedBox(
                height: 100.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 23.w, right: 23.w),
                child: Container(
                  width: 400.w,
                  height: 320.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B3B3B),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border(
                      top: BorderSide(width: 2.w, color: Colors.amber),
                      bottom: BorderSide(width: 2.w, color: Colors.amber),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                          child: Image.asset(
                            AppImages.text,
                            width: 60.w,
                          ),
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        Text(
                          "Text",
                          style: AppTextStyle.robotoMedium
                              .copyWith(color: Colors.white, fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.w),
                          child: TextField(
                            controller: createQrController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFF333333),
                              labelText: "Enter Text",
                              labelStyle: AppTextStyle.robotoBold.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 8.sp),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(18.r)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.w, top: 70.h),
                          child: InkWell(
                            onTap: () {
                              QrScannerScreen(
                                barcode: (barcode) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(barcode.code.toString()),
                                    ),
                                  );
                                  context.read<ProductBloc>().add(
                                        AddProductEvent(
                                          productModel: ProductModel(
                                            name: createQrController.text,
                                            id: 1,
                                            qrCode: barcode.code.toString(),
                                            description: "Tabiiy",
                                          ),
                                        ),
                                      );
                                },
                              );
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) => const ProductScreen()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.amber, borderRadius: BorderRadius.circular(8.r)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        AppImages.qr,
                                        width: 25,
                                      ),
                                      Text(
                                        "  Generte Code",
                                        style: AppTextStyle.robotoMedium
                                            .copyWith(color: Colors.black26),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
