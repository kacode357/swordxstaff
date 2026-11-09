# KAuto — Sword x Staff (`D:\swordxstaff\TOOL`)

Hệ thống quản lý, phân tích, patch client và đóng gói APK cho **Sword x Staff** theo chuẩn kiến trúc của `D:\hactaydu\TOOL` và `D:\anhhungtienlen\TOOL`.

---

## 1. Cấu trúc thư mục chuẩn

```text
TOOL/
├── original/
│   ├── Sword_x_Staff_1.0.0.xapk     # File XAPK gốc từ APKPure (Split APKs)
│   └── Sword_x_Staff_Merged.apk     # File APK đơn đã hợp nhất từ các split apk
├── source/                          # Mã nguồn Smali + Assets sau khi giải nén APK
├── patches/                         # Danh mục các bản vá (Smali / Hook / Assets)
├── client/                          # Pipeline giải mã / hook logic game (IL2CPP / HybridCLR)
├── features/                        # Mỗi tính năng mod là 1 module độc lập (Speed, Auto, ...)
├── scripts/
│   ├── config.ps1                   # Cấu hình đường dẫn Apktool / Apksigner / APKEditor
│   ├── 0_merge_xapk.ps1             # Hợp nhất các split apk từ XAPK thành 1 APK duy nhất
│   ├── 1_decompile.ps1              # Giải nén APK gốc bằng Apktool
│   ├── 2_apply_patches.ps1          # Chạy pipeline patch logic & assets
│   ├── 3_build_and_sign.ps1         # Đóng gói, zipalign & ký APK
│   └── run_all.ps1                  # Chạy trọn gói 1-click ra APK hoàn chỉnh
└── dist/
    └── KAuto_Sword_x_Staff.apk      # File APK hoàn chỉnh đã ký chữ ký v1 + v2
```

---

## 2. Các lệnh thường dùng

### Hợp nhất XAPK thành APK đơn
```powershell
powershell -ExecutionPolicy Bypass -File "D:\swordxstaff\TOOL\scripts\0_merge_xapk.ps1"
```

### Decompile APK
```powershell
powershell -ExecutionPolicy Bypass -File "D:\swordxstaff\TOOL\scripts\1_decompile.ps1"
```

### Build & Đóng gói APK hoàn chỉnh
```powershell
powershell -ExecutionPolicy Bypass -File "D:\swordxstaff\TOOL\scripts\run_all.ps1" -SkipDecompile
```

### Build và tự động cài vào thiết bị / giả lập qua ADB
```powershell
powershell -ExecutionPolicy Bypass -File "D:\swordxstaff\TOOL\scripts\run_all.ps1" -SkipDecompile -Install
```
