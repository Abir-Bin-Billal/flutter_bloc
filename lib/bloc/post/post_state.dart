import 'package:bloc_flutter/models/post_model.dart';
import 'package:bloc_flutter/utils/enums.dart';
import 'package:equatable/equatable.dart';

class PostState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postModel;
  final String message;

  const PostState(
      {this.postStatus = PostStatus.loading,
      this.postModel = const <PostModel>[],
      this.message = ''});

  PostState copyWith(
      {PostStatus? postStatus, List<PostModel>? postModel, String? message}) {
    return PostState(
        postStatus: postStatus ?? this.postStatus,
        postModel: postModel ?? this.postModel,
        message: message ?? this.message);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [postModel, postStatus];
}
