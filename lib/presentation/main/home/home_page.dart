import 'package:curso_flutter_avancado/presentation/main/home/home_viewmodel.dart';
import 'package:curso_flutter_avancado/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import '../../../app/di.dart';
import '../../common/state_renderer/state_render_impl.dart';
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
    return Container();
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

