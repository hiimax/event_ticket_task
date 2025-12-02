import 'package:event_ticket_task/core/api/api_helper.dart';
import 'package:event_ticket_task/features/auth/models/ticket_response_model.dart';
import 'package:event_ticket_task/features/auth/repository/ticket_repository.dart';

final class TicketRepositoryImpl implements TicketRepository {
  TicketRepositoryImpl(this._apiHandler);

  final ApiHandler _apiHandler;

  @override
  Future<ApiResponse<TicketResponseModel>> getTickets() {
    return _apiHandler.request(
      path: '/tickets',
      method: MethodType.get,
      responseMapper: TicketResponseModel.fromJson,
    );
  }

  @override
  Future<ApiResponse<void>> purchaseSuccess() {
    return _apiHandler.request(
      path: '/purchase-success',
      method: MethodType.post,
    );
  }

  @override
  Future<ApiResponse<void>> purchaseFailed() {
    return _apiHandler.request(
      path: '/purchase-failed',
      method: MethodType.post,
    );
  }
}
