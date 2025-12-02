import 'package:event_ticket_task/app/service_locator.dart';
import 'package:event_ticket_task/env/development.dart';
import 'package:event_ticket_task/env/env_fields.dart';
import 'package:event_ticket_task/env/production.dart';
import 'package:event_ticket_task/env/staging.dart';

enum AppEnvironment { dev, staging, prod }

abstract interface class Env implements EnvFields {
  factory Env() => _instance;

  static final Env _instance = switch (locator<AppEnvironment>()) {
    AppEnvironment.dev => DevEnv(),
    AppEnvironment.staging => QaEnv(),
    AppEnvironment.prod => ProdEnv(),
  };
}
