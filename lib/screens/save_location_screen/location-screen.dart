import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/adress_view_model.dart';
import '../map_screen.dart';

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
        title: const Text("May Addresses"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<AddressesViewModel>(
              builder: (context, viewModel, child) {
                return ListView(children: [
                  ...List.generate(viewModel.myAddresses.length, (index) {
                    var myAddress = viewModel.myAddresses[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return UpdateAddressScreen(
                        //         placeModel: myAddress,
                        //       );
                        //     },
                        //   ),
                        // );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(12),
                        height: 100,
                        width: double.infinity,
                        color: Colors.blue,
                      ),
                    );
                  })
                ]);
              },
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const MapScreen();
                    },
                  ),
                );
              },
              child: Text("Yangi address qo'shish"))
        ],
      ),
    );
  }
}