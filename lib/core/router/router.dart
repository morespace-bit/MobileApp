// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:learn_flutter/features/auth/viewmodel/auth_viewmodel.dart';
// import 'package:learn_flutter/features/auth/view/signup_page.dart';
// import 'package:learn_flutter/features/home/view/home_page.dart';
// import 'package:learn_flutter/splash_screen.dart';

// final routerProvider = Provider<GoRouter>((ref) {
//   return GoRouter(
//     initialLocation: '/splash',
//     routes: [
//       GoRoute(
//         path: '/splash',
//         builder: (context, state) => const SplashScreen(),
//       ),
//       GoRoute(path: '/signup', builder: (context, state) => const SignUpPage()),
//       GoRoute(path: '/home', builder: (context, state) => const HomePage()),
//     ],
//     redirect: (context, state) {
//       // You can add global redirect logic here if needed
//       return null;
//     },
//   );
// });
