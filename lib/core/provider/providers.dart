import 'package:app_876/ui/Screens/BusinessSideApp/AuthScreens/BusinessSignInScreen/business_signin_viewmodel.dart';
import 'package:app_876/ui/Screens/BusinessSideApp/AuthScreens/BusinessSignUPScreen/business_signup_viewmodel.dart';
import 'package:app_876/ui/Screens/BusinessSideApp/AuthScreens/UploadBusinessFilesScreen/UploadBusinessFilesScreenModel.dart';
import 'package:app_876/ui/Screens/BusinessSideApp/AuthScreens/auth_viewModel.dart';
import 'package:app_876/ui/Screens/BusinessSideApp/AuthScreens/service_addition_viewmodel.dart';
import 'package:app_876/ui/Screens/CustomerSideApp/AuthScreens/customer_authscreens_viewmodel.dart';
import 'package:app_876/ui/Screens/CustomerSideApp/AuthScreens/CustomerSignINScreen/customer_signin_viewmodel.dart';
import 'package:app_876/ui/Screens/CustomerSideApp/AuthScreens/CustomerSignUPScreen/customer_sign_up_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  // Add your providers here

  ChangeNotifierProvider<BusinessSignUpViewModel>(
      create: (_) => BusinessSignUpViewModel()),
  //signin
  ChangeNotifierProvider<BusinessSignInViewModel>(
      create: (_) => BusinessSignInViewModel()),

  ChangeNotifierProvider<ServiceAdditionViewModel>(
      create: (_) => ServiceAdditionViewModel()),
  ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
  ChangeNotifierProvider<UploadBusinessFileViewModel>(
      create: (_) => UploadBusinessFileViewModel()),

  //Customer Providers>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  ChangeNotifierProvider<CustomerSignUpViewModel>(
      create: (_) => CustomerSignUpViewModel()),
  ChangeNotifierProvider<CustomerSignInViewModel>(
      create: (_) => CustomerSignInViewModel()),
  ChangeNotifierProvider<CustomerAuthScreenViewModel>(
      create: (_) => CustomerAuthScreenViewModel()),
];
