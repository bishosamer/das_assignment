import 'package:das_assignment/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:das_assignment/models/user.dart';
import 'package:das_assignment/presentation/home_page.dart';
import 'package:das_assignment/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final UserRepository userRepository = UserRepository.instance;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => userRepository,
      child: BlocProvider(
        create: (context) => HomePageBloc(context.read<UserRepository>()),
        child: SafeArea(
          child: MaterialApp(
            title: 'DAS assignment',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            home: const HomePage(),
          ),
        ),
      ),
    );
  }
}
