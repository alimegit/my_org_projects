import 'dart:convert';
import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'models/game_model.dart';
import 'package:http/http.dart' as http;

class FetchGameDataScreen extends StatefulWidget {
  const FetchGameDataScreen({
    super.key,
  });

  @override
  State<FetchGameDataScreen> createState() => _FetchDataCarModelsState();
}

class _FetchDataCarModelsState extends State<FetchGameDataScreen> {
  bool isLoading = true;

  Future<List<GameModul>?> _fetchData() async {
    http.Response response;
    try {
      response = await http.get(
        Uri.parse("https://www.freetogame.com/api/games"),
      );
      if (response.statusCode == 200) {
        return (jsonDecode(response.body)["data"] as List?)
                ?.map((e) => GameModul.fromJson(e))
                .toList() ??
            [];
      }
    } catch (error) {
      throw Exception(
        error.toString(),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.c_C4C4C4,
      ),
      body: FutureBuilder<List<GameModul>?>(
        future: _fetchData(),
        builder:
            (BuildContext context, AsyncSnapshot<List<GameModul>?> snapShot) {
          if (snapShot.data != null) {
            List<GameModul> gameModul = snapShot.data as List<GameModul>;
            return ListView(children: [
              ...List.generate(
                gameModul.length,
                (index) => InkWell(
                  onTap: (){},
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.c_a3b18a,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      children: [
                        Image.network(gameModul[index].thumbnail),
                      ],
                    ),
                  ),
                ),
              ),
            ]);
          } else if (snapShot.hasError) {
            return Center(
              child: Text(
                snapShot.hasError.toString(),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
