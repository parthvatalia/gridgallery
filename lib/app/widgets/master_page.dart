
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MasterPage extends StatelessWidget {
  const MasterPage({
    super.key,
    this.appBar,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.annotationColor,
    this.floatingActionButtonLocation,
    this.backgroundColor,
    this.onWillPop,
    this.systemNavigationBarColor,
    this.canPop,
    this.onBackPressed,
    this.resizeToAvoidBottomInset,
    this.extendBody = false,
  });

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final Color? annotationColor;
  final Future<bool> Function()? onWillPop;
  final Color? systemNavigationBarColor;
  final bool? canPop;
  final void Function(bool)? onBackPressed;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool? resizeToAvoidBottomInset;
  final bool extendBody;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop ?? true,
      onPopInvoked: onBackPressed,
      child: WillPopScope(
        onWillPop: () async {
          if (onBackPressed != null && Navigator.of(context).canPop()) {
            return true;
          }
          if (!Navigator.of(context).canPop() && (canPop ?? false)) {
            await Future.delayed(const Duration(milliseconds: 100));
            return false;
          }
          return true;
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            systemNavigationBarColor:
                systemNavigationBarColor ?? Colors.transparent,
            systemNavigationBarDividerColor: Colors.transparent,
            systemStatusBarContrastEnforced: false,
            systemNavigationBarContrastEnforced: false,
            systemNavigationBarIconBrightness:


                     Brightness.dark,
            statusBarColor: Colors.transparent,
            statusBarIconBrightness:  Brightness.dark,
            statusBarBrightness:  Brightness.dark,
          ),
          child: Scaffold(
            extendBody: extendBody,
            floatingActionButtonLocation: floatingActionButtonLocation,
            backgroundColor:
                backgroundColor ?? Theme.of(context).colorScheme.surface,
            appBar: appBar,
            body: body,

            floatingActionButton: floatingActionButton,
            bottomNavigationBar: bottomNavigationBar,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          ),
        ),
      ),
    );
  }
}
