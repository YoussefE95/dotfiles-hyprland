const yargs = require('yargs');
const app = require('./app.js');
const supportedInfo = ['temp', 'min-temp', 'max-temp', 'stat', 'sunrise', 'sunset', 'icon', 'icon-color'];

yargs(process.argv.slice(2))
    .usage('$0: Usage <cmd> [options]')
    .command(
        'get <info>',
        'get information about local weather',
        (yargs) => {
            return yargs
                .positional('info', {
                    describe: 'what to search for in relation weather',
                    type: 'string',
                    choices: supportedInfo
                });
        },
        (args) => { 
            if (args.info === 'temp') {
                app.getTemp();
            } else if (args.info === 'min-temp') {
                app.getMinTemp();
            } else if (args.info === 'max-temp') {
                app.getMaxTemp();
            } else if (args.info === 'stat') {
                app.getStat();
            } else if (args.info === 'sunrise') {
                app.getSunrise();
            } else if (args.info === 'sunset') {
                app.getSunset();
            } else if (args.info === 'icon') {
                app.getIcon();
            } else if (args.info === 'icon-color') {
                app.getIconColor();
            } else {
                console.log(`Info for ${args.type} is not supported.`);
            }
        }
    )
    .help().argv;