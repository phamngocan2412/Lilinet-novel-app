import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lilinet_app/features/auth/domain/entities/app_user.dart';
import 'package:lilinet_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lilinet_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:lilinet_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:lilinet_app/features/favorites/domain/entities/favorite.dart';
import 'package:lilinet_app/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:lilinet_app/features/favorites/presentation/bloc/favorites_event.dart';
import 'package:lilinet_app/features/favorites/presentation/bloc/favorites_state.dart';
import 'package:lilinet_app/features/favorites/presentation/widgets/favorite_button.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}
class MockFavoritesBloc extends MockBloc<FavoritesEvent, FavoritesState> implements FavoritesBloc {}

void main() {
  late MockAuthBloc mockAuthBloc;
  late MockFavoritesBloc mockFavoritesBloc;

  setUpAll(() {
    registerFallbackValue(AddFavoriteEvent(movieId: '1'));
    registerFallbackValue(RemoveFavoriteEvent('1'));
  });

  setUp(() {
    mockAuthBloc = MockAuthBloc();
    mockFavoritesBloc = MockFavoritesBloc();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (_) => mockAuthBloc),
          BlocProvider<FavoritesBloc>(create: (_) => mockFavoritesBloc),
        ],
        child: const Scaffold(
          body: FavoriteButton(
            movieId: '123',
            movieTitle: 'Test Movie',
            moviePoster: 'poster.jpg',
            movieType: 'Movie',
          ),
        ),
      ),
    );
  }

  final testUser = const AppUser(id: 'user1', email: 'test@example.com');

  testWidgets('renders favorite_border icon when not favorite', (tester) async {
    when(() => mockAuthBloc.state).thenReturn(Authenticated(testUser));
    when(() => mockFavoritesBloc.state).thenReturn(FavoritesLoaded(const []));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsNothing);
  });

  testWidgets('renders favorite icon (red) when favorite', (tester) async {
    when(() => mockAuthBloc.state).thenReturn(Authenticated(testUser));
    final favorite = Favorite(
      id: 'fav1',
      userId: 'user1',
      movieId: '123',
      createdAt: DateTime.now(),
    );
    when(() => mockFavoritesBloc.state).thenReturn(FavoritesLoaded([favorite]));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });

  testWidgets('adds to favorite when clicked and authenticated', (tester) async {
    when(() => mockAuthBloc.state).thenReturn(Authenticated(testUser));
    when(() => mockFavoritesBloc.state).thenReturn(FavoritesLoaded(const []));

    await tester.pumpWidget(createWidgetUnderTest());

    await tester.tap(find.byType(IconButton));
    await tester.pump();

    verify(() => mockFavoritesBloc.add(any(that: isA<AddFavoriteEvent>()))).called(1);
  });

  testWidgets('removes from favorite when clicked and already favorite', (tester) async {
    when(() => mockAuthBloc.state).thenReturn(Authenticated(testUser));
    final favorite = Favorite(
      id: 'fav1',
      userId: 'user1',
      movieId: '123',
      createdAt: DateTime.now(),
    );
    when(() => mockFavoritesBloc.state).thenReturn(FavoritesLoaded([favorite]));

    await tester.pumpWidget(createWidgetUnderTest());

    await tester.tap(find.byType(IconButton));
    await tester.pump();

    verify(() => mockFavoritesBloc.add(any(that: isA<RemoveFavoriteEvent>()))).called(1);
  });
}
