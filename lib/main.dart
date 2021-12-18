import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networkcheckcubit/internetConnectionCubit/internet_check_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Cubit Network Check'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  InternetCheckCubit internetCheckCubit = InternetCheckCubit();

  @override
  void initState() {
    internetCheckCubit.checkNetwork();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<InternetCheckCubit, bool>(
        bloc: internetCheckCubit,
        builder: (context, state) {
          if (state) {
            return Center(
              child: Text(
                'You connected to network',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .apply(color: Colors.green),
                textAlign: TextAlign.center,
              ),
            );
          }
          return Center(
            child: Text(
              'No Internet connected pleas check internet connection and tyr again',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .apply(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
