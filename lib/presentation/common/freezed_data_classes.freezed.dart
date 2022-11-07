// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginObject {
  String get userName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res>;
  $Res call({String userName, String password, String token});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res> implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  final LoginObject _value;
  // ignore: unused_field
  final $Res Function(LoginObject) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? password = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LoginObjectCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$$_LoginObjectCopyWith(
          _$_LoginObject value, $Res Function(_$_LoginObject) then) =
      __$$_LoginObjectCopyWithImpl<$Res>;
  @override
  $Res call({String userName, String password, String token});
}

/// @nodoc
class __$$_LoginObjectCopyWithImpl<$Res> extends _$LoginObjectCopyWithImpl<$Res>
    implements _$$_LoginObjectCopyWith<$Res> {
  __$$_LoginObjectCopyWithImpl(
      _$_LoginObject _value, $Res Function(_$_LoginObject) _then)
      : super(_value, (v) => _then(v as _$_LoginObject));

  @override
  _$_LoginObject get _value => super._value as _$_LoginObject;

  @override
  $Res call({
    Object? userName = freezed,
    Object? password = freezed,
    Object? token = freezed,
  }) {
    return _then(_$_LoginObject(
      userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginObject implements _LoginObject {
  _$_LoginObject(this.userName, this.password, this.token);

  @override
  final String userName;
  @override
  final String password;
  @override
  final String token;

  @override
  String toString() {
    return 'LoginObject(userName: $userName, password: $password, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginObject &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.token, token));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(token));

  @JsonKey(ignore: true)
  @override
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      __$$_LoginObjectCopyWithImpl<_$_LoginObject>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(
          final String userName, final String password, final String token) =
      _$_LoginObject;

  @override
  String get userName;
  @override
  String get password;
  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForgotPasswordObject {
  String get userName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgotPasswordObjectCopyWith<ForgotPasswordObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordObjectCopyWith<$Res> {
  factory $ForgotPasswordObjectCopyWith(ForgotPasswordObject value,
          $Res Function(ForgotPasswordObject) then) =
      _$ForgotPasswordObjectCopyWithImpl<$Res>;
  $Res call({String userName, String password, String token});
}

/// @nodoc
class _$ForgotPasswordObjectCopyWithImpl<$Res>
    implements $ForgotPasswordObjectCopyWith<$Res> {
  _$ForgotPasswordObjectCopyWithImpl(this._value, this._then);

  final ForgotPasswordObject _value;
  // ignore: unused_field
  final $Res Function(ForgotPasswordObject) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? password = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ForgotPasswordObjectCopyWith<$Res>
    implements $ForgotPasswordObjectCopyWith<$Res> {
  factory _$$_ForgotPasswordObjectCopyWith(_$_ForgotPasswordObject value,
          $Res Function(_$_ForgotPasswordObject) then) =
      __$$_ForgotPasswordObjectCopyWithImpl<$Res>;
  @override
  $Res call({String userName, String password, String token});
}

/// @nodoc
class __$$_ForgotPasswordObjectCopyWithImpl<$Res>
    extends _$ForgotPasswordObjectCopyWithImpl<$Res>
    implements _$$_ForgotPasswordObjectCopyWith<$Res> {
  __$$_ForgotPasswordObjectCopyWithImpl(_$_ForgotPasswordObject _value,
      $Res Function(_$_ForgotPasswordObject) _then)
      : super(_value, (v) => _then(v as _$_ForgotPasswordObject));

  @override
  _$_ForgotPasswordObject get _value => super._value as _$_ForgotPasswordObject;

  @override
  $Res call({
    Object? userName = freezed,
    Object? password = freezed,
    Object? token = freezed,
  }) {
    return _then(_$_ForgotPasswordObject(
      userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ForgotPasswordObject implements _ForgotPasswordObject {
  _$_ForgotPasswordObject(this.userName, this.password, this.token);

  @override
  final String userName;
  @override
  final String password;
  @override
  final String token;

  @override
  String toString() {
    return 'ForgotPasswordObject(userName: $userName, password: $password, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForgotPasswordObject &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.token, token));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(token));

  @JsonKey(ignore: true)
  @override
  _$$_ForgotPasswordObjectCopyWith<_$_ForgotPasswordObject> get copyWith =>
      __$$_ForgotPasswordObjectCopyWithImpl<_$_ForgotPasswordObject>(
          this, _$identity);
}

abstract class _ForgotPasswordObject implements ForgotPasswordObject {
  factory _ForgotPasswordObject(
          final String userName, final String password, final String token) =
      _$_ForgotPasswordObject;

  @override
  String get userName;
  @override
  String get password;
  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$_ForgotPasswordObjectCopyWith<_$_ForgotPasswordObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterObject {
  String get countryMobileCode => throw _privateConstructorUsedError;
  String get mobileNumber => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get profilePicture => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterObjectCopyWith<RegisterObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterObjectCopyWith<$Res> {
  factory $RegisterObjectCopyWith(
          RegisterObject value, $Res Function(RegisterObject) then) =
      _$RegisterObjectCopyWithImpl<$Res>;
  $Res call(
      {String countryMobileCode,
      String mobileNumber,
      String userName,
      String email,
      String password,
      String profilePicture});
}

/// @nodoc
class _$RegisterObjectCopyWithImpl<$Res>
    implements $RegisterObjectCopyWith<$Res> {
  _$RegisterObjectCopyWithImpl(this._value, this._then);

  final RegisterObject _value;
  // ignore: unused_field
  final $Res Function(RegisterObject) _then;

  @override
  $Res call({
    Object? countryMobileCode = freezed,
    Object? mobileNumber = freezed,
    Object? userName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_value.copyWith(
      countryMobileCode: countryMobileCode == freezed
          ? _value.countryMobileCode
          : countryMobileCode // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: mobileNumber == freezed
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: profilePicture == freezed
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_RegisterObjectCopyWith<$Res>
    implements $RegisterObjectCopyWith<$Res> {
  factory _$$_RegisterObjectCopyWith(
          _$_RegisterObject value, $Res Function(_$_RegisterObject) then) =
      __$$_RegisterObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String countryMobileCode,
      String mobileNumber,
      String userName,
      String email,
      String password,
      String profilePicture});
}

/// @nodoc
class __$$_RegisterObjectCopyWithImpl<$Res>
    extends _$RegisterObjectCopyWithImpl<$Res>
    implements _$$_RegisterObjectCopyWith<$Res> {
  __$$_RegisterObjectCopyWithImpl(
      _$_RegisterObject _value, $Res Function(_$_RegisterObject) _then)
      : super(_value, (v) => _then(v as _$_RegisterObject));

  @override
  _$_RegisterObject get _value => super._value as _$_RegisterObject;

  @override
  $Res call({
    Object? countryMobileCode = freezed,
    Object? mobileNumber = freezed,
    Object? userName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_$_RegisterObject(
      countryMobileCode == freezed
          ? _value.countryMobileCode
          : countryMobileCode // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber == freezed
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture == freezed
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegisterObject implements _RegisterObject {
  _$_RegisterObject(this.countryMobileCode, this.mobileNumber, this.userName,
      this.email, this.password, this.profilePicture);

  @override
  final String countryMobileCode;
  @override
  final String mobileNumber;
  @override
  final String userName;
  @override
  final String email;
  @override
  final String password;
  @override
  final String profilePicture;

  @override
  String toString() {
    return 'RegisterObject(countryMobileCode: $countryMobileCode, mobileNumber: $mobileNumber, userName: $userName, email: $email, password: $password, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterObject &&
            const DeepCollectionEquality()
                .equals(other.countryMobileCode, countryMobileCode) &&
            const DeepCollectionEquality()
                .equals(other.mobileNumber, mobileNumber) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.profilePicture, profilePicture));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(countryMobileCode),
      const DeepCollectionEquality().hash(mobileNumber),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(profilePicture));

  @JsonKey(ignore: true)
  @override
  _$$_RegisterObjectCopyWith<_$_RegisterObject> get copyWith =>
      __$$_RegisterObjectCopyWithImpl<_$_RegisterObject>(this, _$identity);
}

abstract class _RegisterObject implements RegisterObject {
  factory _RegisterObject(
      final String countryMobileCode,
      final String mobileNumber,
      final String userName,
      final String email,
      final String password,
      final String profilePicture) = _$_RegisterObject;

  @override
  String get countryMobileCode;
  @override
  String get mobileNumber;
  @override
  String get userName;
  @override
  String get email;
  @override
  String get password;
  @override
  String get profilePicture;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterObjectCopyWith<_$_RegisterObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RolesObject {
  String get projectId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RolesObjectCopyWith<RolesObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RolesObjectCopyWith<$Res> {
  factory $RolesObjectCopyWith(
          RolesObject value, $Res Function(RolesObject) then) =
      _$RolesObjectCopyWithImpl<$Res>;
  $Res call({String projectId});
}

/// @nodoc
class _$RolesObjectCopyWithImpl<$Res> implements $RolesObjectCopyWith<$Res> {
  _$RolesObjectCopyWithImpl(this._value, this._then);

  final RolesObject _value;
  // ignore: unused_field
  final $Res Function(RolesObject) _then;

  @override
  $Res call({
    Object? projectId = freezed,
  }) {
    return _then(_value.copyWith(
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_RolesObjectCopyWith<$Res>
    implements $RolesObjectCopyWith<$Res> {
  factory _$$_RolesObjectCopyWith(
          _$_RolesObject value, $Res Function(_$_RolesObject) then) =
      __$$_RolesObjectCopyWithImpl<$Res>;
  @override
  $Res call({String projectId});
}

/// @nodoc
class __$$_RolesObjectCopyWithImpl<$Res> extends _$RolesObjectCopyWithImpl<$Res>
    implements _$$_RolesObjectCopyWith<$Res> {
  __$$_RolesObjectCopyWithImpl(
      _$_RolesObject _value, $Res Function(_$_RolesObject) _then)
      : super(_value, (v) => _then(v as _$_RolesObject));

  @override
  _$_RolesObject get _value => super._value as _$_RolesObject;

  @override
  $Res call({
    Object? projectId = freezed,
  }) {
    return _then(_$_RolesObject(
      projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RolesObject implements _RolesObject {
  _$_RolesObject(this.projectId);

  @override
  final String projectId;

  @override
  String toString() {
    return 'RolesObject(projectId: $projectId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RolesObject &&
            const DeepCollectionEquality().equals(other.projectId, projectId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(projectId));

  @JsonKey(ignore: true)
  @override
  _$$_RolesObjectCopyWith<_$_RolesObject> get copyWith =>
      __$$_RolesObjectCopyWithImpl<_$_RolesObject>(this, _$identity);
}

abstract class _RolesObject implements RolesObject {
  factory _RolesObject(final String projectId) = _$_RolesObject;

  @override
  String get projectId;
  @override
  @JsonKey(ignore: true)
  _$$_RolesObjectCopyWith<_$_RolesObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CredentialsObject {
  String get project_detail_id => throw _privateConstructorUsedError;
  String get hosting_id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CredentialsObjectCopyWith<CredentialsObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CredentialsObjectCopyWith<$Res> {
  factory $CredentialsObjectCopyWith(
          CredentialsObject value, $Res Function(CredentialsObject) then) =
      _$CredentialsObjectCopyWithImpl<$Res>;
  $Res call({String project_detail_id, String hosting_id});
}

/// @nodoc
class _$CredentialsObjectCopyWithImpl<$Res>
    implements $CredentialsObjectCopyWith<$Res> {
  _$CredentialsObjectCopyWithImpl(this._value, this._then);

  final CredentialsObject _value;
  // ignore: unused_field
  final $Res Function(CredentialsObject) _then;

  @override
  $Res call({
    Object? project_detail_id = freezed,
    Object? hosting_id = freezed,
  }) {
    return _then(_value.copyWith(
      project_detail_id: project_detail_id == freezed
          ? _value.project_detail_id
          : project_detail_id // ignore: cast_nullable_to_non_nullable
              as String,
      hosting_id: hosting_id == freezed
          ? _value.hosting_id
          : hosting_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CredentialsObjectCopyWith<$Res>
    implements $CredentialsObjectCopyWith<$Res> {
  factory _$$_CredentialsObjectCopyWith(_$_CredentialsObject value,
          $Res Function(_$_CredentialsObject) then) =
      __$$_CredentialsObjectCopyWithImpl<$Res>;
  @override
  $Res call({String project_detail_id, String hosting_id});
}

/// @nodoc
class __$$_CredentialsObjectCopyWithImpl<$Res>
    extends _$CredentialsObjectCopyWithImpl<$Res>
    implements _$$_CredentialsObjectCopyWith<$Res> {
  __$$_CredentialsObjectCopyWithImpl(
      _$_CredentialsObject _value, $Res Function(_$_CredentialsObject) _then)
      : super(_value, (v) => _then(v as _$_CredentialsObject));

  @override
  _$_CredentialsObject get _value => super._value as _$_CredentialsObject;

  @override
  $Res call({
    Object? project_detail_id = freezed,
    Object? hosting_id = freezed,
  }) {
    return _then(_$_CredentialsObject(
      project_detail_id == freezed
          ? _value.project_detail_id
          : project_detail_id // ignore: cast_nullable_to_non_nullable
              as String,
      hosting_id == freezed
          ? _value.hosting_id
          : hosting_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CredentialsObject implements _CredentialsObject {
  _$_CredentialsObject(this.project_detail_id, this.hosting_id);

  @override
  final String project_detail_id;
  @override
  final String hosting_id;

  @override
  String toString() {
    return 'CredentialsObject(project_detail_id: $project_detail_id, hosting_id: $hosting_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CredentialsObject &&
            const DeepCollectionEquality()
                .equals(other.project_detail_id, project_detail_id) &&
            const DeepCollectionEquality()
                .equals(other.hosting_id, hosting_id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(project_detail_id),
      const DeepCollectionEquality().hash(hosting_id));

  @JsonKey(ignore: true)
  @override
  _$$_CredentialsObjectCopyWith<_$_CredentialsObject> get copyWith =>
      __$$_CredentialsObjectCopyWithImpl<_$_CredentialsObject>(
          this, _$identity);
}

abstract class _CredentialsObject implements CredentialsObject {
  factory _CredentialsObject(
          final String project_detail_id, final String hosting_id) =
      _$_CredentialsObject;

  @override
  String get project_detail_id;
  @override
  String get hosting_id;
  @override
  @JsonKey(ignore: true)
  _$$_CredentialsObjectCopyWith<_$_CredentialsObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddCredentialsObject {
  String get addCredentialArray => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddCredentialsObjectCopyWith<AddCredentialsObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCredentialsObjectCopyWith<$Res> {
  factory $AddCredentialsObjectCopyWith(AddCredentialsObject value,
          $Res Function(AddCredentialsObject) then) =
      _$AddCredentialsObjectCopyWithImpl<$Res>;
  $Res call({String addCredentialArray});
}

/// @nodoc
class _$AddCredentialsObjectCopyWithImpl<$Res>
    implements $AddCredentialsObjectCopyWith<$Res> {
  _$AddCredentialsObjectCopyWithImpl(this._value, this._then);

  final AddCredentialsObject _value;
  // ignore: unused_field
  final $Res Function(AddCredentialsObject) _then;

  @override
  $Res call({
    Object? addCredentialArray = freezed,
  }) {
    return _then(_value.copyWith(
      addCredentialArray: addCredentialArray == freezed
          ? _value.addCredentialArray
          : addCredentialArray // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AddCredentialsObjectCopyWith<$Res>
    implements $AddCredentialsObjectCopyWith<$Res> {
  factory _$$_AddCredentialsObjectCopyWith(_$_AddCredentialsObject value,
          $Res Function(_$_AddCredentialsObject) then) =
      __$$_AddCredentialsObjectCopyWithImpl<$Res>;
  @override
  $Res call({String addCredentialArray});
}

/// @nodoc
class __$$_AddCredentialsObjectCopyWithImpl<$Res>
    extends _$AddCredentialsObjectCopyWithImpl<$Res>
    implements _$$_AddCredentialsObjectCopyWith<$Res> {
  __$$_AddCredentialsObjectCopyWithImpl(_$_AddCredentialsObject _value,
      $Res Function(_$_AddCredentialsObject) _then)
      : super(_value, (v) => _then(v as _$_AddCredentialsObject));

  @override
  _$_AddCredentialsObject get _value => super._value as _$_AddCredentialsObject;

  @override
  $Res call({
    Object? addCredentialArray = freezed,
  }) {
    return _then(_$_AddCredentialsObject(
      addCredentialArray == freezed
          ? _value.addCredentialArray
          : addCredentialArray // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddCredentialsObject implements _AddCredentialsObject {
  _$_AddCredentialsObject(this.addCredentialArray);

  @override
  final String addCredentialArray;

  @override
  String toString() {
    return 'AddCredentialsObject(addCredentialArray: $addCredentialArray)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddCredentialsObject &&
            const DeepCollectionEquality()
                .equals(other.addCredentialArray, addCredentialArray));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(addCredentialArray));

  @JsonKey(ignore: true)
  @override
  _$$_AddCredentialsObjectCopyWith<_$_AddCredentialsObject> get copyWith =>
      __$$_AddCredentialsObjectCopyWithImpl<_$_AddCredentialsObject>(
          this, _$identity);
}

abstract class _AddCredentialsObject implements AddCredentialsObject {
  factory _AddCredentialsObject(final String addCredentialArray) =
      _$_AddCredentialsObject;

  @override
  String get addCredentialArray;
  @override
  @JsonKey(ignore: true)
  _$$_AddCredentialsObjectCopyWith<_$_AddCredentialsObject> get copyWith =>
      throw _privateConstructorUsedError;
}
