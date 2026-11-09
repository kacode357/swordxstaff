package com.kauto;

public class KAutoHtml {
    public static final String HTML_CONTENT = 
        "<!DOCTYPE html>" +
        "<html lang='vi'>" +
        "<head>" +
        "<meta charset='UTF-8'>" +
        "<meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no'>" +
        "<title>KAuto Mod Menu</title>" +
        "<style>" +
        "* { box-sizing: border-box; margin: 0; padding: 0; user-select: none; -webkit-user-select: none; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; }" +
        "body {" +
        "  background: rgba(0, 0, 0, 0.55);" +
        "  width: 100vw; height: 100vh;" +
        "  display: flex; align-items: center; justify-content: center;" +
        "  overflow: hidden;" +
        "}" +
        ".kauto-card {" +
        "  width: 90%; max-width: 440px; max-height: 88vh;" +
        "  background: rgba(13, 17, 23, 0.92);" +
        "  backdrop-filter: blur(24px); -webkit-backdrop-filter: blur(24px);" +
        "  border: 1px solid rgba(0, 240, 255, 0.35);" +
        "  border-radius: 18px;" +
        "  box-shadow: 0 10px 40px rgba(0, 0, 0, 0.8), 0 0 30px rgba(0, 240, 255, 0.2);" +
        "  color: #f0f6fc; display: flex; flex-direction: column;" +
        "  animation: popIn 0.25s cubic-bezier(0.16, 1, 0.3, 1);" +
        "}" +
        "@keyframes popIn { 0% { transform: scale(0.92); opacity: 0; } 100% { transform: scale(1); opacity: 1; } }" +
        ".kauto-header {" +
        "  display: flex; align-items: center; justify-content: space-between;" +
        "  padding: 14px 18px; border-bottom: 1px solid rgba(255, 255, 255, 0.08);" +
        "  background: linear-gradient(90deg, rgba(0, 240, 255, 0.12), rgba(168, 85, 247, 0.12));" +
        "  border-radius: 18px 18px 0 0;" +
        "}" +
        ".kauto-title {" +
        "  display: flex; align-items: center; gap: 10px;" +
        "}" +
        ".kauto-badge {" +
        "  width: 32px; height: 32px; border-radius: 9px;" +
        "  background: linear-gradient(135deg, #00f0ff, #7928ca);" +
        "  display: flex; align-items: center; justify-content: center;" +
        "  font-weight: 900; font-size: 17px; color: #fff;" +
        "  box-shadow: 0 0 12px rgba(0, 240, 255, 0.6);" +
        "}" +
        ".kauto-name { font-size: 15px; font-weight: 700; color: #fff; letter-spacing: 0.5px; }" +
        ".kauto-sub { font-size: 11px; color: #00f0ff; opacity: 0.85; font-weight: 600; }" +
        ".kauto-vip {" +
        "  background: rgba(16, 185, 129, 0.15); border: 1px solid rgba(16, 185, 129, 0.5);" +
        "  color: #10b981; font-size: 10px; font-weight: 700; padding: 2px 7px; border-radius: 12px;" +
        "  margin-left: 6px; letter-spacing: 0.5px;" +
        "}" +
        ".kauto-actions { display: flex; gap: 8px; }" +
        ".btn-action {" +
        "  background: rgba(255, 255, 255, 0.08); border: 1px solid rgba(255, 255, 255, 0.12);" +
        "  color: #c9d1d9; width: 30px; height: 30px; border-radius: 8px;" +
        "  display: flex; align-items: center; justify-content: center;" +
        "  font-size: 15px; cursor: pointer; transition: all 0.2s;" +
        "}" +
        ".btn-action:active { background: rgba(255, 255, 255, 0.2); transform: scale(0.95); }" +
        ".kauto-tabs {" +
        "  display: flex; gap: 4px; padding: 10px 14px; background: rgba(0, 0, 0, 0.25);" +
        "  border-bottom: 1px solid rgba(255, 255, 255, 0.06);" +
        "}" +
        ".tab-btn {" +
        "  flex: 1; padding: 8px 4px; font-size: 12px; font-weight: 600;" +
        "  background: transparent; border: none; color: #8b949e;" +
        "  border-radius: 8px; cursor: pointer; text-align: center; transition: all 0.2s;" +
        "}" +
        ".tab-btn.active {" +
        "  background: rgba(0, 240, 255, 0.15); color: #00f0ff;" +
        "  box-shadow: inset 0 0 10px rgba(0, 240, 255, 0.15); border: 1px solid rgba(0, 240, 255, 0.3);" +
        "}" +
        ".kauto-body {" +
        "  padding: 16px; overflow-y: auto; flex: 1;" +
        "}" +
        ".tab-content { display: none; }" +
        ".tab-content.active { display: block; animation: fadeIn 0.2s; }" +
        "@keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }" +
        ".section-title { font-size: 11px; text-transform: uppercase; color: #8b949e; margin-bottom: 10px; font-weight: 700; letter-spacing: 0.8px; }" +
        ".speed-box {" +
        "  background: rgba(22, 27, 34, 0.8); border: 1px solid rgba(255, 255, 255, 0.08);" +
        "  border-radius: 12px; padding: 14px; margin-bottom: 14px;" +
        "}" +
        ".speed-val-row { display: flex; justify-content: space-between; align-items: baseline; margin-bottom: 10px; }" +
        ".speed-label { font-size: 13px; color: #c9d1d9; font-weight: 600; }" +
        ".speed-val { font-size: 20px; color: #00f0ff; font-weight: 800; text-shadow: 0 0 10px rgba(0, 240, 255, 0.5); }" +
        ".speed-btn-row { display: grid; grid-template-columns: repeat(5, 1fr); gap: 6px; margin-top: 12px; }" +
        ".btn-speed {" +
        "  padding: 8px 0; font-size: 12px; font-weight: 700; border-radius: 8px;" +
        "  border: 1px solid rgba(255, 255, 255, 0.1); background: rgba(33, 38, 45, 0.8);" +
        "  color: #c9d1d9; cursor: pointer; transition: all 0.15s;" +
        "}" +
        ".btn-speed.active {" +
        "  background: linear-gradient(135deg, #00f0ff, #0284c7); color: #000;" +
        "  border-color: #00f0ff; box-shadow: 0 0 12px rgba(0, 240, 255, 0.4);" +
        "}" +
        ".slider-container { margin: 8px 0; }" +
        ".kauto-slider {" +
        "  width: 100%; height: 6px; border-radius: 4px;" +
        "  background: rgba(255, 255, 255, 0.12); outline: none; -webkit-appearance: none;" +
        "}" +
        ".kauto-slider::-webkit-slider-thumb {" +
        "  -webkit-appearance: none; width: 20px; height: 20px; border-radius: 50%;" +
        "  background: #00f0ff; box-shadow: 0 0 12px #00f0ff; cursor: pointer;" +
        "}" +
        ".toggle-card {" +
        "  display: flex; align-items: center; justify-content: space-between;" +
        "  background: rgba(22, 27, 34, 0.8); border: 1px solid rgba(255, 255, 255, 0.08);" +
        "  border-radius: 12px; padding: 12px 14px; margin-bottom: 8px;" +
        "}" +
        ".toggle-info { display: flex; flex-direction: column; gap: 2px; }" +
        ".toggle-name { font-size: 13px; font-weight: 600; color: #f0f6fc; }" +
        ".toggle-desc { font-size: 11px; color: #8b949e; }" +
        ".switch {" +
        "  position: relative; display: inline-block; width: 44px; height: 24px;" +
        "}" +
        ".switch input { opacity: 0; width: 0; height: 0; }" +
        ".switch-slider {" +
        "  position: absolute; cursor: pointer; top: 0; left: 0; right: 0; bottom: 0;" +
        "  background-color: rgba(255, 255, 255, 0.15); transition: 0.3s; border-radius: 24px;" +
        "}" +
        ".switch-slider:before {" +
        "  position: absolute; content: ''; height: 18px; width: 18px; left: 3px; bottom: 3px;" +
        "  background-color: white; transition: 0.3s; border-radius: 50%;" +
        "}" +
        "input:checked + .switch-slider { background-color: #00f0ff; box-shadow: 0 0 10px rgba(0, 240, 255, 0.5); }" +
        "input:checked + .switch-slider:before { transform: translateX(20px); background-color: #0d1117; }" +
        ".info-table { width: 100%; border-collapse: collapse; font-size: 12px; }" +
        ".info-table td { padding: 8px 6px; border-bottom: 1px solid rgba(255, 255, 255, 0.05); }" +
        ".info-table td:first-child { color: #8b949e; font-weight: 500; width: 40%; }" +
        ".info-table td:last-child { color: #f0f6fc; font-weight: 600; text-align: right; }" +
        ".kauto-footer {" +
        "  padding: 10px 16px; border-top: 1px solid rgba(255, 255, 255, 0.06);" +
        "  display: flex; justify-content: space-between; align-items: center;" +
        "  font-size: 11px; color: #8b949e; background: rgba(0, 0, 0, 0.2);" +
        "  border-radius: 0 0 18px 18px;" +
        "}" +
        ".kauto-footer a { color: #00f0ff; text-decoration: none; font-weight: 600; }" +
        ".toast-msg {" +
        "  position: fixed; bottom: 20px; left: 50%; transform: translateX(-50%);" +
        "  background: rgba(0, 240, 255, 0.95); color: #000; padding: 8px 16px; border-radius: 20px;" +
        "  font-size: 12px; font-weight: 700; box-shadow: 0 4px 15px rgba(0,0,0,0.5);" +
        "  opacity: 0; pointer-events: none; transition: opacity 0.3s;" +
        "}" +
        ".toast-msg.show { opacity: 1; }" +
        "</style>" +
        "</head>" +
        "<body>" +
        "<div class='kauto-card' id='kautoCard'>" +
        "  <div class='kauto-header'>" +
        "    <div class='kauto-title'>" +
        "      <div class='kauto-badge'>K</div>" +
        "      <div>" +
        "        <div style='display:flex;align-items:center;'>" +
        "          <span class='kauto-name'>KAuto PRO</span>" +
        "          <span class='kauto-vip'>VIP</span>" +
        "        </div>" +
        "        <div class='kauto-sub'>SWORD X STAFF v1.0.0</div>" +
        "      </div>" +
        "    </div>" +
        "    <div class='kauto-actions'>" +
        "      <button class='btn-action' onclick='minimizeMenu()'>−</button>" +
        "      <button class='btn-action' onclick='closeMenu()'>✕</button>" +
        "    </div>" +
        "  </div>" +
        "  <div class='kauto-tabs'>" +
        "    <button class='tab-btn active' onclick=\"switchTab('speed')\">⚡ Tốc Độ</button>" +
        "    <button class='tab-btn' onclick=\"switchTab('auto')\">🤖 Tự Động</button>" +
        "    <button class='tab-btn' onclick=\"switchTab('info')\">📊 Chỉ Số</button>" +
        "    <button class='tab-btn' onclick=\"switchTab('settings')\">⚙️ Cài Đặt</button>" +
        "  </div>" +
        "  <div class='kauto-body'>" +
        "    <!-- SPEED TAB -->" +
        "    <div class='tab-content active' id='tab-speed'>" +
        "      <div class='section-title'>Điều Khiển Tốc Độ Game (TimeScale)</div>" +
        "      <div class='speed-box'>" +
        "        <div class='speed-val-row'>" +
        "          <span class='speed-label'>Tốc độ chiến đấu:</span>" +
        "          <span class='speed-val' id='speedDisplay'>1.0x</span>" +
        "        </div>" +
        "        <div class='slider-container'>" +
        "          <input type='range' class='kauto-slider' id='speedSlider' min='1' max='20' step='0.5' value='1' oninput='onSliderChange(this.value)'>" +
        "        </div>" +
        "        <div class='speed-btn-row'>" +
        "          <button class='btn-speed active' onclick='setSpeed(1)'>1x</button>" +
        "          <button class='btn-speed' onclick='setSpeed(2)'>2x</button>" +
        "          <button class='btn-speed' onclick='setSpeed(5)'>5x</button>" +
        "          <button class='btn-speed' onclick='setSpeed(10)'>10x</button>" +
        "          <button class='btn-speed' onclick='setSpeed(20)'>20x</button>" +
        "        </div>" +
        "      </div>" +
        "    </div>" +
        "    <!-- AUTO TAB -->" +
        "    <div class='tab-content' id='tab-auto'>" +
        "      <div class='section-title'>Tính Năng Tự Động Hóa</div>" +
        "      <div class='toggle-card'>" +
        "        <div class='toggle-info'>" +
        "          <span class='toggle-name'>⚡ Auto Vượt Ải (Stage Push)</span>" +
        "          <span class='toggle-desc'>Tự động khiêu chiến màn tiếp theo</span>" +
        "        </div>" +
        "        <label class='switch'>" +
        "          <input type='checkbox' id='chk_stage' onchange=\"toggleFeature('stage', this.checked)\">" +
        "          <span class='switch-slider'></span>" +
        "        </label>" +
        "      </div>" +
        "      <div class='toggle-card'>" +
        "        <div class='toggle-info'>" +
        "          <span class='toggle-name'>🎁 Auto Phúc Lợi & Quà Ngày</span>" +
        "          <span class='toggle-desc'>Tự động nhận thưởng điểm danh, rương</span>" +
        "        </div>" +
        "        <label class='switch'>" +
        "          <input type='checkbox' id='chk_welfare' onchange=\"toggleFeature('welfare', this.checked)\">" +
        "          <span class='switch-slider'></span>" +
        "        </label>" +
        "      </div>" +
        "      <div class='toggle-card'>" +
        "        <div class='toggle-info'>" +
        "          <span class='toggle-name'>⚔️ Bỏ Qua Hoạt Ảnh Skill</span>" +
        "          <span class='toggle-desc'>Tắt cutscenes và hiệu ứng chiến đấu</span>" +
        "        </div>" +
        "        <label class='switch'>" +
        "          <input type='checkbox' id='chk_skipanim' onchange=\"toggleFeature('skipanim', this.checked)\">" +
        "          <span class='switch-slider'></span>" +
        "        </label>" +
        "      </div>" +
        "      <div class='toggle-card'>" +
        "        <div class='toggle-info'>" +
        "          <span class='toggle-name'>💎 Auto Rút Thẻ Nhanh</span>" +
        "          <span class='toggle-desc'>Mở tướng 10x siêu tốc, bỏ qua quay</span>" +
        "        </div>" +
        "        <label class='switch'>" +
        "          <input type='checkbox' id='chk_gacha' onchange=\"toggleFeature('gacha', this.checked)\">" +
        "          <span class='switch-slider'></span>" +
        "        </label>" +
        "      </div>" +
        "    </div>" +
        "    <!-- INFO TAB -->" +
        "    <div class='tab-content' id='tab-info'>" +
        "      <div class='section-title'>Thông Số Hệ Thống & Trò Chơi</div>" +
        "      <table class='info-table'>" +
        "        <tr><td>Ứng dụng</td><td>Sword x Staff</td></tr>" +
        "        <tr><td>Package</td><td>com.zjcs.android.vn</td></tr>" +
        "        <tr><td>Engine</td><td>Unity + HybridCLR</td></tr>" +
        "        <tr><td>Kiến trúc</td><td>ARM64-v8a (IL2CPP)</td></tr>" +
        "        <tr><td>Build Version</td><td>156677 (v1.0.0)</td></tr>" +
        "        <tr><td>KAuto Hook</td><td style='color:#10b981;'>Đã kết nối ✓</td></tr>" +
        "        <tr><td>Trạng thái Mod</td><td style='color:#00f0ff;'>Kích hoạt</td></tr>" +
        "      </table>" +
        "    </div>" +
        "    <!-- SETTINGS TAB -->" +
        "    <div class='tab-content' id='tab-settings'>" +
        "      <div class='section-title'>Tùy Chỉnh Giao Diện</div>" +
        "      <div class='speed-box'>" +
        "        <div class='speed-val-row'>" +
        "          <span class='speed-label'>Độ trong suốt HUD:</span>" +
        "          <span class='speed-val' id='opacityVal'>92%</span>" +
        "        </div>" +
        "        <div class='slider-container'>" +
        "          <input type='range' class='kauto-slider' min='50' max='100' value='92' oninput='changeOpacity(this.value)'>" +
        "        </div>" +
        "      </div>" +
        "      <div style='margin-top:10px;'>" +
        "        <button class='btn-speed' style='width:100%;padding:10px;' onclick='resetDefaults()'>Khôi Phục Mặc Định</button>" +
        "      </div>" +
        "    </div>" +
        "  </div>" +
        "  <div class='kauto-footer'>" +
        "    <span>KAuto Native Engine</span>" +
        "    <a href='#'>kauto.fun</a>" +
        "  </div>" +
        "</div>" +
        "<div class='toast-msg' id='toast'>Thông báo</div>" +
        "<script>" +
        "let currentSpeed = 1.0;" +
        "function switchTab(name) {" +
        "  document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));" +
        "  document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));" +
        "  event.currentTarget.classList.add('active');" +
        "  document.getElementById('tab-' + name).classList.add('active');" +
        "}" +
        "function setSpeed(val) {" +
        "  currentSpeed = parseFloat(val);" +
        "  document.getElementById('speedDisplay').innerText = currentSpeed.toFixed(1) + 'x';" +
        "  document.getElementById('speedSlider').value = currentSpeed;" +
        "  document.querySelectorAll('.btn-speed').forEach(b => {" +
        "    b.classList.toggle('active', b.innerText === val + 'x');" +
        "  });" +
        "  showToast('Đã đổi tốc độ: ' + currentSpeed + 'x');" +
        "  if (window.KAutoNative && window.KAutoNative.setSpeed) {" +
        "    window.KAutoNative.setSpeed(currentSpeed);" +
        "  }" +
        "}" +
        "function onSliderChange(val) {" +
        "  currentSpeed = parseFloat(val);" +
        "  document.getElementById('speedDisplay').innerText = currentSpeed.toFixed(1) + 'x';" +
        "  document.querySelectorAll('.btn-speed').forEach(b => {" +
        "    b.classList.toggle('active', b.innerText === parseInt(val) + 'x' && Math.abs(currentSpeed - parseInt(val)) < 0.1);" +
        "  });" +
        "  if (window.KAutoNative && window.KAutoNative.setSpeed) {" +
        "    window.KAutoNative.setSpeed(currentSpeed);" +
        "  }" +
        "}" +
        "function toggleFeature(id, enabled) {" +
        "  showToast((enabled ? 'Bật: ' : 'Tắt: ') + id);" +
        "  if (window.KAutoNative && window.KAutoNative.toggleFeature) {" +
        "    window.KAutoNative.toggleFeature(id, enabled);" +
        "  }" +
        "}" +
        "function changeOpacity(val) {" +
        "  document.getElementById('opacityVal').innerText = val + '%';" +
        "  document.getElementById('kautoCard').style.opacity = val / 100;" +
        "}" +
        "function resetDefaults() {" +
        "  setSpeed(1);" +
        "  document.querySelectorAll('.switch input').forEach(s => s.checked = false);" +
        "  changeOpacity(92);" +
        "  showToast('Đã đặt lại mặc định');" +
        "}" +
        "function minimizeMenu() {" +
        "  if (window.KAutoNative && window.KAutoNative.minimize) {" +
        "    window.KAutoNative.minimize();" +
        "  }" +
        "}" +
        "function closeMenu() {" +
        "  if (window.KAutoNative && window.KAutoNative.close) {" +
        "    window.KAutoNative.close();" +
        "  }" +
        "}" +
        "function showToast(msg) {" +
        "  const t = document.getElementById('toast');" +
        "  t.innerText = msg; t.classList.add('show');" +
        "  clearTimeout(window._tHide);" +
        "  window._tHide = setTimeout(() => t.classList.remove('show'), 1500);" +
        "}" +
        "</script>" +
        "</body>" +
        "</html>";
}
