--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    diameter_lightyears integer,
    shape_galaxy character varying(40)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_from_earth numeric(10,1),
    diameterofmoon numeric(8,0),
    turnaroundtime numeric(8,3),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    count_moons integer,
    is_spherical boolean,
    diameterofplanet numeric(9,1),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    planettyp character varying(40),
    typdescription text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_billions_of_year numeric(8,2),
    has_life boolean,
    count_planets integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milchstrasse', 'Die Milchstraße, auch Galaxis, ist die Galaxie, in der sich das Sonnensystem mit der Erde befindet.', 100, 'Spiralgalaxie');
INSERT INTO public.galaxy VALUES (2, 'Grosse Magelanische Wolke', 'Die Magellanschen Wolken sind zwei irreguläre Zwerggalaxien in relativer Nähe zur Milchstraße', 25, 'Unregelmaessige Galaxie');
INSERT INTO public.galaxy VALUES (3, 'Kleine Magelanische Wolke', 'Die Magellanschen Wolken sind zwei irreguläre Zwerggalaxien in relativer Nähe zur Milchstraße', 15, 'Unregelmaessige Galaxie');
INSERT INTO public.galaxy VALUES (4, 'URSA-MINOR-Zwerg', 'Die Ursa-Minor-Zwerggalaxie ist eine elliptische Zwerggalaxie im Sternbild des Kleinen Bären. ', 2, 'sphaeroide Galaxie');
INSERT INTO public.galaxy VALUES (5, 'Cetus-Zwerg', 'Die Cetus-Zwerggalaxie ist eine sphäroidale Zwerggalaxie im Sternbild des Walfischs.', 3, 'sphaeroide Galaxie');
INSERT INTO public.galaxy VALUES (6, 'Andromeda 1', 'Andromeda I ist eine spheroidale Zwerggalaxie (dSph) im Sternbild der Andromeda.', 3, 'sphaeroide Galaxie');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Mond', 384400.0, 3474, 27.320, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 6000.0, 22, 0.300, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 20063.0, 12, 1.100, 4);
INSERT INTO public.moon VALUES (4, 'Metis', 128000.0, 43, 0.295, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 671100.0, 3121, 3.551, 5);
INSERT INTO public.moon VALUES (6, 'Thebe', 200000.0, 98, 0.675, 5);
INSERT INTO public.moon VALUES (7, 'Themisto', 7507000.0, 8, 130.020, 5);
INSERT INTO public.moon VALUES (8, 'Ersa', 11500000.0, 3, 252.000, 5);
INSERT INTO public.moon VALUES (9, 'Daphnis', 136505.0, 7, 0.590, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 185520.0, 396, 0.940, 6);
INSERT INTO public.moon VALUES (11, 'Telesto', 294619.0, 25, 1.880, 6);
INSERT INTO public.moon VALUES (12, 'Rosalind', 69927.0, 72, 0.558, 7);
INSERT INTO public.moon VALUES (13, 'Cordelia', 49752.0, 40, 0.335, 7);
INSERT INTO public.moon VALUES (14, 'Bianca', 59166.0, 54, 0.435, 7);
INSERT INTO public.moon VALUES (15, 'Larissa', 48800.0, 194, 0.550, 8);
INSERT INTO public.moon VALUES (16, 'Proteus', 117647.0, 428, 1.120, 8);
INSERT INTO public.moon VALUES (17, 'Naiad', 48227.0, 66, 0.294, 8);
INSERT INTO public.moon VALUES (18, 'Sao', 15900000.0, 40, 2914.000, 8);
INSERT INTO public.moon VALUES (19, 'Thalassa', 50075.0, 82, 0.310, 8);
INSERT INTO public.moon VALUES (20, 'Atlas', 137670.0, 30, 0.601, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Erde', 1, true, 12756.3, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, true, 12103.6, 1);
INSERT INTO public.planet VALUES (3, 'Merkur', 0, true, 4881.0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, true, 6792.0, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 95, true, 142984.0, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 146, true, 120536.0, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 28, true, 51118.0, 1);
INSERT INTO public.planet VALUES (8, 'Neptun', 16, true, 49528.0, 1);
INSERT INTO public.planet VALUES (9, 'Ross 128 b', 0, true, 20000.0, 5);
INSERT INTO public.planet VALUES (10, 'Wolf 1061', 0, true, 4000.0, 3);
INSERT INTO public.planet VALUES (11, 'Wolf 1061 c', 0, true, 20409.0, 3);
INSERT INTO public.planet VALUES (12, 'Wolf 1061 d', 0, true, 4107.0, 3);
INSERT INTO public.planet VALUES (13, 'Pluto', 5, false, 2374.0, 1);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Gesteinsplanet', 'Ein felsiger Planet, auch Tellur genannt, hat eine felsige Oberfläche und ist daher fest.');
INSERT INTO public.planet_types VALUES (2, 'Gasriese', ' Diese Planeten werden so genannt, weil sie im Grunde Riesen sind und vollständig aus Gas bestehen (außer dem Kern).');
INSERT INTO public.planet_types VALUES (3, 'Zwergplanet', 'Sehr kleine Planeten.');
INSERT INTO public.planet_types VALUES (4, 'Gesteinsplanet', 'Bestehen ueberwiegend aus Gestain');
INSERT INTO public.planet_types VALUES (5, 'Gasplanet', 'Bestehen ueberwiegend aus gasfoermigen Stoffen');
INSERT INTO public.planet_types VALUES (6, 'Zwergplanet', 'Ein Zwergplanet ist ein Himmelskörper im Sonnensystem, der direkt die Sonne umkreist, aber nicht genug Masse hat, um seine Bahn von anderen Objekten freizuräumen.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (4, 'Alpha Centauri', 6.00, false, 0, 1);
INSERT INTO public.star VALUES (5, 'Ross 128', 5.00, false, 0, 1);
INSERT INTO public.star VALUES (1, 'Sonne', 4.57, true, 8, 1);
INSERT INTO public.star VALUES (6, 'Prokyon', 2.80, false, 0, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 238.00, false, 0, 1);
INSERT INTO public.star VALUES (3, 'Wolf 359', 100.00, false, 0, 1);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 13, true);


--
-- Name: planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_id_seq', 6, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

