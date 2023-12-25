// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SignInDataCWProxy {
  SignInData state(BaseState? state);

  SignInData user(User? user);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SignInData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SignInData(...).copyWith(id: 12, name: "My name")
  /// ````
  SignInData call({
    BaseState? state,
    User? user,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSignInData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSignInData.copyWith.fieldName(...)`
class _$SignInDataCWProxyImpl implements _$SignInDataCWProxy {
  final SignInData _value;

  const _$SignInDataCWProxyImpl(this._value);

  @override
  SignInData state(BaseState? state) => this(state: state);

  @override
  SignInData user(User? user) => this(user: user);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SignInData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SignInData(...).copyWith(id: 12, name: "My name")
  /// ````
  SignInData call({
    Object? state = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
  }) {
    return SignInData(
      state: state == const $CopyWithPlaceholder()
          ? _value.state
          // ignore: cast_nullable_to_non_nullable
          : state as BaseState?,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as User?,
    );
  }
}

extension $SignInDataCopyWith on SignInData {
  /// Returns a callable class that can be used as follows: `instanceOfSignInData.copyWith(...)` or like so:`instanceOfSignInData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SignInDataCWProxy get copyWith => _$SignInDataCWProxyImpl(this);
}
