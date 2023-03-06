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
    return Scaffold(
      backgroundColor: colors.BackgroundColor,
      body: Center(
          child: DefaultText.Medium(
              text: 'Profile Page', textcolor: Colors.black, size: 30.sp)),
    );
  }
}
