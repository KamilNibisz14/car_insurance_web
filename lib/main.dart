import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:car_insurance/features/add_policy/presentation/bloc/add_policy_bloc.dart';
import 'package:car_insurance/features/add_policy/presentation/navigation_bloc/navigation_bloc.dart';
import 'package:car_insurance/features/add_policy/presentation/pages/forms_page/policy_duration_form_page.dart';
import 'package:car_insurance/features/login/presentation/bloc/login_bloc.dart';
import 'package:car_insurance/features/main_page/presentation/pages/main_page.dart';
import 'package:car_insurance/features/search_policy/presentation/bloc/search_policy_bloc.dart';
import 'package:car_insurance/features/search_policy/presentation/navigation/search_policy_navigation_bloc.dart';

import 'features/add_policy/presentation/pages/forms_page/car_form_page.dart';
import 'features/add_policy/presentation/pages/forms_page/car_owner_form_page.dart';
import 'features/add_policy/presentation/pages/forms_page/car_user_form_page.dart';
import 'features/add_policy/presentation/pages/forms_page/insurance_coverage_form_page.dart';
import 'features/add_policy/presentation/pages/policy_view.dart';
import 'features/login/presentation/pages/login_page.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'features/search_policy/presentation/pages/policy_view_page.dart';
import 'features/search_policy/presentation/pages/search_policy_page.dart';
import 'locator.dart';

void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDI6FuselP0FfhMFBx907gynPjdxp5b8I0",
        projectId: "insurance-fe7e6",
        messagingSenderId: "1044801714070",
        appId: "1:1044801714070:web:a81a013d23919448004fb7"
    )
  );


  setup();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
      ),
      BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
      ),
      BlocProvider<AddPolicyBloc>(
        create: (context) => AddPolicyBloc(),
      ),
      BlocProvider<SearchPolicyNavigationBloc>(
        create: (context) => SearchPolicyNavigationBloc(),
      ),
       BlocProvider<SearchPolicyBloc>(
        create: (context) => SearchPolicyBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      initialRoute: LoginPage.id,
      routes: {
        //add policy
        InsuranceCoverageFormPage.id: (context) => const InsuranceCoverageFormPage(),
        CarFormPage.id: (context) => const CarFormPage(),
        CarUserFormPage.id: (context) => const CarUserFormPage(),
        CarOwnerFormPage.id: (context) => const CarOwnerFormPage(),
        PolicyDurationFormPage.id: (context) => const PolicyDurationFormPage(),
        AddPolicyViewPage.id: (context) => const AddPolicyViewPage(),
        // main
        LoginPage.id: (context) => const LoginPage(),
        MainPage.id: (context) => const MainPage(),

        //search policy
        SearchPolicyPage.id: (context) => const SearchPolicyPage(),
        PolicyViewPage.id: (context) => const PolicyViewPage(),
      },
    );
  }
}
