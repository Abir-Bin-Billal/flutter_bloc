import 'package:bloc_flutter/bloc/counter/counter_bloc.dart';
import 'package:bloc_flutter/bloc/counter/counter_event.dart';
import 'package:bloc_flutter/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Center(
                child: Text(state.counter.toString(), style: TextStyle(fontSize: 60),),
              );
            }
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              context.read<CounterBloc>().add(IncreamentCounter());
            }, child: Text("increament")),
            SizedBox(width: 10,),
            ElevatedButton(onPressed: (){
              context.read<CounterBloc>().add(DecreamentCounter());
            }, child: Text("Decreament"))
          ],
        )
        ],
      ),
    );
  }
}
