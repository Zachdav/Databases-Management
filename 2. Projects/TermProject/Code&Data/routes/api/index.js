
/*****************
     API ENTRY
******************/

const express = require('express');
const cors = require('cors');

const router = express.Router({ mergeParams: true });

// cors
router.use(cors({
    origin: '*',
    methods: ["GET", "POST"],
    allowedHeaders: ["Content-Type", "Authorization"]
}));

router.use('/', require('./public'));
router.use('/auth', require('./protected'));

module.exports = router;