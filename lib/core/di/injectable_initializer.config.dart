// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../data/data_source/auth_remote_data_source.dart' as _i697;
import '../../data/data_source/create_post_remote_data_source.dart' as _i206;
import '../../data/data_source/home_tab_remote_data_source.dart' as _i530;
import '../../data/repository_impl/auth_repository_impl.dart' as _i318;
import '../../data/repository_impl/create_post_repository_impl.dart' as _i2;
import '../../data/repository_impl/home_tab_repository_impl.dart' as _i478;
import '../../domain/repository/auth_repository.dart' as _i614;
import '../../domain/repository/create_post_repository.dart' as _i588;
import '../../domain/repository/home_repository.dart' as _i181;
import '../../domain/use_case/auth_use_case.dart' as _i185;
import '../../domain/use_case/create_post_use_case.dart' as _i178;
import '../../domain/use_case/home_use_case.dart' as _i127;
import '../../presentation/auth/manager/auth_cubit.dart' as _i1067;
import '../../presentation/layout/manager/home_teb_cubit/home_tab_view_model.dart'
    as _i503;
import '../../presentation/post_screen/manager/create_post_cubit.dart' as _i4;
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
    gh.factory<_i4.CreatePostViewModel>(() => _i4.CreatePostViewModel());
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioProvider.providePretty());
    gh.lazySingleton<_i785.AuthInterceptor>(() => _i785.AuthInterceptor());
    gh.singleton<_i557.ApiClient>(() => _i557.ApiClient.new(gh<_i361.Dio>()));
    gh.factory<_i697.AuthRemoteDataSource>(
      () => _i697.AuthRemoteDataSourceImpl(),
    );
    gh.factory<_i530.HomeTabRemoteDataSource>(
      () => _i530.HomeTabRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.factory<_i206.CreatePostRemoteDataSource>(
      () => _i206.CreatePostRemoteDataSourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i181.HomeRepository>(
      () => _i478.HomeTabRepositoryImpl(gh<_i530.HomeTabRemoteDataSource>()),
    );
    gh.factory<_i614.AuthRepository>(
      () => _i318.AuthRepositoryImpl(gh<_i697.AuthRemoteDataSource>()),
    );
    gh.factory<_i127.HomeTabUseCase>(
      () => _i127.HomeTabUseCase(gh<_i181.HomeRepository>()),
    );
    gh.factory<_i588.CreatePostRepository>(
      () =>
          _i2.CreatePostRepositoryImpl(gh<_i206.CreatePostRemoteDataSource>()),
    );
    gh.factory<_i503.HomeTabViewModel>(
      () => _i503.HomeTabViewModel(gh<_i127.HomeTabUseCase>()),
    );
    gh.factory<_i185.AuthUseCase>(
      () => _i185.AuthUseCase(gh<_i614.AuthRepository>()),
    );
    gh.factory<_i178.CreatePostUseCase>(
      () => _i178.CreatePostUseCase(gh<_i588.CreatePostRepository>()),
    );
    gh.factory<_i1067.AuthViewModel>(
      () => _i1067.AuthViewModel(gh<_i185.AuthUseCase>()),
    );
    return this;
  }
}

class _$DioProvider extends _i785.DioProvider {}
