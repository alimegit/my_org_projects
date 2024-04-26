import 'package:default_project/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ],
        title: Text(
          "Demola Andreas",
          style: AppTextStyle.robotoBold
              .copyWith(color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          const Spacer(),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    hintText: "Text",
                    contentPadding: EdgeInsets.all(10.w.h),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send,
                    color: Colors.pink,
                  )),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
