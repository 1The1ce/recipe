import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/onboarding/presentation/widgets/onboarding_continue_button.dart';
import 'package:recipe_app/signup/widgets/complete_profile_gender.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/sizes.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/profile_text_field.dart';

class CompleteProfileView extends StatelessWidget {
  const CompleteProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.beigeColor,
        title: appBarTitle(text: 'Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.all(AppSizes.padding36),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Complete your profile',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Lorem ipsum dolor sit amet pretium cras id dui\npellentesque ornare. Quisque malesuada netus\npulvinar diam.',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
              ),
              Padding(
                padding: EdgeInsets.only(left: 127, right: 127, top: 44),
                child: Stack(
                  children: [
                    Container(
                      width: 103,
                      height: 100,
                      decoration: BoxDecoration(
                          color: AppColors.pink,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/icons/profile.svg',
                        height: 44,
                        color:AppColors.redPinkMain,
                      )),
                    ),
                    Positioned(
                      top: 66,
                      left: 74,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: AppColors.redPinkMain,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/edit-brush.svg',
                          ),
                        ),
                      ),

                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              CompleteProfileGender(),
              SizedBox(height: 14),
              ProfileTextField(title: 'Bio', text: 'About yourself'),
            ],
          ),
        ],
      ),
      bottomNavigationBar: OnboardingContinueButton(),
    );
  }
}
