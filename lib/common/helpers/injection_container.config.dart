// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../domain/repositories/user_repository.dart' as _i12;
import '../../domain/use_cases/authentication_usecases.dart' as _i15;
import '../../domain/use_cases/synchronize.dart' as _i10;
import '../../domain/use_cases/use_cases.dart' as _i18;
import '../../platform/database/daos/sync_data_dao.dart' as _i9;
import '../../platform/database/database.dart' as _i3;
import '../../platform/networking/network_provider_property_api.dart' as _i14;
import '../../platform/repositories/user_repository_impl.dart' as _i13;
import '../../platform/storages/secure_storage_service.dart' as _i8;
import '../../platform/synchronize/synchronize_impl.dart' as _i11;
import '../../platform/use_cases/authentication_usecases_impl.dart' as _i16;
import '../../presentation/home/bloc/home_cubit.dart' as _i17;
import '../../presentation/login/boc/sign_in_bloc.dart' as _i20;
import '../connectivity/network_state.dart' as _i5;
import '../connectivity/network_state_change.dart' as _i19;
import '../connectivity/network_state_impl.dart' as _i6;
import 'exception_handler.dart' as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.AppDatabase>(_i3.AppDatabase());
  gh.factory<_i4.NetworkExceptionHandler>(() => _i4.NetworkExceptionHandler());
  gh.singleton<_i5.NetworkState>(
      _i6.NetworkStateImpl(connectivity: get<_i7.Connectivity>()));
  gh.factory<_i8.SecureStorage>(() => _i8.SecureStorage());
  gh.factory<_i9.SyncDatasDao>(() => _i9.SyncDatasDao(get<_i3.AppDatabase>()));
  gh.singleton<_i10.Synchronize>(_i11.SynchronizeImpl(
    networkState: get<_i5.NetworkState>(),
    appDatabase: get<_i3.AppDatabase>(),
    secureStorage: get<_i8.SecureStorage>(),
  ));
  gh.factory<_i12.UserRepository>(() => _i13.UserRepositoryImpl(
        secureStorage: get<_i8.SecureStorage>(),
        exceptionHandler: get<_i4.NetworkExceptionHandler>(),
        networkProviderPropertyApi: get<_i14.NetworkProviderPropertyApi>(),
      ));
  gh.factory<_i15.AuthenticationUseCases>(() => _i16.AuthenticationUseCasesImpl(
      userRepository: get<_i12.UserRepository>()));
  gh.factory<_i17.HomeCubit>(() => _i17.HomeCubit(
        exceptionHandler: get<_i4.NetworkExceptionHandler>(),
        authenticationUseCases: get<_i18.AuthenticationUseCases>(),
      ));
  gh.singleton<_i19.NetworkStateChange>(_i19.NetworkStateChange(
    connectivity: get<_i7.Connectivity>(),
    synchronize: get<_i10.Synchronize>(),
  ));
  gh.factory<_i20.SignInBloc>(() => _i20.SignInBloc(
        secureStorage: get<_i8.SecureStorage>(),
        authenticationUseCases: get<_i15.AuthenticationUseCases>(),
        exceptionHandler: get<_i4.NetworkExceptionHandler>(),
      ));
  return get;
}
