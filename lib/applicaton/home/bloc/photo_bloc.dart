import 'package:comment_adder/applicaton/data/model/comment_photo_model.dart';
import 'package:comment_adder/applicaton/data/repo/api_repo_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final ApiProvider apiProvider = ApiProvider();
  PhotoBloc() : super(PhotoInitial()) {
    on<FetchPhotos>((event, emit) async {
      emit(PhotoLoading());
      try {
        final List<Photo> photos = await apiProvider.fetchPhotos();
        emit(PhotoLoaded(photos));
      } catch (e) {
        emit(PhotoError());
      }
    });

    on<AddComment>((event, emit) async {
      emit(PhotoLoading());
      try {
        final Photo photo = await apiProvider.addComment(event.comment);
        emit(CommentAdded(photo));
      } catch (e) {
        emit(PhotoError());
      }
    });
  }
}
