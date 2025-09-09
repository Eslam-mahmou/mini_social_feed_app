// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../data/data_source/auth_remote_data_source.dart' as _i697;
import '../../data/repository_impl/auth_repository_impl.dart' as _i318;
import '../../domain/repository/auth_repository.dart' as _i614;
import '../../domain/use_case/auth_use_case.dart' as _i185;
import '../../presentation/auth/manager/auth_cubit.dart' as _i1067;
import '../network/api_client.dart' as _i557;
import '../network/network_factory.dart' as _i785;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioProvider = _$DioProvider();
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioProvider.providePretty());
    gh.lazySingleton<_i785.AuthInterceptor>(() => _i785.AuthInterceptor());
    gh.singleton<_i557.ApiClient>(() => _i557.ApiClient.new(gh<_i361.Dio>()));
    gh.factory<_i697.AuthRemoteDataSource>(
      () => _i697.AuthRemoteDataSourceImpl(),
    );
    gh.factory<_i614.AuthRepository>(
      () => _i318.AuthRepositoryImpl(gh<_i697.AuthRemoteDataSource>()),
    );
    gh.factory<_i185.AuthUseCase>(
      () => _i185.AuthUseCase(gh<_i614.AuthRepository>()),
    );
    gh.factory<_i1067.AuthViewModel>(
      () => _i1067.AuthViewModel(gh<_i185.AuthUseCase>()),
    );
    return this;
  }
}

class _$DioProvider extends _i785.DioProvider {}
