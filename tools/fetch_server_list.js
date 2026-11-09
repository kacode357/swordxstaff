/**
 * Tool tra cuu Server List va CDN Update cho Sword x Staff
 * URL goc lay tu assets/config/client_config.json
 */
const https = require('https');

const config = require('../game_assets/config/client_config.json');
const manifest = require('../game_assets/config/build_manifest.json');

console.log('=== SWORD X STAFF SERVER & VERSION INSPECTOR ===');
console.log('Package:', 'com.zjcs.android.vn');
console.log('Version:', manifest.AppVersion, `(Build: ${manifest.BuildVersion})`);
console.log('Region:', manifest.Region);
console.log('ServerList URLs:', config.ServerListUrls);

async function checkUrl(url) {
  return new Promise((resolve) => {
    https.get(url, (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => {
        resolve({ url, status: res.statusCode, data: data.slice(0, 300) });
      });
    }).on('error', (err) => {
      resolve({ url, status: 'ERROR', error: err.message });
    });
  });
}

(async () => {
  for (const base of config.ServerListUrls) {
    console.log(`\nTesting base: ${base}`);
    const targets = [
      `${base}Version.json`,
      `${base}build_manifest.json`,
      `${base}${manifest.BuildVersion}/version.json`,
      `${base}server_list.json`
    ];
    for (const t of targets) {
      const res = await checkUrl(t);
      console.log(`  [${res.status}] ${t}`);
    }
  }
})();
