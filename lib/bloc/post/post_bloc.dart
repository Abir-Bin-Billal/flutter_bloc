import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/repository/post_repository.dart';
import 'package:bloc_flutter/utils/enums.dart';

import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository = PostRepository();
  PostBloc() : super(PostState()) {
    on<PostFetched>(postFetched);
  }

  void postFetched(PostFetched event, Emitter<PostState> emit) async {
   await postRepository.fetchPost().then((value) {
      emit(state.copyWith(
          postStatus: PostStatus.success,
          postModel: value,
          message: "Successfully fetched"));
    }).onError((error, stackrace) {
      emit(state.copyWith(
          postStatus: PostStatus.failure, message: error.toString()));
    });
  }
}
