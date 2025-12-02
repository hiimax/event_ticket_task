import 'package:flutter/material.dart';

class ConfirmPurchaseModal extends StatelessWidget {
  const ConfirmPurchaseModal({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });
  final Function() onConfirm;
  final Function() onCancel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Confirm Purchase'),
          Text('Are you sure you want to purchase this ticket?'),

          Row(
            children: [
              TextButton(onPressed: onCancel, child: Text('Cancel')),
              TextButton(onPressed: onConfirm, child: Text('Confirm')),
            ],
          ),
        ],
      ),
    );
  }
}
