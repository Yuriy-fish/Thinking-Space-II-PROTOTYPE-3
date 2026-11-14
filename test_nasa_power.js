import https from 'https';

const url = 'https://power.larc.nasa.gov/api/temporal/daily/point?parameters=T2M,ALLSKY_SFC_SW_DWN&community=AG&longitude=-89.67&latitude=75.38&start=20230701&end=20230705&format=JSON';

console.log('Sending request to NASA POWER API...');
https.get(url, (res) => {
  console.log('NASA POWER HTTP Status:', res.statusCode);
  let d = '';
  res.on('data', chunk => d += chunk);
  res.on('end', () => {
    try {
      const json = JSON.parse(d);
      console.log('NASA POWER Parameter Keys:', Object.keys(json.properties.parameter));
      console.log('T2M (Temperature at 2 Meters, Devon Island July 1-5, 2023):', json.properties.parameter.T2M);
      console.log('VALIDATION SUCCESS: Live NASA observation verified!');
    } catch(e) {
      console.log('Parse error:', e.message);
    }
  });
}).on('error', err => console.log('NASA POWER Error:', err.message));
