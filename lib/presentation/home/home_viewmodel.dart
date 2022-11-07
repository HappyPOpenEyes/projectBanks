
import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project_bank/domain/usecase/hosting_usecase.dart';
import 'package:project_bank/presentation/base/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/model/model.dart';
import '../common/state_renderer/state_renderer.dart';
import '../common/state_renderer/state_renderer_impl.dart';
import '../resources/routes_manager.dart';

class HomeViewModel extends BaseViewModel with HomeViewModelInputs, HomeViewModelOutputs{
  HostingUseCase _homeUseCase;
  final _dataStreamController = BehaviorSubject<HomeViewObject>();
  StreamController isUserUnauthorizedStreamController = StreamController<
      bool>();
  HomeViewModel(this._homeUseCase);
  List<GetHostingData> hostingData =[];
  List<ProjectData>projectData =[];
  List<EnvironmentData> environmentData =[];
  List<TypeData> typeData =[];
  List<DeployToData> deployToData =[];
  @override
  void start() {
    // TODO: implement start
    _getHome();
  }
  _getHome() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));

    (await _homeUseCase.execute(Void)).fold((failure) {
      if(failure.code==401){
        isUserUnauthorizedStreamController.add(true);
      }
      else {
        inputState.add(ErrorState(
            StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
      }
    }, (homeObject) {
      inputState.add(ContentState());
      inputHomeData.add(HomeViewObject(homeObject.getHostingData));
      hostingData = homeObject.getHostingData;
      if (hostingData.isNotEmpty){
        for (var i in hostingData) {
          if (projectData.isEmpty){
            projectData.add(i.projectData!);
          }
          else {
            List<String> tempid = [];
          for(int temp =0;temp<projectData.length;temp++){
            tempid.add(projectData[temp].id);
          }
          if(!tempid.contains(i.projectData!.id)){
            projectData.add(i.projectData!);
          }
          }

          if (typeData.isEmpty){
            typeData.add(i.typeData!);
          }
          else {
            List<String> tempid = [];
            for(int temp =0;temp<typeData.length;temp++){
              tempid.add(typeData[temp].id);
            }
            if(!tempid.contains(i.typeData!.id)){
              typeData.add(i.typeData!);
            }
          }

          if (environmentData.isEmpty){
            environmentData.add(i.environmentData!);
          }
          else {
            List<String> tempid = [];
            for(int temp =0;temp<environmentData.length;temp++){
              tempid.add(environmentData[temp].id);
            }
            if(!tempid.contains(i.environmentData!.id)){
              environmentData.add(i.environmentData!);
            }
          }

          if (deployToData.isEmpty){
            deployToData.add(i.deployToData!);
          }
          else {
            List<String> tempid = [];
            for(int temp =0;temp<deployToData.length;temp++){
              tempid.add(deployToData[temp].id);
            }
            if(!tempid.contains(i.deployToData!.id)){
              deployToData.add(i.deployToData!);
            }
          }
        }
    }
    });
  }

  @override
  void dispose() {
    _dataStreamController.close();
    isUserUnauthorizedStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputHomeData => _dataStreamController.sink;

  // outputs
  @override
  Stream<HomeViewObject> get outputHomeData =>
      _dataStreamController.stream.map((data) => data);
}

abstract class HomeViewModelInputs {

  Sink get inputHomeData;
}

abstract class HomeViewModelOutputs {
  Stream<HomeViewObject> get outputHomeData;
}
class HomeViewObject {
  List<GetHostingData> getHostingData;
  HomeViewObject(this.getHostingData);
}