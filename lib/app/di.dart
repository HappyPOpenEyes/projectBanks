
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:project_bank/domain/usecase/addcredential_usecase.dart';
import 'package:project_bank/domain/usecase/addhosting_usecase.dart';
import 'package:project_bank/domain/usecase/credentials_usecase.dart';
import 'package:project_bank/domain/usecase/deletecredential_usecase.dart';
import 'package:project_bank/domain/usecase/forgotpassword_usecase.dart';
import 'package:project_bank/domain/usecase/hosting_usecase.dart';
import 'package:project_bank/domain/usecase/roles_usecase.dart';
import 'package:project_bank/domain/usecase/token_usecase.dart';
import 'package:project_bank/presentation/credential/credential_viewmodel.dart';
import 'package:project_bank/presentation/edit_credential/editcredential_viewmodel.dart';
import 'package:project_bank/presentation/forgot_password/forgot_password_viewmodel.dart';
import 'package:project_bank/presentation/hosting_details/hosting_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../data/data_source/remote_data_source.dart';
import '../data/network/app_api.dart';
import '../data/network/dio_factory.dart';
import '../data/network/network_info.dart';
import '../data/repository/repository_impl.dart';
import '../domain/repository/repository.dart';
import '../domain/usecase/login_usecase.dart';
import '../presentation/home/home_viewmodel.dart';
import '../presentation/login/login_viewmodel.dart';
import 'app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  // shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));
  // network info
  instance.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(DataConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // app  service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImplementer(instance()));

  // local data source
  // instance.registerLazySingleton<LocalDataSource>(
  //         () => LocalDataSourceImplementer());

  // repository
  instance.registerLazySingleton<Repository>(
          () => RepositoryImpl(instance(), instance()));
}
initLoginModule(){
  if(!GetIt.I.isRegistered<LoginUseCase>()){
    instance.registerFactory<TokenUseCase>(() => TokenUseCase(instance()));
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance(),instance(),instance()));
  }
}


initForgotPasswordModule(){
  if(!GetIt.I.isRegistered<ForgotPasswordUseCase>()){
    instance.registerFactory<ForgotPasswordUseCase>(() => ForgotPasswordUseCase(instance()));
    instance.registerFactory<ForgotPasswordViewModel>(() => ForgotPasswordViewModel(instance()));
  }
}

initHostingModule() {
  if (!GetIt.I.isRegistered<HostingUseCase>()) {
    instance.registerFactory<HostingUseCase>(() => HostingUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<AddHostingUseCase>()) {
    instance.registerFactory<AddHostingUseCase>(() => AddHostingUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<HomeViewModel>()) {
    instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance(),instance()));
  }
}
initRolesModule() {
  if (!GetIt.I.isRegistered<CredentialsUseCase>()) {
    instance.registerFactory<CredentialsUseCase>(() => CredentialsUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<CredentialsViewModel>()) {
    instance.registerFactory<CredentialsViewModel>(() => CredentialsViewModel(instance(),instance()));
  }
  if (!GetIt.I.isRegistered<RolesUseCase>()) {
    instance.registerFactory<RolesUseCase>(() => RolesUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<HostingDetailsViewModel>()) {
    instance.registerFactory<HostingDetailsViewModel>(() => HostingDetailsViewModel(instance(),instance()));
  }
}
initCredentialModule() {
  if (!GetIt.I.isRegistered<CredentialsUseCase>()) {
    instance.registerFactory<CredentialsUseCase>(() => CredentialsUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<CredentialsViewModel>()) {
    instance.registerFactory<CredentialsViewModel>(() => CredentialsViewModel(instance(),instance()));
  }
  if (!GetIt.I.isRegistered<DeleteCredentialsUseCase>()) {
    instance.registerFactory<DeleteCredentialsUseCase>(() => DeleteCredentialsUseCase(instance()));
  }
}


initEditCredentialModule() {
  if (!GetIt.I.isRegistered<AddCredentialUseCase>()) {
    instance.registerFactory<AddCredentialUseCase>(() => AddCredentialUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<EditCredentialViewModel>()) {
    instance.registerFactory<EditCredentialViewModel>(() => EditCredentialViewModel(instance(),instance()));
  }
  if (!GetIt.I.isRegistered<RolesUseCase>()) {
    instance.registerFactory<RolesUseCase>(() => RolesUseCase(instance()));
  }
}
