import 'package:default_project/data/models/my_response.dart';
import 'package:default_project/data/models/simple/weather_main_model.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:default_project/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../data/models/detail/hourly_item/one_call_data.dart';
import '../data/repository/weather_repository.dart';
import '../utils/app_images.dart';

class SimpleWeatherScreen extends StatefulWidget {
  const SimpleWeatherScreen({super.key});

  @override
  State<SimpleWeatherScreen> createState() => _SimpleWeatherScreenState();
}

class _SimpleWeatherScreenState extends State<SimpleWeatherScreen> {
  final WeatherRepository weatherRepository = WeatherRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.c_0B42AB,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<MyResponse>(
                future: weatherRepository.getSimpleWeatherInfo("Tashkent"),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  if (snapshot.hasData) {
                    WeatherMainModel weatherMainModel =
                        (snapshot.data as MyResponse).data as WeatherMainModel;
                    return Padding(
                      padding: EdgeInsets.only(left: 15.w, top: 33.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const  Icon(Icons.location_on_outlined)),
                              Text(
                                weatherMainModel.name,
                                style: TextStyle(
                                    color: AppColors.white, fontSize: 24.sp),
                              ),
                            ],
                          ),
                          Text(
                              weatherMainModel.dateTime
                                  .getParsedDate()
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 14.sp, color: AppColors.white)),
                          Center(
                            child: Column(
                              children: [
                                Image.network(
                                  weatherMainModel.weatherModel[0].icon
                                      .getWeatherIconUrl(),
                                ),
                                Text(
                                  "${(weatherMainModel.mainInMain.temp - 273.15).toStringAsFixed(2)} C",
                                  style: TextStyle(fontSize: 24.sp),
                                ),
                                SizedBox(
                                  height: 13.h,
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 15.h),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22.r),
                                      color: AppColors.c_001026),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right:10.w,left:15.h,top: 15.h,bottom: 15.h),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(AppImages.humadity),
                                            Text(
                                              "${weatherMainModel.mainInMain.humidity}%",
                                              style: TextStyle(
                                                  color: AppColors.white,
                                                  fontSize: 18.sp),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(right: 10.w),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(AppImages.pressure),
                                            Text(
                                              "${weatherMainModel.mainInMain.pressure} mbar",
                                              style: TextStyle(
                                                  color: AppColors.white,
                                                  fontSize: 15.sp),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(right: 15.w),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(AppImages.windy),
                                            Text(
                                              "${weatherMainModel.windInMain.speed} km/h",
                                              style: TextStyle(
                                                  color: AppColors.white,
                                                  fontSize: 15.sp),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
              FutureBuilder<MyResponse>(
                future: weatherRepository.getComplexWeatherInfo(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  if (snapshot.hasData) {
                    OneCallData oneCallData =
                    (snapshot.data as MyResponse).data as OneCallData;
                    return Column(
                      children: [
                        Text(oneCallData.timezone)
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
