// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_manager.dart' as _i108;
import '../data/data_sources/remote_data_source_imp/product_remote_data_source_imp.dart'
    as _i11;
import '../data/repositories/product_repository_imp.dart' as _i457;
import '../domain/repositories/data_sources/remote_data_source/product_remote_data_source.dart'
    as _i806;
import '../domain/repositories/repositories/product_repository.dart' as _i197;
import '../domain/use_cases/product_use_case.dart' as _i464;
import '../features/ui/product/cubit/product_view_model.dart' as _i470;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i108.ApiManager>(() => _i108.ApiManager());
    gh.factory<_i806.ProductRemoteDataSource>(() =>
        _i11.ProductRemoteDataSourceImp(apiManager: gh<_i108.ApiManager>()));
    gh.factory<_i470.ProductViewModel>(() =>
        _i470.ProductViewModel(productUseCase: gh<_i464.ProductUseCase>()));
    gh.factory<_i197.ProductRepository>(() => _i457.ProductRepositoryImp(
        productRemoteDataSource: gh<_i806.ProductRemoteDataSource>()));
    gh.factory<_i464.ProductUseCase>(
        () => _i464.ProductUseCase(productRepository: gh<_i197.ProductRepository>()));
    return this;
  }
}
