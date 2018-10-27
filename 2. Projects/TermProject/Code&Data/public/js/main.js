
// --------------
// ---- MAIN ----
// --------------

const API_BASE = 'https://kilominx.brandoncanaday.me';

// initialize map
Promise.all([
    initializeWorldMap('worldmap', 5), 
    wait(3000)
])
.then(results => closeLoadingScreen())
.catch(err => closeLoadingScreen());

// init sidenav
const $sidenav = document.querySelector('.sidenav');
if($sidenav) {
    M.Sidenav.init($sidenav, { 
        draggable: true, 
        edge: 'right' 
    });
}

// init modals
const $modals = document.querySelectorAll('.modal');
if($modals && $modals.length) {
    M.Modal.init($modals, { 
        opacity: 0.8,
        onOpenStart: ($modal) => {
            openLoadingScreen();
            const $container = $modal.querySelector('.modal-content');
            const triggerType = window.lastModalTrigger.getAttribute('data-type');
            switch(triggerType) {
                case 'competition':
                    // fill modal with competition info
                    Promise.all([
                        fillCompetition($container, window.lastModalTrigger), 
                        wait(1000)
                    ])
                    .then(results => closeLoadingScreen())
                    .catch(err => closeLoadingScreen());
                    break;
                case 'result':
                    // fill modal with result info
                    Promise.all([
                        fillResult($container, window.lastModalTrigger), 
                        wait(1000)
                    ])
                    .then(results => closeLoadingScreen())
                    .catch(err => closeLoadingScreen());
                    break;
                default:
            }
        },
        onCloseEnd: ($modal) => {
            $modal.querySelector('.modal-content').innerHTML = '';
        }
    });
}

// on competition link clicks
$(document).on('click', '.competition-link', onCompetitionLinkClick);

// ---------------
// -- FUNCTIONS --
// ---------------

// finds/fills the given container element with the given competition info
function fillCompetition($container, $competitionInfo) {
    $container.innerHTML = '';
    return new Promise((resolve, reject) => {
        Promise.all([
            getJSON(`${API_BASE}/api/competitions/${$competitionInfo.getAttribute('data-id')}`),
            getJSON(`${API_BASE}/api/results/competition/${$competitionInfo.getAttribute('data-id')}`)
        ])
        .then(([r1, r2]) => {
            // add competition info
            const competition = r1.competitions[0];
            $container.innerHTML = `
                <h4>${competition.name}</h4>
                <p>
                <span><b>City:</b> ${competition.city}</span><br>
                <span><b>Country:</b> ${competition.country}</span><br>
                <span><b>Dates:</b> ${new Date(competition.startDate).toLocaleDateString()}</span> - <span>${new Date(competition.endDate).toLocaleDateString()}</span>
                </p>
                <p><div class="divider"></div></p>
            `;
            // add results for the competition
            const { results } = r2;
            const $resultsTable = createDataTable('Results', results, onResultRowClick);
            if($resultsTable) {
                $container.appendChild($resultsTable);
            } else {
                $container.innerHTML += `
                    <div class="container valign-wrapper" style="padding: 2em; justify-content: center">
                        <i class="material-icons red-text" style="margin-right: 1em">warning</i>
                        <span style="vertical-align: middle">No results to display</span>
                    </div>
                `;
            }
            resolve();
        })
        .catch(err => {
            // add error content
            $container.innerHTML = `
                <h4>Woops!</h4>
                <p><div class="divider"></div></p>
                <div class="container valign-wrapper" style="padding: 2em; justify-content: center">
                    <i class="material-icons red-text" style="margin-right: 1em">warning</i>
                    <span style="vertical-align: middle">${err.message}</span>
                </div>
            `;
            reject(err);
        });
    });
}

// finds/fills the given container element with the given result info
function fillResult($container, $resultInfo) {
    $container.innerHTML = '';
    return new Promise((resolve, reject) => {
        Promise.all([
            // to display actual result info
            getJSON(`${API_BASE}/api/results/${$resultInfo.getAttribute('data-id')}`),
            // to check if record result (same competition)
            getJSON(`${API_BASE}/api/results/competition/${$resultInfo.getAttribute('data-competitionId')}?record=single`),
            getJSON(`${API_BASE}/api/results/competition/${$resultInfo.getAttribute('data-competitionId')}?record=average`),
            // to check if record result (same country)
            getJSON(`${API_BASE}/api/results/country/${$resultInfo.getAttribute('data-countryId')}?record=single`),
            getJSON(`${API_BASE}/api/results/country/${$resultInfo.getAttribute('data-countryId')}?record=average`),
            // to check if record result (same continent)
            getJSON(`${API_BASE}/api/results/continent/${$resultInfo.getAttribute('data-continentId')}?record=single`),
            getJSON(`${API_BASE}/api/results/continent/${$resultInfo.getAttribute('data-continentId')}?record=average`),
            // to check if record result (world)
            getJSON(`${API_BASE}/api/results?record=single`),
            getJSON(`${API_BASE}/api/results?record=average`),
        ])
        .then(([r1, r2, r3, r4, r5, r6, r7, r8, r9]) => {
            const result = r1.results[0];
            const competition_Record_Single = r2.results[0],
                competition_Record_Average = r3.results[0],
                country_Record_Single = r4.results[0],
                country_Record_Average = r5.results[0],
                continent_Record_Single = r6.results[0],
                continent_Record_Average = r7.results[0],
                world_Record_Single = r8.results[0],
                world_Record_Average = r9.results[0];
            // array of icons that denote records for this result
            const recordIcons = [];
            // check if result is a record at any scope (competition, country, continent, world)
            if(result.id == competition_Record_Single.id) recordIcons.push(createTooltippedIcon('grade', 'Competition Record - Single', 'lime'));
            if(result.id == competition_Record_Average.id) recordIcons.push(createTooltippedIcon('grade', 'Competition Record - Average', 'deep-orange'));
            if(result.id == country_Record_Single.id) recordIcons.push(createTooltippedIcon('grade', 'Country Record - Single', 'green'));
            if(result.id == country_Record_Average.id) recordIcons.push(createTooltippedIcon('grade', 'Country Record - Average', 'light-blue'));
            if(result.id == continent_Record_Single.id) recordIcons.push(createTooltippedIcon('grade', 'Continent Record - Single', 'cyan'));
            if(result.id == continent_Record_Average.id) recordIcons.push(createTooltippedIcon('grade', 'Continent Record - Average', 'teal'));
            if(result.id == world_Record_Single.id) recordIcons.push(createTooltippedIcon('grade', 'World Record - Single', 'deep-purple'));
            if(result.id == world_Record_Average.id) recordIcons.push(createTooltippedIcon('grade', 'World Record - Average', 'indigo'));
            // add the result info
            $container.innerHTML = `
                <h4>${result.person}</h4>
                <p>
                <span><b>Round:</b> ${result.round}</span><br>
                <span><b>Competition:</b> <a class="competition-link" data-id="${result.competitionId}">${result.competition}</a></span>
                </p>
            `;
            // add the record icons
            recordIcons.forEach($record => $container.appendChild($record));
            $container.innerHTML += `<p><div class="divider"></div></p>`;
            // reinitialize tooltips
            M.Tooltip.init(document.querySelectorAll('.tooltipped'));
            // add the result details
            const $resultCollapsible = createResultCollapsible(result);
            if($resultCollapsible) {
                $container.appendChild($resultCollapsible);
            } else {
                $container.innerHTML += `
                    <div class="container valign-wrapper" style="padding: 2em; justify-content: center">
                        <i class="material-icons" style="color: #66bb6a; margin-right: 1em">warning</i>
                        <span style="vertical-align: middle">No result data to display</span>
                    </div>
                `;
            }
            resolve();
        })
        .catch(err => {
            // add error content
            $container.innerHTML = `
                <h4>Woops!</h4>
                <p><div class="divider"></div></p>
                <div class="container valign-wrapper" style="padding: 2em; justify-content: center">
                    <i class="material-icons red-text" style="margin-right: 1em">warning</i>
                    <span style="vertical-align: middle">${err.message}</span>
                </div>
            `;
            reject(err);
        });
    });
}

// creates expandable collapsible from mysql2 result
function createResultCollapsible(result) {
    if(!result) return null;
    const $ul = document.createElement('ul');
    $ul.classList.add('collapsible', 'expandable');
    $ul.innerHTML = `
        <li class="active">
            <div class="collapsible-header"><i class="material-icons green-text">timer</i>Times</div>
            <div class="collapsible-body">
                <ul class="collection">
                    <li class="collection-item"><div><b>Attempt 1:</b><span class="secondary-content black-text">${displayTime(result.value1)}</span></div></li>
                    <li class="collection-item"><div><b>Attempt 2:</b><span class="secondary-content black-text">${displayTime(result.value2)}</span></div></li>
                    <li class="collection-item"><div><b>Attempt 3:</b><span class="secondary-content black-text">${displayTime(result.value3)}</span></div></li>
                    <li class="collection-item"><div><b>Attempt 4:</b><span class="secondary-content black-text">${displayTime(result.value4)}</span></div></li>
                    <li class="collection-item"><div><b>Attempt 5:</b><span class="secondary-content black-text">${displayTime(result.value5)}</span></div></li>
                </ul>
            </div>
        </li>
        <li class="active">
            <div class="collapsible-header"><i class="material-icons blue-text">insert_chart</i>Stats</div>
            <div class="collapsible-body">
                <ul class="collection">
                    <li class="collection-item"><div><i class="material-icons left red-text" style="margin-right: 1em">whatshot</i><b>Best:</b><span class="secondary-content black-text">${displayTime(result.best)}</span></div></li>
                    <li class="collection-item"><div><i class="material-icons left purple-text" style="margin-right: 1em">blur_on</i><b>Average:</b><span class="secondary-content black-text">${displayTime(result.average)}</span></div></li>
                </ul>
            </div>
        </li>
    `;
    // init materialize collapsible
    M.Collapsible.init($ul, { accordion: false });
    return $ul;

    function displayTime(value) {
        if(value == 'DNS' || value == 'DNF') {
            return value;
        } else {
            return `${value}s`;
        }
    }
}

// creates table from mysql2 results
function createDataTable(title, rows, handler) {
    if(!rows || !rows.length) return null;
    const $container = document.createElement('div');
    const $tableContainer = document.createElement('div');
    const $table = document.createElement('table');
    const $thead = document.createElement('thead');
    const $theadRow = document.createElement('tr');
    const $tbody = document.createElement('tbody');
    const $tfoot = document.createElement('tfoot');
    if(handler) $tbody.addEventListener('click', handler);
    $container.innerHTML = `<h5 style="margin-bottom: 1em">${title}</h5>`;
    $tableContainer.classList.add('table-container');
    $table.classList.add('highlight', 'tablesorter');
    // fill thead/tbody
    rows.forEach((row, i) => {
        const $tr = document.createElement('tr');
        if(i == 0) {
            Object.entries(row).forEach(([key, value]) => {
                // only display non-id columns. 
                // set id columns as 'data-' attributes of current <tr>
                if(key.indexOf('id') >= 0 || key.indexOf('Id') >= 0) {
                    $tr.setAttribute(`data-${key}`, value);
                } else {
                    const $th = document.createElement('th');
                    $th.textContent = key;
                    $theadRow.appendChild($th);
                    const $td = document.createElement('td');
                    $td.textContent = value || 'NULL';
                    $tr.appendChild($td);
                }
            });
            $thead.appendChild($theadRow);
            $tfoot.appendChild($theadRow.cloneNode(true));
        } else {
            Object.entries(row).forEach(([key, value]) => {
                // only display non-id columns. 
                // set id columns as 'data-' attributes of current <tr>
                if(key.indexOf('id') >= 0 || key.indexOf('Id') >= 0) {
                    $tr.setAttribute(`data-${key}`, value);
                } else {
                    const $td = document.createElement('td');
                    $td.textContent = value || 'NULL';
                    $tr.appendChild($td);
                }
            });
        }
        $tbody.appendChild($tr);
    });
    $table.appendChild($thead);
    $table.appendChild($tbody);
    $table.appendChild($tfoot);
    // allows html table to be interactive
    $($table).tablesorter({ 
        theme: 'materialize',
        widgets: ['filter']
    });
    $tableContainer.appendChild($table);
    $container.appendChild($tableContainer);
    return $container;
}

// handles when user clicks on competition link in result details
function onCompetitionLinkClick(e) {
    openLoadingScreen();
    Promise.all([
        fillCompetition(document.querySelector('#even-more-info .modal-content'), e.target),
        wait(1000)
    ])
    .then(results => closeLoadingScreen())
    .catch(err => closeLoadingScreen());
}

// handles when user clicks on row in results data table
function onResultRowClick(e) {
    if(e.target.tagName == 'TD') {
        openLoadingScreen();
        Promise.all([
            fillResult(document.querySelector('#even-more-info .modal-content'), e.target.parentNode),
            wait(1000)
        ])
        .then(results => closeLoadingScreen())
        .catch(err => closeLoadingScreen());
    }
}

// initializes Leaflet world map w/ given params
async function initializeWorldMap(id, zoom) {
    openLoadingScreen('Initializing map...');
    const location = await getLocation();
    // init leaflet map
    const map = L.map(id, {
        center: location,
        zoom: zoom
    });
    // create/add tile layer for map
    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="https://openstreetmap.org">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://mapbox.com">Mapbox</a>',
        maxZoom: 18,
        id: 'mapbox.dark',
        accessToken: 'pk.eyJ1IjoiYnJhbmRvbmNhbmFkYXkiLCJhIjoiY2pmMWY2ZzB5MGFoMTJ6cTdpM2hxbnkxMyJ9.iEfEI64VslLN-ISVuK78Fg'
    }).addTo(map);
    // fetch competitions/results layers for map
    Promise.all([
        getJSON(`${API_BASE}/api/competitions`),
        getJSON(`${API_BASE}/api/results`),
    ])
    .then(([results1, results2]) => {
        const { competitions } = results1;
        const { results } = results2;
        const competitionMarkers = [];
        const resultsMarkers = [];
        const mcgLayerSupportGroup = L.markerClusterGroup.layerSupport().addTo(map);
        // create competition marker array
        if(competitions && competitions.length) {
            competitions.forEach(c => competitionMarkers.push(makeCompetitionMarker(c)));
        }
        // create results marker array
        if(results && results.length) {
            results.forEach(r => resultsMarkers.push(makeResultMarker(r)));
        }
        // create layer groups and add them to map
        const competitionLayerGroup = L.layerGroup(competitionMarkers);
        const resultLayerGroup = L.layerGroup(resultsMarkers);
        mcgLayerSupportGroup.checkIn(competitionLayerGroup);
        mcgLayerSupportGroup.checkIn(resultLayerGroup);
        competitionLayerGroup.addTo(map);
        resultLayerGroup.addTo(map);
        // create/add layer control to map
        L.control.layers(null, { 
            "Competitions": competitionLayerGroup,
            "Results": resultLayerGroup
        }, { position: 'topleft' }).addTo(map);
        return map;
    })
    .catch(err => {
        console.log(err);
        return err;
    });
}

// creates leaflet marker using given kilominx competition data
function makeCompetitionMarker(c) {
    return L.marker([c.latitude, c.longitude])
    .bindPopup(L.popup({ className: 'competition-popup' }).setContent(`
        <div class="row">
            <div class="col s12">
                <div class="card">
                    <div class="card-content white-text">
                        <span class="card-title">${c.name}</span>
                        <b>${c.city}</b><br>
                        <b>${c.country}</b>
                    </div>
                    <div class="card-action">
                        <a class="modal-trigger" href="#even-more-info" data-type="competition" data-id="${c.id}" onclick="window.lastModalTrigger = this">More Info</a>
                    </div>
                </div>
            </div>
        </div>
    `));
}

// creates leaflet marker using given kilominx result data
function makeResultMarker(r) {
    return L.marker([r.latitude, r.longitude])
    .bindPopup(L.popup({ className: 'result-popup' }).setContent(`
        <div class="row">
            <div class="col s12">
                <div class="card">
                    <div class="card-content white-text">
                        <span class="card-title">${r.person}</span>
                        <span><b>Round: </b>${r.round}</span><br>
                        <span><b>Competition: </b>${r.competition}</span>
                    </div>
                    <div class="card-action">
                        <a class="modal-trigger" href="#even-more-info" data-type="result" data-id="${r.id}" data-competitionId="${r.competitionId}" data-countryId="${r.countryId}" data-continentId="${r.continentId}" onclick="window.lastModalTrigger = this">More Info</a>
                    </div>
                </div>
            </div>
        </div>
    `));
}

// creates Materialize tooltipped icon
function createTooltippedIcon(icon, tooltip, color) {
    const $a = document.createElement('a');
    const $icon = document.createElement('i');
    $a.classList.add('tooltipped');
    $a.setAttribute('data-position', 'top');
    $a.setAttribute('data-delay', '50');
    $a.setAttribute('data-tooltip', tooltip);
    $a.style.marginRight = '1.5em';
    $icon.classList.add('material-icons', `${color}-text`);
    $icon.textContent = icon;
    $a.appendChild($icon);
    return $a;
}

// ---------------
// --- HELPERS ---
// --------------- 

// open loading modal with given message
function openLoadingScreen(message) {
    const $loaderModal = document.querySelector('.preloader-modal');
    const $message = document.querySelector('.preloader-modal .header');
    if($message) 
        $message.textContent = message;
    if($loaderModal)
        $loaderModal.style.display = 'block';
}

// closes preloader modal
function closeLoadingScreen() {
    document.querySelector('.preloader-modal').style.display = 'none';
}

// gets json from backend
function getJSON(endpoint) {
    return new Promise((resolve, reject) => {
        fetch(endpoint)
        .then(body => {
            return body.json()
        })
        .then(json => {
            resolve(json);
        })
        .catch(err => {
            reject(err);
        });
    });
}

// gets [lat, long] of user (very slow for some reason)
function getLocation() {
    return new Promise((resolve, reject) => {
        if(navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(pos => {
                // current location data
                resolve([pos.coords.latitude, pos.coords.longitude])
            }, () => { 
                // fallback to Athens
                resolve([33.9519, -83.3576]);
            }, {
                timeout: 2000, // how long to wait for location data
                maximumAge: 60000*60 // 1 hr location caching
            });
        } else {
            // fallback to Athens
            resolve([33.9519, -83.3576]);
        }
    });
}

// waits a certain amount of time
function wait(ms) {
    return new Promise((reject, resolve) => {
        setTimeout(() => resolve(), ms);
    });
}