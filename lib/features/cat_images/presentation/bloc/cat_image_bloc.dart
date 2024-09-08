// features/cat_images/presentation/bloc/cat_image_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/cat_image.dart';
import '../../domain/use_cases/fetch_cat_images.dart';

// Events
abstract class CatImageEvent {}

class FetchCatImagesEvent extends CatImageEvent {}

// States
abstract class CatImageState {}

class CatImageInitial extends CatImageState {}

class CatImageLoading extends CatImageState {}

class CatImageLoaded extends CatImageState {
  final List<CatImage> catImages;

  CatImageLoaded({required this.catImages});
}

class CatImageError extends CatImageState {
  final String message;

  CatImageError({required this.message});
}

// Bloc
class CatImageBloc extends Bloc<CatImageEvent, CatImageState> {
  final FetchCatImages fetchCatImages;

  CatImageBloc({required this.fetchCatImages}) : super(CatImageInitial()) {
    on<FetchCatImagesEvent>((event, emit) async {
      emit(CatImageLoading());
      try {
        final images = await fetchCatImages();
        emit(CatImageLoaded(catImages: images));
      } catch (e) {
        emit(CatImageError(message: e.toString()));
      }
    });
  }
}
