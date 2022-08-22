const superagent = require('superagent');
const config = require('./config.json');

const getData = async () => {
    try {
        const url = `${config.url}?APPID=${config.auth}&id=${config.city}&units=${config.unit}`;
        const response = await superagent.get(url);

        return response.body;
    } catch (err) {
        console.log(err);
    }
};

module.exports = {
    getData,
}