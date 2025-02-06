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
    super.initState();
    context.read<PostBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Post Screen"),
        centerTitle: true,
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
            return Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Search your item", icon: Icon(Icons.search)),
                  onChanged: (fliterSearch) {
                    context.read<PostBloc>().add(SearchItem(fliterSearch));
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: state.tempPostModel.isEmpty
                          ? state.postModel.length
                          : state.tempPostModel.length,
                      itemBuilder: (context, index) {
                        if (state.tempPostModel.isNotEmpty) {
                          final item = state.tempPostModel[index];
                          return Card(
                            color: const Color.fromARGB(31, 205, 193, 193),
                            child: ListTile(
                              title: Text(
                                item.email.toString(),
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                item.body.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          );
                        } else {
                          final items = state.postModel[index];
                          return Card(
                            color: const Color.fromARGB(31, 205, 193, 193),
                            child: ListTile(
                              title: Text(
                                items.email.toString(),
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                items.body.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          );
                        }
                      }),
                ),
              ],
            );
        }
      }),
    );
  }
}
