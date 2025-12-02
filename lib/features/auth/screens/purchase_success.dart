import 'package:event_ticket_task/app/router_paths.dart';
import 'package:event_ticket_task/core/extensions/extension.dart';
import 'package:event_ticket_task/core/utils/import.dart';
import 'package:event_ticket_task/core/utils/launch_confetti.dart';
import 'package:event_ticket_task/core/utils/spacer.dart';
import 'package:event_ticket_task/core/widgets/buttons.dart';

class PurchaseSuccessScreen extends StatelessWidget {
  const PurchaseSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    launchConfetti(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Purchase Success'),
          YMargin(16),
          Text('Thank you for your purchase'),
          YMargin(16),
          CustomElevatedButton(
            text: 'Go to Home',
            onPressed: () {
              context.goNamed(AppPath.splash.home.path);
            },
          ),
        ],
      ).paddingAll(16),
    );
  }
}
