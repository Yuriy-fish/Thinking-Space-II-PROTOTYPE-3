import https from 'https';

https.get('https://www.spaceappschallenge.org/2026/challenges/permanent-moon-base-locations-and-mars/?tab=resources', { headers: { 'User-Agent': 'Mozilla/5.0' } }, (res) => {
  let data = '';
  res.on('data', chunk => data += chunk);
  res.on('end', () => {
    // Unescape unicode
    const decoded = data.replace(/\\u003c/g, '<').replace(/\\u003e/g, '>').replace(/\\"/g, '"').replace(/\\\//g, '/');
    const regex = /<p[^>]*>(.*?)<\/p>/gis;
    let match;
    console.log('=== OFFICIAL RESOURCES EXTRACTED FROM LIVE PAGE ===\n');
    while ((match = regex.exec(decoded)) !== null) {
      const p = match[1];
      if (/Earthdata|Worldview|Planetary Data System|LRO|Diviner|RADARSAT|SAR Python|Copernicus|Open Science|G-Portal/i.test(p)) {
        console.log(p.replace(/<[^>]+>/g, '').trim());
        const hrefMatch = p.match(/href="([^"]+)"/);
        if (hrefMatch) {
          console.log('-> URL:', hrefMatch[1]);
        }
        console.log('---');
      }
    }
  });
}).on('error', err => console.error(err));
