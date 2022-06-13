import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:photo_gallery/photo_gallery.dart';

part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {

  LibraryBloc(bool isInitialPermisionGranted) : super(LibraryState(isPermisionGranted: isInitialPermisionGranted)) {

    on<LibrarySetIsLoadingEvent>(onLibrarySetIsLoadingEvent);
    on<LibrarySetPermissionGrantedEvent>(onLibrarySetPermissionGrantedEvent);
    on<LibrarySetImageAlbumsEvent>(onLibrarySetImageAlbumsEvent);
    on<LibrarySetVideoAlbumsEvent>(onLibrarySetVideoAlbumsEvent);
    on<LibrarySetAllMediaEvent>(onLibrarySetAllMediaEvent);
    
    initLibraryBloc();
  }

  //* Init Bloc
  void initLibraryBloc() async {
    if (!state.isPermisionGranted) {
      add(const LibrarySetIsLoadingEvent(false));
      add(const LibrarySetPermissionGrantedEvent(false));
      return;
    }
    List<Album> imageAlbums = await _getImageAlbum();
    List<Album> videoAlbums = await _getVideoAlbum();    
    List<Medium> allMedia   = await getAndSortAllMedia([...imageAlbums, ...videoAlbums]);

    add(LibrarySetImageAlbumsEvent(imageAlbums));
    add(LibrarySetVideoAlbumsEvent(videoAlbums));
    add(LibrarySetAllMediaEvent(allMedia));
    add(const LibrarySetIsLoadingEvent(false));
  }

  //* Events
  void onLibrarySetIsLoadingEvent(LibrarySetIsLoadingEvent event, Emitter<LibraryState> emit) {
    emit(state.copyWith(isLoading: event.isLoading));
  }

  void onLibrarySetPermissionGrantedEvent(LibrarySetPermissionGrantedEvent event, Emitter<LibraryState> emit) {
    emit(state.copyWith(isPermisionGranted: event.isPermisionGranted));
  }

  void onLibrarySetImageAlbumsEvent(LibrarySetImageAlbumsEvent event, Emitter<LibraryState> emit) {
    emit(state.copyWith(imageAlbums: event.imageAlbums));
  }

  void onLibrarySetVideoAlbumsEvent(LibrarySetVideoAlbumsEvent event, Emitter<LibraryState> emit) {
    emit(state.copyWith(videoAlbums: event.videoAlbums));
  }
  
  void onLibrarySetAllMediaEvent(LibrarySetAllMediaEvent event, Emitter<LibraryState> emit) {
    emit(state.copyWith(allMedia: event.allMedia));
  }

  //* Helpers
  Future<List<Album>> _getImageAlbum() async {
    return await PhotoGallery.listAlbums(mediumType: MediumType.image);
  }

  Future<List<Album>> _getVideoAlbum() async {
    return await PhotoGallery.listAlbums(mediumType: MediumType.video);
  }

  Future<List<Medium>> getAndSortAllMedia(List<Album> albums) async {
    List<Medium> allMedia = [];

    for (Album album in albums) {
      MediaPage mediaPage = await album.listMedia();
      allMedia = [...allMedia, ...mediaPage.items];
    }

    allMedia.sort((a,b) {      
      DateTime aDateTime = a.modifiedDate ?? a.creationDate ?? DateTime(1900);
      DateTime bDateTime = b.modifiedDate ?? b.creationDate ?? DateTime(1900);
      return aDateTime.compareTo(bDateTime);      
    });

    return allMedia;
  }


}
