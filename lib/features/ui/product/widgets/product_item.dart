import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevate_tech_assessment/core/utils/app_assets.dart';
import 'package:elevate_tech_assessment/core/utils/app_colors.dart';
import 'package:elevate_tech_assessment/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../domain/entities/ProductResponseEntity.dart';

class ProductItem extends StatelessWidget {
 final ProductResponseEntity item;
  const ProductItem({super.key,required this.item});

  @override
  Widget build(BuildContext context) {

    return
      Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.whiteBlue, width: 2.w),
        ),
        child: Column(
          children: [
            Stack(
              children: [

                ClipRRect(

                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.r),
                      topLeft: Radius.circular(15.r)),

                  child: CachedNetworkImage(

                    imageUrl: item.image??AppAssets.noImage,
                    width: double.infinity,
                    height: 128.h,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) =>
                        Icon(
                          Icons.error,
                          color: AppColors.redColor,
                        ),
                    placeholder: (context, url) =>
                        Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        ),
                  ),
                ),
                Positioned(
                  top: 2.h,
                  right: 3.w,
                  child: CircleAvatar(radius: 24.r,
                    backgroundColor: AppColors.whiteColor,
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        onPressed: () {
                          //todo add to favorite
                        },
                        icon: Icon(Icons.favorite_border_rounded,
                          color: AppColors.primaryColor,)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    item.title??AppConstants.title,
                    style: AppStyles.textColor14W400,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h,),
                  Row(

                    children: [
                      Text(
                        'EGP ${item.price}',
                        style: AppStyles.textColor14W400.copyWith(fontSize: 11.sp),


                      ),
                      SizedBox(width: 8.w,),
                      Text('EGP ${(item.price??0 * 1.2).toInt()}',
                        style: AppStyles.priceColor11W400.copyWith(
                          decoration: TextDecoration.lineThrough,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  Row(children: [
                    Text('Review (${item.rating?.rate??''})',
                      style: AppStyles.priceColor11W400),
                    Icon(Icons.star, color: AppColors.goldColor, size: 15.h,),
                    SizedBox(width: 12.w,),
                    CircleAvatar(
                      radius: 21.r,
                      backgroundColor: AppColors.primaryColor,
                      child:Icon(Icons.add,color: AppColors.whiteColor,size: 32.h,),),
                  ],),
                ],
              ),
            )
          ],
        ),
      );
  }
}
