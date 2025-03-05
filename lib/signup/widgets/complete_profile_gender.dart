import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';

class CompleteProfileGender extends StatelessWidget {
  const CompleteProfileGender({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          'Gender',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: 150,
                  color: AppColors.redPinkMain,
                  child: Column(
                    children: [
                      Container(
                        child: ListTile(
                          title: Text('Male'),
                          onTap: () {
                            Navigator.pop(context, 'Male');
                          },
                        ),
                      ),
                      ListTile(
                        title: Text('Female'),
                        onTap: () {
                          Navigator.pop(context, 'Female');
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Container(
            width: 358,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: AppColors.pink,
            ),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Text(
              'Male/Female',
              style: TextStyle(
                color: AppColors.beigeColor.withValues(alpha: 0.5),
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );

  }
}
