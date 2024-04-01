// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_education/data/api/services/news_api_service.dart'
    as _i3;
import 'package:flutter_education/data/repository/news_api_repository.dart'
    as _i5;
import 'package:flutter_education/domain/repositories/news_repository.dart'
    as _i4;
import 'package:flutter_education/internal/repositories.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt settings({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.NewsApiService>(() => _i3.NewsApiService());
    gh.factory<_i4.NewsRepository>(
        () => _i5.NewsApiRepository(apiService: gh<_i3.NewsApiService>()));
    gh.factory<_i6.Repositories>(
        () => _i6.Repositories(newsRepository: gh<_i4.NewsRepository>()));
    return this;
  }
}
