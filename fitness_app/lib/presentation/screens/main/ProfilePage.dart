import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../colors.dart' as colors;
import '../../widgets/DefaultText.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: colors.BackgroundColor,
      body: Container(
          height: 300.sp,
          width: 100.w,
          child: DefaultText.Medium(
              text: 'Profile Page', textcolor: Colors.black, size: 30)),
    ));
  }
}
