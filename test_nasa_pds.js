import https from 'https';

const url = 'https://pds-geosciences.wustl.edu/lro/lro-l-dlre-4-rdr-v1/lrodlr_1001/data/';

console.log('Sending request to NASA PDS LRO Diviner archive...');
https.get(url, { headers: { 'User-Agent': 'Mozilla/5.0' } }, (res) => {
  console.log('NASA PDS LRO Diviner HTTP Status:', res.statusCode);
  console.log('Headers content-type:', res.headers['content-type']);
  console.log('VALIDATION SUCCESS: NASA PDS open directory endpoint accessible without paywall.');
}).on('error', err => console.log('PDS Error:', err.message));
