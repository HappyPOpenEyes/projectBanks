import 'package:project_bank/app/extension.dart';
import 'package:project_bank/data/response/response.dart';

import '../../domain/model/model.dart';
import '../response/response.dart';
const EMPTY = "";
const ZERO = 0;

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        this?.id?.orEmpty() ?? EMPTY,
        this?.role_id?.orEmpty() ?? EMPTY,
        this?.first_name?.orEmpty() ?? EMPTY,
        this?.last_name?.orEmpty() ?? EMPTY,
        this?.phoneno?.orEmpty() ?? EMPTY,
        this?.profile_image?.orEmpty() ?? EMPTY,
        this?.email?.orEmpty() ?? EMPTY,
        this?.created_at?.orEmpty() ?? EMPTY,
        this?.updated_at?.orEmpty() ?? EMPTY,
        this?.created_by?.orEmpty() ?? EMPTY,
        this?.updated_by?.orEmpty() ?? EMPTY,
        this?.full_name?.orEmpty() ?? EMPTY);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
        this?.customer?.toDomain(),this?.token?.orEmpty() ?? EMPTY);
  }
}

extension TokenResponseMapper on TokenResponse? {
  TokenData toDomain() {
    return TokenData(this?.token?.orZero() ?? ZERO,this?.id?.orEmpty() ?? EMPTY,this?.created_at?.orEmpty() ?? EMPTY,
      this?.updated_at?.orEmpty() ?? EMPTY);
  }
}
extension GetTokenResponseMapper on GetTokenResponse? {
  GetTokenData toDomain() {
    return GetTokenData(this?.tokenResponse?.toDomain());
  }
}

extension DeleteCredentialResponseMapper on DeleteCredentialResponse? {
  DeleteCredential toDomain() {
    return DeleteCredential(this?.data?.orEmpty() ?? EMPTY);
  }
}
extension ForgotPassResponseMapper on ForgotPassResponse? {
  ForgotPassword toDomain() {
    return ForgotPassword(this?.data?.orEmpty() ?? EMPTY);
  }
}
extension ProjectResponseMapper on ProjectResponse? {
  ProjectData toDomain() {
    return ProjectData(this?.id?.orEmpty() ?? EMPTY,this?.name?.orEmpty() ?? EMPTY);
  }
}
extension EnvironmentResponseMapper on EnvironmentResponse? {
  EnvironmentData toDomain() {
    return EnvironmentData(this?.id?.orEmpty() ?? EMPTY,this?.display_text?.orEmpty() ?? EMPTY,this?.environment?.orEmpty() ?? EMPTY);
  }
}
extension DeployToResponseMapper on DeployToResponse? {
  DeployToData toDomain() {
    return DeployToData(this?.id?.orEmpty() ?? EMPTY,this?.display_text?.orEmpty() ?? EMPTY,this?.deployto?.orEmpty() ?? EMPTY);
  }
}
extension ServerNameResponseMapper on ServerNameResponse? {
  ServerNameData toDomain() {
    return ServerNameData(this?.id?.orEmpty() ?? EMPTY,this?.display_text?.orEmpty() ?? EMPTY,this?.servername?.orEmpty() ?? EMPTY);
  }
}
extension TypeResponseMapper on TypeResponse? {
  TypeData toDomain() {
    return TypeData(this?.id?.orEmpty() ?? EMPTY,this?.display_text?.orEmpty() ?? EMPTY,this?.type?.orEmpty() ?? EMPTY);
  }
}
extension BranchResponseMapper on BranchResponse? {
  BranchData toDomain() {
    return BranchData(this?.id?.orEmpty() ?? EMPTY,this?.display_text?.orEmpty() ?? EMPTY,this?.branch?.orEmpty() ?? EMPTY);
  }
}
extension UserResponseMapper on UserResponse? {
  UserData toDomain() {
    return UserData(this?.id?.orEmpty() ?? EMPTY,this?.full_name?.orEmpty() ?? EMPTY);
  }
}
extension HostingDataResponseMapper on HostingDataResponse? {
  GetHostingData toDomain() {
    return GetHostingData(this?.id?.orEmpty() ?? EMPTY,this?.project_detail_id?.orEmpty() ?? EMPTY,this?.git_repo?.orEmpty() ?? EMPTY,this?.remote_folder?.orEmpty() ?? EMPTY,this?.url?.orEmpty() ?? EMPTY,this?.admin_url?.orEmpty() ?? EMPTY,this?.technology?.orEmpty() ?? EMPTY,this?.created_by?.orEmpty() ?? EMPTY,this?.created_at?.orEmpty() ?? EMPTY,this?.projectResponse?.toDomain(),this?.environmentResponse?.toDomain(),this?.deployToResponse?.toDomain(),this?.serverNameResponse?.toDomain(),this?.typeResponse?.toDomain(),this?.branchResponse?.toDomain(),this?.is_active?.orZero()??ZERO,this?.userResponse.toDomain());
  }
}
extension HostingResponseMapper on HostingResponse? {
  HostingArrayObject toDomain() {
    List<GetHostingData> mappedServices =
    (this?.hostingDataResponse?.map((service) => service.toDomain()) ??
        Iterable.empty())
        .cast<GetHostingData>()
        .toList();
    return HostingArrayObject(mappedServices);
  }
}
extension RoleDataResponseMapper on RoleDataResponse? {
  RolesData toDomain() {
    return RolesData(this?.is_active?.orZero()??ZERO,this?.id?.orZero()??ZERO,this?.project_detail_id?.orEmpty() ?? EMPTY,this?.role_name?.orEmpty() ?? EMPTY,this?.credential?.orEmpty() ?? EMPTY);
  }
}
extension RolesResponseMapper on RolesResponse? {
  RolesArrayObject toDomain() {
    List<RolesData> mappedServices =
    (this?.roleDataResponse?.map((service) => service.toDomain()) ??
        Iterable.empty())
        .cast<RolesData>()
        .toList();
    return RolesArrayObject(mappedServices);
  }
}
extension CredentialDataResponseMapper on CredentialDataResponse? {
  CredentialsData toDomain() {
    return CredentialsData(this?.id?.orEmpty() ?? EMPTY,this?.project_detail_id?.orEmpty() ?? EMPTY,this?.hosting_id?.orEmpty() ?? EMPTY,this?.project_role_id?.orEmpty() ?? EMPTY,this?.username?.orEmpty() ?? EMPTY,this?.password?.orEmpty() ?? EMPTY,this?.is_active?.orZero()??ZERO,this?.roleDataResponse?.toDomain());
  }
}
extension AddCredentialDataResponseMapper on AddCredentialDataResponse? {
  AddCredentialsData toDomain() {
    return AddCredentialsData(this?.id?.orEmpty() ?? EMPTY,this?.project_detail_id?.orEmpty() ?? EMPTY,this?.hosting_id?.orEmpty() ?? EMPTY,this?.project_role_id?.orEmpty() ?? EMPTY,this?.username?.orEmpty() ?? EMPTY,this?.password?.orEmpty() ?? EMPTY,this?.is_active?.orEmpty()??EMPTY);
  }
}
extension CredentialResponseMapper on CredentialResponse? {
  CredentialsArrayObject toDomain() {
    List<CredentialsData> mappedServices =
    (this?.credentialDataResponse?.map((service) => service.toDomain()) ??
        Iterable.empty())
        .cast<CredentialsData>()
        .toList();
    return CredentialsArrayObject(mappedServices);
  }
}
extension AddCredentialResponseMapper on AddCredentialResponse? {

  AddCredentialsObject toDomain() {
    return AddCredentialsObject(
        this?.addCredentialDataResponse?.toDomain(),);
  }
}
extension HostingDataActiveResponseMapper on HostingDataActiveResponse? {
  GetHostingActiveData toDomain() {
    return GetHostingActiveData(this?.id?.orEmpty() ?? EMPTY,this?.project_detail_id?.orEmpty() ?? EMPTY,this?.deployto_id?.orEmpty() ?? EMPTY,this?.environment_id?.orEmpty() ?? EMPTY,this?.server_name_id?.orEmpty() ?? EMPTY,this?.type_id?.orEmpty() ?? EMPTY,this?.branch_id?.orEmpty() ?? EMPTY,this?.git_repo?.orEmpty() ?? EMPTY,this?.remote_folder?.orEmpty() ?? EMPTY,this?.url?.orEmpty() ?? EMPTY,this?.admin_url?.orEmpty() ?? EMPTY,this?.technology?.orEmpty() ?? EMPTY,this?.created_by?.orEmpty() ?? EMPTY,this?.created_at?.orEmpty() ?? EMPTY,this?.is_active?.orZero()??ZERO);
  }
}
extension AddHostingResponseMapper on AddHostingResponse? {
  GetHostingActiveObjectData toDomain() {
    return GetHostingActiveObjectData(this?.hostingDataActiveResponse?.toDomain());
  }
}
