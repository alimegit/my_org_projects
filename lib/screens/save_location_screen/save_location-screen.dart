import 'package:default_project/utils/app_text_style.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../view_models/adress_view_model.dart';
import '../map_screen.dart';
import '../update_map_screen.dart';

class SaveLocationScreen extends StatefulWidget {
  const SaveLocationScreen({super.key});

  @override
  State<SaveLocationScreen> createState() => _SaveLocationScreenState();
}

class _SaveLocationScreenState extends State<SaveLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.black,
            )),
        title: Text(
          "My Addresses",
          style: AppTextStyle.robotoMedium.copyWith(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<AddressesViewModel>(
              builder: (context, viewModel, child) {
                return ListView(
                  children: [
                    ...List.generate(
                      viewModel.myAddresses.length,
                      (index) {
                        // var myAddress = viewModel.myAddresses[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const  UpdateMapScreen()));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5), // qora to'rt ko'z
                                  spreadRadius: 5, // to'laq
                                  blurRadius: 7, // nurlilik
                                  offset: const Offset(0, 3), // ofset
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    viewModel.myAddresses[index].image,
                                    width: 60,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          viewModel.myAddresses[index].placeCategory.name,
                                          style: AppTextStyle.robotoRegular.copyWith(
                                              color: Colors.black,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          viewModel.myAddresses[index].orientAddress,
                                          style: AppTextStyle.robotoRegular.copyWith(
                                              color: Colors.grey,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      viewModel.myAddresses.remove(viewModel.myAddresses[index]);
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.cancel_outlined,
                                      size: 25.sp,
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
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const MapScreen();
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text("Yangi address qo'shish")),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
