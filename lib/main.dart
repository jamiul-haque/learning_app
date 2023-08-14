import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:learning_app/app_bloc.dart';
// import 'package:learning_app/app_events.dart';
// import 'package:learning_app/app_states.dart';
import 'package:learning_app/common/routes/routes.dart';
import 'package:learning_app/common/values/colors.dart';
import 'package:learning_app/global.dart';

// import 'pages/register/register.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: AppColors.primaryText),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
          ),
          onGenerateRoute: AppPages.GenerateRouteSettings,
        ),
      ),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text("Flutter Bloc"),
//       ),
//       body: Center(
//           child: BlocBuilder<AppBlocs, AppStates>(builder: (context, state) {
//         return Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               "${BlocProvider.of<AppBlocs>(context).state.counter}",
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         );
//       })),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           FloatingActionButton(
//             heroTag: "heroTag1",
//             onPressed: () =>
//                 BlocProvider.of<AppBlocs>(context).add(Increment()),
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//           FloatingActionButton(
//             heroTag: "heroTag2",
//             onPressed: () =>
//                 BlocProvider.of<AppBlocs>(context).add(Decrement()),
//             tooltip: 'Decrement',
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }
