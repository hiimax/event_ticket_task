import 'dart:async';

import 'package:event_ticket_task/app/app.dart';
import 'package:event_ticket_task/app/bootstrap.dart';
import 'package:event_ticket_task/env/env.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  unawaited(
    bootstrap(() => ProviderScope(child: const EventTicketApp()), environment: AppEnvironment.dev),
  );
}
