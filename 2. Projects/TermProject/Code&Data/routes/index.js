
const express = require('express');
const logger = require('../lib/logger');

const router = express.Router({ mergeParams: true });

// home page
router.get("/", (req, res) => {
    res.render('home', {
        pageSubtitle: "Home"
    });
});

// api
router.use('/api', require('./api'));

module.exports = router;