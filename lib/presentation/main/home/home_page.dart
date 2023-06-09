import 'package:carousel_slider/carousel_slider.dart';
import 'package:curso_flutter_avancado/presentation/main/home/home_viewmodel.dart';
import 'package:curso_flutter_avancado/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import '../../../app/di.dart';
import '../../../domain/model/model.dart';
import '../../common/state_renderer/state_render_impl.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
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
        /*
        StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshot){
            return snapshot.data!.getScreenWidget(
                context, _getContentWidget(), (){
                  _viewModel.start();
                }
            ) ?? Container();
          },
        )
         */
        child: _getContentWidget(),
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
    return StreamBuilder<List<Service>>(
      stream: _viewModel.outputServices,
      builder: (context, snapshot){
        return _getServicesContent(snapshot.data);
      },
    );
  }

  Widget _getServicesContent(List<Service>? services){
    if(services!=null){
      return Padding(
        padding: EdgeInsets.only(left: AppPadding.p12, right: AppPadding.p12),
        child: Container(
          height: AppSize.s140,
          margin: EdgeInsets.symmetric(vertical: AppMargin.m12),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children:
              services.map((service) => Card(
                elevation: AppSize.s4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s12),
                    side: BorderSide(color: ColorManager.white, width: AppSize.s1_5)
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.s12),
                      child: Container(color: Colors.black26,),
                    )
                  ],
                ),
              )).toList()
            ,
          ),
        ),
      );
    }else{
      return Container();
    }
  }

  Widget _getStores(){
    return StreamBuilder<List<Store>>(
      stream: _viewModel.outputStores,
      builder: (context, snapshot){
        return _getStoresContent(snapshot.data);
      },
    );
  }

  Widget _getStoresContent(List<Store>? stores){
    if(stores!=null){
      return Padding(
        padding: EdgeInsets.only(left: AppPadding.p12, right: AppPadding.p12, top: AppPadding.p12),
        child: Flex(
          direction: Axis.vertical,
          children: [
            GridView.count(
              crossAxisSpacing: AppSize.s8,
              mainAxisSpacing: AppSize.s8,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(
                  stores.length,
                  (index){
                    return InkWell(
                      onTap: (){
                        //navigate do details screen
                        Navigator.of(context).pushNamed(Routes.storeDetailsRoute);
                      },
                      child: Card(
                        elevation: AppSize.s4,
                        child: Container(color: Colors.blueAccent,),
                      ),
                    );
                  }
              ),
            )
          ],
        ),
      );
    }else{
      return Container();
    }
  }


  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

