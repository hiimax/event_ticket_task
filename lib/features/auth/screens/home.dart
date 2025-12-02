import 'package:event_ticket_task/app/router_paths.dart';
import 'package:event_ticket_task/app/service_locator.dart';
import 'package:event_ticket_task/core/extensions/extension.dart';
import 'package:event_ticket_task/core/hooks/use_init_hook.dart';
import 'package:event_ticket_task/core/storage/cache_storage.dart';
import 'package:event_ticket_task/core/utils/import.dart';
import 'package:event_ticket_task/core/utils/spacer.dart';
import 'package:event_ticket_task/features/auth/components/confirm_purchase_modal.dart';
import 'package:event_ticket_task/features/auth/components/ticket_list_item.dart';
import 'package:event_ticket_task/features/auth/enum/online_status.dart';
import 'package:event_ticket_task/features/auth/enum/user_location.dart';
import 'package:event_ticket_task/features/auth/provider/ticket_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketVM = ref.watch(ticketsNotifierProvider);
    final onlineStatus = useState<bool>(false);
    final userLocation = useState<UserLocation>(UserLocation.Lagos);

    useInit(() {
      onlineStatus.value = locator.get<SharedPrefs>().offlineMode;
    });

    useInitAsync(() async {
      await ticketVM.getTickets(onSuccess: (message) {}, onError: (error) {});
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Event Ticket',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            YMargin(12),
            Text(
              'Find your next event',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            GestureDetector(
              onTap: () {
                onlineStatus.value = !onlineStatus.value;
                ticketVM.updateOnlineStatus(onlineStatus.value);
              },
              child: Text(switch (onlineStatus.value) {
                true => OnlineStatus.online.description,
                false => OnlineStatus.offline.description,
              }, style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
            ),
            GestureDetector(
              onTap: () {
                ticketVM.updateUserLocation();
              },
              child: Text(switch (ticketVM.isUserInLagos) {
                true => UserLocation.Lagos.description,
                false => UserLocation.Abuja.description,
              }, style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final ticket = ticketVM.allEventTicketsData[index];
                  return TicketListItem(
                    ticket: ticket,
                    addToWishlist: () {
                      ticketVM.updateTicketFavorite(index);
                    },
                    purchase: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ConfirmPurchaseModal(
                            onConfirm: () {
                              ticketVM.updateTicketPurchased(index);
                              context.pop();
                              context.pushNamed(
                                AppPath.splash.purchaseSuccess.path,
                              );
                            },
                            onCancel: () {
                              ticketVM.purchaseFailed(
                                onSuccess: (message) {
                                  context.pop();
                                },
                                onError: (error) {
                                  context.pop();
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  ).paddingAll(16);
                },

                itemCount: ticketVM.allEventTicketsData.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
