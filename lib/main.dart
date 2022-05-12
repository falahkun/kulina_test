import 'package:flutter/material.dart';
import 'package:kulina_testapp/injection.dart' as i;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kulina_testapp/src/domain/usecases/banner_usecase.dart';
import 'package:kulina_testapp/src/presentation/blocs/banner_vsmall_bloc.dart';
import 'package:kulina_testapp/src/presentation/blocs/banner_vtop_bloc.dart';
import 'package:kulina_testapp/src/presentation/views/pages/home_screen.dart';

void main() {
  i.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => VSmallBloc(i.locator.get<BannerUseCase>()),),
        BlocProvider(create: (_) => VTopBloc(i.locator.get<BannerUseCase>()),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
