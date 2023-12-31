import 'package:comment_adder/applicaton/data/model/comment_photo_model.dart';
import 'package:comment_adder/applicaton/home/bloc/photo_bloc.dart';
import 'package:comment_adder/applicaton/home/constants.dart';
import 'package:comment_adder/applicaton/home/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HOMEScreen extends StatelessWidget {
  const HOMEScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController commentcontrol = TextEditingController();
    return Scaffold(
      bottomNavigationBar: const SizedBox(height: 50, child: Placeholder()),
      backgroundColor: const Color(0xffF8F8FF),
      body: SafeArea(
        child: SizedBox(
          child: Column(
            children: [
              const TopBoxWidget(),
              kSpaceBox,
              const SeasrchBox(),
              BlocConsumer<PhotoBloc, PhotoState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is PhotoLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is PhotoLoaded) {
                    final List<Photo> photos = state.photos;
                    return Expanded(
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            final Photo photo = photos[index];
                            if (photo == photos[7]) {
                              return GestureDetector(
                                onTap: () {
                                  add_cooment_box(context, commentcontrol);
                                },
                                child: CommentBox(
                                  icon: Icons.add,
                                  comment: photo.title,
                                  child: Image.network(photo.thumbnailUrl),
                                ),
                              );
                            }
                            return CommentBox(
                              icon: Icons.check,
                              comment: photo.title,
                              child: Image.network(photo.thumbnailUrl),
                            );
                          },
                        ),
                      ),
                    );
                  } else if (state is CommentAdded) {
                    final Photo photo = state.photo;
                    return CommentBox(
                        icon: Icons.check,
                        comment: photo.title,
                        child: Image.network(photo.thumbnailUrl));
                  } else if (state is PhotoError) {
                    return const Center(child: Text('Failed to fetch data.'));
                  } else {
                    return Container();
                  }
                },
              ),
              kSpaceBox,

              // GestureDetector(
              //     onTap: () {
              //       add_cooment_box(context);
              //     },
              //     child: const CommentBox(
              //       comment: 'thid is the 2nd comment',
              //       icon: Icons.add,
              //       child: Image.network(),
              //     )),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<dynamic> add_cooment_box(
      BuildContext context, TextEditingController commentcontrol) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Comment'),
          content: TextField(
            controller: commentcontrol,
            decoration: const InputDecoration(hintText: 'Enter your comment'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Comment canceled'),
                  ),
                );
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                debugPrint(commentcontrol.text);
                BlocProvider.of<PhotoBloc>(context)
                    .add(AddComment(commentcontrol.text));
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Comment added'),
                  ),
                );
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
