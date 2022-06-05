import 'package:balda2/helpers/user_provider.dart';
import 'package:balda2/spash_screen.dart';
import 'package:balda2/views/Add/views/adding_view.dart';
import 'package:balda2/views/Add/views/main_add_view.dart';
import 'package:balda2/views/advertisments/views/ads_main_view.dart';
import 'package:balda2/views/advertisments/views/ads_messages_view.dart';
import 'package:balda2/views/messages/views/chat_view.dart';
import 'package:balda2/views/messages/views/main_messages_view.dart';
import 'package:balda2/views/settings/views/change_password_view.dart';
import 'package:balda2/views/settings/views/change_phone_view.dart';
import 'package:balda2/views/settings/views/change_username_view.dart';
import 'package:balda2/views/settings/views/main_setings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'translations/codegen_loader.g.dart';
import 'views/Auth/first_view.dart';
import 'views/Auth/phone_verification_view.dart';
import 'views/Auth/signin_view.dart';
import 'views/Auth/signup_view.dart';
import 'tab_view.dart';
import 'views/settings/views/raise_subscription.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        path: 'assets/translations/',
        supportedLocales: const [
          Locale('ar'),
        ],
        startLocale: const Locale('ar'),
        assetLoader: const CodegenLoader(),
        fallbackLocale: const Locale('ar'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (_, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => UserProvider(),
          ),
        ],
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'balda2',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
          routes: {
            FirstView.routeName: (context) => const FirstView(),
            SignInView.routeName: (context) => const SignInView(),
            SignUpView.routeName: (context) => const SignUpView(),
            PhoneVerificationView.routeName: ((context) =>
                const PhoneVerificationView()),
            TabView.routeName: (context) => const TabView(),
            MainSettingsView.routeName: ((context) => const MainSettingsView()),
            ChnagePasswordView.routeName: ((context) =>
                const ChnagePasswordView()),
            ChangePhoneView.routeName: ((context) => const ChangePhoneView()),
            ChangeUserView.routeName: ((context) => const ChangeUserView()),
            MainMessagesView.routeName: (context) => const MainMessagesView(),
            ChatView.routeName: (context) => const ChatView(),
            MainAdsView.routeName: (context) => const MainAdsView(),
            AdsMessagesView.routeName: (context) => const AdsMessagesView(),
            MainAddView.routeName: (context) => const MainAddView(),
            AddingView.routeName: (context) => const AddingView(),
            RaiseSubscription.routeName: (context) => const RaiseSubscription(),
          },
        ),
      ),
    );
  }
}
