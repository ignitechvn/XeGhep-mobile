# Xe Ghép Mobile App

Ứng dụng mobile cho nền tảng chia sẻ khách hàng xe ghép (4-7 chỗ) tại Việt Nam.

## 📱 Giới thiệu

Xe Ghép là nền tảng kết nối tài xế xe ghép với khách hàng, giúp tối ưu hóa hiệu suất vận chuyển và giảm thiểu việc bỏ khách thông qua cơ chế chia sẻ khách hàng.

## 🎯 Tính năng chính

### Cho Tài xế (Driver)
- ✅ **Xác thực OTP/SMS** + KYC cơ bản
- ✅ **Quản lý hồ sơ** và trạng thái sẵn sàng
- ✅ **Đăng khách lên sàn** (+1 điểm khi có người nhận)
- ✅ **Duyệt và nhận khách** (-1 điểm, có quota theo điểm)
- ✅ **Trao đổi với khách** (ẩn số điện thoại)
- ✅ **Điều hướng và nhắc nhở** thời gian
- ✅ **Xác nhận hoàn thành** chuyến (PIN/ảnh)
- ✅ **Thông báo real-time**
- ✅ **Lịch sử và khiếu nại**

### Cơ chế điểm số
- **Đăng khách**: +1 điểm
- **Nhận khách**: -1 điểm
- **Điểm tối thiểu**: ≥ 0 để nhận khách
- **Phạt**: ≤ -3 điểm bị khóa 7 ngày
- **Quota**: Giới hạn số khách nhận theo điểm

## 🏗️ Kiến trúc kỹ thuật

### Stack công nghệ
- **Framework**: Flutter 3.x + Dart
- **State Management**: MVVM + Riverpod
- **Navigation**: go_router
- **Networking**: Dio + Retrofit
- **Data Models**: Freezed + Json Serializable
- **Local Storage**: Hive/Isar (offline-first)
- **UI**: Material 3 + Custom Theme

### Cấu trúc dự án
```
lib/
├── app/                    # App configuration
│   ├── router/            # Navigation routes
│   ├── theme/             # UI theme & colors
│   └── constants/         # App constants
├── core/                  # Core utilities
│   ├── network/           # API client & interceptors
│   ├── storage/           # Local storage management
│   └── utils/             # Helper functions
├── data/                  # Data layer
│   ├── models/            # Data models (Freezed)
│   ├── sources/           # Data sources
│   └── repositories/      # Repository pattern
├── features/              # Feature modules
│   ├── auth/              # Authentication
│   ├── home/              # Home dashboard
│   ├── marketplace/       # Customer marketplace
│   ├── post_customer/     # Post customer form
│   ├── rides/             # Ride management
│   ├── score/             # Score system
│   ├── notifications/     # Push notifications
│   ├── profile/           # User profile
│   └── support/           # Customer support
└── shared/                # Shared components
    ├── widgets/           # Reusable widgets
    └── services/          # Shared services
```

## 🚀 Cài đặt và chạy

### Yêu cầu hệ thống
- Flutter SDK >= 3.10.0
- Dart SDK >= 3.0.0
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Cài đặt
```bash
# Clone repository
git clone <repository-url>
cd XeGhep-mobile

# Cài đặt dependencies
flutter pub get

# Chạy code generation
flutter packages pub run build_runner build --delete-conflicting-outputs

# Chạy ứng dụng
flutter run
```

### Build cho production
```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

## 📋 Lộ trình phát triển

### V1 (MVP) - Hiện tại
- ✅ Auth OTP + KYC
- ✅ Home dashboard
- ✅ Marketplace (duyệt/nhận khách)
- ✅ Đăng khách
- ✅ Chuyến đi (assign → complete/cancel)
- ✅ Điểm số cơ bản
- ✅ Thông báo cơ bản
- ✅ Cache nhẹ

### V2 (Sắp tới)
- 🔄 Realtime WebSocket
- 🔄 Ưu tiên tuyến ưa thích
- 🔄 Offline queue đầy đủ
- 🔄 Lịch sử/leaderboard điểm
- 🔄 Khiếu nại có theo dõi trạng thái

### V3 (Tương lai)
- 🔮 Tối ưu hiệu năng/điều hướng
- 🔮 Đề xuất thông minh theo thói quen
- 🔮 Gamification (huy hiệu)
- 🔮 Đa ngôn ngữ

## 🔒 Bảo mật

- **Xác thực**: OTP/SMS + JWT tokens
- **Bảo mật dữ liệu**: Ẩn số điện thoại khách
- **Call masking**: Gọi qua hệ thống trung gian
- **Biometric/PIN**: Khóa ứng dụng
- **Encryption**: Mã hóa dữ liệu nhạy cảm

## 📱 Quyền ứng dụng

- **Vị trí**: Điều hướng và tìm khách gần nhất
- **Camera**: Chụp ảnh bằng chứng hoàn thành
- **Thư viện ảnh**: Chọn ảnh từ thiết bị
- **Microphone**: Ghi âm khi cần thiết
- **Thông báo**: Push notifications

## 🤝 Đóng góp

1. Fork repository
2. Tạo feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Mở Pull Request

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

## 📞 Liên hệ

- **Email**: support@xeghep.com
- **Website**: https://xeghep.com
- **Hotline**: 1900-xxxx

---

**Xe Ghép** - Chia sẻ khách hàng, tối ưu hiệu suất! 🚗💨
