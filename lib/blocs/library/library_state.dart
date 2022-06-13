part of 'library_bloc.dart';

class LibraryState extends Equatable {
  const LibraryState({
    this.isPermisionGranted = false,
    this.isLoading = true,
    this.imageAlbums = const [],
    this.videoAlbums = const [],
    this.allMedia    = const [],
  });

  final bool isPermisionGranted;
  final bool isLoading;
  final List<Album> imageAlbums;
  final List<Album> videoAlbums;
  final List<Medium> allMedia;  

  LibraryState copyWith({
    bool? isPermisionGranted,
    bool? isLoading,
    List<Album>? imageAlbums,
    List<Album>? videoAlbums,
    List<Medium>? allMedia
  }) => LibraryState(
    isPermisionGranted: isPermisionGranted ?? this.isPermisionGranted,
    isLoading: isLoading ?? this.isLoading,
    imageAlbums: imageAlbums ?? this.imageAlbums,
    videoAlbums: videoAlbums ?? this.videoAlbums,
    allMedia: allMedia ?? this.allMedia,
  );
  
  @override
  List<Object> get props => [isPermisionGranted, isLoading, imageAlbums, videoAlbums, allMedia];
}
