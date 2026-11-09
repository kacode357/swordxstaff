$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

# 1. Update KAutoBridge.smali in client and smali_us_classes2
$bridgeSmaliCode = @'
.class public Lcom/kauto/KAutoBridge;
.super Ljava/lang/Object;
.source "KAutoBridge.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "KAutoBridge"

.field public static playerName:Ljava/lang/String; = "Adventurer"

.field public static playerLevel:Ljava/lang/String; = "Lv. 1"

.field public static playerPower:Ljava/lang/String; = "--"

.field public static playerServer:Ljava/lang/String; = "Global S1"


# instance fields
.field private final activity:Landroid/app/Activity;

.field private final menu:Lcom/kauto/KAutoMenu;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    :try_start_0
    const-string v0, "kauto_speed"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    const-string v1, "KAutoBridge"

    const-string v2, "libkauto_speed.so loaded successfully in clinit"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lcom/kauto/KAutoMenu;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/kauto/KAutoBridge;->activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/kauto/KAutoBridge;->menu:Lcom/kauto/KAutoMenu;

    return-void
.end method

.method static synthetic access$000(Lcom/kauto/KAutoBridge;)Lcom/kauto/KAutoMenu;
    .registers 1

    iget-object p0, p0, Lcom/kauto/KAutoBridge;->menu:Lcom/kauto/KAutoMenu;

    return-object p0
.end method

.method public static native nativeSetSpeed(F)V
.end method

.method public static native nativeIsSpeedReady()Z
.end method

.method public static onGameReport(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    if-nez p1, :cond_exit
    return-void

    :cond_exit
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "roleName"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_name_1
    const-string v1, "roleName"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    sput-object v1, Lcom/kauto/KAutoBridge;->playerName:Ljava/lang/String;
    goto :check_level

    :cond_name_1
    const-string v1, "role_name"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_name_2
    const-string v1, "role_name"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    sput-object v1, Lcom/kauto/KAutoBridge;->playerName:Ljava/lang/String;
    goto :check_level

    :cond_name_2
    const-string v1, "name"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_check_level
    const-string v1, "name"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    sput-object v1, Lcom/kauto/KAutoBridge;->playerName:Ljava/lang/String;

    :cond_check_level
    :check_level
    const-string v1, "roleLevel"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_lvl_1
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "Lv. "
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v2, "roleLevel"
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    sput-object v1, Lcom/kauto/KAutoBridge;->playerLevel:Ljava/lang/String;
    goto :check_power

    :cond_lvl_1
    const-string v1, "PlayerLevel"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_lvl_2
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "Lv. "
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v2, "PlayerLevel"
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v2
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    sput-object v1, Lcom/kauto/KAutoBridge;->playerLevel:Ljava/lang/String;
    goto :check_power

    :cond_lvl_2
    const-string v1, "role_level"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_check_power
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "Lv. "
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v2, "role_level"
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    sput-object v1, Lcom/kauto/KAutoBridge;->playerLevel:Ljava/lang/String;

    :cond_check_power
    :check_power
    const-string v1, "CombatRating"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_pwr_1
    const-string v1, "CombatRating"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    move-result-object v1
    const-string v2, "TotalPower"
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :cond_check_server
    const-string v2, "TotalPower"
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v1
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v1
    sput-object v1, Lcom/kauto/KAutoBridge;->playerPower:Ljava/lang/String;
    goto :check_server

    :cond_pwr_1
    const-string v1, "TotalPower"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_pwr_2
    const-string v1, "TotalPower"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v1
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v1
    sput-object v1, Lcom/kauto/KAutoBridge;->playerPower:Ljava/lang/String;
    goto :check_server

    :cond_pwr_2
    const-string v1, "power"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_check_server
    const-string v1, "power"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    sput-object v1, Lcom/kauto/KAutoBridge;->playerPower:Ljava/lang/String;

    :cond_check_server
    :check_server
    const-string v1, "serverName"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_srv_1
    const-string v1, "serverName"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    sput-object v1, Lcom/kauto/KAutoBridge;->playerServer:Ljava/lang/String;
    goto :done

    :cond_srv_1
    const-string v1, "server_name"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :cond_srv_2
    const-string v1, "server_name"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    sput-object v1, Lcom/kauto/KAutoBridge;->playerServer:Ljava/lang/String;
    goto :done

    :cond_srv_2
    const-string v1, "ServerId"
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :done
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "Server "
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v2, "ServerId"
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v2
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    sput-object v1, Lcom/kauto/KAutoBridge;->playerServer:Ljava/lang/String;

    :done
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    return-void
.end method

.method public getPlayerInfo()Ljava/lang/String;
    .registers 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{\"name\":\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/kauto/KAutoBridge;->playerName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\",\"level\":\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/kauto/KAutoBridge;->playerLevel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\",\"power\":\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/kauto/KAutoBridge;->playerPower:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\",\"server\":\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/kauto/KAutoBridge;->playerServer:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\"}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public close()V
    .registers 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/kauto/KAutoBridge;->activity:Landroid/app/Activity;

    new-instance v1, Lcom/kauto/KAutoBridge$4;

    invoke-direct {v1, p0}, Lcom/kauto/KAutoBridge$4;-><init>(Lcom/kauto/KAutoBridge;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public minimize()V
    .registers 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/kauto/KAutoBridge;->activity:Landroid/app/Activity;

    new-instance v1, Lcom/kauto/KAutoBridge$3;

    invoke-direct {v1, p0}, Lcom/kauto/KAutoBridge$3;-><init>(Lcom/kauto/KAutoBridge;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setSpeed(F)V
    .registers 6
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Speed requested: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "KAutoBridge"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    invoke-static {p1}, Lcom/kauto/KAutoBridge;->nativeSetSpeed(F)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    iget-object v0, p0, Lcom/kauto/KAutoBridge;->activity:Landroid/app/Activity;

    new-instance v1, Lcom/kauto/KAutoBridge$1;

    invoke-direct {v1, p0, p1}, Lcom/kauto/KAutoBridge$1;-><init>(Lcom/kauto/KAutoBridge;F)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
'@

[System.IO.File]::WriteAllText("D:\swordxstaff\TOOL\client\smali\com\kauto\KAutoBridge.smali", $bridgeSmaliCode, $utf8NoBom)
[System.IO.File]::WriteAllText("D:\swordxstaff\TOOL\smali_us_classes2\com\kauto\KAutoBridge.smali", $bridgeSmaliCode, $utf8NoBom)
Write-Host "KAutoBridge.smali updated!"

# 2. Hook AppActivity.EventReport
$appActivityPath = "D:\swordxstaff\TOOL\smali_us_classes2\com\leiting\unity\AppActivity.smali"
$act = [System.IO.File]::ReadAllText($appActivityPath, $utf8NoBom)
if (-not $act.Contains("invoke-static {p2, p3}, Lcom/kauto/KAutoBridge;->onGameReport")) {
    $targetMethod = ".method public EventReport(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V`r`n    .registers 6"
    $replaceMethod = @'
.method public EventReport(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    # [KAuto] Hook role info from EventReport
    invoke-static {p2, p3}, Lcom/kauto/KAutoBridge;->onGameReport(Ljava/lang/String;Ljava/lang/String;)V
'@
    $act = $act.Replace($targetMethod, $replaceMethod)
    [System.IO.File]::WriteAllText($appActivityPath, $act, $utf8NoBom)
    Write-Host "EventReport hooked in AppActivity.smali!"
} else {
    Write-Host "EventReport already hooked."
}
