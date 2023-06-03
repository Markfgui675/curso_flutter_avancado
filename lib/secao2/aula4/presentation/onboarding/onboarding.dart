import 'package:curso_flutter_avancado/secao2/aula4/presentation/resources/assets_manager.dart';
import 'package:curso_flutter_avancado/secao2/aula4/presentation/resources/color_manager.dart';
import 'package:curso_flutter_avancado/secao2/aula4/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../domain/model.dart';
import '../resources/routes_manager.dart';
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
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
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
              height: AppSize.s40,
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: AppPadding.p20, bottom: AppPadding.p8),
                    child: Text(AppStrings.skip, textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.subtitle2,),
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
      height: AppSize.s60,
      width: double.infinity,
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Padding(
            padding: const EdgeInsets.only(left: AppPadding.p20),
            child: InkWell(
              onTap: (){
                _pageController.animateToPage(
                    _getPreviousIndex(),
                    duration: const Duration(milliseconds: DurationConst.d300),
                    curve: Curves.linear
                );
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
            padding: const EdgeInsets.only(right: AppPadding.p20),
            child: InkWell(
              onTap: (){
                _pageController.animateToPage(
                    _getNextIndex(),
                    duration: const Duration(milliseconds: DurationConst.d300),
                    curve: Curves.linear
                );
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

  int _getPreviousIndex(){

    int previousIndex = _currentIndex--; // -1
    if(previousIndex== -1){
      _currentIndex = _list.length - 1; //infinite loop to go to the lenght of slider list
    }

    return _currentIndex;

  }

  int _getNextIndex(){

    int nextIndex = _currentIndex++; // -1
    if(nextIndex >= _list.length){
      _currentIndex = 0; //infinite loop to go to the lenght of slider list
    }

    return _currentIndex;

  }

  Widget _getProperCircle(int index){
    if(index == _currentIndex){
      return Image.asset(ImageAssets.marked, width: AppSize.s10,);
    } else {
      return Image.asset(ImageAssets.notMarked, width: AppSize.s10,);
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
          child: Text(_sliderObject.title!, textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(_sliderObject.subTitle!, textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2,),
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
