import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_bank/presentation/hosting_details/hosting_viewmodel.dart';

import '../../app/di.dart';
import '../../domain/model/model.dart';
import '../common/state_renderer/state_renderer_impl.dart';
import '../resources/color_manager.dart';
import '../resources/value_manager.dart';

class HostingDetails extends StatefulWidget {
  const HostingDetails({super.key, required this.hostingData});
  final GetHostingData? hostingData;
  @override
  State<HostingDetails> createState() => _HostingDetailsState();
}

class _HostingDetailsState extends State<HostingDetails> {

  HostingDetailsViewModel _viewModel = instance<HostingDetailsViewModel>();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.setProjectId(widget.hostingData?.project_detail_id ?? "");
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
          title: Text('Hosting Details',
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
    return StreamBuilder<HostingDetailsViewObject>(
        stream: _viewModel.outputHostingDetailsData,
        builder: (context, snapshot)
        {
    return Container(
        padding: const EdgeInsets.only(top: AppPadding.p16),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: AppPadding.p16,right: AppPadding.p16,bottom: AppPadding.p16),
          child: Card(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getRow('Project Name:',widget.hostingData?.projectData?.name,AppPadding.p16,AppPadding.p16),
                _getRow('Deploy To:',widget.hostingData?.deployToData?.display_text,AppPadding.p0,AppPadding.p16),
                _getRow('Enviorment:',widget.hostingData?.environmentData?.display_text,AppPadding.p0,AppPadding.p16),
                _getRow('Server Name:',widget.hostingData?.serverNameData?.display_text,AppPadding.p0,AppPadding.p16),
                _getRow('Type:',widget.hostingData?.typeData?.display_text,AppPadding.p0,AppPadding.p16),
                _getRow('Git repository:',widget.hostingData?.git_repo,AppPadding.p0,AppPadding.p16),
                _getRow('Branch:',widget.hostingData?.branchData?.display_text,AppPadding.p0,AppPadding.p16),
                _getRow('Remote folder:',widget.hostingData?.remote_folder,AppPadding.p0,AppPadding.p16),
                _getRow('Url:',widget.hostingData?.url,AppPadding.p0,AppPadding.p16),
                _getRow('Admin Url:',widget.hostingData?.admin_url,AppPadding.p0,AppPadding.p16),
                _getRow('Technology:',widget.hostingData?.technology,AppPadding.p0,AppPadding.p16),
                _getRow('Created By:',widget.hostingData?.created_by,AppPadding.p0,AppPadding.p16),
                _getRow('Created At:',widget.hostingData?.created_at,AppPadding.p0,AppPadding.p16),
                Padding(padding: EdgeInsets.all(AppPadding.p16),child:

                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
              //scrollDirection: Axis.vertical,
                     shrinkWrap: true,
                     itemCount:_viewModel.rolesData.length,
                     itemBuilder: (BuildContext context, int index) {
                     // print(snapshot.data?.rolesData.length);
                      return Column(children: [
                        IntrinsicHeight(
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            SizedBox(
                              width: AppSize.s60,
                              child: Text('${snapshot.data?.rolesData[index].role_name}',style: Theme.of(context).textTheme.headline3),

                            ),
                            VerticalDivider(
                              color: Colors.grey,  //color of divider
                              width: 10, //width space of divider
                              thickness: 5, //thickness of divier line
                            ),
                            SizedBox(
                              width: AppSize.s210,
                              child: Text('${snapshot.data?.rolesData[index].credentials}'),
                            )
                          ],),
                        ),

                        // Container(
                        //  // color: Colors.red,
                        //   width:100,child: Text('QA',style: Theme.of(context).textTheme.headline3,
                        // ),
                        // ),
                        // Container(
                        //   //color: Colors.blue,
                        //   width: 200,child: Text('mkagrana@theopeneyes.com mkagrana@theopeneyes.com nikhil.pithadiya@theopeneyes.in nikhil.pithadiya@theopeneyes.in',style: Theme.of(context).textTheme.subtitle1,
                        // ),
                        // ),

                        const Divider(
                          height: AppSize.s28,
                          thickness: 5,
                          color: Colors.grey,
                        ),

                        /*VerticalDivider(color: Colors.black,
                          thickness: 2, width: 20,
                          indent: 50,
                          endIndent: 50,),
                        Container(
                          color: Colors.blue,
                          height: 50,
                          width: 100,
                        ),*/
                      ],
                      );
              }),)
              ],
            ),
          ),
        )
    );
        });
  }

  Widget _getRow(String lableTitle,String? lableValue,double topPadding,double bottomPadding ) {

    return Padding(padding: EdgeInsets.only(left: AppPadding.p16,right: AppPadding.p16,bottom: bottomPadding,top: topPadding),child: Row(
      //mainAxisAlignment: MainAxisAlignment.r,
      children: [
        IntrinsicHeight(
          child: Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: AppSize.s110,
                child: Text(lableTitle,style: Theme.of(context).textTheme.bodyText1),
              ),
              SizedBox(
                width: AppSize.s180,
                child:Text(lableValue!,style: Theme.of(context).textTheme.subtitle1,textAlign:TextAlign.left,),
              )
            ],),
        ),
      ],
    ),);
  }

}
