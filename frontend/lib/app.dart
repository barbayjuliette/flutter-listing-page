import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './product_listing/presentation/pages/product_listing_page.dart';
import './product_listing/business/cubit/product_listing_cubit.dart';
import './product_listing/model/product_listing_repository.dart';

class OrganicsApp extends StatelessWidget {
  const OrganicsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Organics e-store',
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
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
          displayMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 14
          ),
          titleLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        )
      ),
      home: RepositoryProvider(
        create: (context) => ProductListingRepository(),
        child: BlocProvider(
          create: (context) => ProductListingCubit(
            repository: context.read<ProductListingRepository>()
          ),
          child: const ProductListingPage(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
