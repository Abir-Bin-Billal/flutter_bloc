import 'package:equatable/equatable.dart';

class TodoState extends Equatable {
  List<String> todoList;
  TodoState({this.todoList = const []});

  TodoState copyWith({List<String>? todoList}) {
    return TodoState(todoList: todoList ?? this.todoList);
  }

  @override
  List<Object?> get props => [todoList];
}
