import 'package:flutter/material.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/sizes.dart';



class ProfileTextField extends StatelessWidget {
  const ProfileTextField({super.key, required this.title, required this.text});

  final String title, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        SizedBox(
          width: 358 * AppSizes.wRatio,
          height: 131 * AppSizes.hRatio,
          child: TextField(
            maxLines: 5,
            minLines: 5,
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.pink,
                hintText: text,
                hintStyle: TextStyle(color: AppColors.textColor.withValues(alpha: 0.45), fontWeight: FontWeight.w500, fontSize: 16, height: 1),
                contentPadding: EdgeInsets.only(left: 21, top: 10,),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(18),
                )
            ),
          ),
        )
      ],
    );
  }
}