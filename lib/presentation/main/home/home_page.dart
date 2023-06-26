import 'package:carousel_slider/carousel_slider.dart';
import 'package:curso_flutter_avancado/presentation/main/home/home_viewmodel.dart';
import 'package:curso_flutter_avancado/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import '../../../app/di.dart';
import '../../../domain/model/model.dart';
import '../../common/state_renderer/state_render_impl.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeViewModel _viewModel = instance<HomeViewModel>();

  _bind(){
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshot){
            return snapshot.data!.getScreenWidget(
                context, _getContentWidget(), (){
                  _viewModel.start();
                }
            ) ?? Container();
          },
        ),
      ),
    );
  }

  Widget _getContentWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getBannersCarousel(),
        _getSection(AppStrings.services),
        _getServices(),
        _getSection(AppStrings.stores),
        _getStores(),
      ],
    );
  }

  Widget _getBannersCarousel(){
    return StreamBuilder<List<Banners>>(
      stream: _viewModel.outputBanners,
      builder: (context, snapshot){
        return _getBanner(snapshot.data);
      },
    );
  }

  Widget _getBanner(List<Banners>? banner ){
    if(banner != null){
      return CarouselSlider(
        items: banner.map((e) => SizedBox(
          width: double.infinity,
          child: Card(
            elevation: AppSize.s1_5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12),
              side: BorderSide(color: ColorManager.white, width: AppSize.s1_5)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s12),
              child: Container(color: Colors.black26,),
            ),
          ),
        )).toList(),
        options: CarouselOptions(
          height: AppSize.s190,
          autoPlay: true,
          enableInfiniteScroll: true,
          enlargeCenterPage: true
        )
      );
    } else {
      return Container();
    }
  }

  Widget _getSection(String title){
    return Padding(
      padding: EdgeInsets.only(top: AppPadding.p12, left: AppPadding.p12, right: AppPadding.p12, bottom: AppPadding.p2),
      child: Text(title, style: Theme.of(context).textTheme.headline3,),
    );
  }

  Widget _getServices(){
    return Center();
  }

  Widget _getStores(){
    return Center();
  }


  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

