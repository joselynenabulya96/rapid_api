const axios = require('axios');

const encodedParams = new URLSearchParams();
encodedParams.set('msg', 'Now is the winter of our discontent <break time="2s"/> Made glorious summer by this sun of York; And all the clouds that lour\'d upon our house In the deep bosom of the ocean buried.');
encodedParams.set('lang', 'Salli');
encodedParams.set('source', 'ttsmp3');

const options = {
  method: 'POST',
  url: 'https://text-to-speech-for-28-languages.p.rapidapi.com/',
  headers: {
    'content-type': 'application/x-www-form-urlencoded',
    'X-RapidAPI-Key': 'b08c0e438emsh72f80302f17be4cp120976jsnc86d7ffdd9fc',
    'X-RapidAPI-Host': 'text-to-speech-for-28-languages.p.rapidapi.com'
  },
  data: encodedParams,
};

try {
	const response = await axios.request(options);
	console.log(response.data);
} catch (error) {
	console.error(error);
}