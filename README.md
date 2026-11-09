# DỰ ÁN MOD & TOOL: SWORD X STAFF (UNITY IL2CPP + HYBRIDCLR)

- **Package APK**: `com.zjcs.android.vn`
- **Tên trò chơi**: Sword x Staff
- **Phiên bản**: `1.0.0` (`versionCode: 156677`)
- **Định dạng gốc**: XAPK (Split APK gồm base APK + UnityDataAssetPack + config.arm64_v8a)
- **Engine Game**: Unity (ARM64-v8a IL2CPP + HybridCLR Hot-update)
- **Quản lý tài nguyên**: YooAsset Manifest V3 (`datapack.unity3d`)
- **Hệ thống âm thanh**: Wwise Audio Engine (`libAkSoundEngine.so`)
- **Bảo mật & Giám sát**: `libNetHTProtect.so`, `libCrashSight.so`, `libjoyboxencrypt.so`
- **CDN Máy chủ Update**: `https://zhangjcskrupdate.boltraygames.com/zhangjcskr/version/release/`
- **Thư mục dự án**: `D:\swordxstaff` (Cấu trúc chuẩn hóa đồng bộ với `D:\hactaydu`)

---

## 1. CẤU TRÚC THƯ MỤC DỰ ÁN

```text
D:\swordxstaff\
├── TOOL/                                     # Bộ công cụ Decompile, Patch & Build APK tự động
│   ├── original/                             # Chứa file gốc sạch
│   │   ├── Sword_x_Staff_1.0.0.xapk          # File XAPK gốc từ APKPure
│   │   └── Sword_x_Staff_Merged.apk          # File APK đơn đã hợp nhất các split apk
│   ├── source/                               # Mã nguồn Smali & Assets sau khi decompile bằng Apktool
│   ├── client/                               # Pipeline giải mã & xử lý logic client
│   ├── features/                             # Các module tính năng mod độc lập
│   │   ├── battle_speed/                     # Tăng tốc trận đấu / tốc độ game
│   │   ├── auto_menu/                        # Menu Mod / Floating UI in-game
│   │   └── player_info/                      # Trích xuất thông tin người chơi, chỉ số nhân vật
│   ├── patches/                              # Các bản vá tự động theo thứ tự
│   │   ├── 01_speed_hack/                    # Bản vá điều chỉnh tốc độ
│   │   ├── 02_mod_menu/                      # Bản vá tích hợp giao diện Mod
│   │   └── 03_bypass_protection/             # Bản vá vô hiệu hóa bảo vệ / CrashSight
│   ├── scripts/                              # Bộ script PowerShell 1-click
│   │   ├── config.ps1                        # Đường dẫn công cụ (Apktool, APKEditor, Apksigner, Key)
│   │   ├── 0_merge_xapk.ps1                  # Hợp nhất các split APK trong XAPK thành 1 APK duy nhất
│   │   ├── 1_decompile.ps1                   # Giải nén APK đơn bằng Apktool
│   │   ├── 2_apply_patches.ps1               # Áp dụng các bản vá trong thư mục patches/
│   │   ├── 3_build_and_sign.ps1              # Build APK, zipalign 4-byte và ký chữ ký số v1 + v2
│   │   └── run_all.ps1                       # Chạy trọn gói 1-click ra APK hoàn thiện
│   ├── dist/                                 # Chứa file APK thành phẩm
│   │   └── KAuto_Sword_x_Staff.apk           # File APK đã patch và ký sẵn sàng cài đặt
│   └── README.md                             # Hướng dẫn chi tiết bộ TOOL
├── game_assets/                              # Toàn bộ tài nguyên gốc đã trích xuất phục vụ Reverse Engineering
│   ├── config/                               # Các file cấu hình hệ thống
│   │   ├── build_manifest.json               # Manifest phiên bản (Build 156677, Client_VN)
│   │   ├── client_config.json                # URL danh sách máy chủ CDN
│   │   ├── features.config                   # Danh sách tính năng SDK, YooAsset, HybridCLR
│   │   ├── LogConfig.json                    # Cấu hình log CrashSight
│   │   └── google-services.json              # Firebase/Google OAuth config
│   ├── metadata/
│   │   └── global-metadata.dat               # IL2CPP Metadata v31 (44.26 MB - Không mã hóa)
│   ├── il2cpp/
│   │   └── libil2cpp.so                      # Thư viện ELF ARM64 (312.36 MB - 240+ il2cpp export)
│   ├── hybridclr/                            # 10 file C# Hot-update dạng CPMV
│   │   ├── Assembly-CSharp.mv.bytes          # Logic chính gameplay (877 KB)
│   │   ├── Console.mv.bytes                  # In-game console / debug (954 KB)
│   │   ├── Framework.mv.bytes                # Framework core (5.9 KB)
│   │   ├── Framework.FirstPass.Runtime.mv.bytes # Firstpass runtime (24.3 KB)
│   │   ├── GameFramework.Runtime.mv.bytes    # GameFramework engine (4.1 KB)
│   │   ├── Launch.mv.bytes                   # Mã khởi động game (18.9 KB)
│   │   ├── Luban.mv.bytes                    # Bảng dữ liệu cấu hình Luban (1 KB)
│   │   ├── LoopScrollRect.Runtime.mv.bytes   # UI Scroll component (2.1 KB)
│   │   ├── CustomWater.mv.bytes              # Shader/Water runtime (708 B)
│   │   ├── GFrameCore.Extensions.Cloneable.mv.bytes (1.4 KB)
│   │   └── Version.json                      # Phiên bản HybridCLR (Build 26, Min 156287, Latest 156677)
│   ├── icon.png                              # Icon gốc trò chơi
│   └── manifest.json                         # Manifest gói XAPK
├── tools/                                    # Các công cụ tra cứu, kiểm tra và trích xuất
│   ├── inspect_il2cpp.py                     # Kiểm tra header ELF libil2cpp & các hàm export
│   ├── inspect_hybridclr.py                  # Kiểm tra định dạng CPMV & token của HybridCLR
│   ├── dump_manifest.js                      # Đọc và định dạng toàn bộ file cấu hình JSON
│   └── fetch_server_list.js                  # Kiểm tra trạng thái máy chủ cập nhật CDN
├── NOTE.md                                   # Ghi chú tổng hợp thông số kỹ thuật & quy trình
└── README.md                                 # Tài liệu dự án
```

---

## 2. HƯỚNG DẪN VẬN HÀNH NHANH (QUICK START)

### Kiểm tra tài nguyên và thông số kỹ thuật
```powershell
python D:\swordxstaff\tools\inspect_il2cpp.py
python D:\swordxstaff\tools\inspect_hybridclr.py
node D:\swordxstaff\tools\dump_manifest.js
```

### Hợp nhất XAPK thành APK đơn (đã hoàn thành sẵn)
```powershell
powershell -ExecutionPolicy Bypass -File "D:\swordxstaff\TOOL\scripts\0_merge_xapk.ps1"
```

### Decompile APK để xem Smali & Assets
```powershell
powershell -ExecutionPolicy Bypass -File "D:\swordxstaff\TOOL\scripts\1_decompile.ps1"
```

### Đóng gói & Ký APK 1-click
```powershell
powershell -ExecutionPolicy Bypass -File "D:\swordxstaff\TOOL\scripts\run_all.ps1" -SkipDecompile
```
*(Thêm cờ `-Install` để tự động đẩy APK vào máy ảo/thiết bị qua ADB)*
