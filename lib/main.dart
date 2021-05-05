import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concepts/logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc_concepts/presentation/router/app_router.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter(), connectivity: Connectivity(),));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  MyApp({@required this.appRouter,@required this.connectivity});

  @override
  Widget build(BuildContext myAppContext) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(create: (internetCubitContext) => InternetCubit(connectivity: connectivity)),
        BlocProvider<CounterCubit>(create: (counterCubitContext) => CounterCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}

