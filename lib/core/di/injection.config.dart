// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:devfunmi/core/di/injection.dart' as _i449;
import 'package:devfunmi/data/datasources/contact_remote_datasource.dart'
    as _i689;
import 'package:devfunmi/data/repositories/contact_repository_impl.dart'
    as _i610;
import 'package:devfunmi/domain/repositories/contact_repository.dart' as _i599;
import 'package:devfunmi/domain/usecases/send_contact_message.dart' as _i171;
import 'package:devfunmi/presentation/sections/contact/bloc/contact_bloc.dart'
    as _i1054;
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.lazySingleton<_i519.Client>(() => appModule.httpClient);
    gh.factory<_i689.ContactRemoteDatasource>(
      () => _i689.ContactRemoteDatasource(gh<_i519.Client>()),
    );
    gh.lazySingleton<_i599.ContactRepository>(
      () => _i610.ContactRepositoryImpl(gh<_i689.ContactRemoteDatasource>()),
    );
    gh.factory<_i171.SendContactMessage>(
      () => _i171.SendContactMessage(gh<_i599.ContactRepository>()),
    );
    gh.factory<_i1054.ContactBloc>(
      () => _i1054.ContactBloc(gh<_i171.SendContactMessage>()),
    );
    return this;
  }
}

class _$AppModule extends _i449.AppModule {}
