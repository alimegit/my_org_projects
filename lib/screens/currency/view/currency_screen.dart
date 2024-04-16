import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/currency_model.dart';
import '../../counter/view/counter_screen.dart';
import '../../shimmer_example/shimmer_example_screen.dart';
import '../currency_controller.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  var currencyController = Get.put(CurrencyController()..fetchCurrencies());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("appbar_title".tr),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: () {
                Get.to(CounterScreen(oldCounter: 234));
              },
              child: const Text("GO TO NEXT PAGE"),
            ),
            TextButton(
              onPressed: () {
                Get.showSnackbar(
                  const GetSnackBar(
                    duration: Duration(seconds: 1),
                    message: "Something went wrong",
                  ),
                );
              },
              child: const Text("SHOW SNACKBAR"),
            ),
            TextButton(
              onPressed: () {
                debugPrint("WIDTH:${Get.width}");
                debugPrint("HEIGHT:${Get.height}");
                Get.defaultDialog(title: "Hello");
              },
              child: const Text("SHOW DIALOG"),
            ),
            TextButton(
              onPressed: () {
                Locale? currentLocale = Get.locale;
                if (currentLocale == const Locale("en", "US")) {
                  Get.updateLocale(const Locale("uz", "UZ"));
                } else {
                  Get.updateLocale(const Locale("en", "US"));
                }
              },
              child: const Text("CHNAGE LANGUAGE "),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("SAVE VALUE"),
            ),
            Expanded(
              child: Obx(
                () {
                  //return const ShimmerExampleScreen();
                  if (currencyController.isLoading.value) {
                    return const ShimmerExampleScreen();
                  }

                  if (currencyController.errorMessage.value.isNotEmpty) {
                    return Center(
                        child: Text(currencyController.errorMessage.value));
                  }

                  return ListView(
                    children: List.generate(
                      currencyController.currencies.length,
                      (index) {
                        var item = currencyController.currencies[index]
                            as CurrencyModel;
                        return ListTile(
                          title: Text(item.cyNmUZ),
                          subtitle: Text(item.nominal),
                        );
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}