'use strict';

const express = require('express');
const path = require('path');
const app = express();

// const cors = require('cors');

const port = 8083;
// const ip = '0.0.0.0';
// const ip = 'localhost';

app.use('/', express.static(path.join(__dirname, 'dist')));

app.listen(port);