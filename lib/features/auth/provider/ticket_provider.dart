import 'dart:convert';

import 'package:event_ticket_task/app/base_change_notifier.dart';
import 'package:event_ticket_task/app/service_locator.dart';
import 'package:event_ticket_task/core/storage/cache_storage.dart';
import 'package:event_ticket_task/features/auth/models/ticket_response_model.dart';
import 'package:event_ticket_task/features/auth/repository/ticket_repository.dart';
import 'package:hooks_riverpod/legacy.dart';

final ticketsNotifierProvider = ChangeNotifierProvider<TicketsProvider>((ref) {
  return TicketsProvider(locator.get<TicketRepository>());
});

class TicketsProvider extends BaseChangeNotifier {
  final TicketRepository _ticketsRepository;
  TicketsProvider(this._ticketsRepository);

  TicketResponseModel _allEventTickets = TicketResponseModel.empty();
  TicketResponseModel get allEventTickets => _allEventTickets;

  List<TicketResponseData> _allEventTicketsData = [];
  List<TicketResponseData> get allEventTicketsData => _allEventTicketsData;

  void updateAllEventTickets(TicketResponseModel data) {
    _allEventTickets = data;
    locator.get<SharedPrefs>().offlineTickets = jsonEncode(data.toJson());
    notifyListeners();
  }

  TicketResponseModel getOfflineTickets() {
    return TicketResponseModel.fromJson(
      jsonDecode(locator.get<SharedPrefs>().offlineTickets),
    );
  }

  void updateTicketFavorite(int index) {
    // Get the ticket from the filtered list
    final ticket = _allEventTicketsData[index];

    // Find the index of this ticket in the main list
    final mainIndex = _allEventTickets.data.indexWhere(
      (element) => element.ticketRef == ticket.ticketRef,
    );

    if (mainIndex != -1) {
      // Update the ticket in the main list
      _allEventTickets.data[mainIndex] = _allEventTickets.data[mainIndex]
          .copyWith(favorited: !_allEventTickets.data[mainIndex].favorited);

      // Update the filtered list to reflect the change immediately
      _allEventTicketsData[index] = _allEventTickets.data[mainIndex];

      // Persist the updated main list
      locator.get<SharedPrefs>().offlineTickets = jsonEncode(
        _allEventTickets.toJson(),
      );
      notifyListeners();
    }
  }

  void updateTicketPurchased(int index) {
    // Get the ticket from the filtered list
    final ticket = _allEventTicketsData[index];

    // Find the index of this ticket in the main list
    final mainIndex = _allEventTickets.data.indexWhere(
      (element) => element.ticketRef == ticket.ticketRef,
    );

    if (mainIndex != -1) {
      // Update the ticket in the main list
      _allEventTickets.data[mainIndex] = _allEventTickets.data[mainIndex]
          .copyWith(
            purchased: true, // Assuming purchased toggles to true
            quantityAvailable:
                _allEventTickets.data[mainIndex].quantityAvailable - 1,
            purchasedAt: DateTime.now().toString(),
          );

      // Update the filtered list to reflect the change immediately
      _allEventTicketsData[index] = _allEventTickets.data[mainIndex];

      // Persist the updated main list
      locator.get<SharedPrefs>().offlineTickets = jsonEncode(
        _allEventTickets.toJson(),
      );
      notifyListeners();
    }
  }

  bool _isOnline = locator.get<SharedPrefs>().offlineMode;
  bool get isOnline => _isOnline;

  void updateOnlineStatus(bool status) {
    _isOnline = status;
    locator.get<SharedPrefs>().offlineMode = status;
    getTickets(onSuccess: (message) {}, onError: (error) {});
    notifyListeners();
  }

  bool _isUserInLagos = locator.get<SharedPrefs>().isUserInLagos;
  bool get isUserInLagos => _isUserInLagos;

  void updateTicketLocation() {
    if (_isUserInLagos) {
      _allEventTicketsData =
          _allEventTickets.data
              .where(
                (element) => element.location.toLowerCase().contains('lagos'),
              )
              .toList();
    } else {
      _allEventTicketsData =
          _allEventTickets.data
              .where(
                (element) => element.location.toLowerCase().contains('abuja'),
              )
              .toList();
    }
    // print(_allEventTicketsData);
    notifyListeners();
  }

  void updateUserLocation() {
    _isUserInLagos = !_isUserInLagos;
    locator.get<SharedPrefs>().isUserInLagos = _isUserInLagos;
    updateTicketLocation();

    notifyListeners();
  }

  Future<void> getTickets({
    required Function(String) onSuccess,
    required Function(String) onError,
  }) async {
    if (!_isOnline) {
      _allEventTickets = getOfflineTickets();
      _allEventTicketsData = _allEventTickets.data;
      updateTicketLocation();
      notifyListeners();
      return;
    } else {
      final response = await _ticketsRepository.getTickets();
      response.when(
        success: (data) {
          if (data != null) {
            _allEventTickets = data.data ?? TicketResponseModel.empty();
            updateTicketLocation(); // Apply filter after fetching
            onSuccess(data.message ?? 'Success Call');
          }
        },
        error: (error) {
          onError(error.message ?? 'Error Call');
        },
      );
    }
  }

  Future<void> purchaseSuccess({
    required Function(String) onSuccess,
    required Function(String) onError,
  }) async {
    final response = await _ticketsRepository.purchaseSuccess();
    response.when(
      success: (data) {
        if (data != null) {
          onSuccess(data.message ?? 'Success Call');
        }
      },
      error: (error) {
        onError(error.message ?? 'Error Call');
      },
    );
  }

  Future<void> purchaseFailed({
    required Function(String) onSuccess,
    required Function(String) onError,
  }) async {
    final response = await _ticketsRepository.purchaseFailed();
    response.when(
      success: (data) {
        if (data != null) {
          onSuccess(data.message ?? 'Success Call');
        }
      },
      error: (error) {
        onError(error.message ?? 'Error Call');
      },
    );
  }
}
