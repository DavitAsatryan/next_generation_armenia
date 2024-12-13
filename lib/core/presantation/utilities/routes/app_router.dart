import 'package:go_router/go_router.dart';
import 'package:next_generation_armenia/core/presantation/screens/forgort_password_code/forgot_password_code.dart';
import 'package:next_generation_armenia/core/presantation/screens/about_us/about_us.dart';
import 'package:next_generation_armenia/core/presantation/screens/blog/blog.dart';
import 'package:next_generation_armenia/core/presantation/screens/contact_us/contact_us.dart';
import 'package:next_generation_armenia/core/presantation/screens/dashboard/dashboard.dart';
import 'package:next_generation_armenia/core/presantation/screens/donor/donor.dart';
import 'package:next_generation_armenia/core/presantation/screens/forgot_password/forgot_password.dart';
import 'package:next_generation_armenia/core/presantation/screens/home/home_screen.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_in/sign_in_screen.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_up/sign_up_donor/sign_up_donor_screen.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_up/sign_up_teacher/sign_up_teacher_screen.dart';
import 'package:next_generation_armenia/core/presantation/screens/teacher/teacher.dart';

class AppRouting {
  static const String home = '/';
  static const String signIn = 'sign-in';
  static const String dashboard = 'dashboard';
  static const String signUpTeacher = 'sign-up-teacher';
  static const String signUpDonor = 'sign-up-donor';
  static const String forgotPassword = 'forgot-password';
  static const String forgotPasswordCode = 'forgot-password-code';

  static const String teacher = 'teacher';
  static const String donor = 'donor';
  static const String aboutUs = 'about-us';
  static const String contactUs = 'contact-us';
  static const String blog = 'blog';

  static late final GoRouter router;

  static void setupRouter(String initialRoute) {
    router = GoRouter(
      initialLocation: initialRoute,
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return HomeScreen(child: child);
          },
          routes: [
            GoRoute(
              path: '/${AppRouting.dashboard}',
              builder: (context, state) => const Dashboard(),
            ),
            GoRoute(
              path: '/${AppRouting.teacher}',
              builder: (context, state) => const Teacher(),
            ),
            GoRoute(
              path: "/${AppRouting.donor}",
              builder: (context, state) => const Donor(),
            ),
            GoRoute(
              path: "/${AppRouting.aboutUs}",
              builder: (context, state) => const AboutUs(),
            ),
            GoRoute(
              path: "/${AppRouting.contactUs}",
              builder: (context, state) => const ContactUs(),
            ),
            GoRoute(
              path: "/${AppRouting.blog}",
              builder: (context, state) => const Blog(),
            ),
            GoRoute(
              path: "/${AppRouting.signIn}",
              builder: (context, state) => const SignInScreen(),
            ),
            GoRoute(
              path: "/${AppRouting.signUpTeacher}",
              builder: (context, state) => const SignUpTeacherScreen(),
            ),
            GoRoute(
              path: "/${AppRouting.signUpDonor}",
              builder: (context, state) => const SignUpDonorScreen(),
            ),
            GoRoute(
              path: "/${AppRouting.forgotPassword}",
              builder: (context, state) => const ForgotPassword(),
            ),
            GoRoute(
              path: "/${AppRouting.forgotPasswordCode}",
              builder: (context, state) => const ForgotPasswordCode(),
            ),
          ],
        ),
      ],
    );
  }
}
