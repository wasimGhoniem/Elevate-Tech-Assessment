import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_styles.dart';

class ProductErrorWidget extends StatelessWidget {
 final  String errorMsg;
 final VoidCallback onPress;
   const ProductErrorWidget({super.key,required this.errorMsg,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Icon(Icons.error_outline, size: 48.w, color: Colors.red),
          SizedBox(height: 16.h),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                errorMsg,
                style:
                AppStyles.error16W800),
          ),

          ElevatedButton(
              onPressed: onPress,
              child: Text(
                AppConstants.tryAgain,
                style: AppStyles.textColor14W400,
              ))
        ],
      ),
    );
  }
}
