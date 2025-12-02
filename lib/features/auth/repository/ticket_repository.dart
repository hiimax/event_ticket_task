

import 'package:event_ticket_task/core/api/api_helper.dart';
import 'package:event_ticket_task/features/auth/models/ticket_response_model.dart';

abstract class TicketRepository {
 
Future<ApiResponse<TicketResponseModel>> getTickets();
Future<ApiResponse<void>> purchaseSuccess();
Future<ApiResponse<void>> purchaseFailed();
}
