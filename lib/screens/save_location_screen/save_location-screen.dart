import 'package:default_project/data/model/place_model.dart';
import 'package:default_project/utils/app_text_style.dart';
import 'package:default_project/view_models/place_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
      body: StreamBuilder<List<PlaceModel>>(
        stream: context.read<PlaceViewModel>().listenPlaces(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            List<PlaceModel> list = snapshot.data as List<PlaceModel>;
            return ListView(
              children: [
                ...List.generate(
                  list.length,
                  (index) {
                    PlaceModel places = list[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const UpdateMapScreen()));
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
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                places.image,
                                width: 60,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      places.placeCategory.name,
                                      style: AppTextStyle.robotoRegular.copyWith(
                                          color: Colors.black,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      places.orientAddress,
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
                                  debugPrint('________________________--id ${places.id}');
                                  context
                                      .read<PlaceViewModel>()
                                      .deletePlace(places.id!, context);

                                  setState(() {
                                  });
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
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
