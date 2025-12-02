import 'package:event_ticket_task/core/utils/app_utils.dart';
import 'package:event_ticket_task/core/utils/extensions.dart';
import 'package:event_ticket_task/core/utils/spacer.dart';
import 'package:event_ticket_task/core/widgets/app_box.dart';
import 'package:event_ticket_task/core/widgets/buttons.dart';
import 'package:event_ticket_task/core/widgets/highlighted_text.dart';
import 'package:event_ticket_task/features/auth/models/ticket_response_model.dart';
import 'package:event_ticket_task/resources/colors.dart';
import 'package:flutter/material.dart';

class TicketListItem extends StatelessWidget {
  const TicketListItem({
    super.key,
    required this.ticket,
    required this.addToWishlist,
    required this.purchase,
  });
  final TicketResponseData ticket;
  final Function() addToWishlist;
  final Function() purchase;

  @override
  Widget build(BuildContext context) {
    return AppBox(
      bgColor: AppColors.customColor2,
      border: AppColors.pureBlack,

      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  ticket.artist,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.skyWhite,
                  ),
                ),
              ),
              YMargin(12),
              Text(
                ticket.location,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ],
          ),
          YMargin(12),
          Row(
            children: [
              Text(
                AppUtils.formatCurrency(ticket.ticketPrice),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              HighlightedText(
                'Available: ***${ticket.quantityAvailable}***',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                highlightColor: AppColors.skyWhite,
                highlightFontWeight: FontWeight.bold,
              ),
            ],
          ),
          YMargin(12),
          Row(
            children: [
              HighlightedText(
                'Event DateTime: ***${formatDate(ticket.eventDate)}***',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                highlightColor: AppColors.skyWhite,
                highlightFontWeight: FontWeight.bold,
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  if (!ticket.favorited) {
                    addToWishlist();
                  }
                },
                child: HighlightedText(
                  ticket.favorited ? 'Favorited' : '***Add to wishlist***',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color:
                        ticket.favorited
                            ? AppColors.success
                            : AppColors.skyWhite,
                  ),
                ),
              ),
            ],
          ),
          YMargin(12),
          if (!ticket.purchased) ...[
            CustomElevatedButton(
              text: 'Buy Now',
              onPressed: () {
                purchase();
              },
            ),
          ] else ...[
            GestureDetector(
              onTap: () {
                print(
                  ' ==== RECEIPT ====\n${ticket.toPrint()}\n=================',
                );
              },
              child: HighlightedText(
                'Print Ticket',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.success,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
