// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_delivery/home/food_page_body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPage();
}

class _MainFoodPage extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("current height is " + MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height40, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BigText(text: 'France', color: AppColors.mainColor, size: Dimensions.height30),
                      Row(
                        children: [
                          SmallText(text: 'Paris', color: Colors.black54),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.width30 + Dimensions.width15,
                      height: Dimensions.height30 + Dimensions.height15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.height15),
                        color: AppColors.mainColor,
                      ),
                      child: Icon(Icons.search, color:Colors.white, size: Dimensions.icon24)
                    ),
                  )
                ],
              ),
            )
          ),
          const FoodPageBody(),
        ]
      ),
    );
  }
}