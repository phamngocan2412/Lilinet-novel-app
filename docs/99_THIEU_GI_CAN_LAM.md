# Dự Án Lilinet App - Tổng Hợp Những Gì Đang Thiếu

## 📊 Tổng Quan Tiến Độ

| Feature | Status | Priority | Est. Time |
|---------|--------|----------|-----------|
| Authentication | ✅ Core Done | High | 2-3 days |
| Movies/Search | ✅ Core Done | High | Done |
| Video Player | ✅ Core Done | High | Done |
| Comments | ✅ Core Done | High | Done |
| Favorites | ✅ Core Done | Medium | Done |
| History | ✅ Core Done | Medium | Done |
| Explore | ⚠️ Basic | Medium | 3-5 days |
| Settings | ⚠️ Basic | Low | 2-3 days |

---

## 🔴 HIGH PRIORITY - Cần Làm Ngay

### 1. Authentication Enhancements
**Mức độ:** Quan trọng | **Thời gian:** 2-3 ngày

- [ ] **Quên mật khẩu** - Password reset flow via email
- [ ] **Email verification** - Xác thực email sau đăng ký
- [ ] **Thay đổi mật khẩu** - Change password trong settings
- [ ] **Cập nhật profile** - Edit username, avatar
- [ ] **Delete account** - Xóa tài khoản và dữ liệu

**Lý do:** Security và user management cơ bản còn thiếu.

---

### 2. Error Handling & Resilience
**Mức độ:** Quan trọng | **Thời gian:** 1-2 ngày

- [ ] **Global error handler** - Bắt lỗi toàn app
- [ ] **Retry mechanism** - Tự động retry API calls
- [ ] **Offline indicator** - Hiển thị khi mất kết nối
- [ ] **Graceful degradation** - App vẫn chạy khi API lỗi
- [ ] **Error logging** - Log lỗi để debug

**Files cần sửa:**
- `core/network/dio_client.dart` - Add interceptors
- `core/widgets/error_widget.dart` - Improve UI
- `app.dart` - Global error boundary

---

### 3. Real-time Features
**Mức độ:** Quan trọng | **Thời gian:** 3-4 ngày

- [ ] **Realtime comments** - Supabase realtime subscriptions
- [ ] **Push notifications** - FCM setup cho replies
- [ ] **Live sync** - Đồng bộ likes/replies real-time

**Implementation:**
```dart
// Add to CommentCubit
_supabase.channel('comments').on(
  RealtimeListenTypes.postgresChanges,
  ...
).subscribe();
```

---

## 🟡 MEDIUM PRIORITY - Nên Có

### 4. Video Player Enhancements
**Thời gian:** 3-5 ngày

- [ ] **Cast to TV** - Chromecast/AirPlay support
- [ ] **Picture-in-picture** - System PiP mode
- [ ] **Quality selector** - Manual quality switch
- [ ] **Audio track selection** - Multi-language audio
- [ ] **Subtitle sync adjustment** - Delay/advance subtitles
- [ ] **Playback speed** - 0.5x, 1.5x, 2x
- [ ] **Sleep timer** - Tự động dừng sau X phút
- [ ] **Skip intro/outro** - Auto-skip

---

### 5. Search & Filter Improvements
**Thời gian:** 2-3 ngày

- [ ] **Advanced search** - Filter by actor, director, year
- [ ] **Search suggestions** - Autocomplete
- [ ] **Search history** - Lưu lịch sử tìm kiếm
- [ ] **Recent searches** - Quick access
- [ ] **Filter by status** - Completed, Ongoing, etc.

---

### 6. Comments Enhancements
**Thời gian:** 2-3 ngày

- [ ] **Edit comment** - Update nội dung (đã có flag)
- [ ] **Delete comment** - Soft delete (đã có flag)
- [ ] **Report comment** - Báo cáo vi phạm
- [ ] **Rich text** - Bold, italic, links
- [ ] **Emoji picker** - Chọn emoji
- [ ] **Image attachments** - Upload ảnh
- [ ] **@mentions** - Autocomplete usernames
- [ ] **Comment pagination** - Load more replies

---

### 7. Favorites & History Improvements
**Thời gian:** 2-3 ngày

- [ ] **Favorites folders** - Tạo collection riêng
- [ ] **Watch statistics** - Thời gian xem, số phim
- [ ] **Binge watching detection** - Nhận diện xem nhiều tập
- [ ] **Auto-clear history** - Xóa lịch sử sau X ngày
- [ ] **Export data** - Export favorites/history

---

### 8. Analytics & Tracking
**Thời gian:** 2-3 ngày

- [ ] **Firebase Analytics** - Track user behavior
- [ ] **Crashlytics** - Báo cáo crash
- [ ] **Performance monitoring** - Theo dõi performance
- [ ] **User engagement metrics** - DAU, MAU, retention

---

## 🟢 LOW PRIORITY - Nice to Have

### 9. UI/UX Polish
**Thời gian:** 3-5 ngày

- [ ] **Animations** - Hero transitions, micro-interactions
- [ ] **Skeleton screens** - Shimmer improvements
- [ ] **Empty states** - Better empty illustrations
- [ ] **Pull-to-refresh** - Tất cả lists
- [ ] **Infinite scroll** - Pagination cho tất cả
- [ ] **Share features** - Share phim qua social
- [ ] **Deep linking** - Mở app từ links

---

### 10. Advanced Features
**Thời gian:** 5-7 ngày

- [ ] **Download for offline** - Tải phim xem offline
- [ ] **Parental controls** - Giới hạn nội dung
- [ ] **Multiple profiles** - Tài khoản con trong 1 account
- [ ] **Watch parties** - Xem cùng bạn bè (sync playback)
- [ ] **Recommendations** - ML-based suggestions
- [ ] **Social features** - Follow users, activity feed

---

### 11. Platform-Specific

#### iOS
- [ ] **iOS-specific permissions** - Photo, notifications
- [ ] **App Store screenshots** - Marketing assets
- [ ] **TestFlight setup** - Beta testing

#### Android
- [ ] **Android 12+ splash screen** - Native splash
- [ ] **Notification channels** - Categories
- [ ] **App bundles** - Optimized builds

---

## 🐛 Known Issues / Bugs

### Cần Fix Ngay
1. **Like/Unlike** - Đã fix, cần test lại ✅
2. **Reply UI** - Đã fix @username ✅
3. **Guest comments** - Sync chưa hoàn thiện
4. **Video player orientation** - Chưa xử lý rotation tốt
5. **Memory leaks** - Kiểm tra Bloc disposal

### Technical Debt
1. **Deprecated APIs** - `withOpacity()` cần đổi thành `withValues()`
2. **Print statements** - Cần thay bằng proper logging
3. **Error handling** - Chưa consistent
4. **Type safety** - Một số chỗ dùng `dynamic`
5. **Tests** - Coverage còn thấp (~30%)

---

## 📋 Missing Documentation

- [ ] **API documentation** - Swagger/OpenAPI cho Consumet
- [ ] **Backend setup guide** - Supabase schema setup
- [ ] **Deployment guide** - Build & release process
- [ ] **Contributing guide** - Cho developers khác
- [ ] **Changelog** - Version history
- [ ] **Privacy policy** - Legal requirement
- [ ] **Terms of service** - Legal requirement

---

## 🛠 Infrastructure & DevOps

### CI/CD
- [ ] **GitHub Actions** - Automated testing
- [ ] **Code coverage** - codecov.io integration
- [ ] **Automated builds** - Build APK/IPA on PR
- [ ] **Release automation** - Auto-publish to stores

### Monitoring
- [ ] **Sentry integration** - Error tracking
- [ ] **Performance monitoring** - Firebase Performance
- [ ] **Uptime monitoring** - API health checks

---

## 📊 Database Schema Missing

### Cần Thêm Tables
```sql
-- Notifications
CREATE TABLE notifications (
  id UUID PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id),
  type TEXT, -- 'reply', 'like', 'new_episode'
  title TEXT,
  body TEXT,
  data JSONB,
  is_read BOOLEAN DEFAULT false,
  created_at TIMESTAMP DEFAULT NOW()
);

-- User sessions/devices
CREATE TABLE user_devices (
  id UUID PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id),
  device_token TEXT, -- FCM token
  device_type TEXT, -- 'ios', 'android'
  last_active TIMESTAMP
);

-- Reports (spam/abuse)
CREATE TABLE reports (
  id UUID PRIMARY KEY,
  reporter_id UUID REFERENCES auth.users(id),
  target_type TEXT, -- 'comment', 'user'
  target_id TEXT,
  reason TEXT,
  status TEXT DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT NOW()
);
```

---

## 🎯 Recommended Roadmap

### Sprint 1 (1-2 tuần) - Core Stability
- Fix known bugs
- Error handling improvements
- Authentication enhancements
- Real-time comments

### Sprint 2 (2-3 tuần) - User Experience
- Video player improvements
- Search & filter
- Comments enhancements
- UI polish

### Sprint 3 (2-3 tuần) - Features
- Favorites folders
- Watch statistics
- Download offline
- Push notifications

### Sprint 4 (2 tuần) - Launch Prep
- Analytics setup
- Performance optimization
- Store assets
- Documentation

---

## 💡 Quick Wins (1-2 ngày)

Những thứ dễ làm nhưng impact cao:

1. ✅ **Fix like/unlike** - Đã xong
2. ✅ **Fix reply UI** - Đã xong
3. [ ] **Add loading states** - Shimmer cho tất cả lists
4. [ ] **Empty states** - Better "no data" UI
5. [ ] **Error messages** - User-friendly errors
6. [ ] **Pull-to-refresh** - Cho tất cả pages
7. [ ] **Share button** - Share phim
8. [ ] **Rate app** - In-app review prompt

---

## 📈 Success Metrics

Cần track sau khi launch:

- **DAU/MAU** - Daily/Monthly active users
- **Retention** - Day 1, 7, 30 retention
- **Session duration** - Thời gian xem TB
- **Videos watched** - Số phim xem/user
- **Comments per user** - Engagement
- **Crash rate** - < 1%
- **App store rating** - > 4.0

---

## 🎓 Learning Resources Cần Bổ Sung

- Clean Architecture pattern
- BLoC pattern advanced
- Supabase security (RLS policies)
- Flutter performance optimization
- Testing strategies (unit/widget/integration)

---

*Document Version: 1.0*
*Last Updated: January 2026*
*Next Review: After Sprint 1*
