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
        "  width: 92%; max-width: 440px;" +
        "  background: rgba(13, 17, 23, 0.95);" +
        "  backdrop-filter: blur(25px); -webkit-backdrop-filter: blur(25px);" +
        "  border: 1px solid rgba(0, 240, 255, 0.4);" +
        "  border-radius: 18px;" +
        "  box-shadow: 0 10px 40px rgba(0, 0, 0, 0.85), 0 0 30px rgba(0, 240, 255, 0.25);" +
        "  color: #f0f6fc; display: flex; flex-direction: column;" +
        "  animation: popIn 0.25s cubic-bezier(0.16, 1, 0.3, 1);" +
        "}" +
        "@keyframes popIn { 0% { transform: scale(0.92); opacity: 0; } 100% { transform: scale(1); opacity: 1; } }" +
        ".kauto-header {" +
        "  padding: 14px 16px; border-bottom: 1px solid rgba(255, 255, 255, 0.1);" +
        "  background: linear-gradient(90deg, rgba(0, 240, 255, 0.15), rgba(168, 85, 247, 0.15));" +
        "  border-radius: 18px 18px 0 0;" +
        "  display: flex; align-items: center; justify-content: space-between;" +
        "}" +
        ".header-left { display: flex; align-items: center; gap: 12px; }" +
        ".char-avatar {" +
        "  width: 44px; height: 44px; border-radius: 12px;" +
        "  background: linear-gradient(135deg, #00f0ff, #7928ca);" +
        "  display: flex; align-items: center; justify-content: center;" +
        "  font-weight: 900; font-size: 22px; color: #fff;" +
        "  box-shadow: 0 0 15px rgba(0, 240, 255, 0.6);" +
        "  border: 2px solid rgba(255, 255, 255, 0.6);" +
        "}" +
        ".char-details { display: flex; flex-direction: column; gap: 3px; }" +
        ".char-name-row { display: flex; align-items: center; gap: 8px; }" +
        ".char-name { font-size: 16px; font-weight: 800; color: #fff; letter-spacing: 0.3px; }" +
        ".char-level {" +
        "  background: rgba(0, 240, 255, 0.2); border: 1px solid rgba(0, 240, 255, 0.6);" +
        "  color: #00f0ff; font-size: 11px; font-weight: 800; padding: 2px 7px; border-radius: 10px;" +
        "}" +
        ".char-sub {" +
        "  font-size: 11px; color: #8b949e; display: flex; align-items: center; gap: 8px; font-weight: 500;" +
        "}" +
        ".char-power { color: #f59e0b; font-weight: 700; }" +
        ".char-server { color: #a855f7; font-weight: 700; }" +
        ".kauto-actions { display: flex; gap: 8px; }" +
        ".btn-action {" +
        "  background: rgba(255, 255, 255, 0.08); border: 1px solid rgba(255, 255, 255, 0.12);" +
        "  color: #c9d1d9; width: 32px; height: 32px; border-radius: 8px;" +
        "  display: flex; align-items: center; justify-content: center;" +
        "  cursor: pointer; transition: all 0.2s;" +
        "}" +
        ".btn-action:active { background: rgba(255, 255, 255, 0.25); transform: scale(0.95); }" +
        ".btn-action svg { stroke: #c9d1d9; }" +
        ".kauto-body { padding: 16px; display: flex; flex-direction: column; gap: 14px; max-height: 72vh; overflow-y: auto; }" +
        ".section-box {" +
        "  background: rgba(22, 27, 34, 0.85); border: 1px solid rgba(255, 255, 255, 0.08);" +
        "  border-radius: 14px; padding: 14px;" +
        "}" +
        ".speed-val-row { display: flex; justify-content: space-between; align-items: center; margin-bottom: 12px; }" +
        ".speed-label {" +
        "  font-size: 13px; color: #f0f6fc; font-weight: 700; display: flex; align-items: center; gap: 8px;" +
        "}" +
        ".speed-label-sub { font-size: 11px; color: #8b949e; font-weight: 500; margin-left: 2px; }" +
        ".speed-val { font-size: 24px; color: #00f0ff; font-weight: 900; text-shadow: 0 0 12px rgba(0, 240, 255, 0.6); }" +
        ".slider-container { margin: 10px 0 14px 0; }" +
        ".kauto-slider {" +
        "  width: 100%; height: 8px; border-radius: 4px;" +
        "  background: rgba(255, 255, 255, 0.15); outline: none; -webkit-appearance: none;" +
        "}" +
        ".kauto-slider::-webkit-slider-thumb {" +
        "  -webkit-appearance: none; width: 22px; height: 22px; border-radius: 50%;" +
        "  background: #00f0ff; box-shadow: 0 0 14px #00f0ff; cursor: pointer;" +
        "}" +
        ".speed-btn-grid { display: grid; grid-template-columns: repeat(7, 1fr); gap: 5px; }" +
        ".btn-spd {" +
        "  padding: 8px 0; font-size: 11px; font-weight: 800; border-radius: 8px;" +
        "  border: 1px solid rgba(255, 255, 255, 0.1); background: rgba(33, 38, 45, 0.9);" +
        "  color: #c9d1d9; cursor: pointer; transition: all 0.15s; text-align: center;" +
        "}" +
        ".btn-spd.active {" +
        "  background: linear-gradient(135deg, #00f0ff, #0284c7); color: #000;" +
        "  border-color: #00f0ff; box-shadow: 0 0 12px rgba(0, 240, 255, 0.5);" +
        "}" +
        ".status-badge {" +
        "  margin-top: 10px; padding: 6px 10px; border-radius: 8px;" +
        "  background: rgba(16, 185, 129, 0.12); border: 1px solid rgba(16, 185, 129, 0.35);" +
        "  color: #10b981; font-size: 11px; font-weight: 600; display: flex; align-items: center; gap: 8px;" +
        "}" +
        ".info-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 8px; font-size: 11px; }" +
        ".info-item { background: rgba(0, 0, 0, 0.25); padding: 8px 10px; border-radius: 8px; border: 1px solid rgba(255,255,255,0.05); }" +
        ".info-item-label {" +
        "  color: #8b949e; font-size: 10px; margin-bottom: 3px; text-transform: uppercase; font-weight: 700;" +
        "  display: flex; align-items: center; gap: 5px;" +
        "}" +
        ".info-item-val { color: #f0f6fc; font-weight: 700; }" +
        ".kauto-footer {" +
        "  padding: 10px 16px; border-top: 1px solid rgba(255, 255, 255, 0.06);" +
        "  display: flex; justify-content: space-between; align-items: center;" +
        "  font-size: 11px; color: #8b949e; background: rgba(0, 0, 0, 0.25);" +
        "  border-radius: 0 0 18px 18px;" +
        "}" +
        ".kauto-footer a { color: #00f0ff; text-decoration: none; font-weight: 700; }" +
        ".toast-msg {" +
        "  position: fixed; bottom: 20px; left: 50%; transform: translateX(-50%);" +
        "  background: rgba(0, 240, 255, 0.95); color: #000; padding: 8px 18px; border-radius: 20px;" +
        "  font-size: 12px; font-weight: 800; box-shadow: 0 4px 15px rgba(0,0,0,0.6);" +
        "  opacity: 0; pointer-events: none; transition: opacity 0.25s;" +
        "}" +
        ".toast-msg.show { opacity: 1; }" +
        "</style>" +
        "</head>" +
        "<body>" +
        "<div class='kauto-card' id='kautoCard'>" +
        "  <!-- HEADER WITH PLAYER INFO (SONG NGU) -->" +
        "  <div class='kauto-header'>" +
        "    <div class='header-left'>" +
        "      <div class='char-avatar' id='charAvatar'>Q</div>" +
        "      <div class='char-details'>" +
        "        <div class='char-name-row'>" +
        "          <span class='char-name' id='charName'>QA</span>" +
        "          <span class='char-level' id='charLevel'>Lv. 1</span>" +
        "        </div>" +
        "        <div class='char-sub'>" +
        "          <span style='display:flex;align-items:center;'>" +
        "            <svg width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='#f59e0b' stroke-width='2.2' stroke-linecap='round' stroke-linejoin='round' style='margin-right:4px;'><path d='M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z'/></svg>" +
        "            L&#7921;c chi&#7871;n / Power: <b class='char-power' id='charPower' style='margin-left:4px;'>--</b>" +
        "          </span>" +
        "          <span>&bull;</span>" +
        "          <span style='display:flex;align-items:center;'>" +
        "            <svg width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='#a855f7' stroke-width='2.2' stroke-linecap='round' stroke-linejoin='round' style='margin-right:4px;'><circle cx='12' cy='12' r='10'/><line x1='2' y1='12' x2='22' y2='12'/><path d='M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z'/></svg>" +
        "            <span class='char-server' id='charServer'>Cloudwhale</span>" +
        "          </span>" +
        "        </div>" +
        "      </div>" +
        "    </div>" +
        "    <div class='kauto-actions'>" +
        "      <button class='btn-action' onclick='minimizeMenu()' title='Minimize'>" +
        "        <svg width='14' height='14' viewBox='0 0 24 24' fill='none' stroke='#c9d1d9' stroke-width='2.5' stroke-linecap='round'><line x1='5' y1='12' x2='19' y2='12'/></svg>" +
        "      </button>" +
        "      <button class='btn-action' onclick='closeMenu()' title='Close'>" +
        "        <svg width='14' height='14' viewBox='0 0 24 24' fill='none' stroke='#c9d1d9' stroke-width='2.5' stroke-linecap='round'><line x1='18' y1='6' x2='6' y2='18'/><line x1='6' y1='6' x2='18' y2='18'/></svg>" +
        "      </button>" +
        "    </div>" +
        "  </div>" +
        "  <!-- BODY CONTENT -->" +
        "  <div class='kauto-body'>" +
        "    <!-- SPEED CONTROL SECTION (SONG NGU) -->" +
        "    <div class='section-box'>" +
        "      <div class='speed-val-row'>" +
        "        <span class='speed-label'>" +
        "          <svg width='18' height='18' viewBox='0 0 24 24' fill='none' stroke='#00f0ff' stroke-width='2.5' stroke-linecap='round' stroke-linejoin='round'><polygon points='13 2 3 14 12 14 11 22 21 10 12 10 13 2'/></svg>" +
        "          <span>T&#7889;c &#272;&#7897; To&agrave;n B&#7897; Game <span class='speed-label-sub'>/ Global Speed</span>:</span>" +
        "        </span>" +
        "        <span class='speed-val' id='speedDisplay'>1.0x</span>" +
        "      </div>" +
        "      <div class='slider-container'>" +
        "        <input type='range' class='kauto-slider' id='speedSlider' min='1' max='50' step='0.5' value='1' oninput='onSliderChange(this.value)'>" +
        "      </div>" +
        "      <div class='speed-btn-grid'>" +
        "        <button class='btn-spd active' onclick='setSpeed(1)'>1x</button>" +
        "        <button class='btn-spd' onclick='setSpeed(2)'>2x</button>" +
        "        <button class='btn-spd' onclick='setSpeed(3)'>3x</button>" +
        "        <button class='btn-spd' onclick='setSpeed(5)'>5x</button>" +
        "        <button class='btn-spd' onclick='setSpeed(10)'>10x</button>" +
        "        <button class='btn-spd' onclick='setSpeed(20)'>20x</button>" +
        "        <button class='btn-spd' onclick='setSpeed(50)'>50x</button>" +
        "      </div>" +
        "      <div class='status-badge'>" +
        "        <svg width='14' height='14' viewBox='0 0 24 24' fill='none' stroke='#10b981' stroke-width='2.5' stroke-linecap='round' stroke-linejoin='round'><circle cx='12' cy='12' r='10'/><polyline points='9 12 11 14 15 10'/></svg>" +
        "        <span>Unity TimeScale Engine (Auto-Locked)</span>" +
        "      </div>" +
        "    </div>" +
        "    <!-- SYSTEM / ACCOUNT INFO (SONG NGU) -->" +
        "    <div class='section-box'>" +
        "      <div class='info-grid'>" +
        "        <div class='info-item'>" +
        "          <div class='info-item-label'>" +
        "            <svg width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='#8b949e' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'><path d='M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z'/><polyline points='3.27 6.96 12 12.01 20.73 6.96'/><line x1='12' y1='22.08' x2='12' y2='12'/></svg>" +
        "            G&oacute;i / Package" +
        "          </div>" +
        "          <div class='info-item-val'>Sword x Staff US</div>" +
        "        </div>" +
        "        <div class='info-item'>" +
        "          <div class='info-item-label'>" +
        "            <svg width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='#8b949e' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'><rect x='4' y='4' width='16' height='16' rx='2'/><rect x='9' y='9' width='6' height='6'/><line x1='9' y1='1' x2='9' y2='4'/><line x1='15' y1='1' x2='15' y2='4'/><line x1='9' y1='20' x2='9' y2='23'/><line x1='15' y1='20' x2='15' y2='23'/><line x1='20' y1='9' x2='23' y2='9'/><line x1='20' y1='14' x2='23' y2='14'/><line x1='1' y1='9' x2='4' y2='9'/><line x1='1' y1='14' x2='4' y2='14'/></svg>" +
        "            Engine" +
        "          </div>" +
        "          <div class='info-item-val'>Unity IL2CPP</div>" +
        "        </div>" +
        "        <div class='info-item'>" +
        "          <div class='info-item-label'>" +
        "            <svg width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='#8b949e' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'><path d='M19 16.9A5 5 0 0 0 18 7h-1.26A8 8 0 1 0 4 15.25'/><polyline points='13 11 9 17 15 17 11 23'/></svg>" +
        "            C&#7853;p nh&#7853;t / Patch" +
        "          </div>" +
        "          <div class='info-item-val'>HybridCLR Hotfix</div>" +
        "        </div>" +
        "        <div class='info-item'>" +
        "          <div class='info-item-label'>" +
        "            <svg width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='#00f0ff' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'><polyline points='22 12 18 12 15 21 9 3 6 12 2 12'/></svg>" +
        "            Tr&#7841;ng th&aacute;i / Status" +
        "          </div>" +
        "          <div class='info-item-val' style='color:#00f0ff;' id='speedStatus'>1.0x Normal</div>" +
        "        </div>" +
        "      </div>" +
        "    </div>" +
        "  </div>" +
        "  <!-- FOOTER -->" +
        "  <div class='kauto-footer'>" +
        "    <span>KAuto Native Engine v2.0 &bull; Song ng&#7919; / Bilingual</span>" +
        "    <a href='#'>kauto.fun</a>" +
        "  </div>" +
        "</div>" +
        "<div class='toast-msg' id='toast'>Thông báo / Notice</div>" +
        "<script>" +
        "let currentSpeed = 1.0;" +
        "function formatPowerVal(p) {" +
        "  if (!p || p === '--') return '--';" +
        "  if (typeof p === 'string' && (p.endsWith('K') || p.endsWith('M') || p.endsWith('B'))) return p;" +
        "  let num = parseFloat(p);" +
        "  if (isNaN(num)) return p;" +
        "  if (num >= 1000000) return (num / 1000000).toFixed(2) + 'M';" +
        "  if (num >= 1000) return (num / 1000).toFixed(2) + 'K';" +
        "  return num.toString();" +
        "}" +
        "function updatePlayerUI(info) {" +
        "  if (!info) return;" +
        "  if (info.name && info.name !== '') {" +
        "    document.getElementById('charName').innerText = info.name;" +
        "    document.getElementById('charAvatar').innerText = info.name.substring(0, 1).toUpperCase();" +
        "  }" +
        "  if (info.level && info.level !== '') document.getElementById('charLevel').innerText = info.level;" +
        "  if (info.power && info.power !== '0' && info.power !== '') {" +
        "    document.getElementById('charPower').innerText = formatPowerVal(info.power);" +
        "  }" +
        "  if (info.server && info.server !== '') document.getElementById('charServer').innerText = info.server;" +
        "}" +
        "function refreshPlayer() {" +
        "  if (window.KAutoNative && window.KAutoNative.getPlayerInfo) {" +
        "    try {" +
        "      const data = JSON.parse(window.KAutoNative.getPlayerInfo());" +
        "      updatePlayerUI(data);" +
        "    } catch(e) {}" +
        "  }" +
        "}" +
        "setInterval(refreshPlayer, 500);" +
        "refreshPlayer();" +
        "function getBoostText(spd) {" +
        "  return spd > 1 ? (spd.toFixed(1) + 'x Tăng tốc / Boost') : '1.0x Bình thường / Normal';" +
        "}" +
        "function setSpeed(val) {" +
        "  currentSpeed = parseFloat(val);" +
        "  document.getElementById('speedDisplay').innerText = currentSpeed.toFixed(1) + 'x';" +
        "  document.getElementById('speedSlider').value = currentSpeed;" +
        "  document.getElementById('speedStatus').innerText = getBoostText(currentSpeed);" +
        "  document.querySelectorAll('.btn-spd').forEach(b => {" +
        "    b.classList.toggle('active', b.innerText === val + 'x');" +
        "  });" +
        "  showToast('Tốc độ / Speed: ' + currentSpeed.toFixed(1) + 'x');" +
        "  if (window.KAutoNative && window.KAutoNative.setSpeed) {" +
        "    window.KAutoNative.setSpeed(currentSpeed);" +
        "  }" +
        "}" +
        "function onSliderChange(val) {" +
        "  currentSpeed = parseFloat(val);" +
        "  document.getElementById('speedDisplay').innerText = currentSpeed.toFixed(1) + 'x';" +
        "  document.getElementById('speedStatus').innerText = getBoostText(currentSpeed);" +
        "  document.querySelectorAll('.btn-spd').forEach(b => {" +
        "    b.classList.toggle('active', b.innerText === parseInt(val) + 'x' && Math.abs(currentSpeed - parseInt(val)) < 0.1);" +
        "  });" +
        "  if (window.KAutoNative && window.KAutoNative.setSpeed) {" +
        "    window.KAutoNative.setSpeed(currentSpeed);" +
        "  }" +
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
        "  window._tHide = setTimeout(() => t.classList.remove('show'), 1200);" +
        "}" +
        "</script>" +
        "</body>" +
        "</html>";
}
