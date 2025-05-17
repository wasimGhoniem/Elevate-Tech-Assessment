import 'package:flutter/material.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_styles.dart';

class ProductErrorWidget extends StatelessWidget {
 final  String errorMsg;
 final void Function()? onPress;
   const ProductErrorWidget({super.key,required this.errorMsg,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

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
      ),
    );
  }
}
