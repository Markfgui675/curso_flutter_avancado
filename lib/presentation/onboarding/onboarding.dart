import 'package:curso_flutter_avancado/presentation/onboarding/onboarding_viewmodel.dart';
import 'package:curso_flutter_avancado/presentation/resources/assets_manager.dart';
import 'package:curso_flutter_avancado/presentation/resources/color_manager.dart';
import 'package:curso_flutter_avancado/presentation/resources/values_manager.dart';
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

  final PageController _pageController = PageController(
      initialPage: 0);

  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
        stream: _viewModel.outputSliderViewObject,
        builder: (_, snapShot) {
          return _getContentWidget(
              snapShot.data!);
        }
    );
  }

  Widget _getContentWidget(SliderViewObject data){

    if(data == null){
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.white,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.numOfSlides,
          onPageChanged: (index){
            _viewModel.onPageChanged(index);
          },
          itemBuilder: (_, index){

            var item = data.sliderObject;
            return OnBoardingPage(item!);

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
              _getBottomSheetWidget(data)
            ],
          ),
        ),

      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject data){

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
                    _viewModel.goPrevious(),
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
              for(int i = 0; i < data.numOfSlides!; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i, data),
                )
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(right: AppPadding.p20),
            child: InkWell(
              onTap: (){
                _pageController.animateToPage(
                    _viewModel.goNext(),
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

  Widget _getProperCircle(int index, SliderViewObject data){
    if(index == data.currentIndex){
      return Image.asset(ImageAssets.marked, width: AppSize.s10,);
    } else {
      return Image.asset(ImageAssets.notMarked, width: AppSize.s10,);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

}



class OnBoardingPage extends StatelessWidget {
  SliderObject _sliderObject;
  OnBoardingPage(this._sliderObject);

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
