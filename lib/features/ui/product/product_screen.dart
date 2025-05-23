
import 'package:elevate_tech_assessment/core/utils/app_colors.dart';
import 'package:elevate_tech_assessment/features/ui/product/cubit/product_states.dart';
import 'package:elevate_tech_assessment/features/ui/product/cubit/product_view_model.dart';
import 'package:elevate_tech_assessment/features/ui/product/widgets/product_error_widget.dart';
import 'package:elevate_tech_assessment/features/ui/product/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../dependency_injection/di.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>getIt<ProductViewModel>()..getProducts(),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SafeArea(
          child: BlocBuilder<ProductViewModel, ProductStates>(
            builder: (context, state) {
              if (state is ProductSuccessState) {
                return Padding(
                  padding:  EdgeInsets.all(16.w),
                  child: GridView.builder(
                    padding: EdgeInsets.only(bottom: 64.h),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 2/3,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 16.w,
                        crossAxisCount: 2),
                    itemBuilder: (context,index){
                      return ProductItem(item:state.products[index] );
                    },
                    itemCount: state.products.length,
                  ),
                );
              } else if (state is ProductErrorState) {
                return ProductErrorWidget(errorMsg:state.failures.errorMsg ,
                  onPress: ()=>context.read<ProductViewModel>().getProducts(),);
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
