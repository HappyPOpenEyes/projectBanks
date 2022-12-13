import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_bank/data/mapper/mapper.dart';
import 'package:project_bank/presentation/edit_credential/editcredential_viewmodel.dart';

import '../../app/di.dart';
import '../../domain/model/model.dart';
import '../common/state_renderer/state_renderer_impl.dart';
import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/value_manager.dart';
import 'Scrollbar.dart';

class EditCredential extends StatefulWidget {
  const EditCredential({super.key, required this.hostingData,required this.isFromEdit,this.credentialsData});
  final GetHostingData? hostingData;
  final CredentialsData? credentialsData;
  final bool isFromEdit;


  @override
  State<EditCredential> createState() => _EditCredentialState();
}

class _EditCredentialState extends State<EditCredential> {
  //RolesData? selectedRolesData;
  //String? selectedValue = null;
  RolesData? _dropdownValue;
  EditCredentialViewModel _viewModel = instance<EditCredentialViewModel>();
  List<DropdownMenuItem<String>> menuItems = [];
  bool _isObscure = true;

  @override
  void initState() {
    _bind();
    if(widget.isFromEdit){
      setData();
      _viewModel.validate();
    }
    super.initState();
  }

  _bind() {

    _viewModel.setProjectId(widget.hostingData?.project_detail_id ?? "");
    _viewModel.start();
    _userNameController
        .addListener(() => _viewModel.setUserName(_userNameController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));

  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }


  bool _value = true;
  TextEditingController _roleController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text((widget.isFromEdit) ?'Edit Credential' : 'Add Credential',
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

                    _getContentWidget();
              }) ??
              Container();
        },
      ),
    );
  }

  setData(){
    if(widget.isFromEdit) {
      _userNameController.text = widget.credentialsData?.username ?? "";
      _passwordController.text = widget.credentialsData?.password ?? "";
      _value = parseBool(widget.credentialsData?.is_active);
      if (_viewModel.rolesData.isNotEmpty) {
        for (var i in _viewModel.rolesData) {
          if (i.id == widget.credentialsData?.rolesData?.id){
            _dropdownValue = i;
            _viewModel.setRollName(_dropdownValue?.id.toString());
          }
        }
      }
    }
  }


  Widget _getContentWidget() {
    setData();
    return StreamBuilder<HostingDetailsViewObject>(
        stream: _viewModel.outputHostingDetailsData,
        builder: (context, snapshot) {
          return Container(
              padding: const EdgeInsets.only(bottom: AppPadding.p16),
              child: SingleChildScrollView(
                //padding: const EdgeInsets.only(left: AppPadding.p16,right: AppPadding.p16,bottom: AppPadding.p16),
                // child: Card(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(padding: EdgeInsets.only(
                          left: AppPadding.p14, right: AppPadding.p12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Is Active?', style: Theme
                                .of(context)
                                .textTheme
                                .subtitle1),
                            Switch(
                              activeColor: ColorManager.primary,
                              value: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),


                      Padding(padding: const EdgeInsets.only(
                          top: AppPadding.p12,
                          right: AppPadding.p12,
                          left: AppPadding.p12), child: DropdownButtonHideUnderline(
                              child: StreamBuilder<bool>(

                                stream: _viewModel.outputIsUserNameValid,
                                 builder: (context, snapshot) {
                                  return InputDecorator(
                                               decoration: const InputDecoration(
                                               filled: false,
                                               hintText: AppStrings.roleHint,
                                                 labelText:
                                                  AppStrings.role,
                                                  // errorText: AppStrings.roleHint,
                                                    ),
                                                  isEmpty:_dropdownValue == null,
                                                 child: Padding(padding: const EdgeInsets.only(
                                                    top: AppPadding.p12,
                                                    right: AppPadding.p4,
                                                      left: AppPadding.p4), child: DropdownButton<RolesData>(
                                                      value: _dropdownValue,
                                                       isDense: true,
                                                        onChanged: (RolesData? newValue) {
                                                         print('value change');
                                                          print(newValue?.role_name);
                                                          setState(() {
                                                              _dropdownValue = newValue;
                                                             _roleController.text = _dropdownValue?.role_name??"";
                                                             _viewModel.setRollName(_dropdownValue?.id.toString());
                                                               });
                                                           },
                                                            items: _viewModel.rolesData.map((RolesData value) {
                                                           return DropdownMenuItem<RolesData>(
                            value: value,
                            child: Text(value.role_name),
                          );
                        }).toList(),
                      ),
                      ),
                );}))),





                      // DropdownButtonFormField(
                      //     decoration: const InputDecoration(
                      //       filled: false,
                      //       //fillColor: Colors.blueAccent,
                      //     ),
                      //     dropdownColor: Colors.blueAccent,
                      //     value: selectedRolesData?.role_name,
                      //     onChanged: (String? newValue) {
                      //       print(menuItems.length);
                      //       setState(() {
                      //         selectedValue = newValue!;
                      //       });
                      //     },
                      //     items: menuItems),

                        // TextFormField(
                        // keyboardType: TextInputType.emailAddress,
                        //  controller: _roleController,
                        //  decoration: const InputDecoration(
                        //  hintText: AppStrings.roleHint,
                        //    labelText: AppStrings.role,
                        //       errorText: AppStrings.roleHint),
                        //     ),

                      Padding(padding: const EdgeInsets.only(
                          top: AppPadding.p12,
                          right: AppPadding.p12,
                          left: AppPadding.p12), child:StreamBuilder<bool>(
                           stream: _viewModel.outputIsUserNameValid,
                           builder: (context, snapshot) {
                            return TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _userNameController,
                              decoration: InputDecoration(
                                  hintText: AppStrings.userNameHint,
                                  labelText: AppStrings.userName,
                                  errorText: (snapshot.data ?? true)
                                      ? null
                                      : AppStrings.userNameHint),
                            );
                           },
                      ),
                      ),
                      Padding(padding: const EdgeInsets.only(
                          top: AppPadding.p12,
                          right: AppPadding.p12,
                          left: AppPadding.p12,
                          bottom: AppPadding.p28), child:  StreamBuilder<bool>(
                          stream: _viewModel.outputIsPasswordValid,
                          builder: (context, snapshot) {
                             return TextFormField(obscureText: _isObscure,
                            keyboardType: TextInputType.visiblePassword,
                            controller: _passwordController,
                            decoration: InputDecoration(
                                hintText: AppStrings.passwordHint,
                                labelText: AppStrings.password,
                                errorText: (snapshot.data ?? true)
                                    ? null
                                    : _viewModel.passwordHint,
                                suffixIcon: IconButton(icon: Icon(
                                    _isObscure ? Icons.visibility : Icons.visibility_off),
                                  onPressed: (){
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  },

                                )
                            ),

                             );
                          },
                      ),
                      ),
                      SizedBox(
                          width: double.infinity,
                          height: AppSize.s40,
                          child: Padding(padding: const EdgeInsets.only(
                              left: AppPadding.p12,
                              right: AppPadding.p12,
                              bottom: AppPadding.p0,
                              top: AppPadding.p0
                          ),
                            child: StreamBuilder<bool?>(
                              stream: _viewModel.outputIsAllInputsValid,
                               builder: (context, snapshot) {
                                 return ElevatedButton(onPressed: (snapshot.data ??  widget.isFromEdit)
                                     ? () {
                                   _viewModel.addCredentialPostObj.id = widget.credentialsData?.id??"";
                                   _viewModel.addCredentialPostObj.projectDetailId = widget.hostingData?.project_detail_id ?? "";
                                   _viewModel.addCredentialPostObj.hostingId = widget.hostingData?.id ?? "";
                                   _viewModel.addCredentialPostObj.projectDetailId = widget.hostingData?.project_detail_id ?? "";
                                   _viewModel.addCredentialPostObj.isActive = (_value) ? "1" : "0";
                                   _viewModel.addCredential();
                                 }
                                     : null,
                                   child: const Text(AppStrings.save),);
                               })
                      )

                      )],))
          );
        });

  }

  bool parseBool(int? integer) {
    return integer == 1;
  }

  // Widget _buildCountry() {
  //   return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         StreamBuilder<String?>(
  //             stream: _viewModel.setRollName(""),
  //             builder: (context, snapshot) {
  //               return Padding(
  //                   padding: const EdgeInsets.symmetric(vertical: 6),
  //                   child: Container(
  //                       width: MediaQuery.of(context).size.width,
  //                       decoration: BoxDecoration(
  //                         border: Border.all(
  //                             width: AppSize.s1_5,
  //                             color: snapshot.data == null
  //                                 ? ColorManager.error
  //                                 : ColorManager.gray),
  //                         borderRadius: const BorderRadius.all(
  //                             Radius.circular(AppSize
  //                                 .s20) //                 <--- border radius here
  //                         ),
  //                       ),
  //                       child: Column(
  //                         children: [
  //                           Container(
  //                               width: double.infinity,
  //                               constraints: const BoxConstraints(
  //                                 minHeight: 45,
  //                                 minWidth: double.infinity,
  //                               ),
  //                               alignment: Alignment.center,
  //                               child: StreamBuilder<bool>(
  //                                   stream: _registerViewModel
  //                                       .outputShowCountryDropdownValue,
  //                                   builder: (context, showDropdownSnapshot) {
  //                                     return Column(
  //                                       children: [
  //                                         Row(
  //                                           mainAxisAlignment:
  //                                           MainAxisAlignment.spaceBetween,
  //                                           children: [
  //                                             Expanded(
  //                                               child: Padding(
  //                                                 padding: const EdgeInsets
  //                                                     .symmetric(
  //                                                     horizontal: 16,
  //                                                     vertical: 10),
  //                                                 child: Text(
  //                                                   snapshot.data ??
  //                                                       AppStrings
  //                                                           .roleHint,
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                             InkWell(
  //                                                 onTap: () {
  //                                                   _viewModel
  //                                                       .setShowCountryNameDropdownValue(
  //                                                       showDropdownSnapshot
  //                                                           .data ==
  //                                                           null
  //                                                           ? true
  //                                                           : !showDropdownSnapshot
  //                                                           .data!);
  //                                                 },
  //                                                 child: Padding(
  //                                                   padding:
  //                                                   const EdgeInsets.only(
  //                                                       right: 10),
  //                                                   child: Icon(showDropdownSnapshot
  //                                                       .data ==
  //                                                       null
  //                                                       ? Icons.arrow_drop_down
  //                                                       : showDropdownSnapshot
  //                                                       .data!
  //                                                       ? Icons
  //                                                       .arrow_drop_up
  //                                                       : Icons
  //                                                       .arrow_drop_down),
  //                                                 )),
  //                                             InkWell(
  //                                                 onTap: () {
  //                                                   _viewModel
  //                                                       .setRollName(
  //                                                       "");
  //                                                 },
  //                                                 child:
  //                                                 const Icon(Icons.close)),
  //                                             const SizedBox(
  //                                               width: AppSize.s12,
  //                                             )
  //                                           ],
  //                                         ),
  //                                         showDropdownSnapshot.data == null
  //                                             ? Container()
  //                                             : showDropdownSnapshot.data!
  //                                             ? TextFormField(
  //                                           keyboardType:
  //                                           TextInputType.name,
  //                                           controller:
  //                                           _roleController,
  //                                           decoration:
  //                                           const InputDecoration(
  //                                               hintText: AppStrings
  //                                                   .roleHint,
  //                                               labelText: AppStrings
  //                                                   .role,
  //                                               errorText: null),
  //                                         )
  //                                             : Container(),
  //                                         StreamBuilder<bool>(
  //                                             stream: _viewModel
  //                                                 .outputIsRollNameValid,
  //                                             builder: (context, snapshot) {
  //                                               return ExpandedSection(
  //                                                 expand: showDropdownSnapshot
  //                                                     .data ??
  //                                                     false,
  //                                                 height: 100,
  //                                                 child: MyScrollbar(
  //                                                   builder: (context,
  //                                                       scrollController2) =>
  //                                                       ListView.builder(
  //                                                           padding:
  //                                                           const EdgeInsets
  //                                                               .all(0),
  //                                                           controller:
  //                                                           scrollController2,
  //                                                           shrinkWrap: true,
  //                                                           itemCount: _viewModel.rolesData.length,
  //                                                           itemBuilder:
  //                                                               (context,
  //                                                               index) {
  //                                                             return Padding(
  //                                                               padding:
  //                                                               const EdgeInsets
  //                                                                   .all(
  //                                                                   8.0),
  //                                                               child: Column(
  //                                                                 crossAxisAlignment:
  //                                                                 CrossAxisAlignment
  //                                                                     .start,
  //                                                                 children: [
  //                                                                   InkWell(
  //                                                                     onTap:
  //                                                                         () {
  //                                                                       _viewModel.setRollName(_viewModel.rolesData[index].id.toString());
  //                                                                       _registerViewModel
  //                                                                           .setShowCountryNameDropdownValue(false);
  //                                                                     },
  //                                                                     child:
  //                                                                     Padding(
  //                                                                       padding:
  //                                                                       const EdgeInsets.symmetric(horizontal: 16),
  //                                                                       child: Text(_viewModel.rolesData[index].role_name),
  //                                                                     ),
  //                                                                   ),
  //                                                                 ],
  //                                                               ),
  //                                                             );
  //                                                           }),
  //                                                 ),
  //                                               );
  //                                             })
  //                                       ],
  //                                     );
  //                                   })),
  //                         ],
  //                       )));
  //             }),
  //         StreamBuilder<String?>(
  //           stream: _registerViewModel.outputCountryNameValue,
  //           builder: (context, snapshot) {
  //             return snapshot.data == null
  //                 ? Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 12),
  //               child: Text(
  //                 "Select country name",
  //                 style: TextStyle(color: ColorManager.error),
  //               ),
  //             )
  //                 : const SizedBox();
  //           },
  //         ),
  //       ]);
  // }
}

