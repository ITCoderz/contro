import 'package:contro/reusable_widgets/business_category_selection_widget/business_category_selection_widget.dart';
import 'package:contro/screen/auth/splash/view/splash_screen.dart';
import 'package:contro/utils/text_styles/text_styles.dart';
import 'package:contro/utils/theme/theme_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'bindings/initializing_dependency.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    if (kDebugMode) {
      return ErrorWidget(details.exception);
    }
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        alignment: Alignment.center,
        child: const Text(
          'Error!\nWe are sorry for interruption due to a Network Failure.',
          textAlign: TextAlign.center,
          style: CustomTextStyles.darkGreyColor416,
        ),
      ),
    );
  };
  CustomThemeData.systemOverlayStyle();
  runApp(
    const ControApp(),
  );
}

class ControApp extends StatelessWidget {
  const ControApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Contro',
      theme: CustomThemeData.lightViewTheme,
      initialBinding: InitializingDependency(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      // home: const BusinessCategorySelectionWidget(),
    );
  }
}
