const { configure, getLogger, addLayout } = require('log4js');
const jsonLayout = require('log4js-json-layout');
addLayout('json', jsonLayout);

configure({
  appenders: {
    out: { type: 'stdout',  layout: { type: 'json'}},
    app: { type: 'file', filename: 'app.log' },
  },
  categories: {
    default: {
      appenders: ['app', 'out'],
      level: 'debug'
    }
  }
});

exports.logger = getLogger();
