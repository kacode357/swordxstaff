====================================================================================
                   HỆ THỐNG KAUTO MOD: SWORD X STAFF (UNITY NATIVE)
====================================================================================

[1] THÔNG TIN GÓI ỨNG DỤNG & CÔNG NGHỆ
------------------------------------------------------------------------------------
- Tên game:             Sword x Staff
- Package ID:           com.zjcs.android.vn
- Version / Build:      1.0.0 (versionCode: 156677)
- Nền tảng / Engine:    Unity ARM64-v8a (IL2CPP + HybridCLR Hot-update)
- Cơ chế Mod KAuto:     Native Android Overlay + Hardware-Accelerated Cyberpunk HUD
- File APK thành phẩm:  D:\swordxstaff\TOOL\dist\KAuto_Sword_x_Staff.apk
- Kích thước APK:       ~1.12 GB (Đã merge split APKs & ký chứng chỉ số v2 + v3)
------------------------------------------------------------------------------------

[2] KIẾN TRÚC KAUTO NATIVE OVERLAY (KHÁC H5 HẮC TÂY DU)
------------------------------------------------------------------------------------
1. Điểm khác biệt so với Hắc Tây Du:
   - Hắc Tây Du là web game (LayaAir HTML5) -> KAuto inject script JS vào DOM HTML.
   - Sword x Staff là Native Unity 3D (OpenGL/Vulkan SurfaceView) -> Không có DOM HTML.
2. Giải pháp Native Floating KAuto:
   - Hook điểm khởi chạy: com.leiting.unity.AppActivity.onCreate(Bundle)
   - Gọi: com.kauto.KAutoMenu.init(activity)
   - Lớp phủ gắn trực tiếp lên Activity DecorView (không cần quyền SYSTEM_ALERT_WINDOW):
     + Floating Pill/Badge: Nút tròn neon phát sáng "K", kéo thả tự do 360 độ trên màn hình.
     + Bảng điều khiển KAuto HUD: Giao diện kính mờ Glassmorphism (Cyberpunk Dark Neon),
       tích hợp các tab:
       * ⚡ Tốc độ (Speed Hack 1x - 20x)
       * 🤖 Tự động (Auto Vượt Ải, Nhận Quà, Bỏ qua Cutscene)
       * 📊 Thông số (Package, Architecture, Engine, FPS)
       * ⚙️ Cài đặt (Opacity HUD, Reset mặc định)
------------------------------------------------------------------------------------

[3] DANH MỤC LỆNH VẬN HÀNH TOOL (POWERSHELL)
------------------------------------------------------------------------------------
1. Compile lại mã nguồn KAuto Java/Smali:
   powershell -ExecutionPolicy Bypass -File "D:\swordxstaff\TOOL\scripts\build_kauto_dex.ps1"

2. Đóng gói & Ký APK thành phẩm (7 giây):
   powershell -ExecutionPolicy Bypass -File "D:\swordxstaff\TOOL\scripts\3_build_and_sign.ps1"

3. Build và cài đặt trực tiếp vào điện thoại / máy ảo qua ADB:
   powershell -ExecutionPolicy Bypass -File "D:\swordxstaff\TOOL\scripts\3_build_and_sign.ps1" -Install
====================================================================================
