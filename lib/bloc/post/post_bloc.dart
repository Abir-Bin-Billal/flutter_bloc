import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/data/models/post_model.dart';
import 'package:bloc_flutter/data/repository/post_repository.dart';
import 'package:bloc_flutter/utils/enums.dart';

import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  List<PostModel> tempPostModel = [];
  final PostRepository postRepository = PostRepository();
  PostBloc() : super(PostState()) {
    on<PostFetched>(postFetched);
    on<SearchItem>(_fiteredItem);
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
  void _fiteredItem(SearchItem event, Emitter<PostState> emit){
    tempPostModel = state.postModel.where((element) => element.id.toString() == event.srcString.toString()).toList();
    emit(state.copyWith(tempPostModel : tempPostModel));
  }
}
