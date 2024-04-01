import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'settings.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'settings',
)
void configureDependencies() => getIt.settings();
