import 'package:event_ticket_task/app/router_paths.dart';
import 'package:event_ticket_task/app/service_locator.dart';
import 'package:event_ticket_task/core/storage/cache_storage.dart';
import 'package:event_ticket_task/core/utils/import.dart';
import 'package:event_ticket_task/core/widgets/buttons.dart';
import 'package:event_ticket_task/features/auth/models/ticket_response_model.dart';
import 'package:event_ticket_task/features/auth/provider/ticket_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketVM = ref.watch(ticketsNotifierProvider);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16),
        width: double.infinity,

        child: Center(
          child: CustomElevatedButton(
            text: 'Run Test',
            onPressed: () {
              if (locator.get<SharedPrefs>().firstTime) {
                ticketVM.updateAllEventTickets(
                  TicketResponseModel.empty().copyWith(
                    data: List.generate(
                      12,
                      (index) => TicketResponseData.empty().copyWith(
                        ticketPrice: Random().nextInt(1000).toString(),
                        artist: 'Artist $index',
                        duration: 'Duration $index',
                        location:
                            'Location ${index % 2 == 0 ? 'Lagos' : 'Abuja'}',
                        locationHex: 'Location Hex $index',
                        eventDate: 'Event Date $index',
                        ticketRef: 'Ticket Ref $index',
                        quantityAvailable: Random().nextInt(10),
                        purchased: Random().nextBool(),
                        purchasedAt: 'Purchased At $index',
                      ),
                    ),
                  ),
                );
              }
              locator.get<SharedPrefs>().firstTime = false;
              context.goNamed(AppPath.splash.home.path);
            },
          ),
        ),
      ),
    );
  }
}
