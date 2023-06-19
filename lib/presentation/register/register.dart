import 'dart:io';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:curso_flutter_avancado/presentation/register/register_viewmodel.dart';
import 'package:flutter/material.dart';
import '../../app/di.dart';
import '../../data/mapper/mapper.dart';
import '../common/state_renderer/state_render_impl.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  RegisterViewModel _viewModel = instance<RegisterViewModel>();
  //ImagePicker picker = instance<ImagePicker>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController _userTextEditingController = TextEditingController();
  TextEditingController _mobileNumberTextEditingController = TextEditingController();
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController = TextEditingController();

  _bind(){
    _viewModel.start();
    _userTextEditingController.addListener(() {
      _viewModel.setUserName(_userTextEditingController.text);
    });
    _mobileNumberTextEditingController.addListener(() {
      _viewModel.setMobileNumber(_mobileNumberTextEditingController.text);
    });
    _emailTextEditingController.addListener(() {
      _viewModel.setEmail(_emailTextEditingController.text);
    });
    _passwordTextEditingController.addListener(() {
      _viewModel.setPassword(_passwordTextEditingController.text);
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: AppSize.s0,
        iconTheme: IconThemeData(color: ColorManager.primary),
        backgroundColor: ColorManager.white,
      ),
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot){
          return Center(
            child: snapshot.data?.getScreenWidget(context, _getContentWidget(), (){
              _viewModel.register();
            }) ?? _getContentWidget(),
          );
        },
      ),
    );
  }

  Widget _getContentWidget(){
    return Container(
      padding: EdgeInsets.only(top: AppPadding.p60),
      color: ColorManager.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image(image: AssetImage(ImageAssets.splashLogo), width: AppSize.s100,),
              SizedBox(height: AppSize.s28,),
              Padding(
                padding: EdgeInsets.only(left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<String?>(
                  stream: _viewModel.outputErrorUserName,
                  builder: (context, snapshot){
                    return TextFormField(
                      controller: _userTextEditingController,
                      keyboardType: TextInputType.text,
                      cursorColor: ColorManager.primary,
                      decoration: InputDecoration(
                          hintText: AppStrings.userName,
                          labelText: AppStrings.userName,
                          errorText: snapshot.data

                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: AppSize.s28,),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left: AppPadding.p28, right: AppPadding.p28, bottom: AppPadding.p28),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CountryCodePicker(
                          onChanged: (country){
                            // update view model with the selected code
                            _viewModel.setCountryCode(country.dialCode ?? EMPTY);
                          },
                          initialSelection: "+33",
                          showCountryOnly: true,
                          showOnlyCountryWhenClosed: true,

                          favorite: [
                            "+966","+02","+39"
                          ],
                        )
                      ),
                      Expanded(
                        flex: 3,
                        child: StreamBuilder<String?>(
                          stream: _viewModel.outputErrorMobileNumber,
                          builder: (context, snapshot){
                            return TextFormField(
                              controller: _mobileNumberTextEditingController,
                              keyboardType: TextInputType.number,
                              cursorColor: ColorManager.primary,
                              decoration: InputDecoration(
                                  hintText: AppStrings.mobileNumber,
                                  labelText: AppStrings.mobileNumber,
                                  errorText: snapshot.data

                              ),
                            );
                          },
                        )
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<String?>(
                  stream: _viewModel.outputErrorEmail,
                  builder: (context, snapshot){
                    return TextFormField(
                      controller: _emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: ColorManager.primary,
                      decoration: InputDecoration(
                          hintText: AppStrings.email,
                          labelText: AppStrings.email,
                          errorText: snapshot.data

                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: AppSize.s28,),
              Padding(
                padding: EdgeInsets.only(left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<String?>(
                  stream: _viewModel.outputErrorPassword,
                  builder: (context, snapshot){
                    return TextFormField(
                      controller: _passwordTextEditingController,
                      keyboardType: TextInputType.text,
                      cursorColor: ColorManager.primary,
                      decoration: InputDecoration(
                          hintText: AppStrings.password,
                          labelText: AppStrings.password,
                          errorText: snapshot.data

                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: AppSize.s28,),
              Padding(
                padding: EdgeInsets.only(left: AppPadding.p28, right: AppPadding.p28),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.lightGrey),
                  ),
                  child: GestureDetector(
                    child: _getMediaWidget(),
                    onTap: (){
                      _showPicker(context);
                    },
                  ),
                )
              ),
              SizedBox(height: AppSize.s28,),
              Padding(
                padding: EdgeInsets.only(left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<bool>(
                  stream: _viewModel.outputIsAllInputsValid,
                  builder: (context, snapshot){
                    return SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: ElevatedButton(
                          onPressed: (snapshot.data ?? false)
                              ? () {
                            _viewModel.register();
                          }
                              : null,
                          child: Text(
                              AppStrings.login
                          )
                      ),
                    );
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                    top: AppPadding.p12,
                    left: AppPadding.p28,
                    right: AppPadding.p28
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, Routes.forgotPasswordRoute);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: AppPadding.p20, bottom: AppPadding.p8),
                        child: Text(AppStrings.forgotPassword, textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.subtitle2,),
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, Routes.registerRoute);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: AppPadding.p20, bottom: AppPadding.p8),
                        child: Text(AppStrings.register, textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.subtitle2,),
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget _getMediaWidget(){
    return Padding(
      padding: EdgeInsets.only(left: AppPadding.p8, right: AppPadding.p8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(AppStrings.profilePicture),
          ),
          Flexible(
            child: StreamBuilder<File>(
              stream: _viewModel.outputProfilePicture,
              builder: (context, snapshot){
                return _imagePickedByUser(snapshot.data);
              },
            ),
          ),
          Flexible(
            child: Icon(Icons.photo_camera),
          ),
        ],
      ),
    );
  }

  Widget _imagePickedByUser(File? image){
    if(image != null && image.path.isNotEmpty){
      return Image.file(image);
    } else {
      return Container();
    }
  }

  _showPicker(BuildContext context){
    // error
  }

  Future<void> _imageFromGallery() async {
    //var image = await picker.pickImage(source: ImageSource.gallery);
    //_viewModel.setProfilePicture(File(image?.path ?? ""));
  }

  Future<void> _imageFromCamera() async {
    //var image = await picker.pickImage(source: ImageSource.camera);
    //_viewModel.setProfilePicture(File(image?.path ?? ""));
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

