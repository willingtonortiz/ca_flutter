import 'package:ca_flutter/app/core/app_module.dart';
import 'package:ca_flutter/app/core/app_widget.dart';
import 'package:ca_flutter/bootstrap.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  bootstrap(
    () => ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
