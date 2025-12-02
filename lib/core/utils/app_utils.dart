// ignore_for_file: deprecated_member_use

import 'package:event_ticket_task/core/functions/dialog.dart';
import 'package:event_ticket_task/core/utils/enable_photo_permission_dialog.dart';
import 'package:event_ticket_task/core/utils/import.dart';
import 'package:event_ticket_task/core/utils/toast_util.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class AppUtils {
  AppUtils._();

  static Color getColorFromHex(String hexColor) {
    final buffer = StringBuffer();
    if (hexColor.length == 6 || hexColor.length == 7) buffer.write('ff');
    buffer.write(hexColor.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static String formatCurrency(dynamic amount, {String? currency}) {
    final totalValue = double.tryParse(amount.toString()) ?? 0;
    final numberFormat = NumberFormat.currency(
      locale: 'en_US',
      symbol: '₦',
      decimalDigits: 2,
    );
    return numberFormat.format(totalValue);
  }

  static String removeInitialZero(String value) {
    if (value.startsWith('0')) {
      value = value.substring(1);
    }

    return value;
  }

  static Future<void> copyToClipboard(context, String? text) async {
    if (text != null && text.isNotEmpty) {
      await Clipboard.setData(ClipboardData(text: text));
      context.showSuccessMessage(context, message: "Copied!");
    }
  }

  static Future<void> saveToGallery(
    BuildContext context,
    ScreenshotController screenshotController,
    String name,
  ) async {
    final permission =
        Platform.isIOS ? Permission.photosAddOnly : Permission.photos;

    // Request the appropriate permission
    PermissionStatus status = await permission.request();
    if (status.isPermanentlyDenied) {
      TransDialog.instance.openDialog(
        dialogContent: const EnablePhotoPermissionDialog(),
      );
      return;
    }
    if (status.isGranted) {
      try {
        final image = await screenshotController.capture(
          pixelRatio: MediaQuery.of(context).devicePixelRatio,
        );

        if (image == null) {
          context.showErrorMessage(message: "Failed to capture screenshot.");
          return;
        }
        //   await Gal.putImageBytes(image, name: name);
        context.showSuccessMessage(message: "Invoice saved to gallery");
        shareImage(context, image, name, name);
        return;
      } catch (e) {
        context.showErrorMessage(message: "Failed to save invoice: $e");
        return;
      }
    } else {
      context.showErrorMessage(message: "Storage permission denied");
      return;
    }
  }

  // Share image
  static Future<void> shareImage(
    context,
    Uint8List bytes,
    String filePath,
    String text,
  ) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/$filePath').create();
      await file.writeAsBytes(bytes);

      await Share.shareXFiles([XFile(file.path)]);
    } catch (e) {
      context.showErrorMessage(context, message: "Error sharing");
    }
  }
}
