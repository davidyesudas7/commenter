part of 'photo_bloc.dart';

abstract class PhotoEvent extends Equatable {
  const PhotoEvent();

  @override
  List<Object> get props => [];
}

class FetchPhotos extends PhotoEvent {}

class AddComment extends PhotoEvent {
  final String comment;

  const AddComment(this.comment);

  @override
  List<Object> get props => [comment];
}
