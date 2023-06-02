import 'package:curso_flutter_avancado/secao2/aula4/presentation/resources/assets_manager.dart';
import 'package:curso_flutter_avancado/secao2/aula4/presentation/resources/color_manager.dart';
import 'package:curso_flutter_avancado/secao2/aula4/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/strings_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {

  late final List<SliderObject> _list = _getSliderData();

  PageController _pageController = PageController(initialPage: 0);

  int _currentIndex = 0;

  List<SliderObject> _getSliderData() => [
    SliderObject(AppStrings.onBoardingTitle1, AppStrings.onBoardingSubTitle1, ImageAssets.onBoardingLogo1),
    SliderObject(AppStrings.onBoardingTitle2, AppStrings.onBoardingSubTitle2, ImageAssets.onBoardingLogo2),
    SliderObject(AppStrings.onBoardingTitle3, AppStrings.onBoardingSubTitle3, ImageAssets.onBoardingLogo3),
    SliderObject(AppStrings.onBoardingTitle4, AppStrings.onBoardingSubTitle4, ImageAssets.onBoardingLogo4),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: AppSize.s1_5,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (_, index){

          return

        },
      ),

    );
  }
}

class SliderObject{

  String? title;
  String? subTitle;
  String? image;

  SliderObject(
      this.title, this.subTitle, this.image);


}

