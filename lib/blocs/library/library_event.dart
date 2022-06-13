part of 'library_bloc.dart';

abstract class LibraryEvent extends Equatable {
  const LibraryEvent();

  @override
  List<Object> get props => [];
}

class LibrarySetImageAlbumsEvent extends LibraryEvent {

  final List<Album> imageAlbums;

  const LibrarySetImageAlbumsEvent(this.imageAlbums);

}

class LibrarySetVideoAlbumsEvent extends LibraryEvent {

  final List<Album> videoAlbums;

  const LibrarySetVideoAlbumsEvent(this.videoAlbums);

}

class LibrarySetAllMediaEvent extends LibraryEvent {

  final List<Medium> allMedia;

  const LibrarySetAllMediaEvent(this.allMedia);

}

class LibrarySetIsLoadingEvent extends LibraryEvent {

  final bool isLoading;

  const LibrarySetIsLoadingEvent(this.isLoading);

}

class LibrarySetPermissionGrantedEvent extends LibraryEvent {

  final bool isPermisionGranted;

  const LibrarySetPermissionGrantedEvent(this.isPermisionGranted);

}


