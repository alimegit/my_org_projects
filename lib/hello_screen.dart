import 'package:default_project/screens/country_screen.dart';
import 'package:default_project/screens/users_screen.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:flutter/material.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_C4C4C4,
      body: Column(
        children: [
         const  SizedBox(height: 47,),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: InkWell(
             onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const  UsersScreen()));},
             child: Container(
               color: Colors.black,
               child:  const Center(
                 child: Padding(
                   padding:  EdgeInsets.all(8.0),
                   child: Text("Users",style: TextStyle(color: Colors.white,fontSize: 18),),
                 ),
               ),
             ),
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: InkWell(
             onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const  CountryScreen()));},
             child: Container(
               color: Colors.black,
               child:  const Center(
                 child: Padding(
                   padding:  EdgeInsets.all(8.0),
                   child: Text("Countries",style: TextStyle(color: Colors.white,fontSize: 18),),
                 ),
               ),
             ),
           ),
         ),
        ],
      )
    );
  }
}
