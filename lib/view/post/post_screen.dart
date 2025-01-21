import 'package:bloc_flutter/bloc/post/post_bloc.dart';
import 'package:bloc_flutter/bloc/post/post_event.dart';
import 'package:bloc_flutter/bloc/post/post_state.dart';
import 'package:bloc_flutter/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Screen"),
      ),
      body: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
        switch (state.postStatus) {
          case PostStatus.loading:
            return Center(child: CircularProgressIndicator());
          case PostStatus.failure:
            return Center(
              child: Text("Operation Failed"),
            );
          case PostStatus.success:
            return ListView.builder(
                itemCount: state.postModel.length,
                itemBuilder: (context, index) {
                  final items = state.postModel[index];
                  return ListTile(
                    title: Text(
                      items.email.toString(),
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      items.body.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                    ),
                    leading: CircleAvatar(
                      child: Text(items.id.toString()),
                    ),
                  );
                });
        }
      }),
    );
  }
}
