import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
const TodoEvent();
}

class AddTotoEvent extends TodoEvent{
  final String? task;
 const AddTotoEvent({this.task});

  @override
  List<Object?> get props => [task];
}
class RemoveTotoEvent extends TodoEvent{
  final Object task;
  const RemoveTotoEvent({required this.task});
  @override
  List<Object?> get props => [];
}