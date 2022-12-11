import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_bloc.dart';
import 'package:tv_series/presentation/widgets/tv_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListsTvPage extends StatefulWidget {
  static const ROUTE_NAME = '/lists-tv';

  @override
  _ListsTvPageState createState() => _ListsTvPageState();
}

class _ListsTvPageState extends State<ListsTvPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => BlocProvider.of<OnTheAirTvBloc>(context, listen: false).add(
        OnTheAirTv(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lists TV'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<OnTheAirTvBloc, TvState>(
          builder: (context, state) {
            if (state is OnTheAirTvLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is OnTheAirTvHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = state.resultOnTheAirTv[index];
                  return TvCard(tv);
                },
                itemCount: state.resultOnTheAirTv.length,
              );
            } else {
              return const Center(
                key: Key('error_message'),
                child: Text('Failed'),
              );
            }
          },
        ),
      ),
    );
  }
}
