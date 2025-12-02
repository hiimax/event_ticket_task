import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:event_ticket_task/app/router.dart';
import 'package:event_ticket_task/resources/colors.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_i18n/loaders/file_translation_loader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventTicketApp extends StatefulWidget {
  const EventTicketApp({super.key});

  @override
  State<EventTicketApp> createState() => _EventTicketAppState();
}

class _EventTicketAppState extends State<EventTicketApp> {
  var savedThemeMode = AdaptiveThemeMode.light;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder:
          (_, child) => AdaptiveTheme(
            light: ThemeData(
              fontFamily: 'Poppins',
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                elevation: 0,
              ),
              appBarTheme: AppBarTheme(
                surfaceTintColor: Colors.white,
                elevation: 0,
                backgroundColor: AppColors.customColor6,
                titleTextStyle: TextStyle(
                  color: AppColors.neutral1000,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              scaffoldBackgroundColor: AppColors.customColor6,
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: AppColors.primaryColor,
                selectionColor: AppColors.primaryColor.withOpacity(0.3),
                selectionHandleColor: AppColors.primaryColor,
              ),
              tabBarTheme: const TabBarThemeData(
                labelStyle: TextStyle(
                  fontSize: 14,
                  color: AppColors.neutral1000,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 14,
                  color: AppColors.neutral600,
                ),
                indicator: BoxDecoration(),
                dividerColor: Colors.transparent,
              ),
              checkboxTheme: CheckboxThemeData(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
                side: const BorderSide(
                  color: AppColors.primaryColor,
                  width: 0.8,
                ),
                fillColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColors.primaryColor;
                  }
                  return AppColors.neutral10;
                }),
              ),
              radioTheme: RadioThemeData(
                fillColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColors.primaryColor;
                  }
                  return AppColors.neutral10;
                }),
              ),
              buttonTheme: ButtonThemeData(
                buttonColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                disabledColor: AppColors.neutral300,
                textTheme: ButtonTextTheme.primary,
              ),
              bottomSheetTheme: const BottomSheetThemeData(
                dragHandleColor: AppColors.dragColor,
                dragHandleSize: Size(60, 5),
                showDragHandle: true,
                backgroundColor: AppColors.skyWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
            ),
            dark: ThemeData(
              useMaterial3: true,
              brightness: Brightness.dark,
              colorSchemeSeed: Colors.blue,
            ),
            initial: AdaptiveThemeMode.light,
            // overrideMode: AdaptiveThemeMode.dark,
            builder: (theme, darkTheme) {
              return MaterialApp.router(
                localizationsDelegates: [
                  FlutterI18nDelegate(
                    translationLoader: FileTranslationLoader(),
                    missingTranslationHandler: (key, locale) {},
                  ),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (locale.languageCode == deviceLocale!.languageCode) {
                      return deviceLocale;
                    }
                  }
                  return supportedLocales.first;
                },
                // locale: local.locale,
                // supportedLocales: AppLocalizations.supportedLocales,
                debugShowCheckedModeBanner: false,
                darkTheme: darkTheme,
                theme: theme,
                routerConfig: router,
              );
            },
          ),
    );
  }
}
