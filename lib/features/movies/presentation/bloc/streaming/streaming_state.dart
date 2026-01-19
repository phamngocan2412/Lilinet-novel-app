import 'package:equatable/equatable.dart';
import '../../../domain/entities/streaming_link.dart';
import '../../../domain/entities/subtitle.dart';

abstract class StreamingState extends Equatable {
  const StreamingState();

  @override
  List<Object?> get props => [];
}

class StreamingInitial extends StreamingState {}

class StreamingLoading extends StreamingState {}

class StreamingLoaded extends StreamingState {
  final List<StreamingLink> links;
  final List<Subtitle>? subtitles;
  final String? selectedServer;
  final String activeProvider; // Added

  const StreamingLoaded({
    required this.links,
    this.subtitles,
    this.selectedServer,
    this.activeProvider = 'Unknown',
  });

  @override
  List<Object?> get props => [links, subtitles, selectedServer, activeProvider];
}

class StreamingError extends StreamingState {
  final String message;

  const StreamingError(this.message);

  @override
  List<Object> get props => [message];
}
