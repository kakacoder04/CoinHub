const { exec } = require('child_process');

const packages = [
  'express',
  'body-parser',
  'mysql',
  'cors',
  'express-session',
  'express-mysql-session',
  'mysql2'
];

console.log('🔧 Đang cài đặt các gói npm...');

exec(`npm init -y && npm install ${packages.join(' ')}`, (err, stdout, stderr) => {
  if (err) {
    console.error('❌ Lỗi khi cài đặt:', err);
    return;
  }
  console.log('✅ Cài đặt hoàn tất!');
  console.log(stdout);
  if (stderr) console.error(stderr);
});
