const fs = require('fs');
const path = require('path');

const configDir = path.join(__dirname, '../game_assets/config');

console.log('=== SWORD X STAFF MANIFEST & ASSET CONFIG ===');
fs.readdirSync(configDir).forEach(file => {
  const filePath = path.join(configDir, file);
  console.log(`\n--- [${file}] ---`);
  try {
    const content = fs.readFileSync(filePath, 'utf-8');
    try {
      const parsed = JSON.parse(content);
      console.log(JSON.stringify(parsed, null, 2));
    } catch {
      console.log(content.trim());
    }
  } catch (err) {
    console.error('Error reading:', err.message);
  }
});
