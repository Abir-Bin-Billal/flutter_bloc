import 'package:bloc_flutter/bloc/todo/todo_bloc.dart';
import 'package:bloc_flutter/bloc/todo/todo_event.dart';
import 'package:bloc_flutter/bloc/todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoBloc, TodoState>(builder: (context, state){
        if(state.todoList.isEmpty){
          return Center(child: Text("No todo list"),);
        }else if(state.todoList.isNotEmpty){
          return ListView.builder(
            itemCount: state.todoList.length,          
            itemBuilder: (context, index){
              return ListTile(
                title: Text(state.todoList[index]),
                trailing: IconButton(onPressed: (){
                  context.read<TodoBloc>().add(RemoveTotoEvent(task:state.todoList[index]));
                }, icon: Icon(Icons.delete))
              );
            });
        }else{
          return Text("hi");
        }
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
       for(int i = 0 ; i<10 ; i++){
         context.read<TodoBloc>().add(AddTotoEvent(task:'task$i'));
       }
      }),
    );
  }
}