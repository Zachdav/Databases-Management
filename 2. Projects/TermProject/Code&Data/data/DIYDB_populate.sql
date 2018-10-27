#Sql dump file to populate the kilominx database

DELETE FROM DIYDB.Competition;
DELETE FROM DIYDB.Continent;
DELETE FROM DIYDB.Country;
DELETE FROM DIYDB.Person;
DELETE FROM DIYDB.Posts;
DELETE FROM DIYDB.RanksAverage;
DELETE FROM DIYDB.RanksSingle;
DELETE FROM DIYDB.ResultRanksAverage;
DELETE FROM DIYDB.ResultRanksSingle;
DELETE FROM DIYDB.Results;
DELETE FROM DIYDB.RoundType;
DELETE FROM DIYDB.Rounds;

#RoundTypes
INSERT INTO DIYDB.RoundType (id, rank, name, final)
VALUES ('1', 29, 'First Round', 0);
INSERT INTO DIYDB.RoundType (id, rank, name, final)
VALUES ('2', 50, 'Second Round', 0);
INSERT INTO DIYDB.RoundType (id, rank, name, final)
VALUES ('d', 20, 'Combined First Round', 0);
INSERT INTO DIYDB.RoundType (id, rank, name, final)
VALUES ('c', 90, 'Combined Final', 1);
INSERT INTO DIYDB.RoundType (id, rank, name, final)
VALUES ('f', 99, 'Final', 1);
#5 Tuples


#Continent
INSERT INTO DIYDB.Continent (id, name, recordName)
VALUES ('_Africa', 'Africa', 'AfR');
INSERT INTO DIYDB.Continent (id, name, recordName)
VALUES ('_Asia', 'Asia', 'AsR');
INSERT INTO DIYDB.Continent (id, name, recordName)
VALUES ('_Europe', 'Europe', 'EuR');
INSERT INTO DIYDB.Continent (id, name, recordName)
VALUES ('_NorthAmerica', 'North America', 'NAR');
INSERT INTO DIYDB.Continent (id, name, recordName)
VALUES ('_Oceania', 'Oceania', 'OcR');
INSERT INTO DIYDB.Continent (id, name, recordName)
VALUES ('_SouthAmerica', 'South America', 'SAR');
#6 Tuples


#Country
INSERT INTO DIYDB.Country (id, name, continentId, Iso2)
VALUES ('USA', 'United States', '_NorthAmerica', 'US');
INSERT INTO DIYDB.Country (id, name, continentId, Iso2)
VALUES ('France', 'France', '_Europe', 'FR');
INSERT INTO DIYDB.Country (id, name, continentId, Iso2)
VALUES ('Sweden', 'Sweden', '_Europe', 'SE');
INSERT INTO DIYDB.Country (id, name, continentId, Iso2)
VALUES ('Canada', 'Canada', '_NorthAmerica', 'CA');
INSERT INTO DIYDB.Country (id, name, continentId, Iso2)
VALUES ('Tunisia', 'Tunisia', '_Africa', 'TN');
INSERT INTO DIYDB.Country (id, name, continentId, Iso2)
VALUES ('UnitedKingdom', 'United Kingdom', '_Europe', 'GB');
INSERT INTO DIYDB.Country (id, name, continentId, Iso2)
VALUES ('Israel', 'Israel', '_Europe', 'IL');
INSERT INTO DIYDB.Country (id, name, continentId, Iso2)
VALUES ('Mexico', 'Mexico', '_NorthAmerica', 'MX');
INSERT INTO DIYDB.Country (id, name, continentId, Iso2)
VALUES ('NewZealand', 'NewZealand', '_Oceania', 'NZ');
INSERT INTO DIYDB.Country (id, name, continentId, Iso2)
VALUES ('Korea', 'Democratic People''s Republic of Korea', '_Asia', 'KP');
INSERT INTO DIYDB.Country (id, name, continentId, Iso2)
VALUES ('Libya', 'Libya', '_Africa', 'LY');
INSERT INTO DIYDB.Country (id, name, continentId, Iso2)
VALUES ('Algeria', 'Algeria', '_Africa', 'DZ');
INSERT INTO DIYDB.Country (id, name, continentId, Iso2)
VALUES ('China', 'China', '_Asia', 'CN');
INSERT INTO DIYDB.Country (id, name, continentId, Iso2)
VALUES ('Finland', 'Finland', '_Europe', 'FI');
INSERT INTO DIYDB.Country (id, name, continentId, Iso2)
VALUES ('Switzerland', 'Switzerland', '_Europe', 'CH');
INSERT INTO DIYDB.Country (id, name, continentId, Iso2)
VALUES ('Russia', 'Russia', '_Europe', 'RU');
INSERT INTO DIYDB.Country (id, name, continentId, Iso2)
VALUES ('Austria', 'Austria', '_Europe', 'AT');
#17 Tuples


#Person 
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2003HARD01', 'Chris Hardwick', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2007ALIW01', 'Waris Ali', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2008CLEM01', 'Kit Clement', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2008WONE01', 'David Woner', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2010AMBR01', 'Jacob Ambrose', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2010BOUV01', 'Pierre Bouvier', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2010CANT02', 'Antoine Cantin', 'Canada');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2010HULL01', 'Katie Hull', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2010KOHL02', 'Erwan Kohler', 'Switzerland');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2010TGRAB01', 'Daniel Grabski', 'Austria');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2010YIDA01', 'Dana Yi', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2011GRIT01', 'Oleg Gritsenko', 'Russia');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2011HOFF02', 'Valentin Hoffmann', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2011REYN02', 'Alban Reynaud', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2011SAKO01', 'Corey Sakowski', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2011WANN01', 'Daniel Wannamaker', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2011WELC01', 'Walker Welch', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2012BUBE01', 'Reto Bubendorf', 'Finland');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2012CALL01', 'Will Callan', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2012DROY01', 'Yann Droy', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2012ELLI01', 'Keaton Ellis', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2012HUGH01', 'Dylan Hughlett', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2012LOET01', 'Barry Loether', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2012SZEL01', 'Tommy Szeliga', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2013BARK01', 'Justin Barker', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2013BROT01', 'Chris Brotzman', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2013CABR01', 'Christopher Cabrera', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2013DICK01', 'Matthew Dickman', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2013GERT01', 'Nicolas Gertner', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2013KLEI03', 'Livia Kleiner', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2013LUDW01', 'David Ludwig', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2013MYUN01', 'Sam Myung', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2013SAVA01', 'Harry Savage', 'UnitedKingdom');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2013TSCH02', 'Robin Tschümperlin', 'Switzerland');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2013WENS01', 'Wenshun Zhou', 'China');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('20146GSEL01', 'Grégoire Gsell', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2014AMAM01', 'Nidhal Amamou', 'Tunisia');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2014BERK02', 'Maximilan Berkmann', 'UnitedKingdom');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2014BLAI02', 'Mayron Blain', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2014BROW05', 'Nicolas Browning', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2014CHER05', 'Clément Cherblanc', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2014CHRI04', 'Benjamin Christie', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2014DRES01', 'Andrew Dressman', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2014EMER01', 'Zach Emery', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2014GARC27', 'Arthur Garcin', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2014GOAS03', 'Alan Goasdoue', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2014GOSL01', 'Raymond Goslow', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2014GREI01', 'Daniel Greigg', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2014IBRA01', 'Mahmoud Ibrahim', 'Tunisia');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2014KARL01', 'Alexander Karlov', 'Sweden');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2014LEHM01', 'Alex Lehman', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2014MOSA01', 'Jordan Mosakowski', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2014REID01', 'Connor Reid', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2014SCHW02', 'Fabio Schwandt', 'UnitedKingdom');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2014SEBA01', 'Juliette Sébastien', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2014SMIT09', 'Natalie Smith', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2014STAR05', 'Charlie Stark', 'UnitedKingdom');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2014STIN01', 'Jared Stinson', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2014WALK05', 'Alex Walker', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015ANDR05', 'Dorian Andrade', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015BALA15', 'Jared Balassaitis', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015BEUG01', 'David Beugnon', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015BOUS02', 'Moez Boussarsar', 'Tunisia');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015BOUS03', 'Aziz Boussarsar', 'Tunisia');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015BOUS04', 'Yosr Boussarsar', 'Tunisia');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015CHER07', 'Tommy Cherry', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015CLAU02', 'Carson Claud', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015CLEM03', 'Pauline Clémenceau', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015COBL01', 'Daniel Coble', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015COOK03', 'Sarah Cook', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015DEGL01', 'Lucas Déglise', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015DIZO02', 'Kieran Dizon', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015FOXC01', 'Caleb Fox', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015FRIT01', 'Dylan Fritz', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015HALG01', 'Tyler Halgren', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015HUBE02', 'Matthew Huber', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015JENK02', 'Oliver Jenks', 'NewZealand');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015JOIN01', 'Noah Joiner', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015KARN02', 'Daniel Karnaukh', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015KIME01', 'Edward Kim', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015KULL01', 'Yann Kull', 'Switzerland');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015MARL01', 'Ben Marlin', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015MILL09', 'Luke Miller', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015MINK04', 'Kevin Min', 'Korea');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015NARK01', 'Tucker Narkinsky', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015PADG01', 'Dalton Padgett', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015PFEU02', 'Marcel Pfeuti', 'Switzerland');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015RABE02', 'Daniel Raber', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015RABE03', 'Nathan Raber', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015RABE04', 'Levi Raber', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015RIZZ02', 'Luca Rizzi', 'Switzerland');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015ROTH01', 'Justin Roth', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015SANC11', 'Nicolás Sánchez', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015SPEC01', 'Tyler Specht', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015SPER01', 'Paul Sperling', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015VARG09', 'Douglas Vargo', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015VERD03', 'Fabien Verdier', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015WEBS01', 'Garrett Webster', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015WYSS01', 'Dimitri Wyss', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015XIET01', 'Tim Xie', 'NewZealand');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2015YANG02', 'Daniel Yang', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016AGRA01', 'Alex Agranov', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016ALBR01', 'John Albright', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016ANDR18', 'Aidan Andrews', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016ANSE02', 'Ilona Ansel', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016AUBE01', 'Matthieu Aubert', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016BARA05', 'Nicholas Baran', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016BITZ01', 'Carter Bitz', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016BLAC13', 'John Black', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016BOTT02', 'Drake Bott', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016BOUR01', 'Noé Bourdon', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016BRIM01', 'Nick Brimhall', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016BRUN01', 'Luke Brunsvold', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016CARS05', 'Brandon Carson', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016CLAI02', 'William St. Clair', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016COST12', 'Joshua Costantini', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016COUR01', 'Reagon Courbron', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016DALE03', 'Ethan Dale', 'NewZealand');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016DAVI02', 'Ethan Davis', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016DORE02', 'Issac Van Doren', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016DORR01', 'Zacháry Dorris', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016DOWE01', 'Bradon Dowell', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016DOYL02', 'Jack Doyle', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016DUEC01', 'Chris Dueck', 'UnitedKingdom');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016FRAG02', 'Louis Fragpane', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016FRAI01', 'Diego Fraile', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016FRIE01', 'Geofrey Friedman', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016GILB01', 'Micah Gilbert', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016GOLD11', 'Matthew Goldstein', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016GOTT01', 'Benjamin Gottschalk', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016GRAS01', 'Peter Grassard', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016GROS06', 'Christophe Grosjean', 'Switzerland');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016GSEL01', 'Grégoire Gsell', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016HART02', 'Sean Hartman', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016HEDG01', 'Finlay Hedges', 'UnitedKingdom');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016HEFF01', 'Addison Heffernan', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016HINK01', 'Katelyn Hinkley', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016HOLD01', 'Will Holding', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016HOSS04', 'Jacob Hossler', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016HOUG01', 'Levin Houghton', 'Switzerland');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016JERO01', 'Charles Jerome', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016KAHN01', 'Logan Kahn', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016KANI01', 'Cenan Kanik', 'Switzerland');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016KIMB01', 'Trevor Kimbell', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016LEHE01', 'Thomas Lehéricy', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016LESU01', 'Erwan Lesueur', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016MACK07', 'John Mackie', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016MCGA01', 'Robin Mcgaha', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016MEYE02', 'Christian Meyer', 'Switzerland');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016MIST03', 'Ethan Misteri', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016MOOR09', 'Orion Moore', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016MULL04', 'Daniel Mullen', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016NUZZ01', 'Chris Nuzzi', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016OCHS01', 'Zachary Ochs', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016PECK02', 'Tommy Peck', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016PIET03', 'Seth Pietrowski', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016PIPE01', 'Abel Piper', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016PYWI01', 'Wilfrid Py', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016REHR01', 'Jake Rehrmann', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016RINE02', 'Tim Rinehart', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016RUSS04', 'Ethan Russell', 'UnitedKingdom');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016SANC39', 'Lucas Sanchez', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016SANF02', 'Eric Sanford', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016SEGR01', 'Mano Ségransan', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016SKIN01', 'Sean Skinner', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016SLIM01', 'Slimane Siroukane', 'Algeria');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016SOKH01', 'Nestor Sokhan', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016STEE01', 'Tristan Steeves', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016TERR04', 'Diego Terrones', 'Mexico');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016THIE02', 'Nick Thies', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016TOWN01', 'Tyler Townsend', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016VILL48', 'Jesse Villezcas', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016VINC01', 'Marie Vincent', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016WATS05', 'Dani Watson', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016WILE01', 'Kristin Wiley', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016WILL21', 'Ulric Williams', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016WILS08', 'Cayle Wilson', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016WOOD02', 'Will Wooden', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2016YISS01', 'Dan Yissachar', 'Israel');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017ABBO01K', 'Kai Abbott', 'UnitedKingdom');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017ALFA08', 'Muaad Alfasy', 'Libya');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017BRYA01', 'Thomas Bryan', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017CRAV01', 'Liam Craven', 'UnitedKingdom');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017DANI07', 'William Daniels', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017DATZ01', 'Michael Datz', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017DAYR01', 'Logan Day-Richter', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017ELMA01', 'Mustafa Zohier Elmaskhot', 'Libya');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017FISH02', 'Lara Fisher', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017FOUR01', 'Baptiste Four', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017GATE01', 'Cooper Gates', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017GRAW01', 'Micah Grawey', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017HARD02', 'Trevor Harding', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017HERR05', 'Jhonathan Herrera', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017HICK01', 'Joseph Hicks', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017HOFF06', 'Oliver Hoffman', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017JEFF02', 'James Jefferson', 'UnitedKingdom');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017JOHN15', 'George Alexander Maxwell Johnstone', 'UnitedKingdom');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017LABI01', 'Jacob Labit', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017LANK04', 'Micah Lankford', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017LOND01', 'Nick London', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017MILL06', 'Lucas Milliere', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017MILL14', 'Elliot Miller', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017MORE01', 'David Moreno', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017MYER02', 'Houston Myer', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017NICH02', 'Lawrence Nichols', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017PETI02', 'Cody Petitt', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017SMIT03', 'Matthan Smith', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017STAR04', 'Silas Starling', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017STOS01', 'Livio Stössel', 'Switzerland');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017TWIG01', 'Wesley Twiggs', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017UPSO01', 'Reed Michael Upson', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017VERD02', 'Guilhem Verdie', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017VERD03', 'Louis Verdie', 'France');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017WEBE03', 'Michael Weber', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017WILK01', 'Nathan Wilkerson', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017WILL02', 'Tabitha Williams', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2017WILL15', 'Jack Willems', 'USA');
INSERT INTO DIYDB.Person (id, name, countryId)
VALUES ('2018TEMP01', 'Valentin Tempere', 'France');
#218 Tuples


#Competition
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('AthensFallLateNight2016', 'Athens Fall Late Night 2016', 'Athens, Georgia', 'USA', 2016, 10, 8, 2016, 10, 8, '2016-10-08', '2016-10-08', 33.950150, -83.375370);
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('GreatSouthOpen2016', 'Great South Open 2016', 'Christchurch', 'NewZealand', 2016, 10, 22, 2016, 10, 22, '2016-10-22', '2016-10-22', -43.535722, 172.655224999);
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('ChamberyOpen2016', 'Chambéry Cube Open 2016', 'Chambéry', 'France', 2016, 11, 11, 2016, 11, 13, '2016-11-11', '2016-11-13', 45.568824, 5.927228);
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('PrincetonFall2016', 'Princeton Fall 2016', 'Princeton, New Jersey', 'USA', 2016, 10, 22, 2016, 10, 22, '2016-10-22', '2016-10-22', 40.363074, -74.687815);
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('SevernaParkFall2016', 'Severna Park Fall 2016', 'Serverna Park, Maryland', 'USA', 2016, 10, 29, 2016, 10, 29, '2016-10-29', '2016-10-29', 39.07762, -76.557978999);
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('PDXCubingforDougy2016', 'PDX Cubing for Dougy 2016', 'Portland, Oregon', 'USA', 2016, 11, 19, 20016, 11, 19, '2016-11-19', '2016-11-19', 45.59855, -122.785392);
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('AthensWinter2016', 'Athens Winter 2016', 'Athens, Georgia', 'USA', 2016, 12, 4, 2016, 12, 4, '2016-12-04', '2016-12-04', 33.937029, -83.36791);
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('SouthBerwickOpen2016', 'South Berwick Open 2016', 'South Berwick, Maine', 'USA', 2016, 12, 10, 2016, 12, 10, '2016-12-10', '2016-12-10', 43.230096, -70.805606);
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('MarrsMixupWinter2017', 'Marrs Mixup Winter 2017', 'Omaha, Nebraska', 'USA', 2017, 1, 7, 2017, 1, 27, '2017-01-07', '2017-01-07', 41.201137, -95.939832);
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('AmericusOpen2017', 'Americus Open 2017', 'Americus, Georgia,', 'USA', 2017, 1, 7, 2017, 1, 27, '2017-01-07', '2017-01-07', 32.056672, -84.217537);
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('CrossroadsCubing2017', 'Crossroads Cubing 2017', 'Monroe, North Carolina,', 'USA', 2017, 1, 7, 2017, 1, 27, '2017-01-07', '2017-01-07', 35.104295, -80.53561);
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('IstresOpen2017', 'Istres Open 2017', 'Istres', 'France', 2017, 1, 28, 2017, 1, 29, '2017-01-28', '2017-01-29', 43.504203, 4.988002);
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('MusicCitySpeedsolving2017', 'Music City Speedsolving 2017', 'Nashville, Tennessee', 'USA', 2017, 3, 11, 2017, 3, 11, '2017-03-11', '2017-03-11', 36.130564, -86.741639);
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('HendersonvilleSpring2017', 'Hendersonville Spring 2017', 'Hendersonville, North Carolina', 'USA', 2017, 4, 23, 2017, 4, 23, '2017-04-23', '2017-04-23', 35.341883, -82.475237);
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('MountainViewOpen2017', 'Mountain View Open 2017', 'Marietta, Georgia', 'USA', 2017, 4, 29, 2017, 4, 30, '2017-04-29', '2017-04-30', 34.031733, -84.466569);
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('OverlandParkOpen2017', 'Overland Park Open 2017', 'Overland Park, Kansas', 'USA', 2017, 4, 29, 2017, 4, 29, '2017-04-29', '2017-04-29', 38.8092, -94.731743);
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('BarbyCube732017', 'Barby Cube 73 2017', 'Barby,', 'France', 2017, 4, 29, 2017, 5, 1, '2017-04-29', '2017-05-01', 45.571075, 5.978338);
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('ChachyaOpen2017', 'Chachya Open 2017', 'Monastir', 'Tunisia', 2017, 6, 29, 2017, 6, 30, '2017-06-29', '2017-06-30', 35.763217, 10.749581);
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('NoStressSolving2017', 'No Stress Solving 2017', 'Marietta, Georgia', 'USA', 2017, 7, 2, 2017, 7, 2, '2017-07-02', '2017-07-02', 34.025622, -84.521065);
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('LondonOpen2017', 'London Open 2017', 'London', 'UnitedKingdom', 2017, 7, 8, 2017, 7, 9, '2017-07-08', '2017-07-09', 51.500809, -0.019576);
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('ZurichOpen2017', 'Zurich Open 2017', 'Wallisellen', 'Switzerland', 2017, 9, 16, 2017, 9, 17, '2017-09-16', '2017-09-17', 47.417731, 8.594597);
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('BarbyCubeAutomne2017', 'Barby Cube 73 Open Automne 2017', 'Barby', 'France', 2017, 9, 23, 2017, 9, 24, '2017-09-23', '2017-09-24', 45.571075, 5.978338);
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('VeteransDayOpen2017', 'Veterans Day Open 2017', 'Colorado Springs, Colorado', 'USA', 2017, 11, 11, 2017, 11, 11, '2017-11-11', '2017-11-11', 38.856435, -104.877402);
INSERT INTO DIYDB.Competition (id, name, cityName, countryId, year, month, day, endYear, endMonth, endDay, start_Date, end_Date, latitude, longitude)
VALUES('ChamberyCube2018', 'Chambéry Cube 2018', 'Chambéry', 'France', 2018, 1, 20, 2018, 1, 21, '2018-01-20', '2018-01-21', 45.568805, 5.926241);
#24 Tuples


#Rounds
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('AthensFallLateNight2016', 'f');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('GreatSouthOpen2016', 'f');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('ChamberyOpen2016', 'f');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('PrincetonFall2016', 'f');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('SevernaParkFall2016', 'c');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('PDXCubingforDougy2016', 'c');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('AthensWinter2016', 'f');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('SouthBerwickOpen2016', 'f');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('MarrsMixupWinter2017', 'c');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('AmericusOpen2017', 'f');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('CrossroadsCubing2017', 'f');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('IstresOpen2017', 'd');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('IstresOpen2017', 'f');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('MusicCitySpeedsolving2017', 'f');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('HendersonvilleSpring2017', 'c');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('MountainViewOpen2017', 'c');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('OverlandParkOpen2017', 'c');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('BarbyCube732017', 'c');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('ChachyaOpen2017', 'c');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('NoStressSolving2017', 'd');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('NoStressSolving2017', 'f');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('LondonOpen2017', 'c');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('ZurichOpen2017', 'c');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('BarbyCubeAutomne2017', 'c');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('VeteransDayOpen2017', 'f');
INSERT INTO DIYDB.Rounds (competitionId, RoundTypeId)
VALUES ('ChamberyCube2018', 'c');
#26 Tuples




#Results need to replace '.,' with ','
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2011WANN01', 'AthensFallLateNight2016', 'f', 2088, 2956, 2418, 2179, 3368, 2088, 2518);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2010AMBR01', 'AthensFallLateNight2016', 'f', 2750, 2394, 2913, 2580, 2693, 2394, 2674);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2014STIN01', 'AthensFallLateNight2016', 'f', 2468, 3344, 3338., 2964, 3233, 2468, 3178);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '2010HULL01', 'AthensFallLateNight2016', 'f', 3774, 5476, 2916, 3119, 2554, 2554, 3270.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (5, '2014GOSL01', 'AthensFallLateNight2016', 'f', 4664, 3759., 5457, 4450, 4035, 3759., 4383);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (6, '2015JOIN01', 'AthensFallLateNight2016', 'f', 4433, 4502, 4791, 3915, 5052, 3915, 4575);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (7, '2015COBL01', 'AthensFallLateNight2016', 'f', 6170, 5704, 5948, 6339, 7685., 5704, 6152);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (8, '2015CLAU02', 'AthensFallLateNight2016', 'f', 9665, 7489, 6395, 6264, 6654., 6264, 6846.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (9, '2016MULL04', 'AthensFallLateNight2016', 'f', 7111, 8049., 5042, 7621., 6073, 5042, 6935.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (10, '2016BARA05', 'AthensFallLateNight2016', 'f', 7124., 7452, 5329, 8033, 6852, 5329, 7143.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (11, '2016THIE02', 'AthensFallLateNight2016', 'f', 9279, 11390, 7039, 7092, 7804., 7039, 8058);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (12, '2015HUBE02', 'AthensFallLateNight2016', 'f', 12799, 8371, 12093, 9597, 8780, 8371, 10157);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (13, '2016DOWE01', 'AthensFallLateNight2016', 'f', 11750, 14247, 9890, -1, -1, 9890, -1);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2015JENK02', 'GreatSouthOpen2016', 'f', 5965, 5965, 5965, 5965, 5965, 5965, 5965);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2015XIET01', 'GreatSouthOpen2016', 'f', 9818, 9818, 9818, 9818, 9818, 9818, 9818);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2016DALE03', 'GreatSouthOpen2016', 'f', 10033, 10033, 10033, 10033, 10033, 10033, 10033);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2014GOAS03', 'ChamberyOpen2016', 'f', 2775, 3307, 2757, 2193, 2187, 2187, 2575);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2013GERT01', 'ChamberyOpen2016', 'f', 2903, -1, 2897, 3046, 2363, 2363, 2949);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2014CHER05', 'ChamberyOpen2016', 'f', 4610, 3556, 2884, 2910, 2686, 2686, 3117);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '2014SEBA01', 'ChamberyOpen2016', 'f', 3522, 3916., 3652., 2978, 3640, 2978, 3605.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (5, '2011REYN02', 'ChamberyOpen2016', 'f', 3970., 3283, -1, 3596, 3178, 3178, 3616.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (6, '2016AUBE01', 'ChamberyOpen2016', 'f', 4851, 4944, 4542, 4823, 4548, 4542, 4741);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (7, '2016ANSE02', 'ChamberyOpen2016', 'f', 4793, 5644, 4706, 4251, 5272, 4251, 4924);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (8, '2016FRAI01', 'ChamberyOpen2016', 'f', 5656, 5339, 5589, 3294, 4708, 3294, 5212);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (9, '2016PYWI01', 'ChamberyOpen2016', 'f', 7004., 5744, 5075, 5113, 5381, 5075, 5413);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (10, '2014GARC27', 'ChamberyOpen2016', 'f', 5290, 7816, 6128, 5496, 5496, 5290, 5707);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (11, '2016VINC01', 'ChamberyOpen2016', 'f', 6424., 5779, 8618, 5199, 4852, 4852, 5801);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (12, '2016GRAS01', 'ChamberyOpen2016', 'f', 6368, 6077, 5474, 6149, 8925, 5474, 6198);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (13, '2016BOUR01', 'ChamberyOpen2016', 'f', 8719, 8408, 6199, 7448, 7615., 6199, 7824.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (14, '2015CLEM03', 'ChamberyOpen2016', 'f', 8387, 8708, 7978, 9302, 9263, 7978, 8786);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (15, '2012DROY01', 'ChamberyOpen2016', 'f', 11962, 7062, 10335, 8856, 7307., 7062, 8833);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (16, '2016LEHE01', 'ChamberyOpen2016', 'f', -1, 9699, 10952, -1, -1, 9699, -1);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2012CALL01', 'SevernaParkFall2016', 'c', 3340, 2795, 2697, 2635, 2391, 2391, 2709);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2011SAKO01', 'SevernaParkFall2016', 'c', 3346, 2984, 2597, 2886, 2510, 2510, 2822);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2010YIDA01', 'SevernaParkFall2016', 'c', 3283, 3121, 3274, 3429, 4476, 3121, 3329);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '2012SZEL01', 'SevernaParkFall2016', 'c', 3483, 4288, 3626, 2275, 3337., 2275, 3482);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (5, '2012ELLI01', 'SevernaParkFall2016', 'c', 5018, 4264, 3293, 4154, 3366., 3293, 3928);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (6, '2013KLEI03', 'SevernaParkFall2016', 'c', 4932, 3551, 4443, 4141, 4694, 3551, 4426);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (7, '2015KARN02', 'SevernaParkFall2016', 'c', -1, 3789, 4807, 3778, 4778, 3778, 4458);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (8, '2014GREI01', 'SevernaParkFall2016', 'c', 5189, 5207, 3830., 4251, 4111, 3830., 4517);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (9, '2014CHRI04', 'SevernaParkFall2016', 'c', 3579, -1, 5757, 4414, 4478, 3579, 4883);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (10, '2016JERO01', 'SevernaParkFall2016', 'c', 5395, 4327, 4804, 4925, 5145, 4327, 4958);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (11, '2015CHER07', 'SevernaParkFall2016', 'c', 4912, 4719, -1, 4796, 5331, 4719, 5013);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (12, '2016SOKH01', 'SevernaParkFall2016', 'c', 5088, 5741, 5447, 3871, -1, 3871, 5425);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (13, '2016BLAC13', 'SevernaParkFall2016', 'c', -1, 5528, -1, -2, -2, 5528, -1);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (14, '2016NUZZ01', 'SevernaParkFall2016', 'c', -1, -1, 0, 0, 0, -1, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (14, '2016TERR04', 'SevernaParkFall2016', 'c', -1, -1, 0, 0, 0, -1, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (14, '2015VARG09', 'SevernaParkFall2016', 'c', -1, -1, 0, 0, 0, -1, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (14, '2016REHR01', 'SevernaParkFall2016', 'c', -1, -1, 0, 0, 0, -1, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (14, '2016MACK07', 'SevernaParkFall2016', 'c', -1, -1, 0, 0, 0, -1, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (14, '2015ROTH01', 'SevernaParkFall2016', 'c', -1, -1, 0, 0, 0, -1, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2015YANG02', 'PDXCubingforDougy2016', 'c', 2457, 3607, 2217, 2746, 2357, 2217, 2520);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2016DAVI02', 'PDXCubingforDougy2016', 'c', 2833, 2716, 2961, 2408, 2557, 2408, 2702);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2015RABE02', 'PDXCubingforDougy2016', 'c', 3618, 3227., 2126, 2610, 2655, 2126, 2831);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '2008CLEM01', 'PDXCubingforDougy2016', 'c', 3630., 2369, 3073, 3867, 3298., 2369, 3334.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (5, '2013BROT01', 'PDXCubingforDougy2016', 'c', 3967, 3462., 3707, 4527, -1, 3462., 4067);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (6, '2015SPER01', 'PDXCubingforDougy2016', 'c', 4223, 4382, 4714, 4901, 4418, 4223, 4505);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (7, '2016TOWN01', 'PDXCubingforDougy2016', 'c', 4446, 4329, 3929, 8132., 4758, 3929, 4511);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (8, '2016ANDR18', 'PDXCubingforDougy2016', 'c', 3717, 4927, 4227, 4797, 5287, 3717, 4650);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (9, '2016GOTT01', 'PDXCubingforDougy2016', 'c', 4277, 4926, 4875, 5058, 4271, 4271, 4693);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (10, '2015HALG01', 'PDXCubingforDougy2016', 'c', 4646, 4776, 4240, 4842, 5511, 4240, 4755);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (11, '2016BRIM01', 'PDXCubingforDougy2016', 'c', 6861, 5477, 7342, 4376, 4975, 4376, 5771);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (12, '2012LOET01', 'PDXCubingforDougy2016', 'c', 6581, 6736, 5792, 6224, 7429., 5792, 6514);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (13, '2015RABE03', 'PDXCubingforDougy2016', 'c', 6513, 4898, 9966, 3960, 8258, 3960, 6556);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (14, '2016KAHN01', 'PDXCubingforDougy2016', 'c', 7219, 7549., 5883, 7725, 4818, 4818, 6884);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (15, '2015RABE04', 'PDXCubingforDougy2016', 'c', 8207, 6271, 6593., -1, 5857, 5857, 7024.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (16, '2013DICK01', 'PDXCubingforDougy2016', 'c', 8911, 8508, 5853, 5306, 9318, 5306, 7757.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (17, '2013WENS01', 'PDXCubingforDougy2016', 'c', 10028, 8834, 5894, 10031, 6604., 5894, 8489);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (18, '2016MOOR09', 'PDXCubingforDougy2016', 'c', 10926, 8648, 8418, 9112, 6653, 6653, 8726);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (19, '2016DOYL02', 'PDXCubingforDougy2016', 'c', 8964, 11570, 9937, 9589, 10870, 8964, 10132);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (20, '2016CARS05', 'PDXCubingforDougy2016', 'c', 15696, 14561., 0, 0, 0, 14561., 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2010HULL01', 'AthensWinter2016', 'f', 2619, 2893, 2968, 2345, 2484, 2345, 2665);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2011WANN01', 'AthensWinter2016', 'f', 2410, 3184, 2839, 3227., -1, 2410, 3083);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2014STIN01', 'AthensWinter2016', 'f', 3465, 2645, 3355., 3041, 2852, 2645, 3083);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '2010AMBR01', 'AthensWinter2016', 'f', 3166, 2760, 3369, 3062, 3078, 2760, 3102);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (5, '2015SANC11', 'AthensWinter2016', 'f', 3642, 3175, 3052, 3325, 2486, 2486, 3184);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (6, '2015PADG01', 'AthensWinter2016', 'f', 4769, 4448, 5894, 5591, 4514, 4448, 4958);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (7, '2015JOIN01', 'AthensWinter2016', 'f', 5431, 4408, 5196, 3600, 6718., 3600, 5012);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (8, '2014LEHM01', 'AthensWinter2016', 'f', 5059, 6777, 5458, 5919, 5535, 5059, 5637);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (9, '2015BALA15', 'AthensWinter2016', 'f', 8165., 6886, 5344, 5869, 6564, 5344, 6440.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (10, '2016MULL04', 'AthensWinter2016', 'f', 6341, 6880, 6704., 7063, 5665, 5665, 6642);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (11, '2014BROW05', 'AthensWinter2016', 'f', 5710, 10022, 8416, 7269, 7149., 5710, 7611);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (12, '2003HARD01', 'AthensWinter2016', 'f', 7319, 8298, 7644, 8385, 8500, 7319, 8109);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (13, '2015BEUG01', 'AthensWinter2016', 'f', 10460, 5548, 9673, 9226, -1, 5548, 9786);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2013MYUN01', 'SouthBerwickOpen2016', 'f', 2231, 2923, 2971, 2792, 2363, 2231, 2693);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2015MARL01', 'SouthBerwickOpen2016', 'f', 4337, 4164, 4891, 3262., 3159, 3159, 3921);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2016COUR01', 'SouthBerwickOpen2016', 'f', 4284, 6115, 3853, 4589, 4910, 3853, 4594);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '2016SOKH01', 'SouthBerwickOpen2016', 'f', 5023, 6891, 6839, 4081, 6013, 4081, 5958);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (5, '2016HEFF01', 'SouthBerwickOpen2016', 'f', 9925, 10305, 8869, 5930, -1, 5930, 9700);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (6, '2016YISS01', 'SouthBerwickOpen2016', 'f', 7845, 8653, 8943, 10288, 7459, 7459, 8480);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (7, '2016COST12', 'SouthBerwickOpen2016', 'f', 12341, 10921, 13338, 12849, 9057, 9057, 12037);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (8, '2016SANF02', 'SouthBerwickOpen2016', 'f', 14106, -1, 16618, 10878, 15126, 10878, 15283.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (9, '2014REID01', 'SouthBerwickOpen2016', 'f', -1, 9585, 6110, 5611, -1, 5611, -1);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2011WELC01', 'MarrsMixupWinter2017', 'c', 2260, 2187, 2781, 2438, 2663, 2187, 2454);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2016HINK01', 'MarrsMixupWinter2017', 'c', 2739, 4226, 4208, 3927., 2948, 2739, 3694);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2016WOOD02', 'MarrsMixupWinter2017', 'c', 5079, 4046, 4703, 4180, 4967, 4046, 4617);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '2016PIPE01', 'MarrsMixupWinter2017', 'c', 4147, 5681, 5449, 4433, 4522, 4147, 4801);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (5, '2016DORE02', 'MarrsMixupWinter2017', 'c', 4999, 6175, 5516, 5284, 6214, 4999, 5658);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (6, '2015WEBS01', 'MarrsMixupWinter2017', 'c', 7108, 6072, 5041, 5652, 6725, 5041, 6150);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (7, '2015MILL09', 'MarrsMixupWinter2017', 'c', 6789, 7090., 5743, 7114, 5120, 5120, 6541);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (8, '2015SPEC01', 'MarrsMixupWinter2017', 'c', 3875, 5779, 6229, 9202, 8218, 3875, 6742);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (9, '2015COOK03', 'MarrsMixupWinter2017', 'c', 7686, -1, 6833, 6417, 5759, 5759, 6979.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (10, '2016VILL48', 'MarrsMixupWinter2017', 'c', 7115., 5627, 6998, 7639, 7708, 5627, 7251.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (11, '2016BITZ01', 'MarrsMixupWinter2017', 'c', 7907., 7576., 7282., 6384, 8999, 6384, 7588);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (12, '2016WILL21', 'MarrsMixupWinter2017', 'c', 7050, 8126., 9575, 8484, 8564, 7050, 8391);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (13, '2016MACK07', 'MarrsMixupWinter2017', 'c', 9557, 8530, 9580, 7144, 9597, 7144, 9222);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (14, '2016BOTT02', 'MarrsMixupWinter2017', 'c', 8928, 10185, 8023, 8701, 10156, 8023, 9262);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (15, '2016GILB01', 'MarrsMixupWinter2017', 'c', 9812, 9835, 11083, 10139, 10555, 9812, 10176);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (16, '2016WILE01', 'MarrsMixupWinter2017', 'c', 13895., 9323, 15029, 8635, 10662, 8635, 11293);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (17, '2014EMER01', 'MarrsMixupWinter2017', 'c', 11028, 13689., 9988, 12259, -1, 9988, 12325);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (18, '2017WILL02', 'MarrsMixupWinter2017', 'c', 11854, 16676, 9149, 12317, 17474, 9149, 13616);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (19, '2016PECK02', 'MarrsMixupWinter2017', 'c', 15020., 14061., 0, 0, 0, 14061., 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2010HULL01', 'AmericusOpen2017', 'f', 3170, 3221, 2384, 2600, 4110, 2384, 2997);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2010AMBR01', 'AmericusOpen2017', 'f', 4075, 3241., 2878, 2444, 2888, 2444, 3002);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2014GOSL01', 'AmericusOpen2017', 'f', 4037., 3587., 3179, 3069, 2826, 2826, 3278);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '2015JOIN01', 'AmericusOpen2017', 'f', 5093, 5077, 3486, 4277, 3904, 3486, 4419);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (5, '2016HART02', 'AmericusOpen2017', 'f', 4348, 7955, 6452, 5869, 5376, 4348, 5899);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (6, '2016SKIN01', 'AmericusOpen2017', 'f', 9471, 5907, 7002, 5941, 6767, 5907, 6570);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (7, '2015BALA15', 'AmericusOpen2017', 'f', 7025, 8665, 7669, 6206, 6344, 6206, 7013);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (8, '2017BRYA01', 'AmericusOpen2017', 'f', 7970, 8675, 5125, 7756, 5478, 5125, 7068.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (9, '2016MIST03', 'AmericusOpen2017', 'f', 7886, 7276., 6982., 6343, 8166, 6343, 7381);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (10, '2003HARD01', 'AmericusOpen2017', 'f', 7881, 5514, 7087, 8160., 8984, 5514, 7709);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (11, '2017MORE01', 'AmericusOpen2017', 'f', 9777, 9002, 12836., 8947, 11855, 8947, 10211);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (12, '2015NARK01', 'AmericusOpen2017', 'f', 10571, 11019, 7216, 10498, 10007, 7216, 10359);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (13, '2016SANC39', 'AmericusOpen2017', 'f', 8301, -1, 8408, 16704, 11403, 8301, 12172);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (14, '2017GRAW01', 'AmericusOpen2017', 'f', -1, 11186, 10485, 7089, -1, 7089, -1);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2010HULL01', 'CrossroadsCubing2017', 'f', 2102, 2101, 3126, 2624, 2494, 2101, 2407);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2011WANN01', 'CrossroadsCubing2017', 'f', 2647, 2438, 2001., 3070, 2357, 2001., 2481);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2010AMBR01', 'CrossroadsCubing2017', 'f', 2353, 4020., 2810, 2413, 2865, 2353, 2696);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '2014STIN01', 'CrossroadsCubing2017', 'f', 3255., 2373, 3294, 2501, 2844, 2373, 2867);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (5, '2014GOSL01', 'CrossroadsCubing2017', 'f', 3659., 3316., 3513., 2307, 4159, 2307, 3496);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (6, '2016OCHS01', 'CrossroadsCubing2017', 'f', 4541, 4879, 5089, 3991., 4987, 3991., 4802);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (7, '2016KIMB01', 'CrossroadsCubing2017', 'f', 5341, 4983, 5348, 5917, 6338, 4983, 5535);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (8, '2016ALBR01', 'CrossroadsCubing2017', 'f', 6826., 5296, 5107, 6123, 5618, 5107, 5679);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (9, '2016BARA05', 'CrossroadsCubing2017', 'f', 5788, 5597, 4753, 6937, 5788, 4753, 5724);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (10, '2015ANDR05', 'CrossroadsCubing2017', 'f', 8788, 5358, 4855, 6352, 6539, 4855, 6083);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (11, '2016THIE02', 'CrossroadsCubing2017', 'f', 8765, 7986, 8681, 7453, 6275, 6275, 8040.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (12, '2015KIME01', 'CrossroadsCubing2017', 'f', 10059, 8394, 4620, 7329., 9219, 4620, 8314);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (13, '2016HOLD01', 'CrossroadsCubing2017', 'f', 8149., 11433, 13547, 8297, 8023, 8023, 9293);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (14, '2016FRIE01', 'CrossroadsCubing2017', 'f', 10337, 10132, 9848, 7195, 8398, 7195, 9459);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (15, '2015FOXC01', 'CrossroadsCubing2017', 'f', 8941, 8727, 10321, 15831, 9803, 8727, 9688);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2014SEBA01', 'IstresOpen2017', 'd', 3201, 4130, 2536, 2729, 3764, 2536, 3231);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2014CHER05', 'IstresOpen2017', 'd', 2469, -1, 3784., 2894, 3110, 2469, 3263.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2013GERT01', 'IstresOpen2017', 'd', 3747, 3717, 2938, 3431, 4068, 2938, 3632);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '2016PYWI01', 'IstresOpen2017', 'd', 4654, 4198, 6077, 5469, 5400, 4198, 5174);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (5, '2015DEGL01', 'IstresOpen2017', 'd', 7307., 5448, 8873, 7968., 7591, 5448, 7622);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (6, '2017VERD03', 'IstresOpen2017', 'd', 9428, 8803, 12876, 8272, 9908, 8272, 9380);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (7, '2017MILL06', 'IstresOpen2017', 'd', 13046, 11936, 12207, 14347, 11815, 11815, 12396);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (8, '2017FOUR01', 'IstresOpen2017', 'd', 20090, 23636, 10419, 11066, 12381, 10419, 14512);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (9, '2017VERD02', 'IstresOpen2017', 'd', -1, -1, 0, 0, 0, -1, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2014CHER05', 'IstresOpen2017', 'f', 3162, 2591, 2083, 2808, 2700, 2083, 2700);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2014SEBA01', 'IstresOpen2017', 'f', 3997, 2651, 3497, 2642, 4780, 2642, 3382);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2013GERT01', 'IstresOpen2017', 'f', -1, 4441, 4437, 3501, 5068, 3501, 4649);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '2016PYWI01', 'IstresOpen2017', 'f', -1, 6057, 5807, 4597, 4108, 4108, 5487);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2010AMBR01', 'MusicCitySpeedsolving2017', 'f', 2409, 2514, 2983, 2326, 2631, 2326, 2518);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2010HULL01', 'MusicCitySpeedsolving2017', 'f', 2938, 2461, 2984, 2277, 2887, 2277, 2762);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2015SANC11', 'MusicCitySpeedsolving2017', 'f', 2498, 3326, 2928, 3001, 3563., 2498, 3085);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '2015JOIN01', 'MusicCitySpeedsolving2017', 'f', 2822, 3174, 3455., 3235, 3705., 2822, 3288.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (5, '2013LUDW01', 'MusicCitySpeedsolving2017', 'f', 4796, 3610, 3276, 4880, 4089, 3276, 4165);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (6, '2016CLAI02', 'MusicCitySpeedsolving2017', 'f', 8951, 6621., 5432, 5328, 3284., 3284., 5794);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (7, '2015FRIT01', 'MusicCitySpeedsolving2017', 'f', 10529, 6742, 8253, 6151, 5002, 5002, 7049.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (8, '2016AGRA01', 'MusicCitySpeedsolving2017', 'f', 8534, 7314, 6192, 6249, 7871., 6192, 7145);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (9, '2014DRES01', 'MusicCitySpeedsolving2017', 'f', 8328, 7260., 7556, 6728, 5224, 5224, 7181);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (10, '2016BRUN01', 'MusicCitySpeedsolving2017', 'f', 10550, 8304, 6666, 8178, 5533, 5533, 7716);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (11, '2017GATE01', 'MusicCitySpeedsolving2017', 'f', 8170, 7611, 6389, 7701., 8146., 6389, 7819);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (12, '2017FISH02', 'MusicCitySpeedsolving2017', 'f', 8791, 11013, 6201, 7832., 7740., 6201, 8121.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (13, '2016FRIE01', 'MusicCitySpeedsolving2017', 'f', 9471, 8811, 7040., 10811, 7068., 7040., 8450);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (14, '2017SMIT03', 'MusicCitySpeedsolving2017', 'f', 9449, 8121., 10367, 15297, 8716, 8121., 9511);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (15, '2016WILS08', 'MusicCitySpeedsolving2017', 'f', 10327, 10789, 11102, 6973, 10501, 6973, 10539);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (16, '2016MACK07', 'MusicCitySpeedsolving2017', 'f', 11376, 11913, 8376, 12498, 9933, 8376, 11074);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (17, '2017WILK01', 'MusicCitySpeedsolving2017', 'f', -1, 11363, -1, -2, -2, 11363, -1);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2011WANN01', 'HendersonvilleSpring2017', 'c', 2668, 2986, 3050, 2751, 2809, 2668, 2849);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2014STIN01', 'HendersonvilleSpring2017', 'c', 3224, 2631, 3044, 3441., 2691, 2631, 2986);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2010AMBR01', 'HendersonvilleSpring2017', 'c', 3506, 2522, 2984, 3491., 3068, 2522, 3181);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '2014GOSL01', 'HendersonvilleSpring2017', 'c', 3801, 3644, 2687, 2908, 3277., 2687, 3276);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (5, '2015PADG01', 'HendersonvilleSpring2017', 'c', 3581, 3447, 4091., 3178, 3859., 3178, 3629);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (6, '2016ALBR01', 'HendersonvilleSpring2017', 'c', 5420, 6307, 4552, 3851, 4036, 3851, 4669);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (7, '2016KIMB01', 'HendersonvilleSpring2017', 'c', 5409, 4079, 5229, 3979, 4886, 3979, 4731);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (8, '2016DORR01', 'HendersonvilleSpring2017', 'c', 5194, 4166, 5807, 4620, 4547, 4166, 4787);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (9, '2014SMIT09', 'HendersonvilleSpring2017', 'c', 6776., 5136, 5522, 4973, 5768, 4973, 5475);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (10, '2017STAR04', 'HendersonvilleSpring2017', 'c', 5220, 5956, 6310, 6779., 5751, 5220, 6006);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (11, '2016RINE02', 'HendersonvilleSpring2017', 'c', 7648, 5959, 7442, 4873, 9756, 4873, 7016);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (12, '2015FOXC01', 'HendersonvilleSpring2017', 'c', 9026, 6277, 0, 0, 0, 6277, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (13, '2016THIE02', 'HendersonvilleSpring2017', 'c', 7534, 6596., 0, 0, 0, 6596., 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (14, '2015DIZO02', 'HendersonvilleSpring2017', 'c', -1, -2, 0, 0, 0, -1, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (15, '2017LOND01', 'HendersonvilleSpring2017', 'c', -1, -1, 0, 0, 0, -1, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2010AMBR01', 'MountainViewOpen2017', 'c', 2203, 2938, 3717, 2217, 2520, 2203, 2558);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2010HULL01', 'MountainViewOpen2017', 'c', 2683, 2947, 2611, 2727, 2755, 2611, 2722);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2015JOIN01', 'MountainViewOpen2017', 'c', 2764, 2979, 2744, 2843, 2760, 2744, 2789);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '2014GOSL01', 'MountainViewOpen2017', 'c', 3040, 3096, 3150, 2462, 2808, 2462, 2981);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (5, '2014STIN01', 'MountainViewOpen2017', 'c', 3090, 3517, 2915, 3035, 2657, 2657, 3013);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (6, '2015SANC11', 'MountainViewOpen2017', 'c', 3938., 3142, 3110, 2462, 2876, 2462, 3043);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (7, '2013CABR01', 'MountainViewOpen2017', 'c', 3357, 3142, 3430., 4516, 3640, 3142, 3476);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (8, '2017BRYA01', 'MountainViewOpen2017', 'c', 4247, 4398, 4807, 4087., 3837., 3837., 4244);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (9, '2016SANC39', 'MountainViewOpen2017', 'c', 5332, 4770, 4730, 4179, 5257, 4179, 4919);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (10, '2016MULL04', 'MountainViewOpen2017', 'c', 5434, 5004, 5091, 5107, 4194, 4194, 5067);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (11, '2016SKIN01', 'MountainViewOpen2017', 'c', 3178, 4825, 5391, 5238, 5314, 3178, 5126);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (12, '2017TWIG01', 'MountainViewOpen2017', 'c', 5437, 4911, 6884, 5628, 6898, 4911, 5983);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (13, '2017HICK01', 'MountainViewOpen2017', 'c', 8636, 5868, 7399., 6711, 4545, 4545, 6659);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (14, '2017HERR05', 'MountainViewOpen2017', 'c', 6566, 6014, 0, 0, 0, 6014, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (15, '2016PIET03', 'MountainViewOpen2017', 'c', 7211, -1, 0, 0, 0, 7211, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (16, '2017HARD02', 'MountainViewOpen2017', 'c', 7235., -1, 0, 0, 0, 7235., 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (17, '2015BEUG01', 'MountainViewOpen2017', 'c', -1, -1, 0, 0, 0, -1, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2008WONE01', 'OverlandParkOpen2017', 'c', 2760, 2889, 2633, 3774, 2474, 2474, 2761);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2015SPEC01', 'OverlandParkOpen2017', 'c', 3803, 3743, 4333, 3308, 3656, 3308, 3734.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2017MILL14', 'OverlandParkOpen2017', 'c', 4562, 4344, 3593, 3867, 5941, 3593, 4258);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '2015WEBS01', 'OverlandParkOpen2017', 'c', 5529, 4780, 4528, 5192, 4387, 4387, 4833);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (5, '2016WOOD02', 'OverlandParkOpen2017', 'c', 6145, 4378, 4519, 4701, 5319, 4378, 4846);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (6, '2013BARK01', 'OverlandParkOpen2017', 'c', 6169, 4237, 3405., 6248, 6004, 3405., 5470);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (7, '2015COOK03', 'OverlandParkOpen2017', 'c', 6602, 6494, 6625, -1, 7126., 6494, 6784);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (8, '2016MACK07', 'OverlandParkOpen2017', 'c', 6544, 8325, 8752, 6048, 4992, 4992, 6972);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (9, '2015FRIT01', 'OverlandParkOpen2017', 'c', 9526, 8727, 7999., 5069, 12800, 5069, 8751);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (10, '2007ALIW01', 'OverlandParkOpen2017', 'c', 8084, 9596, 9259, 7167, 8965, 7167, 8769);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (11, '2017MYER02', 'OverlandParkOpen2017', 'c', -1, 11939, 0, 0, 0, 11939, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2014CHER05', 'BarbyCube732017', 'c', 2418, 2457, 2378, 2410, 1782, 1782, 2402);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2014SEBA01', 'BarbyCube732017', 'c', 2558, 3189, 2247, 2686, 2710, 2247, 2651);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2013GERT01', 'BarbyCube732017', 'c', 2626, 2490, 2990, 2873, 2758, 2490, 2752);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '2016GSEL01', 'BarbyCube732017', 'c', 3175, 2444, 3008, 2856, 3169, 2444, 3011);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (5, '2016ANSE02', 'BarbyCube732017', 'c', 4500, 6029, 5224, 4858, 3932, 3932, 4861);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (6, '2016BOUR01', 'BarbyCube732017', 'c', 5334, 4880, 4891, 3862., 5977, 3862., 5035);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (7, '2016PYWI01', 'BarbyCube732017', 'c', 6287, 6383, 4992, 6766, -1, 4992, 6479.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (8, '2015WYSS01', 'BarbyCube732017', 'c', 6392, -1, 6535., 9921, 5097, 5097, 7616);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (9, '2016LEHE01', 'BarbyCube732017', 'c', 7287, 8090., 11015, -1, 5238, 5238, 8797);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (10, '2010BOUV01', 'BarbyCube732017', 'c', 8725, 15753, 0, 0, 0, 8725, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2014CHER05', 'ChachyaOpen2017', 'c', 2572, 2403, 2546, 2462, 3276, 2403, 2527);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2015BOUS02', 'ChachyaOpen2017', 'c', 5820, 5253, 6334, 6234, 4206, 4206, 5769);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2015BOUS03', 'ChachyaOpen2017', 'c', 24878, 5766, 5221, 6543., 6783, 5221, 6364);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '2014IBRA01', 'ChachyaOpen2017', 'c', 8324, 7539, 8369, 10207, 8212, 7539, 8302);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (5, '2016SLIM01', 'ChachyaOpen2017', 'c', 10064, 10507, 11971, 10006, 7898, 7898, 10192);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (6, '2015BOUS04', 'ChachyaOpen2017', 'c', -1, 19696, 0, 0, 0, 19696, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (7, '2014AMAM01', 'ChachyaOpen2017', 'c', 32030, 22559, 0, 0, 0, 22559, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (8, '2017ELMA01', 'ChachyaOpen2017', 'c', 39626, 96000, 0, 0, 0, 39626, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (9, '2017ALFA08', 'ChachyaOpen2017', 'c', -1, -1, 0, 0, 0, -1, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2010AMBR01', 'NoStressSolving2017', 'd', 2698, 2378, 2755, 2609, 2366, 2366, 2562);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2010HULL01', 'NoStressSolving2017', 'd', 2398, 1746, 3848., 2524, 2898, 1746, 2607);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2014STIN01', 'NoStressSolving2017', 'd', 2683, 2818, 3144, 2934, 2970, 2683, 2907);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '2014GOSL01', 'NoStressSolving2017', 'd', 3525, 3082, 2839, 3054, 2584, 2584, 2992);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (5, '2015JOIN01', 'NoStressSolving2017', 'd', 2783, 2778, -1, 2783, 3643, 2778, 3070);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (6, '2013CABR01', 'NoStressSolving2017', 'd', 3024, 4036, 2682, 3337., 4958, 2682, 3466.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (7, '2015SANC11', 'NoStressSolving2017', 'd', 2555, 4220, 4931, 3227., 4042, 2555, 3830.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (8, '2015MINK04', 'NoStressSolving2017', 'd', 5050, 3766., 3916., 4555, 5216, 3766., 4507);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (9, '2015KIME01', 'NoStressSolving2017', 'd', 5313, 6202, 4003, 3479, 6056, 3479, 5124);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (10, '2016SKIN01', 'NoStressSolving2017', 'd', 4947, 7292, -1, 4725, 4879, 4725, 5706);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (11, '2016FRAG02', 'NoStressSolving2017', 'd', 6340, 7389, 5950, 5119, 6350, 5119, 6213);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (12, '2017PETI02', 'NoStressSolving2017', 'd', 8476, 7314, 5308, 6056, 7148, 5308, 6839);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (13, '2016MCGA01', 'NoStressSolving2017', 'd', 7240., 11167, 7686, 7806, 7527, 7240., 7673);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (14, '2017HICK01', 'NoStressSolving2017', 'd', 6965., 9289, 5836, 9000, -1, 5836, 8418);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (15, '2017LANK04', 'NoStressSolving2017', 'd', 9665, 9340, 9532, 6655, 7841, 6655, 8904);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (16, '2016GOLD11', 'NoStressSolving2017', 'd', 8542, 9075, 7217, 9840, 9924, 7217, 9152);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (17, '2016HOSS04', 'NoStressSolving2017', 'd', 9898, 9109, 10114, 8754, 7895, 7895, 9254);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (18, '2017WILL15', 'NoStressSolving2017', 'd', 15761., 12357, 0, 0, 0, 12357, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2010HULL01', 'NoStressSolving2017', 'f', 2272, 2612, 2701, 3593, 2149, 2149, 2528);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2010AMBR01', 'NoStressSolving2017', 'f', 2638, 2774, 2576, 2333, 2659, 2333, 2624);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2014STIN01', 'NoStressSolving2017', 'f', 1642., 2409, 3820., 2949, 2742, 1642., 2700);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '2015SANC11', 'NoStressSolving2017', 'f', 2955, 2753, 2864, 2429, 4194, 2429, 2857);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (5, '2014GOSL01', 'NoStressSolving2017', 'f', 3058, 2522, 3783, 2644, 3514, 2522, 3072);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (6, '2015JOIN01', 'NoStressSolving2017', 'f', 2843, 3846, 3663., 2598, 3384., 2598, 3297);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (7, '2013CABR01', 'NoStressSolving2017', 'f', 3772, 3347, 3599, 2698, 3710, 2698, 3552.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (8, '2015MINK04', 'NoStressSolving2017', 'f', 4803, 4378, 5100, 4236, 4208, 4208, 4472);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2014CHER05', 'LondonOpen2017', 'c', 2533, 2358, 2333, 2124, 3199, 2124, 2408);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2013SAVA01', 'LondonOpen2017', 'c', 2483, 2393, 1961, 2423, 2887, 1961, 2433);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2014SCHW02', 'LondonOpen2017', 'c', 2805, 2512, 2664, 2984, 2556, 2512, 2675);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '2014STAR05', 'LondonOpen2017', 'c', 4422, 5292, 4655, 4092, 4146, 4092, 4408);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (5, '2010CANT02', 'LondonOpen2017', 'c', 5304, 4464, 3667, 5617, 4335, 3667, 4701);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (6, '2014KARL01', 'LondonOpen2017', 'c', 5007, 6438, 5972, 5112, 5230, 5007, 5438);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (7, '2017JOHN15', 'LondonOpen2017', 'c', 7336, 10902, 5357, 6168, 8899, 5357, 7468.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (8, '2017ABBO01K', 'LondonOpen2017', 'c', 7426., 9917, 6861, 6935., 8400, 6861, 7587);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (9, '2017CRAV01', 'LondonOpen2017', 'c', -1, 7532., 7543., 6753, 8782, 6753, 7952);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (10, '2014BERK02', 'LondonOpen2017', 'c', 8599, 11632, -1, -1, 9953, 8599, -1);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (11, '2016DUEC01', 'LondonOpen2017', 'c', 16524, -2, 0, 0, 0, 16524, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (12, '2016RUSS04', 'LondonOpen2017', 'c', -1, -1, 0, 0, 0, -1, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (12, '2016HEDG01', 'LondonOpen2017', 'c', -1, -1, 0, 0, 0, -1, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (12, '2017JEFF02', 'LondonOpen2017', 'c', -1, -1, 0, 0, 0, -1, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2012BUBE01', 'ZurichOpen2017', 'c', 4009., 3466., 3045, 2995, 3881, 2995, 3464);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2015RIZZ02', 'ZurichOpen2017', 'c', 3378, 3862., 3671, 4262, 3482, 3378, 3672);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2010KOHL02', 'ZurichOpen2017', 'c', 3566., 3732, 3954, 3868, 4483, 3566., 3851);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '2015PFEU02', 'ZurichOpen2017', 'c', 3148, 5042, 4602, 3961, 3659., 3148, 4074);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (5, '2010TGRAB01', 'ZurichOpen2017', 'c', 4188, 2991, 3635, 5053, -1, 2991, 4292);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (6, '2013TSCH02', 'ZurichOpen2017', 'c', 7254., 6870, 0, 0, 0, 6870, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (7, '2016MEYE02', 'ZurichOpen2017', 'c', 6873, 8703, 0, 0, 0, 6873, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (8, '2011GRIT01', 'ZurichOpen2017', 'c', 7208, 7339, 0, 0, 0, 7208, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (9, '2016HOUG01', 'ZurichOpen2017', 'c', 10954, 11979, 0, 0, 0, 10954, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (10, '2016GROS06', 'ZurichOpen2017', 'c', -1, -1, 0, 0, 0, -1, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (10, '2017STOS01', 'ZurichOpen2017', 'c', -1, -1, 0, 0, 0, -1, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2014CHER05', 'BarbyCubeAutomne2017', 'c', 2475, 2160, 1926., 1769., 2380, 1769., 2155);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2014SEBA01', 'BarbyCubeAutomne2017', 'c', 2293, 3014, 3244, 2861, 2801, 2293, 2892);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2016ANSE02', 'BarbyCubeAutomne2017', 'c', 2971, 3009, 4793, 3717, 2787, 2787, 3232);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '20146GSEL01', 'BarbyCubeAutomne2017', 'c', 3964, 2635, 3398., 3627., 3529, 2635, 3518);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (5, '2011HOFF02', 'BarbyCubeAutomne2017', 'c', 3289, 4079, 3590, 4151, 3776, 3289, 3815);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (6, '2015DEGL01', 'BarbyCubeAutomne2017', 'c', 4121, 4388, 4208, 4156, 4014, 4014, 4162);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (7, '2016BOUR01', 'BarbyCubeAutomne2017', 'c', 4649, 7389, 5740, 4123, 4129, 4123, 4839);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (8, '2016PYWI01', 'BarbyCubeAutomne2017', 'c', 6867, 4952, 5059, 3470., 4756, 3470., 4922);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (9, '2016VINC01', 'BarbyCubeAutomne2017', 'c', 4748, 5279, 5293, 5596, 4296, 4296, 5107);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (10, '2016LESU01', 'BarbyCubeAutomne2017', 'c', -1, 5468, 3831, 6131, 3860, 3831, 5153);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (11, '2016KANI01', 'BarbyCubeAutomne2017', 'c', 5533, 4101, 5160, 5424, 5033, 4101, 5206);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (12, '2015KULL01', 'BarbyCubeAutomne2017', 'c', 5116, 7139, 5944, 5759, 4768, 4768, 5606);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (13, '2015WYSS01', 'BarbyCubeAutomne2017', 'c', 9896, 5461, 5209, 5891, 6741, 5209, 6031);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (14, '2014BLAI02', 'BarbyCubeAutomne2017', 'c', 5804, -1, 0, 0, 0, 5804, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (15, '2015VERD03', 'BarbyCubeAutomne2017', 'c', 11227, 7912, 0, 0, 0, 7912, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (16, '2016SEGR01', 'BarbyCubeAutomne2017', 'c', 15979, 9416, 0, 0, 0, 9416, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2012HUGH01', 'VeteransDayOpen2017', 'f', 3924, 4636, 3248., 3595., 3463., 3248., 3661);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2017DAYR01', 'VeteransDayOpen2017', 'f', 3837., 4579, 3360, 4208, 3668, 3360, 3904);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2014MOSA01', 'VeteransDayOpen2017', 'f', 3550, 5346, 4199, 3605., 3871, 3550, 3892);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '2014WALK05', 'VeteransDayOpen2017', 'f', 5104, 5900, 4509, 4680, 6246, 4509, 5228);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (5, '2016STEE01', 'VeteransDayOpen2017', 'f', 6168, 6246, -1, 5889, 6464, 5889, 6293);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (6, '2017NICH02', 'VeteransDayOpen2017', 'f', 5944, 6131, 6082, 8220, 7281, 5944, 6498);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (7, '2016WATS05', 'VeteransDayOpen2017', 'f', 6560., 9626, 6983, 5407, 6764, 5407, 6769);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (8, '2017DATZ01', 'VeteransDayOpen2017', 'f', 6514, 7448, 9535, 5938, 7874., 5938, 7279.);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (9, '2017DANI07', 'VeteransDayOpen2017', 'f', 8398, 8214, 8268, 10141, 9246, 8214, 8637);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (10, '2017WEBE03', 'VeteransDayOpen2017', 'f', 8295, 10361, 7710., 8900, 9760, 7710., 8985);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (11, '2017LABI01', 'VeteransDayOpen2017', 'f', 10920, 16051, 11044, 10474, 8817, 8817, 10813);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (12, '2017UPSO01', 'VeteransDayOpen2017', 'f', 11257, 12689, 6575, 15193, 8608, 6575, 10851);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (13, '2017HOFF06', 'VeteransDayOpen2017', 'f', 18742, 13697, 12860, 16271, -1, 12860, 16237);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (1, '2014SEBA01', 'ChamberyCube2018', 'c', 3114, 2172, 1888, 2463, 2686, 1888, 2440);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (2, '2012BUBE01', 'ChamberyCube2018', 'c', 3423., 2155, 2687, 2639, 3509., 2155, 2916);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (3, '2016ANSE02', 'ChamberyCube2018', 'c', 3834., 3170, 3295., 3275, 2846, 2846, 3247);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (4, '2016GRAS01', 'ChamberyCube2018', 'c', 3334., 3635, 3138, 3710, 3671, 3138, 3547);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (5, '2014CHER05', 'ChamberyCube2018', 'c', 3046, -2, -2, -2, -2, 3046, -1);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (6, '2016GSEL01', 'ChamberyCube2018', 'c', 5211, 4686, 0, 0, 0, 4686, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (7, '2015WYSS01', 'ChamberyCube2018', 'c', 6948, 4693, 0, 0, 0, 4693, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (8, '2018TEMP01', 'ChamberyCube2018', 'c', 6301, 4841, 0, 0, 0, 4841, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (9, '2016VINC01', 'ChamberyCube2018', 'c', 6377, 4848, 0, 0, 0, 4848, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (10, '2016PYWI01', 'ChamberyCube2018', 'c', 7562, 5146, 0, 0, 0, 5146, 0);
INSERT INTO DIYDB.Results (pos, personId, competitionId, roundTypeId, value1, value2, value3, value4, value5, best, average)
VALUES (11, '2016LESU01', 'ChamberyCube2018', 'c', 5281, -1, 0, 0, 0, 5281, 0);
# 336 Tuples


#RanksAverage
#Not populate yet


#RanksSingle
#Not Populate yet


#ResultRanksAverage
#Not populate yet


#ResultRanksSingle
#Not Populate yet


#Posts
#INSERT INTO DIYDB.Posts(title, body, authorId, postDate)
#VALUES('INIT', 'Welcome to the first post for the Official Unofficial Kilominx Results!', '2010AMBR01', CURDATE())