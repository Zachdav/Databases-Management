
/*****************
    PUBLIC API
******************/

const express = require('express');
const mysql = require('mysql2/promise');
const logger = require('../../lib/logger');

const router = express.Router({ mergeParams: true });

// ---------------
// --- RESULTS ---
// ---------------

// all results
router.get('/results', (req, res) => {
    const { record } = req.query;
    let SQL_GET_RECORD = '';
    if(record == 'single') {
        // get result with record 'best' time in the world (exclude results with <= 0 time)
        SQL_GET_RECORD = 'AND r.best > 0 ORDER BY r.best ASC LIMIT 1';
    } else if(record == 'average') {
        // get result with record 'average' time in the world (exclude results with <= 0 time)
        SQL_GET_RECORD = 'AND r.average > 0 ORDER BY r.average ASC LIMIT 1';
    }
    req.app.get('db').query(`
        SELECT 
            r.id,
            p.name AS person,
            rt.name AS round,
            ROUND((r.value1+0.0)/(100+0.0), 2) AS value1,
            ROUND((r.value2+0.0)/(100+0.0), 2) AS value2,
            ROUND((r.value3+0.0)/(100+0.0), 2) AS value3,
            ROUND((r.value4+0.0)/(100+0.0), 2) AS value4,
            ROUND((r.value5+0.0)/(100+0.0), 2) AS value5,
            ROUND((r.best+0.0)/(100+0.0), 2) AS best,
            ROUND((r.average+0.0)/(100+0.0), 2) AS average,
            c.name AS competition,
            c.latitude, 
            c.longitude,
            c.id AS competitionId,
            c.countryId,
            cou.continentId
        FROM Results r, Competition c, Person p, RoundType rt, Country cou
        WHERE 
            r.roundTypeId = rt.id 
            AND r.personId = p.id 
            AND r.competitionId = c.id
            AND c.countryId = cou.id
        ${SQL_GET_RECORD}
    `)
    .then(([rows, fields]) => {
        res.json({ results: rows });
    })
    .catch(err => {
        res.json(err);
    });
});

// results by id
router.get('/results/:id', (req, res) => {
    req.app.get('db').query(`
        SELECT 
            r.id,
            p.name AS person,
            rt.name AS round,
            ROUND((r.value1+0.0)/(100+0.0), 2) AS value1,
            ROUND((r.value2+0.0)/(100+0.0), 2) AS value2,
            ROUND((r.value3+0.0)/(100+0.0), 2) AS value3,
            ROUND((r.value4+0.0)/(100+0.0), 2) AS value4,
            ROUND((r.value5+0.0)/(100+0.0), 2) AS value5,
            ROUND((r.best+0.0)/(100+0.0), 2) AS best,
            ROUND((r.average+0.0)/(100+0.0), 2) AS average,
            c.name AS competition,
            c.latitude, 
            c.longitude,
            c.id AS competitionId,
            c.countryId,
            cou.continentId
        FROM Results r, Competition c, Person p, RoundType rt, Country cou
        WHERE 
            r.id = ? 
            AND r.roundTypeId = rt.id 
            AND r.personId = p.id 
            AND r.competitionId = c.id
            AND c.countryId = cou.id
    `, [req.params.id])
    .then(([rows, fields]) => {
        res.json({ results: rows });
    })
    .catch(err => {
        res.json(err);
    });
});

// results by competition (optionally filtered by query string '?record=')
router.get('/results/competition/:id', (req, res) => {
    const { record } = req.query;
    let SQL_GET_RECORD = '';
    if(record == 'single') {
        // get result with record 'best' time in the world (exclude results with <= 0 time)
        SQL_GET_RECORD = 'AND r.best > 0 ORDER BY r.best ASC LIMIT 1';
    } else if(record == 'average') {
        // get result with record 'average' time in the world (exclude results with <= 0 time)
        SQL_GET_RECORD = 'AND r.average > 0 ORDER BY r.average ASC LIMIT 1';
    }
    req.app.get('db').query(`
        SELECT
            r.id,
            p.name AS person,
            rt.name AS round,
            ROUND((r.value1+0.0)/(100+0.0), 2) AS value1,
            ROUND((r.value2+0.0)/(100+0.0), 2) AS value2,
            ROUND((r.value3+0.0)/(100+0.0), 2) AS value3,
            ROUND((r.value4+0.0)/(100+0.0), 2) AS value4,
            ROUND((r.value5+0.0)/(100+0.0), 2) AS value5,
            ROUND((r.best+0.0)/(100+0.0), 2) AS best,
            ROUND((r.average+0.0)/(100+0.0), 2) AS average,
            c.id AS competitionId,
            c.countryId,
            cou.continentId
        FROM Results r, Competition c, Person p, RoundType rt, Country cou
        WHERE 
            r.competitionId = ?
            AND r.roundTypeId = rt.id 
            AND r.personId = p.id
            AND r.competitionId = c.id
            AND c.countryId = cou.id
        ${SQL_GET_RECORD}
    `, [req.params.id])
    .then(([rows, fields]) => {
        res.json({ results: rows });
    })
    .catch(err => {
        res.json(err);
    });
});

// results by country (optionally filtered by query string '?record=')
router.get('/results/country/:id', (req, res) => {
    const { record } = req.query;
    let SQL_GET_RECORD = '';
    if(record == 'single') {
        // get result with record 'best' time in the world (exclude results with <= 0 time)
        SQL_GET_RECORD = 'AND r.best > 0 ORDER BY r.best ASC LIMIT 1';
    } else if(record == 'average') {
        // get result with record 'average' time in the world (exclude results with <= 0 time)
        SQL_GET_RECORD = 'AND r.average > 0 ORDER BY r.average ASC LIMIT 1';
    }
    req.app.get('db').query(`
        SELECT 
            r.id,
            p.name AS person,
            rt.name AS round,
            ROUND((r.value1+0.0)/(100+0.0), 2) AS value1,
            ROUND((r.value2+0.0)/(100+0.0), 2) AS value2,
            ROUND((r.value3+0.0)/(100+0.0), 2) AS value3,
            ROUND((r.value4+0.0)/(100+0.0), 2) AS value4,
            ROUND((r.value5+0.0)/(100+0.0), 2) AS value5,
            ROUND((r.best+0.0)/(100+0.0), 2) AS best,
            ROUND((r.average+0.0)/(100+0.0), 2) AS average,
            c.id AS competitionId,
            c.countryId,
            cou.continentId
        FROM Results r, Competition c, Person p, RoundType rt, Country cou
        WHERE 
            r.roundTypeId = rt.id 
            AND r.personId = p.id 
            AND r.competitionId = c.id 
            AND c.countryId = ?
            AND c.countryId = cou.id
        ${SQL_GET_RECORD}
    `, [req.params.id])
    .then(([rows, fields]) => {
        res.json({ results: rows });
    })
    .catch(err => {
        res.json(err);
    });
});

// results by continent (optionally filtered by query string '?record=')
router.get('/results/continent/:id', (req, res) => {
    const { record } = req.query;
    let SQL_GET_RECORD = '';
    if(record == 'single') {
        // get result with record 'best' time in the world (exclude results with <= 0 time)
        SQL_GET_RECORD = 'AND r.best > 0 ORDER BY r.best ASC LIMIT 1';
    } else if(record == 'average') {
        // get result with record 'average' time in the world (exclude results with <= 0 time)
        SQL_GET_RECORD = 'AND r.average > 0 ORDER BY r.average ASC LIMIT 1';
    }
    req.app.get('db').query(`
        SELECT 
            r.id,
            p.name AS person,
            rt.name AS round,
            ROUND((r.value1+0.0)/(100+0.0), 2) AS value1,
            ROUND((r.value2+0.0)/(100+0.0), 2) AS value2,
            ROUND((r.value3+0.0)/(100+0.0), 2) AS value3,
            ROUND((r.value4+0.0)/(100+0.0), 2) AS value4,
            ROUND((r.value5+0.0)/(100+0.0), 2) AS value5,
            ROUND((r.best+0.0)/(100+0.0), 2) AS best,
            ROUND((r.average+0.0)/(100+0.0), 2) AS average,
            c.id AS competitionId,
            c.countryId,
            cou.continentId
        FROM Results r, Competition c, Person p, RoundType rt, Country cou
        WHERE 
            r.roundTypeId = rt.id 
            AND r.personId = p.id 
            AND r.competitionId = c.id 
            AND c.countryId = cou.id
            AND cou.continentId = ?
        ${SQL_GET_RECORD}
    `, [req.params.id])
    .then(([rows, fields]) => {
        res.json({ results: rows });
    })
    .catch(err => {
        res.json(err);
    });
});

// --------------------
// --- COMPETITIONS ---
// --------------------

// all competitions
router.get('/competitions', (req, res) => {
    req.app.get('db').query(`
        SELECT
            c.id,
            c.name, 
            c.start_Date AS startDate, 
            c.end_Date AS endDate,
            c.latitude,
            c.longitude,
            c.cityName AS city, 
            cou.name AS country,
            con.name AS continent
        FROM Competition c, Country cou, Continent con
        WHERE 
            c.countryId = cou.id
            AND cou.continentId = con.id
    `)
    .then(([rows, fields]) => {
        res.json({ competitions: rows });
    })
    .catch(err => {
        res.json(err);
    });
});

// competition by id
router.get('/competitions/:id', (req, res) => {
    req.app.get('db').query(`
        SELECT
            c.id,
            c.name, 
            c.start_Date AS startDate, 
            c.end_Date AS endDate,
            c.latitude,
            c.longitude,
            c.cityName AS city, 
            cou.name AS country,
            con.name AS continent
        FROM Competition c, Country cou, Continent con
        WHERE 
            c.id = ?
            AND c.countryId = cou.id 
            AND cou.continentId = con.id
    `, [req.params.id])
    .then(([rows, fields]) => {
        res.json({ competitions: rows });
    })
    .catch(err => {
        res.json(err);
    });
});

module.exports = router;