
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/app_prefs.dart';
import '../../app/di.dart';
import '../../domain/model/model.dart';
import '../common/state_renderer/state_renderer_impl.dart';
import '../credential/credential_page.dart';
import '../hosting_details/hosting_details.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/value_manager.dart';
import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ProjectData? _dropdownValueFotProject;
  TypeData? _dropdownValueForType;
  EnvironmentData? _dropdownValueEnv;
  DeployToData? _dropdownValueForDep;
  HomeViewModel _viewModel = instance<HomeViewModel>();
  TextEditingController _roleController = TextEditingController();
  List<GetHostingData> _searchResult  = [];
  List<GetHostingData> _FilterResult  = [];
  TextEditingController editingController = TextEditingController();
  GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();
  bool _IsSearching = false;
  bool _IsFiltering = false;
  String? SelectedProjectId = "";
  String? SelectedEnviormnetId = "";
  String? SelectedTypeId = "";
  String? SelectedDeployId = "";
  AppPreferences _appPreferences = instance<AppPreferences>();
  @override
  void initState() {
    _bind();
    _IsSearching = false;
    super.initState();
    fetchData();

  }
  void fetchData() {

      setState(() {
        _searchResult = _viewModel.hostingData;
        print(_searchResult.length);
      });
  }
  _bind() {
    _viewModel.start();
    _viewModel.isUserUnauthorizedStreamController.stream
        .listen((isSuccessLoggedIn) {
      // navigate to main screen
      SchedulerBinding.instance.addPostFrameCallback((_) {
        // _appPreferences.setIsUserLoggedIn();
        Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
      });
    });
  }


  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  bool _value = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(key: scaffolKey,
      appBar: AppBar(
        title: Text('Hostings',
          style: Theme
              .of(context)
              .textTheme
              .headline2,
        ),
        actions: [
          IconButton(
              icon: const Icon(
                  Icons.logout,
                  color: Color(0xFFFFFFFF),
                  size: 25.0),
              onPressed: (){
                _logout();
              }
          ),
        ],
      ),
      endDrawer: Drawer(
        child: SingleChildScrollView(
      //padding: const EdgeInsets.only(left: AppPadding.p16,right: AppPadding.p16,bottom: AppPadding.p16),
      // child: Card(

      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: const EdgeInsets.only(
              left: AppPadding.p14, right: AppPadding.p12,top: AppPadding.p30,bottom: AppPadding.p20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Select Filter', style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.only(
              top: AppPadding.p12,
              right: AppPadding.p12,
              left: AppPadding.p12), child: DropdownButtonHideUnderline(
              child: StreamBuilder<bool>(
                // stream: _viewModel.outputIsUserNameValid,
                  builder: (context, snapshot) {
                    return InputDecorator(
                      decoration: const InputDecoration(
                        filled: false,
                        hintText: AppStrings.projectHint,
                        labelText:
                        AppStrings.project,
                        // errorText: AppStrings.roleHint,
                      ),
                      isEmpty: _dropdownValueFotProject == null,
                      child: Padding(padding: const EdgeInsets.only(
                          top: AppPadding.p12,
                          right: AppPadding.p12,
                          left: AppPadding.p12), child: DropdownButton<ProjectData>(
                        value: _dropdownValueFotProject,
                        isDense: true,
                        onChanged: (ProjectData? newValue) {
                          print('value change');
                          print(newValue?.name);
                          setState(() {
                            _dropdownValueFotProject = newValue;
                            SelectedProjectId = _dropdownValueFotProject?.id;
                            _roleController.text = _dropdownValueFotProject?.name??"";
                            // _viewModel.setRollName(_dropdownValue?.id.toString());
                          });
                        },
                        items: _viewModel.projectData.map((ProjectData value) {
                          return DropdownMenuItem<ProjectData>(
                            value: value,
                            child: Text(value.name),
                          );
                        }).toList(),
                      ),
                      ),
                    );}))),
          Padding(padding: const EdgeInsets.only(
              top: AppPadding.p12,
              right: AppPadding.p12,
              left: AppPadding.p12), child: DropdownButtonHideUnderline(
              child: StreamBuilder<bool>(
                // stream: _viewModel.outputIsUserNameValid,
                  builder: (context, snapshot) {
                    return InputDecorator(
                      decoration: const InputDecoration(
                        filled: false,
                        hintText: AppStrings.deployHint,
                        labelText:
                        AppStrings.deploy,
                        // errorText: AppStrings.roleHint,
                      ),
                      isEmpty: _dropdownValueForDep == null,
                      child: Padding(padding: const EdgeInsets.only(
                          top: AppPadding.p12,
                          right: AppPadding.p12,
                          left: AppPadding.p12), child: DropdownButton<DeployToData>(
                        value: _dropdownValueForDep,
                        isDense: true,
                        onChanged: (DeployToData? newValue) {
                          print('value change');
                          print(newValue?.display_text);
                          setState(() {
                            _dropdownValueForDep = newValue;
                            SelectedDeployId = _dropdownValueForDep?.id;
                            _roleController.text = _dropdownValueForDep?.display_text??"";
                            // _viewModel.setRollName(_dropdownValue?.id.toString());
                          });
                        },
                        items: _viewModel.deployToData.map((DeployToData value) {
                          return DropdownMenuItem<DeployToData>(
                            value: value,
                            child: Text(value.display_text),
                          );
                        }).toList(),
                      ),
                      ),
                    );}))),
          Padding(padding: const EdgeInsets.only(
              top: AppPadding.p12,
              right: AppPadding.p12,
              left: AppPadding.p12), child: DropdownButtonHideUnderline(
              child: StreamBuilder<bool>(
                // stream: _viewModel.outputIsUserNameValid,
                  builder: (context, snapshot) {
                    return InputDecorator(
                      decoration: const InputDecoration(
                        filled: false,
                        hintText: AppStrings.environmentHint,
                        labelText:
                        AppStrings.environment,
                        // errorText: AppStrings.roleHint,
                      ),
                      isEmpty: _dropdownValueEnv == null,
                      child: Padding(padding: const EdgeInsets.only(
                          top: AppPadding.p12,
                          right: AppPadding.p12,
                          left: AppPadding.p12), child: DropdownButton<EnvironmentData>(
                        value: _dropdownValueEnv,
                        isDense: true,
                        onChanged: (EnvironmentData? newValue) {
                          print('value change');
                          print(newValue?.display_text);
                          setState(() {
                            _dropdownValueEnv = newValue;
                            SelectedEnviormnetId = _dropdownValueEnv?.id;
                            _roleController.text = _dropdownValueEnv?.display_text??"";
                            // _viewModel.setRollName(_dropdownValue?.id.toString());
                          });
                        },
                        items: _viewModel.environmentData.map((EnvironmentData value) {
                          return DropdownMenuItem<EnvironmentData>(
                            value: value,
                            child: Text(value.display_text),
                          );
                        }).toList(),
                      ),
                      ),
                    );}))),
          Padding(padding: const EdgeInsets.only(
              top: AppPadding.p12,
              right: AppPadding.p12,
              left: AppPadding.p12), child: DropdownButtonHideUnderline(
              child: StreamBuilder<bool>(
                // stream: _viewModel.outputIsUserNameValid,
                  builder: (context, snapshot) {
                    return InputDecorator(
                      decoration: const InputDecoration(
                        filled: false,
                        hintText: AppStrings.typeHint,
                        labelText:
                        AppStrings.type,
                        // errorText: AppStrings.roleHint,
                      ),
                      isEmpty: _dropdownValueForType == null,
                      child: Padding(padding: const EdgeInsets.only(
                          top: AppPadding.p12,
                          right: AppPadding.p12,
                          left: AppPadding.p12), child: DropdownButton<TypeData>(
                        value: _dropdownValueForType,
                        isDense: true,
                        onChanged: (TypeData? newValue) {
                          print('value change');
                          print(newValue?.display_text);
                          setState(() {
                            _dropdownValueForType = newValue;
                            SelectedTypeId = _dropdownValueForType?.id;
                            _roleController.text = _dropdownValueForType?.display_text??"";
                            // _viewModel.setRollName(_dropdownValue?.id.toString());
                          });
                        },
                        items: _viewModel.typeData.map((TypeData value) {
                          return DropdownMenuItem<TypeData>(
                            value: value,
                            child: Text(value.display_text),
                          );
                        }).toList(),
                      ),
                      ),
                    );}))),
          const SizedBox(height: AppSize.s12),
          Padding(
            padding: const EdgeInsets.only(
                left: AppPadding.p12, right: AppPadding.p12),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StreamBuilder<bool>(
                  //stream: _viewModel.outputIsAllInputsValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: AppSize.s130,
                      height: AppSize.s40,
                      child: ElevatedButton(
                          onPressed:() {
                            _FilterResult.clear();

                            List<GetHostingData> tempArray  = [];
                            List<GetHostingData> tempArray1  = [];
                            List<GetHostingData> tempArray2  = [];
                            List<GetHostingData> tempArray3  = [];


                            if(SelectedProjectId==""&&SelectedEnviormnetId==""&&SelectedTypeId==""&&SelectedDeployId==""){
                              _IsFiltering=false;
                              Scaffold.of(context).closeEndDrawer();
                              setState(() {});
                              print("Return");
                            }
                            else {
                              _IsFiltering = true;
                              if (SelectedProjectId != "") {
                                _viewModel.hostingData.forEach((userDetail) {
                                  if (userDetail.projectData?.id ==
                                      SelectedProjectId) {
                                    tempArray.add(userDetail);
                                  }
                                  _FilterResult = tempArray;
                                  // _viewModel.login();
                                });

                                if (SelectedDeployId != "") {
                                  for (int temp = 0; temp <
                                      tempArray.length; temp++) {
                                    if (tempArray[temp].deployToData?.id ==
                                        SelectedDeployId) {
                                      tempArray1.add(tempArray[temp]);
                                    }
                                  }
                                  _FilterResult = tempArray1;
                                }
                                else {
                                  if (SelectedEnviormnetId != "") {
                                    for (int temp = 0; temp <
                                        tempArray.length; temp++) {
                                      if (tempArray[temp].environmentData?.id ==
                                          SelectedEnviormnetId) {
                                        tempArray1.add(tempArray[temp]);
                                      }
                                    }
                                    _FilterResult = tempArray1;
                                  }
                                  else {
                                    if (SelectedTypeId != "") {
                                      print(tempArray.length);
                                      for (int temp = 0; temp <
                                          tempArray.length; temp++) {
                                        if (tempArray[temp].typeData?.id ==
                                            SelectedTypeId) {
                                          tempArray1.add(tempArray[temp]);
                                        }
                                      }
                                      _FilterResult = tempArray2;
                                    }
                                  }
                                }
                                if (SelectedEnviormnetId != "") {
                                  print(tempArray1.length);
                                  for (int temp = 0; temp <
                                      tempArray1.length; temp++) {
                                    if (tempArray1[temp].environmentData?.id ==
                                        SelectedEnviormnetId) {
                                      tempArray2.add(tempArray1[temp]);
                                    }
                                  }
                                  _FilterResult = tempArray2;
                                }
                                else {
                                  if (SelectedTypeId != "") {
                                    print(tempArray1.length);
                                    for (int temp = 0; temp <
                                        tempArray1.length; temp++) {
                                      if (tempArray1[temp].typeData?.id ==
                                          SelectedTypeId) {
                                        tempArray2.add(tempArray1[temp]);
                                      }
                                    }
                                    _FilterResult = tempArray2;
                                  }
                                }
                                if (SelectedTypeId != "") {
                                  print(tempArray2.length);
                                  for (int temp = 0; temp <
                                      tempArray2.length; temp++) {
                                    if (tempArray2[temp].typeData?.id ==
                                        SelectedTypeId) {
                                      tempArray3.add(tempArray2[temp]);
                                    }
                                  }
                                  _FilterResult = tempArray3;
                                }
                                // else{
                                //   if(SelectedEnviormnetId!=""){
                                //     print(tempArray.length);
                                //     for(int temp=0;temp<tempArray.length;temp++){
                                //       if (tempArray[temp].environmentData?.id ==
                                //           SelectedEnviormnetId) {
                                //         print("Diff");
                                //         tempArray1.add(tempArray[temp]);
                                //       }
                                //     }
                                //     _FilterResult = tempArray1;
                                //   }
                                //   else{
                                //     if(SelectedTypeId!=""){
                                //       print(tempArray.length);
                                //       for(int temp=0;temp<tempArray.length;temp++){
                                //         if (tempArray[temp].typeData?.id ==
                                //             SelectedTypeId) {
                                //           print("Diff");
                                //           tempArray1.add(tempArray[temp]);
                                //         }
                                //       }
                                //       _FilterResult = tempArray1;
                                //     }
                                //
                                //   }
                                //
                                // }

                              }
                              else {
                                if (SelectedDeployId != "") {

                                  for (int temp = 0; temp <
                                      _viewModel.hostingData.length; temp++) {
                                    if (_viewModel.hostingData[temp]
                                        .deployToData?.id ==
                                        SelectedDeployId) {
                                      tempArray1.add(
                                          _viewModel.hostingData[temp]);
                                    }
                                  }
                                  _FilterResult = tempArray1;
                                }
                                else {
                                  if (SelectedEnviormnetId != "") {
                                    print("inside1");
                                    for (int temp = 0; temp <
                                        _viewModel.hostingData.length; temp++) {
                                      if (_viewModel.hostingData[temp]
                                          .environmentData?.id ==
                                          SelectedEnviormnetId) {
                                        print("Diff");
                                        tempArray1.add(
                                            _viewModel.hostingData[temp]);
                                      }
                                    }
                                    _FilterResult = tempArray1;
                                  }
                                  else {
                                    if (SelectedTypeId != "") {
                                      print("inside1111111");
                                      for (int temp = 0; temp <
                                          _viewModel.hostingData
                                              .length; temp++) {
                                        if (_viewModel.hostingData[temp]
                                            .typeData?.id ==
                                            SelectedTypeId) {
                                          print(_viewModel.hostingData[temp]
                                              .typeData?.id);
                                          print(SelectedTypeId);
                                          print("Diff");
                                          tempArray1.add(
                                              _viewModel.hostingData[temp]);
                                        }
                                      }
                                      _FilterResult = tempArray1;
                                    }
                                  }
                                }
                                if (SelectedEnviormnetId != "") {
                                  print("inside1");
                                  for (int temp = 0; temp <
                                      tempArray1.length; temp++) {
                                    if (tempArray1[temp].environmentData?.id ==
                                        SelectedEnviormnetId) {
                                      print("Diff");
                                      tempArray2.add(tempArray1[temp]);
                                    }
                                  }
                                  _FilterResult = tempArray2;
                                }
                                if (SelectedTypeId != "") {
                                  print("inside1");
                                  for (int temp = 0; temp <
                                      tempArray1.length; temp++) {
                                    if (tempArray1[temp].typeData?.id ==
                                        SelectedTypeId) {
                                      print("Diff");
                                      tempArray2.add(tempArray1[temp]);
                                    }
                                  }
                                  _FilterResult = tempArray2;
                                }
                              }

                              //_FilterResult = tempArray;
                              print("Last......");
                              print(_FilterResult.length);
                              Scaffold.of(context).closeEndDrawer();
                              setState(() {});
                              // if (SelectedProjectId=="") {
                              //   Scaffold.of(context).closeEndDrawer();
                              //   setState(() {});
                              //   print("Return......");
                              //   print(SelectedProjectId);
                              //   return;
                              // }
                            }
                          },
                          child: Text(AppStrings.filter)),
                    );
                  },
                ),




                // SizedBox(
                //   width: 150,
                //   height: 40,
                //
                //   child: ElevatedButton(onPressed:() {
                //     Navigator.pushReplacementNamed(context, Routes.mainRoute);
                //
                //   }, child: const Text(AppStrings.login),),
                // ),
                SizedBox(
                  width: AppSize.s130,
                  height: 40,
                  child: ElevatedButton(onPressed:() {
                    setState(() {
                      _IsFiltering=false;
                      SelectedProjectId="";
                      SelectedEnviormnetId="";
                      SelectedTypeId="";
                      SelectedDeployId="";
                      _dropdownValueFotProject = null;
                      _dropdownValueForType = null;
                      _dropdownValueEnv = null;
                      _dropdownValueForDep = null;
                    });

                  },style: ElevatedButton.styleFrom(
                    primary: ColorManager.green,
                  ), child: const Text(AppStrings.clear),),
                )
              ],
            ),
          )
        ],
      )
        )
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
    return StreamBuilder<HomeViewObject>(
        stream: _viewModel.outputHomeData,
        builder: (context, snapshot)
        {
          return Container(
              child: Column(
                  children: <Widget>[
              Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child:Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   SizedBox(
                height: AppSize.s40,
                width: 270,
                  child:  TextField(
                  controller: editingController,
                  decoration: const InputDecoration(
                      hintText: 'Search in project name,server,environment,hosting account&type...', border: InputBorder.none,prefixIcon: Icon(Icons.search)),
                  onChanged: onSearchTextChanged,
                ),
                // trailing: IconButton(icon: Icon(Icons.cancel), onPressed: () {
                //   editingController.clear();
                //   onSearchTextChanged('');
                // },),
              ),
                   SizedBox(
                     width: 80,
                     height: 40,
                     child: ElevatedButton(onPressed:() {
                       Scaffold.of(context).openEndDrawer();
                     }, child:Text('Filter'),),
                   ),

            ],
          ),),


                    Expanded(

                        child: _searchResult.length != 0 || editingController.text.isNotEmpty ? _searchResult.isNotEmpty ?  ListView.builder(
                            itemCount:_searchResult.length, // the length
                            itemBuilder: (context, index) {
                              return  Container(
                                padding: const EdgeInsets.only(left: AppPadding.p16,
                                    right: AppPadding.p16,
                                    bottom: AppPadding.p16),
                                child:  Card(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      _getRow('Project Name:', _searchResult[index].projectData?.name??"", AppPadding.p16,
                                          AppPadding.p16),
                                      _getRow('Server Name:', _searchResult[index].serverNameData?.display_text??"", AppPadding.p0,
                                          AppPadding.p16),
                                      _getRow(
                                          'Hosting Account:', _searchResult[index].deployToData?.display_text??"", AppPadding.p0,
                                          AppPadding.p16),
                                      _getRow('Enviorment:', _searchResult[index].environmentData?.display_text??"", AppPadding.p0,
                                          AppPadding.p16),
                                      _getRow(
                                          'Type:',  _searchResult[index].typeData?.display_text??"", AppPadding.p0, AppPadding.p0),
                                      Padding(padding: const EdgeInsets.only(
                                          left: AppPadding.p16, bottom: AppPadding.p16),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Is Active?:', style: Theme
                                                .of(context)
                                                .textTheme
                                                .bodyText1),
                                            Switch(
                                              activeColor: ColorManager.primary,
                                              value: parseBool(_searchResult[index].is_active) ,
                                              onChanged: (value) {
                                                _viewModel.addHostingIsActive(_searchResult[index]);
                                              },
                                            ),
                                          ],
                                        ),),
                                      Padding(padding: const EdgeInsets.only(left: AppPadding.p16,bottom: AppPadding.p16),
                                        child:Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                              height: AppSize.s40,
                                              width: AppSize.s40,
                                              child:  TextButton(
                                                onPressed: (){
                                                  initCredentialModule();
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => CrediantialPage(hostingData: _searchResult[index]),
                                                    ),
                                                  );
                                                },

                                                child: SvgPicture.asset(ImageAssets.crediantialIc),
                                              ),
                                            ),
                                            SizedBox(
                                              height: AppSize.s40,
                                              width: AppSize.s40,
                                              child:  TextButton(
                                                onPressed: () {
                                                  initRolesModule();
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => HostingDetails(hostingData: _searchResult[index]),
                                                    ),
                                                  );
                                                },

                                                child: SvgPicture.asset(ImageAssets.viewIc),
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: AppSize.s40,
                                            //   width: AppSize.s40,
                                            //   child:  TextButton(
                                            //     onPressed: () {
                                            //       // Navigator.pushNamed(
                                            //       //     context, Routes.forgotPasswordRoute);
                                            //     },
                                            //
                                            //     child: SvgPicture.asset(ImageAssets.editIc),
                                            //   ),
                                            // ),

                                          ],
                                        ),)
                                    ],
                                  ),
                                ),
                              );
                            }) : const Center(child: Text('No hosting available'))
                            : _IsFiltering ?  _FilterResult.isNotEmpty ? ListView.builder(
                            itemCount:_FilterResult.length, // the length
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.only(left: AppPadding.p16,
                                    right: AppPadding.p16,
                                    bottom: AppPadding.p16),
                                child: Card(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      _getRow('Project Name:', _FilterResult[index].projectData?.name??"", AppPadding.p16,
                                          AppPadding.p16),
                                      _getRow('Server Name:', _FilterResult[index].serverNameData?.display_text??"", AppPadding.p0,
                                          AppPadding.p16),
                                      _getRow(
                                          'Hosting Account:', _FilterResult[index].deployToData?.display_text??"", AppPadding.p0,
                                          AppPadding.p16),
                                      _getRow('Environment:', _FilterResult[index].environmentData?.display_text??"", AppPadding.p0,
                                          AppPadding.p16),
                                      _getRow(
                                          'Type:',  _FilterResult[index].typeData?.display_text??"", AppPadding.p0, AppPadding.p0),
                                      Padding(padding: const EdgeInsets.only(
                                          left: AppPadding.p16, bottom: AppPadding.p16),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Is Active?:', style: Theme
                                                .of(context)
                                                .textTheme
                                                .bodyText1),
                                            Switch(
                                              activeColor: ColorManager.primary,
                                              value: parseBool(_FilterResult[index].is_active) ,
                                              onChanged: (value) {
                                                _viewModel.addHostingIsActive(_FilterResult[index]);
                                              },
                                            ),
                                          ],
                                        ),),
                                      Padding(padding: const EdgeInsets.only(left: AppPadding.p16,bottom: AppPadding.p16),
                                        child:Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                              height: AppSize.s40,
                                              width: AppSize.s40,
                                              child:  TextButton(
                                                onPressed: (){
                                                  initCredentialModule();
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => CrediantialPage(hostingData: _FilterResult[index]),
                                                    ),
                                                  );
                                                },

                                                child: SvgPicture.asset(ImageAssets.crediantialIc),
                                              ),
                                            ),
                                            SizedBox(
                                              height: AppSize.s40,
                                              width: AppSize.s40,
                                              child:  TextButton(
                                                onPressed: () {
                                                  initRolesModule();
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => HostingDetails(hostingData: _FilterResult[index]),
                                                    ),
                                                  );
                                                },

                                                child: SvgPicture.asset(ImageAssets.viewIc),
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: AppSize.s40,
                                            //   width: AppSize.s40,
                                            //   child:  TextButton(
                                            //     onPressed: () {
                                            //       // Navigator.pushNamed(
                                            //       //     context, Routes.forgotPasswordRoute);
                                            //     },
                                            //
                                            //     child: SvgPicture.asset(ImageAssets.editIc),
                                            //   ),
                                            // ),

                                          ],
                                        ),)
                                    ],
                                  ),
                                ),
                              );
                            }) : const Center(child: Text('No hosting available')) :
                        RefreshIndicator(
                         onRefresh: _pullRefresh,
                            child: ListView.builder(
                            itemCount:_viewModel.hostingData.length, // the length
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.only(left: AppPadding.p16,
                                    right: AppPadding.p16,
                                    bottom: AppPadding.p16),
                                child: Card(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      _getRow('Project Name:', '${snapshot.data?.getHostingData[index].projectData?.name}', AppPadding.p16,
                                          AppPadding.p16),
                                      _getRow('Server Name:', '${snapshot.data?.getHostingData[index].serverNameData?.display_text}', AppPadding.p0,
                                          AppPadding.p16),
                                      _getRow(
                                          'Hosting Account:', '${snapshot.data?.getHostingData[index].deployToData?.display_text}', AppPadding.p0,
                                          AppPadding.p16),
                                      _getRow('Environment:', '${snapshot.data?.getHostingData[index].environmentData?.display_text}', AppPadding.p0,
                                          AppPadding.p16),
                                      _getRow(
                                          'Type:', '${snapshot.data?.getHostingData[index].typeData?.display_text}', AppPadding.p0, AppPadding.p0),
                                      Padding(padding: const EdgeInsets.only(
                                          left: AppPadding.p16, bottom: AppPadding.p16),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Is Active?:', style: Theme
                                                .of(context)
                                                .textTheme
                                                .bodyText1),
                                            Switch(
                                              activeColor: ColorManager.primary,
                                              value: parseBool(snapshot.data?.getHostingData[index].is_active) ,
                                              onChanged: (value) {
                                                _viewModel.addHostingIsActive(_viewModel.hostingData[index]);
                                              },
                                            ),
                                          ],
                                        ),),
                                      Padding(padding: const EdgeInsets.only(left: AppPadding.p16,bottom: AppPadding.p16),
                                        child:Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                              height: AppSize.s40,
                                              width: AppSize.s40,
                                              child:  TextButton(
                                                onPressed: (){
                                                  initCredentialModule();
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => CrediantialPage(hostingData: snapshot.data?.getHostingData[index]),
                                                    ),
                                                  );
                                                },

                                                child: SvgPicture.asset(ImageAssets.crediantialIc,color: ColorManager.primary,),
                                              ),
                                            ),
                                            SizedBox(
                                              height: AppSize.s40,
                                              width: AppSize.s40,
                                              child:  TextButton(
                                                onPressed: () {
                                                  initRolesModule();
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => HostingDetails(hostingData: snapshot.data?.getHostingData[index]),
                                                    ),
                                                  );
                                                },

                                                child: SvgPicture.asset(ImageAssets.viewIc,color: ColorManager.primary),
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: AppSize.s40,
                                            //   width: AppSize.s40,
                                            //   child:  TextButton(
                                            //     onPressed: () {
                                            //       // Navigator.pushNamed(
                                            //       //     context, Routes.forgotPasswordRoute);
                                            //     },
                                            //
                                            //     child: SvgPicture.asset(ImageAssets.editIc),
                                            //   ),
                                            // ),

                                          ],
                                        ),)
                                    ],
                                  ),
                                ),
                              );
                            })
                    ))]));
        });
  }
  Future<void> _pullRefresh() async {
   _viewModel.getHome();
  }
  bool parseBool(int? integer) {
    return integer == 1;
  }

  Widget _getRow(String lableTitle,String lableValue,double topPadding,double bottomPadding ) {

    return Padding(padding: EdgeInsets.only(left: AppPadding.p16,right: AppPadding.p16,bottom: bottomPadding,top: topPadding),child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(lableTitle,style: Theme.of(context).textTheme.bodyText1),
        Text(lableValue,style: Theme.of(context).textTheme.subtitle1)
      ],
    ),);
  }

  Widget _getButtonRow() {
    return Padding(padding: const EdgeInsets.only(left: AppPadding.p16,bottom: AppPadding.p16),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: AppSize.s40,
            width: AppSize.s40,
            child:  TextButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, Routes.credentialRoute);
              },

              child: SvgPicture.asset(ImageAssets.crediantialIc),
            ),
          ),
          SizedBox(
            height: AppSize.s40,
            width: AppSize.s40,
            child:  TextButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, Routes.hostingDetailRoute);
              },

              child: SvgPicture.asset(ImageAssets.viewIc),
            ),
          ),
          // SizedBox(
          //   height: AppSize.s40,
          //   width: AppSize.s40,
          //   child:  TextButton(
          //     onPressed: () {
          //       // Navigator.pushNamed(
          //       //     context, Routes.forgotPasswordRoute);
          //     },
          //
          //     child: SvgPicture.asset(ImageAssets.editIc),
          //   ),
          // ),

        ],
      ),);
  }


  void _logout() {
    _appPreferences.logout(); // clear login flag from app prefs
    //_localDataSource.clearCache();
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _viewModel.hostingData.forEach((userDetail) {
      if (userDetail.projectData!.name.toLowerCase().contains(text.toLowerCase())||userDetail.environmentData!.display_text.toLowerCase().contains(text.toLowerCase())||userDetail.deployToData!.display_text.toLowerCase().contains(text.toLowerCase())||userDetail.branchData!.display_text.toLowerCase().contains(text.toLowerCase())||userDetail.typeData!.display_text.toLowerCase().contains(text.toLowerCase())||userDetail.serverNameData!.display_text.toLowerCase().contains(text.toLowerCase()))
        _searchResult.add(userDetail);
    });
    setState(() {});
  }
}


