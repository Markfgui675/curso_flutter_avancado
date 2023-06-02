import 'package:curso_flutter_avancado/secao2/aula4/presentation/resources/assets_manager.dart';
import 'package:curso_flutter_avancado/secao2/aula4/presentation/resources/color_manager.dart';
import 'package:curso_flutter_avancado/secao2/aula4/presentation/resources/styles_manager.dart';
import 'package:curso_flutter_avancado/secao2/aula4/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/font_manager.dart';
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
        backgroundColor: ColorManager.white,
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

          var item = _list[index];
          return OnBoardingPage(item);

        },
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s100,
        child: Column(
          children: [
            SizedBox(
              height: AppSize.s30,
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.only(right: AppPadding.p20, bottom: AppPadding.p8),
                    child: Text(AppStrings.skip, textAlign: TextAlign.end,
                      style: getMediumStyle(fontSize: FontSize.s16,color: ColorManager.primary),),
                  ),
                ),
              ),
            ),
            _getBottomSheetWidget()
          ],
        ),
      ),

    );
  }

  Widget _getBottomSheetWidget(){

    return Container(
      height: AppSize.s70,
      width: double.infinity,
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: InkWell(
              onTap: (){

              },
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: Icon(Icons.arrow_back, color: ColorManager.white,),
              ),
            ),
          ),

          // circles indicators
          Row(
            children: [
              for(int i = 0; i < _list.length; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i),
                )
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: InkWell(
              onTap: (){

              },
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: Icon(Icons.arrow_forward, color: ColorManager.white,),
              ),
            ),
          )

        ],
      ),
    );

  }

  Widget _getProperCircle(int index){
    if(index == _currentIndex){
      return Image.asset(ImageAssets.marked, width: AppSize.s16,);
    } else {
      return Image.asset(ImageAssets.notMarked, width: AppSize.s16,);
    }
  }

}



class OnBoardingPage extends StatelessWidget {
  SliderObject _sliderObject;
  OnBoardingPage(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[

        const SizedBox(height: AppSize.s40,),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(_sliderObject.title!, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline1,),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(_sliderObject.subTitle!, textAlign: TextAlign.center, style: Theme.of(context).textTheme.subtitle1,),
        ),
        const SizedBox(height: AppSize.s60,),

        // image widget
        Container(
          height: AppSize.s430,
          width: MediaQuery.of(context).size.width*0.85,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(_sliderObject.image!),
              fit: BoxFit.cover
            )
          ),
        )

      ],
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

