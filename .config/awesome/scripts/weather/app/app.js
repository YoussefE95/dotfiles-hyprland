const openWeather = require('weather-api');
const themeInfo = require('/home/younix/.config/theme-setter/info.json')

const getTemp = async () => {
    const weatherData = await openWeather.getData();
    console.log(`${Math.round(weatherData.main.temp)}°F`);
};

const getMinTemp = async () => {
    const weatherData = await openWeather.getData();
    console.log(`${Math.round(weatherData.main.temp_min)}°`);
};

const getMaxTemp = async () => {
    const weatherData = await openWeather.getData();
    console.log(`${Math.round(weatherData.main.temp_max)}°`);
};

const getStat = async () => {
    const weatherData = await openWeather.getData();
    console.log(weatherData.weather[0].description);
};

const getSunrise = async () => {
    const weatherData = await openWeather.getData();
    const sunrise = new Date(weatherData.sys.sunrise*1000);
    console.log(`${sunrise.getHours()}:${sunrise.getMinutes()}AM`);
};

const getSunset = async () => {
    const weatherData = await openWeather.getData();
    const sunset = new Date(weatherData.sys.sunset*1000);
    console.log(`${sunset.getHours() - 12}:${sunset.getMinutes()}PM`);
};

const getIcon = async () => {
    const weatherData = await openWeather.getData();
    const weatherIcon = weatherData.weather[0].icon;

    if (weatherIcon === '01d') {
        console.log('');
    } else if (weatherIcon === '01n') {
        console.log('');
    } else if (weatherIcon === '02d') {
        console.log('');
    } else if (weatherIcon === '02n') {
        console.log('');
    } else if (weatherIcon === '03d') {
        console.log('');
    } else if (weatherIcon === '03n') {
        console.log('');
    } else if (weatherIcon === '04d') {
        console.log('');
    } else if (weatherIcon === '04n') {
        console.log('');
    } else if (weatherIcon === '09d') {
        console.log('');
    } else if (weatherIcon === '09n') {
        console.log('');
    } else if (weatherIcon === '10d') {
        console.log('');
    } else if (weatherIcon === '10n') {
        console.log('');
    } else if (weatherIcon === '11d') {
        console.log('');
    } else if (weatherIcon === '11n') {
        console.log('');
    } else if (weatherIcon === '13d') {
        console.log('');
    } else if (weatherIcon === '13n') {
        console.log('');
    } else if (weatherIcon === '50d') {
        console.log('');
    } else if (weatherIcon === '50n') {
        console.log('');
    }
};

const getIconColor = async () => {
    const weatherData = await openWeather.getData();
    const weatherIcon = weatherData.weather[0].icon;
    let currentTheme = themeInfo.current.theme;

    if (themeInfo.current.mode === 'light') {
        currentTheme += '-light'
    }

    if (weatherIcon === '01d') {
        console.log(themeInfo.colors[currentTheme].yellow);
    } else {
        console.log(themeInfo.colors[currentTheme].blue);
    }
};

module.exports = {
    getTemp,
    getMinTemp,
    getMaxTemp,
    getStat,
    getSunrise,
    getSunset,
    getIcon,
    getIconColor,
}