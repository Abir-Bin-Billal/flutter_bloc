import 'package:bloc_flutter/data/models/post_model.dart';
import 'package:bloc_flutter/utils/enums.dart';
import 'package:equatable/equatable.dart';

class PostState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postModel;
  final List<PostModel> tempPostModel;
  final String message;

  const PostState(
      {this.postStatus = PostStatus.loading,
      this.postModel = const <PostModel>[],
      this.tempPostModel = const <PostModel>[],
      this.message = ''});

  PostState copyWith(
      {PostStatus? postStatus, List<PostModel>? postModel, String? message,List<PostModel>? tempPostModel}) {
    return PostState(
        postStatus: postStatus ?? this.postStatus,
        postModel: postModel ?? this.postModel,
        tempPostModel: tempPostModel ?? this.tempPostModel,
        message: message ?? this.message);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [postModel, postStatus, tempPostModel, message];
}
