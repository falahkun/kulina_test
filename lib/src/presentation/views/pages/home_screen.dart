import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kulina_testapp/src/presentation/blocs/banner_vsmall_bloc.dart';
import 'package:kulina_testapp/src/presentation/blocs/banner_vtop_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    context.read<VSmallBloc>().add(FetchVSmallBanner());
    context.read<VTopBloc>().add(FetchVTopBanner());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<VTopBloc, VTopState>(
            builder: (_, state) {
              print(state);
              return Container();
            },
          ),

          BlocBuilder<VSmallBloc, VsmallState>(
            builder: (_, state) {
              print(state);
              return Container();
            },
          )
        ],
      ),
    );
  }
}
