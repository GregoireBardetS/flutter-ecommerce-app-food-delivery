import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(
    viewportFraction: 0.85
  );
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;

  @override
  void initState(){
    super.initState();
    pageController.addListener((){
      setState(() {
        _currPageValue = pageController.page!;
      }); 
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.redAccent,
      height: 320,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, index){
          return _buildPageItem(index,);
        }
      ),
    );
  }

  Widget _buildPageItem(int index){

    Matrix4 matrix = new Matrix4.identity();
    if (index==_currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1-_scaleFactor);
      var currTrans = 120;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
    } else if (index==_currPageValue.floor()+1) {
      var currScale = _scaleFactor + (_currPageValue-index+1) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
    }


    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven?const Color(0xFF69c5df):const Color(0xFF9294cc),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/food0.png")
              )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white
              ),
              child: Container(
                margin: const EdgeInsets.only(top:15, left: 15, right: 15, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(
                      text: 'Delicious dish',
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) => const Icon(Icons.star, color: AppColors.mainColor, size: 15,))
                        ),
                        const SizedBox(width: 10,),
                        SmallText(text: "4.5"),
                        const SizedBox(width: 15,),
                        SmallText(text: "1287"),
                        const SizedBox(width: 5,),
                        SmallText(text: "comments")
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          text: 'Normal',
                          iconColor: AppColors.iconColor1
                        ),
                        IconAndTextWidget(
                          icon: Icons.location_on,
                          text: '1.6km',
                          iconColor: AppColors.mainColor
                        ),
                        IconAndTextWidget(
                          icon: Icons.access_time_rounded,
                          text: '32min',
                          iconColor: AppColors.iconColor2
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ),
          ),
      
        ]
      ),
    );
  }
}