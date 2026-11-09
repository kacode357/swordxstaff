# Cau hinh chung cho he thong Modding KAuto - Sword x Staff
$ROOT_DIR = "D:\swordxstaff\TOOL"
$TOOLS_DIR = "$ROOT_DIR\tools"

$JAVA = "C:\Program Files\Microsoft\jdk-17.0.21.21-hotspot\bin\java.exe"
if (-not (Test-Path $JAVA)) {
    $JAVA = "java"
}

$APKTOOL = "$TOOLS_DIR\apktool.jar"
$APKEDITOR = "$TOOLS_DIR\APKEditor.jar"
$BAKSMALI = "$TOOLS_DIR\baksmali.jar"
$SMALI = "$TOOLS_DIR\smali.jar"
$UBER_SIGNER = "$TOOLS_DIR\uber-apk-signer.jar"
$ADB = "C:\Program Files\Netease\MuMuPlayer\nx_main\adb.exe"

$ORIGINAL_XAPK = "$ROOT_DIR\original\Sword_x_Staff_1.0.0.xapk"
$ORIGINAL_APK = "$ROOT_DIR\original\Sword_x_Staff_Merged.apk"
$SOURCE_DIR = "$ROOT_DIR\source"
$PATCHES_DIR = "$ROOT_DIR\patches"
$DIST_DIR = "$ROOT_DIR\dist"
$OUTPUT_APK = "$DIST_DIR\KAuto_Sword_x_Staff.apk"
$PATCHED_DEX = "$ROOT_DIR\classes3_patched.dex"
$SMALI_CLASSES3 = "$ROOT_DIR\smali_classes3"
