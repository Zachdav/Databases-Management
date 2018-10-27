
/*****************
     APP ENTRY
******************/

const express = require('express');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const morgan = require('morgan');
const mysql = require('mysql2/promise');
const handlebars = require('express-handlebars');
const path = require('path');
const logger = require('./lib/logger');

const app = express();
const { 
    PORT = 5500,
    DATABASE_URL = 'localhost',
    DATABASE_USER = 'root',
    DATABASE_PASS = '',
    DATABASE_NAME = 'DIYDB'
} = process.env;



// body parsing
app.use(cookieParser());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// view engine
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'handlebars');
app.engine('handlebars', handlebars({ 
    defaultLayout: 'main',
    layoutsDir: path.join(__dirname, 'views', 'layouts'),
    partialsDir: path.join(__dirname, 'views', 'partials'),
}));

// public assets
app.use(express.static(path.join(__dirname, 'public')));

// logging requests
app.use(morgan('dev', {
    skip: (req, res) => { return res.statusCode < 400; },
    stream: process.stderr
}), morgan('dev', {
    skip: (req, res) => { return res.statusCode >= 400; },
    stream: process.stdout
}));

// routes
app.use(require('./routes'));

// connect to database. start app
mysql.createConnection({ 
    host: DATABASE_URL, 
    database: DATABASE_NAME, 
    user: DATABASE_USER, 
    password : DATABASE_PASS 
})
.then(connection => {
    app.set('db', connection);
    app.listen(PORT, () => logger.info(`App running on port ${PORT}`));
})
.catch(err => {
    logger.error(`App failed with error ${err}`);
});

