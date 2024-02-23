import 'package:default_project/data/local/storage_repo.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/widgets/buttons.dart';
import 'package:default_project/widgets/email.dart';
import 'package:default_project/widgets/next_string_widget.dart';
import 'package:default_project/widgets/textFormField.dart';
import 'package:default_project/widgets/two_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/password.dart';
import 'homescreen.dart';
import 'login.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController passwordcontroller = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  late SharedPreferences _pref;

  Future<void> _getSharedInstance() async {
    _pref = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    passwordcontroller.dispose();
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _getSharedInstance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_0001FC,
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 47.h),
                child: Center(
                  child: NextString(
                      onTap: () {},
                      text: "Create an account",
                      size: 24,
                      weight: FontWeight.w700,
                      color: AppColors.white),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              UniversalTextFormField(
                controller: nameController,
                text: 'Full Name',
                fulltext: 'Full Name',
              ),
              SizedBox(
                height: 1.h,
              ),
              EmailTextFormField(
                  controller: emailController,
                  text: "Email",
                  fulltext: "Email"),
              SizedBox(
                height: 1.h,
              ),
              PasswordTextFormField(
                controller: passwordcontroller,
                text: 'Password',
                fulltext: 'Password',
              ),
              SizedBox(
                height: 15.h,
              ),
              Buttons(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginScreen()));
                      StorageRepository.setString(
                          key: 'name', value: nameController.text);
                      StorageRepository.setString(
                          key: 'email', value: emailController.text);
                      StorageRepository.setString(
                          key: 'code', value: passwordcontroller.text);
                    }

                  },
                  text: "Validate"),
              SizedBox(
                height: 5.h,
              ),
              NextString(
                  onTap: () {},
                  text: "Already have an account ? Login",
                  size: 14,
                  weight: FontWeight.w400,
                  color: AppColors.c_FBDF00),
              SizedBox(
                height: 20.h,
              ),
              SvgPicture.asset(AppImages.ellipse3),
              SizedBox(
                height: 15.h,
              ),
              NextString(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  text: "Skip for now",
                  size: 12,
                  weight: FontWeight.w400,
                  color: AppColors.white)
            ],
          ),
        ),
      ),
    );
  }
}
