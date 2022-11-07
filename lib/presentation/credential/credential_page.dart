import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_bank/presentation/edit_credential/edit_credential.dart';

import '../../app/di.dart';
import '../../domain/model/model.dart';
import '../common/state_renderer/state_renderer_impl.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/value_manager.dart';
import 'credential_viewmodel.dart';

class CrediantialPage extends StatefulWidget {
  const CrediantialPage({super.key, required this.hostingData});
  final GetHostingData? hostingData;

  @override
  State<CrediantialPage> createState() => _CrediantialPageState();
}

class _CrediantialPageState extends State<CrediantialPage> {

  CredentialsViewModel _viewModel = instance<CredentialsViewModel>();

  bool _value = true;
  TextEditingController _roleController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isObscure = true;
  var pagesCount = 3;

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.setRequestDataForCredential(widget.hostingData?.project_detail_id ?? "", widget.hostingData?.id ?? "");
    _viewModel.start();

  }
  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Credential',
            style: Theme
                .of(context)
                .textTheme
                .headline2,
          ),
        ),
        backgroundColor: ColorManager.white,
        body:
        StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  _viewModel.start();
                }) ??
                Container();
          },
        ),
    );
  }
  Widget _getContentWidget() {
    return StreamBuilder<CredentialsDetailsViewObject>(
        stream: _viewModel.outputCredentialsData,
        builder: (context, snapshot)
        {
    return Container(
        padding: const EdgeInsets.only(bottom: AppPadding.p16),
      child: SingleChildScrollView(
        //padding: const EdgeInsets.only(left: AppPadding.p16,right: AppPadding.p16,bottom: AppPadding.p16),
        // child: Card(
          child: Column(
           // crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            _getRow('Project Name:',widget.hostingData?.projectData?.name,AppPadding.p16,AppPadding.p16),
            _getRow('Hosting Account:',widget.hostingData?.deployToData?.display_text,AppPadding.p0,AppPadding.p16),
            _getRow('Enviorment:',widget.hostingData?.environmentData?.display_text,AppPadding.p0,AppPadding.p16),
            _getRow('Admin Url:',widget.hostingData?.admin_url,AppPadding.p0,AppPadding.p16),

            Padding(padding: const EdgeInsets.only(left: AppPadding.p16,right: AppPadding.p16,bottom: AppPadding.p16),
              child: ListView.builder(

                   physics: const NeverScrollableScrollPhysics(),
                    //scrollDirection: Axis.vertical,
                   shrinkWrap: true,
                   itemCount:_viewModel.credentialsData.length,
                   itemBuilder: (BuildContext context, int index) {
                     return Card(
                       child: Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                       _getRow('Role:','${snapshot.data?.credentialsData[index].rolesData?.role_name}',AppPadding.p16,AppPadding.p16),
                       _getRow('Username:','${snapshot.data?.credentialsData[index].username}',AppPadding.p0,AppPadding.p16),
                       _getRow('Password:','${snapshot.data?.credentialsData[index].password}',AppPadding.p0,AppPadding.p0),
                       Padding(padding: EdgeInsets.only(left:AppPadding.p14,right: AppPadding.p12),child:Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text('Is Active?:',style: Theme.of(context).textTheme.subtitle1),
                           Switch(
                             activeColor: ColorManager.primary,
                             value:parseBool(snapshot.data?.credentialsData[index].is_active),
                             onChanged: (value) {
                               // setState(() {
                               //   _value = value;
                               // });
                             },
                           ),
                         ],
                       ),
                       ),
                       Padding(padding: const EdgeInsets.only(left:AppPadding.p16,right: AppPadding.p16,bottom: AppPadding.p12),
                         child:Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             SizedBox(
                               width: 150,
                               height: 40,

                               child: ElevatedButton(onPressed:() {

                                 initEditCredentialModule();
                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                     builder: (context) => EditCredential(hostingData:widget.hostingData,isFromEdit: true,credentialsData: _viewModel.credentialsData[index],),
                                   ),
                                 ).then((value) => _bind());
                               }, child: const Text(AppStrings.edit),),
                             ),
                             SizedBox(
                               width: 150,
                               height: 40,
                               child: ElevatedButton(onPressed:() {
                                _viewModel.deleteCredential(snapshot.data?.credentialsData[index].id??"");
                               },style: ElevatedButton.styleFrom(
                                 primary: ColorManager.red,
                               ), child: const Text(AppStrings.delete),),
                             )
                           ],
                         ),
                       ),




                     // Padding(padding: const EdgeInsets.only(top: AppPadding.p28,right: AppPadding.p12,left: AppPadding.p12),child:SizedBox(
                     //     height: AppSize.s50,
                     //     width: AppSize.s50,
                     //     child:  TextButton(
                     //       onPressed: () {
                     //         setState(() {
                     //           pagesCount = pagesCount-1;
                     //         });
                     //       },
                     //
                     //       child: SvgPicture.asset(ImageAssets.deleteIc),
                     //     ),
                     //   ),),
                     //   Padding(padding: const EdgeInsets.only(top: AppPadding.p12,right: AppPadding.p12,left: AppPadding.p12),child: TextFormField(
                     //    keyboardType: TextInputType.emailAddress,
                     //     controller: _roleController,
                     //     decoration: const InputDecoration(
                     //     hintText: AppStrings.roleHint,
                     //       labelText: AppStrings.role,
                     //          errorText: AppStrings.roleHint),
                     //        ),),
                     //   Padding(padding: const EdgeInsets.only(top: AppPadding.p12,right: AppPadding.p12,left: AppPadding.p12),child:TextFormField(
                     // keyboardType: TextInputType.emailAddress,
                     // controller: _userNameController,
                     // decoration: const InputDecoration(
                     // hintText: AppStrings.userNameHint,
                     // labelText: AppStrings.userName,
                     // errorText: AppStrings.userNameHint),
                     //
                     //   ),),
                     //   Padding(padding: const EdgeInsets.only(top: AppPadding.p12,right: AppPadding.p12,left: AppPadding.p12),child:TextFormField(
                     //     obscureText: true,
                     //     keyboardType: TextInputType.visiblePassword,
                     //     controller: _passwordController,
                     //     decoration: InputDecoration(
                     //         hintText: AppStrings.enterPassword,
                     //         labelText: AppStrings.password,
                     //         errorText: AppStrings.enterPassword,
                     //         suffixIcon: IconButton(icon: Icon(
                     //             _isObscure ? Icons.visibility : Icons.visibility_off),
                     //           onPressed: (){
                     //             setState(() {
                     //               _isObscure = !_isObscure;
                     //             });
                     //           },
                     //
                     //         )
                     //     ),
                     //
                     //   ),),



                     ],));
                   }),
                ),
               // Padding(padding: const EdgeInsets.only(left:AppPadding.p16,right: AppPadding.p16,bottom: AppPadding.p12),
              // child:Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     SizedBox(
              //       width: 150,
              //       height: 40,
              //
              //       child: ElevatedButton(onPressed:() {
              //
              //       }, child: const Text(AppStrings.save),),
              //     ),
              //     SizedBox(
              //       width: 150,
              //       height: 40,
                  SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                    child:Padding(padding: const EdgeInsets.only(left:AppPadding.p16,right: AppPadding.p16,bottom: AppPadding.p0
                    ),

                      child:ElevatedButton(onPressed:() {
                        initEditCredentialModule();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditCredential(hostingData:widget.hostingData,isFromEdit: false,),
                          ),
                        ).then((value) => _bind());
                      },style: ElevatedButton.styleFrom(
                      primary: ColorManager.green
                    ), child: const Text(AppStrings.addCredentials),),
                  )
                  )
                ],
              ),
            )
    //     ],
    //   ),
    //   )
    );
        });

  }
  bool parseBool(int? integer) {
    return integer == 1;
  }


  Widget _getRow(String lableTitle,String? lableValue,double topPadding,double bottomPadding ) {

    return Padding(padding: EdgeInsets.only(left: AppPadding.p16,right: AppPadding.p16,bottom: bottomPadding,top: topPadding),child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
              SizedBox(
                width: AppSize.s140,
                child:Align(
                  alignment: Alignment.centerLeft,
                  child: Text(lableTitle,style: Theme.of(context).textTheme.bodyText1),
                )


              ),
              SizedBox(
                width: AppSize.s140,
                child:Align(
                  alignment: Alignment.centerRight,
                   child:Text(lableValue!,style: Theme.of(context).textTheme.subtitle1,textAlign:TextAlign.left,),
              )
            )],),
    );
  }
}
