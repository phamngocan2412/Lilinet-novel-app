# Tổng Quan Hệ Thống Lilinet App

## 1. Giới Thiệu

**Lilinet App** là một ứng dụng xem phim trực tuyến Flutter sử dụng Clean Architecture, BLoC pattern, và Supabase backend.

## 2. Kiến Trúc Tổng Quan

### 2.1 Kiến Trúc Layer (Clean Architecture)

```
lib/
├── features/           # Feature modules
│   ├── auth/          # Xác thực người dùng
│   ├── movies/        # Phim, tìm kiếm, trending
│   ├── video_player/  # Trình phát video
│   ├── comments/      # Bình luận
│   ├── favorites/     # Danh sách yêu thích
│   ├── history/       # Lịch sử xem
│   ├── explore/       # Khám phá thể loại
│   ├── settings/      # Cài đặt
│   ├── main/          # Navigation & scaffold
│   └── splash/        # Màn hình khởi động
├── core/              # Shared utilities
│   ├── theme/         # Theme & colors
│   ├── widgets/       # Shared widgets
│   ├── network/       # Networking (Dio)
│   └── constants/     # API constants
└── routes/            # App navigation
```

### 2.2 Data Flow Architecture

```
UI (Presentation Layer)
    ↕
Bloc/Cubit (State Management)
    ↕
UseCase (Domain Layer)
    ↕
Repository (Data Layer)
    ↕
DataSource (Remote/Local)
```

## 3. Chức Năng Chính

### 3.1 Authentication (Auth)
**File chính:**
- `lib/features/auth/presentation/bloc/auth_bloc.dart`
- `lib/features/auth/presentation/widgets/auth_dialog.dart`
- `lib/features/auth/data/datasources/auth_supabase_datasource.dart`

**Chức năng:**
- Đăng nhập bằng email/password
- Đăng ký tài khoản mới
- Đăng xuất
- Quản lý trạng thái đăng nhập
- Hiển thị dialog yêu cầu đăng nhập

**State Management:** AuthBloc với các state: AuthInitial, AuthLoading, AuthAuthenticated, AuthUnauthenticated, AuthError

---

### 3.2 Movies (Phim)
**File chính:**
- `lib/features/movies/presentation/pages/home_page.dart`
- `lib/features/movies/presentation/bloc/trending_movies/trending_movies_bloc.dart`
- `lib/features/movies/presentation/bloc/movie_details/movie_details_bloc.dart`
- `lib/features/movies/presentation/bloc/search/search_bloc.dart`

**Chức năng:**
- **Home Page**: Hiển thị phim trending, carousel, grid phim
- **Trending**: Lấy danh sách phim trending từ API
- **Search**: Tìm kiếm phim theo tên
- **Movie Details**: 
  - Thông tin phim (title, description, rating, etc.)
  - Danh sách episodes (cho TV Series)
  - Chọn server streaming
  - Chọn season/episode
  - Thông tin diễn viên

**API Integration:** Consumet API

---

### 3.3 Video Player
**File chính:**
- `lib/features/video_player/presentation/widgets/video_player_content.dart`
- `lib/features/video_player/presentation/bloc/video_player_bloc.dart`
- `lib/features/video_player/presentation/widgets/miniplayer_widget.dart`

**Chức năng:**
- Phát video với media_kit
- Custom video controls (play/pause, seek, fullscreen)
- Miniplayer (phát nhỏ gọn khi navigate)
- Expanded player (toàn màn hình)
- Hỗ trợ subtitles
- Điều chỉnh độ sáng màn hình
- Giữ màn hình sáng khi xem

**Features:**
- Picture-in-picture mode
- Gesture controls (tap to pause, double tap to seek)
- Buffer progress indicator

---

### 3.4 Comments (Bình luận)
**File chính:**
- `lib/features/comments/presentation/widgets/comment_bottom_sheet.dart`
- `lib/features/comments/presentation/manager/comment_cubit.dart`
- `lib/features/comments/data/datasources/comment_remote_datasource.dart`

**Chức năng:**
- **Danh sách bình luận**: Hiển thị bình luận theo video
- **Thêm bình luận**: Người dùng đã đăng nhập có thể bình luận
- **Reply**: Trả lời bình luận (có @username trong input)
- **Like/Unlike**: Toggle like bình luận
- **Sort**: Sắp xếp theo Trending hoặc Newest
- **Home Trending Section**: Hiển thị bình luận trending trên home page

**Backend:** Supabase (comments, comment_likes tables)

**Guest Support:** Cho phép khách bình luận local, sync khi đăng nhập

---

### 3.5 Favorites (Danh sách yêu thích)
**File chính:**
- `lib/features/favorites/presentation/pages/favorites_page.dart`
- `lib/features/favorites/presentation/bloc/favorites_bloc.dart`
- `lib/features/favorites/presentation/widgets/favorite_button.dart`

**Chức năng:**
- Thêm/xóa phim khỏi danh sách yêu thích
- Hiển thị danh sách phim yêu thích
- Button favorite trên movie details
- Sync với Supabase

---

### 3.6 History (Lịch sử xem)
**File chính:**
- `lib/features/history/presentation/pages/recently_watched_page.dart`
- `lib/features/history/presentation/bloc/history_bloc.dart`

**Chức năng:**
- Lưu lịch sử phim đã xem
- Tiếp tục xem từ vị trí đã dừng
- Xóa lịch sử
- Hiển thị recently watched

---

### 3.7 Explore (Khám phá)
**File chính:**
- `lib/features/explore/presentation/pages/explore_page.dart`
- `lib/features/explore/presentation/pages/genre_movies_page.dart`
- `lib/features/explore/presentation/bloc/explore_bloc.dart`

**Chức năng:**
- Hiển thị danh sách thể loại (genres)
- Filter phim theo thể loại
- Xem phim theo genre
- Category chips

---

### 3.8 Settings (Cài đặt)
**File chính:**
- `lib/features/settings/presentation/pages/settings_page.dart`
- `lib/features/settings/presentation/bloc/settings_bloc.dart`

**Chức năng:**
- Theme settings (light/dark mode)
- Language settings
- App settings management
- Clear cache/data

---

### 3.9 Main Navigation
**File chính:**
- `lib/features/main/presentation/pages/main_screen.dart`
- `lib/features/main/presentation/pages/scaffold_with_player.dart`
- `lib/routes/app_router.dart`

**Chức năng:**
- Bottom navigation (Home, Explore, Favorites, Settings)
- Shell route with miniplayer
- Navigation management

## 4. Tech Stack

### 4.1 Core Technologies
- **Framework**: Flutter 3.x
- **Language**: Dart
- **Architecture**: Clean Architecture + BLoC Pattern

### 4.2 State Management
- `flutter_bloc`: BLoC pattern implementation
- `equatable`: Value equality for states

### 4.3 Dependency Injection
- `get_it`: Service locator
- `injectable`: Code generation for DI

### 4.4 Networking
- `dio`: HTTP client
- `retrofit`: Type-safe HTTP client
- `pretty_dio_logger`: Request/response logging

### 4.5 Backend
- **Supabase**: Authentication & Database
- **Consumet API**: Movie data & streaming links

### 4.6 Video Player
- `media_kit`: Cross-platform video player
- `screen_brightness`: Brightness control
- `wakelock_plus`: Keep screen on

### 4.7 Local Storage
- `hive_ce`: NoSQL local database
- `shared_preferences`: Simple key-value storage
- `flutter_secure_storage`: Secure storage

### 4.8 Navigation
- `go_router`: Declarative routing

### 4.9 UI/UX
- `google_fonts`: Custom fonts
- `cached_network_image`: Image caching
- `shimmer`: Loading shimmer effect
- `flutter_spinkit`: Loading indicators
- `smooth_page_indicator`: Page indicators

### 4.10 Utilities
- `freezed`: Immutable data classes
- `json_serializable`: JSON serialization
- `dartz`: Functional programming (Either)
- `intl`: Internationalization
- `connectivity_plus`: Network connectivity

## 5. Navigation Structure

```
/splash                    → SplashPage (initial)
/                          → MainScreen (with BottomNav)
├── /search               → SearchPage
├── /settings             → SettingsPage
├── /genre/:id            → GenreMoviesPage
└── /movie/:id            → MovieDetailsPage
```

## 6. Database Schema (Supabase)

### Tables:
- **profiles**: User profiles (id, user_name, avatar_url)
- **comments**: Comments (id, video_id, user_id, content, parent_id, likes, created_at)
- **comment_likes**: Like tracking (comment_id, user_id)
- **favorites**: User favorites (user_id, movie_id, movie_data)
- **watch_history**: Watch progress (user_id, video_id, progress, timestamp)

## 7. API Integration

### Consumet API Endpoints:
- `/trending`: Lấy phim trending
- `/search/:query`: Tìm kiếm phim
- `/info?id=:id`: Chi tiết phim
- `/watch?episodeId=:id`: Link streaming

## 8. Testing Strategy

- **Unit Tests**: Use cases, repositories
- **Widget Tests**: UI components
- **Integration Tests**: Feature flows
- **Mocking**: mocktail

## 9. Build Configuration

### Dev Dependencies:
- `build_runner`: Code generation
- `retrofit_generator`: API client generation
- `injectable_generator`: DI generation
- `hive_ce_generator`: Hive adapters
- `freezed`: Immutable classes
- `json_serializable`: JSON parsing

---

*Document Version: 1.0*
*Last Updated: January 2026*
