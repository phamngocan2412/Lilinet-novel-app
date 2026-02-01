import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:lilinet_app/core/errors/failures.dart';
import 'package:lilinet_app/features/movies/domain/entities/movie.dart';
import 'package:lilinet_app/features/movies/domain/repositories/movie_repository.dart';
import 'package:lilinet_app/features/movies/domain/usecases/get_movie_details.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late GetMovieDetails useCase;
  late MockMovieRepository mockRepository;

  setUp(() {
    mockRepository = MockMovieRepository();
    useCase = GetMovieDetails(mockRepository);
  });

  group('GetMovieDetails', () {
    const tMovie = Movie(
      id: '1',
      title: 'Test Movie',
      rating: 8.5,
      poster: 'https://example.com/poster.jpg',
      cover: 'https://example.com/backdrop.jpg',
      description: 'Test description',
      genres: ['Action', 'Drama'],
      releaseDate: '2024-01-01',
      duration: '120 min',
      type: 'Movie',
      casts: [],
      recommendations: [],
    );

    const tParams = GetMovieDetailsParams(id: '1', type: 'Movie');

    test('should get movie details from repository', () async {
      // Arrange
      when(
        () => mockRepository.getMovieDetails(
          any(),
          provider: any(named: 'provider'),
          type: any(named: 'type'),
          fastMode: any(named: 'fastMode'),
        ),
      ).thenAnswer((_) async => const Right(tMovie));

      // Act
      final result = await useCase(tParams);

      // Assert
      expect(result, const Right(tMovie));
      verify(
        () => mockRepository.getMovieDetails(
          '1',
          provider: null,
          type: 'Movie',
          fastMode: false,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should get movie details with provider', () async {
      // Arrange
      const provider = 'animekai';
      const paramsWithProvider = GetMovieDetailsParams(
        id: '1',
        type: 'TV Series',
        provider: provider,
      );
      when(
        () => mockRepository.getMovieDetails(
          any(),
          provider: any(named: 'provider'),
          type: any(named: 'type'),
          fastMode: any(named: 'fastMode'),
        ),
      ).thenAnswer((_) async => const Right(tMovie));

      // Act
      final result = await useCase(paramsWithProvider);

      // Assert
      expect(result, const Right(tMovie));
      verify(
        () => mockRepository.getMovieDetails(
          '1',
          provider: provider,
          type: 'TV Series',
          fastMode: false,
        ),
      ).called(1);
    });

    test('should get movie details in fast mode', () async {
      // Arrange
      const fastParams = GetMovieDetailsParams(
        id: '1',
        type: 'Movie',
        fastMode: true,
      );
      when(
        () => mockRepository.getMovieDetails(
          any(),
          provider: any(named: 'provider'),
          type: any(named: 'type'),
          fastMode: any(named: 'fastMode'),
        ),
      ).thenAnswer((_) async => const Right(tMovie));

      // Act
      final result = await useCase(fastParams);

      // Assert
      expect(result, const Right(tMovie));
      verify(
        () => mockRepository.getMovieDetails(
          '1',
          provider: null,
          type: 'Movie',
          fastMode: true,
        ),
      ).called(1);
    });

    test('should return Failure when repository fails', () async {
      // Arrange
      const failure = Failure.server('Server error');
      when(
        () => mockRepository.getMovieDetails(
          any(),
          provider: any(named: 'provider'),
          type: any(named: 'type'),
          fastMode: any(named: 'fastMode'),
        ),
      ).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(tParams);

      // Assert
      expect(result, const Left(failure));
      verify(
        () => mockRepository.getMovieDetails(
          '1',
          provider: null,
          type: 'Movie',
          fastMode: false,
        ),
      ).called(1);
    });

    test(
      'should use default values when optional parameters not provided',
      () async {
        // Arrange
        when(
          () => mockRepository.getMovieDetails(
            any(),
            provider: any(named: 'provider'),
            type: any(named: 'type'),
            fastMode: any(named: 'fastMode'),
          ),
        ).thenAnswer((_) async => const Right(tMovie));

        // Act
        await useCase(tParams);

        // Assert
        verify(
          () => mockRepository.getMovieDetails(
            '1',
            provider: null,
            type: 'Movie',
            fastMode: false,
          ),
        ).called(1);
      },
    );
  });
}
