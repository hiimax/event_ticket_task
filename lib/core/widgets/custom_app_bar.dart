import 'package:event_ticket_task/app/router.dart';
import 'package:event_ticket_task/core/utils/import.dart';
import 'package:event_ticket_task/core/widgets/animated_widgets.dart';
import 'package:event_ticket_task/resources/colors.dart';
import 'package:event_ticket_task/resources/resources.dart';

class CustomAppBar extends AppBar {
  final Function()? onTap;
  CustomAppBar({
    super.key,
    super.title,
    super.actions,
    super.bottom,
    this.onTap,
  }) : super(
         leading: ShrinkableButton(
           onTap:
               () =>
                   onTap != null
                       ? onTap()
                       : rootNavigatorKey.currentContext!.pop(),
           child: Padding(
             padding: const EdgeInsets.only(left: 15, bottom: 17),
             child: SvgPicture.asset(
               SvgIcons.backButton,
               width: 38,
               height: 38,
             ),
           ),
         ),
         leadingWidth: 52,
       );
}

class CustomBackButton extends AppBar {
  final String name;
  @override
  final double elevation;
  final Function()? onTap;
  CustomBackButton({
    super.key,
    super.actions,
    super.bottom,
    required this.name,
    this.onTap,
    this.elevation = 5,
  }) : super(
         leading: Padding(
           padding: const EdgeInsets.only(left: 8),
           child: ShrinkableButton(
             onTap:
                 () =>
                     onTap != null
                         ? onTap()
                         : rootNavigatorKey.currentContext!.pop(),
             child: SvgPicture.asset(
               SvgIcons.chevronLeft,
               width: 20,
               height: 20,
             ),
           ),
         ),
         leadingWidth: 30,
         centerTitle: false,
         title: Text(
           name,
           style: const TextStyle(
             color: AppColors.pureBlack,
             fontSize: 14,
             fontWeight: FontWeight.w400,
           ),
         ),
         elevation: elevation,
         shadowColor: AppColors.pureBlack.withOpacity(0.4),
         backgroundColor: AppColors.customColor6,
       );
}

class DashBoardAppBar extends AppBar {
  @override
  final Widget title;
  @override
  final double? leadingWidth;
  @override
  final Widget? leading;

  DashBoardAppBar({
    super.key,
    super.bottom,
    super.actions,
    this.leading,
    this.leadingWidth = 0,
    required this.title,
  }) : super(
         leadingWidth: leadingWidth,
         leading: leading,
         centerTitle: false,
         elevation: 5,
         shadowColor: AppColors.pureBlack.withOpacity(0.4),
         backgroundColor: AppColors.customColor6,
       );
}

class CustomSliverAppBar extends SliverAppBar {
  CustomSliverAppBar({super.key, super.title, super.actions})
    : super(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: ShrinkableButton(
            onTap: () => rootNavigatorKey.currentContext!.pop(),
            child: CircleAvatar(
              backgroundColor: AppColors.skyWhite,
              child: Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
            ),
          ),
        ),
      );
}
