import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/bloc/todo/todo_event.dart';
import 'package:bloc_flutter/bloc/todo/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String?> todoList =[];
  TodoBloc() : super(TodoState()){
    on<AddTotoEvent>(_addTodoEvent);
    on<RemoveTotoEvent>(_removeTodoEvent);
  }

void _addTodoEvent(AddTotoEvent event , Emitter<TodoState> emit){
  todoList.add(event.task);
  emit(state.copyWith(todoList: List.from(todoList)));
}

void _removeTodoEvent(RemoveTotoEvent event , Emitter<TodoState> emit){
  todoList.remove(event.task);
  emit(state.copyWith(todoList: List.from(todoList)));
}

}