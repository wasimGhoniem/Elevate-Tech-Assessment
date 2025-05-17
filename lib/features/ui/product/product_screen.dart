import 'package:elevate_tech_assessment/core/utils/app_colors.dart';
import 'package:elevate_tech_assessment/core/utils/app_styles.dart';
import 'package:elevate_tech_assessment/features/ui/product/cubit/product_states.dart';
import 'package:elevate_tech_assessment/features/ui/product/cubit/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../dependency_injection/di.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductViewModel viewModel=getIt<ProductViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductViewModel,ProductStates>(
        bloc: viewModel..getProducts(),
        builder:(context,state){
          if(state is ProductSuccessState){
           return ListView.builder(itemBuilder: (context,index){
              return Text(state.productResponseEntity.title??"",style:TextStyle(color: Colors.red) );
      
            },itemCount: 20,);
          }
          else if(state is ProductErrorState){
            return Column(children: [
              Text(state.failures.errorMsg,style: AppStyles.textColor12W400,)
            ],);
          }
          else{
            return Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
          }
      
        }
      
        ,
      ),
    );
  }
}
