require("dotenv").config();
require('elastic-apm-node').start({
  serviceName: process.env.SERVICE_NAME,
  serverUrl: process.env.SERVICE_URL,
});
const express = require("express");
const cors = require("cors");
const welcomeNote = require('./helpers/welcomeNotes');
const app = express();

const port = process.env.PORT || 5678;

app.use(cors());

app.use(express.urlencoded({ extended: false }));
app.use(express.json());

app.use(require('./routes'));

app.use('/', (req, res) => {
  const random = Math.floor(Math.random() * 10);
  res.status(200).json({
    message: 'Welcome!',
    note: 'figure out the next quote 😁',
    quote: welcomeNote[random],
  });
});

app.listen(port, () => console.log(`\n Server started on port ${port}`));
