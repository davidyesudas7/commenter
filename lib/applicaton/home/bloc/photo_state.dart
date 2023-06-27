part of 'photo_bloc.dart';

abstract class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object> get props => [];
}

class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}

class PhotoLoaded extends PhotoState {
  final List<Photo> photos;

  const PhotoLoaded(this.photos);

  @override
  List<Object> get props => [photos];
}

class CommentAdded extends PhotoState {
  final Photo photo;

  const CommentAdded(this.photo);

  @override
  List<Object> get props => [photo];
}

class PhotoError extends PhotoState {}
