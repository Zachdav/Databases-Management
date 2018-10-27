
/*****************
   PROTECTED API
******************/

const express = require('express');
const jwt = require('jsonwebtoken');
const mysql = require('mysql2/promise');
const logger = require('../../lib/logger');

const router = express.Router({ mergeParams: true });

// endpoint protection
router.use(protectAPI());





// stuff





function protectAPI() {
    return (req, res, next) => {
        verifySessionToken(req)
        .then(payload => {
            req.sessionData = payload;
            next();
        })
        .catch(err => {
            res.status(400).json(err);
        });
    }
}

function verifySessionToken(req) {
    return new Promise((resolve, reject) => {
        // grab header from request
        const authHeader = req.headers['authorization'];
        if(!authHeader) {
            return reject(new Error('Missing authorization header.'));
        }
        // parse session token from header. format is 'Authorization: Bearer <token>'
        const token = authHeader.split(' ')[1];
        if(!token) {
            return reject(new Error('Missing session token.'));
        }
        // token must be a valid one & not yet expired
        jwt.verify(token, 'asdfasdfasdfasdf123456789!')
        .then(payload => {
            resolve(payload);
        })
        .catch(err => {
            reject(new Error('Invalid session token.'));
        });
    });
}

module.exports = router;