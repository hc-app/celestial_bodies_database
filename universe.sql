--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    satellites integer NOT NULL,
    images integer NOT NULL,
    length_km numeric(8,1),
    description text,
    observing boolean,
    active boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    satellites integer NOT NULL,
    images integer NOT NULL,
    length_ly numeric(8,1),
    description text,
    observing boolean,
    active boolean,
    asteroid_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    satellites integer NOT NULL,
    images integer NOT NULL,
    length_km numeric(5,1),
    description text,
    observing boolean,
    active boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    satellites integer NOT NULL,
    images integer NOT NULL,
    length_km numeric(8,1),
    description text,
    observing boolean,
    active boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    satellites integer NOT NULL,
    images integer NOT NULL,
    length_km numeric(8,1),
    description text,
    observing boolean,
    active boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Asteroid_01', 0, 5, 123.0, 'Asteroid_01 description.', true, true);
INSERT INTO public.asteroid VALUES (2, 'Asteroid_02', 0, 2, 25.0, 'Asteroid_02 description.', true, true);
INSERT INTO public.asteroid VALUES (3, 'Asteroid_03', 0, 10, 125.0, 'Asteroid_03 description.', true, true);
INSERT INTO public.asteroid VALUES (4, 'Asteroid_04', 0, 2, 23.0, 'Asteroid_04 description.', true, true);
INSERT INTO public.asteroid VALUES (5, 'Asteroid_05', 1, 15, 3456.0, 'Asteroid_05 description.', true, true);
INSERT INTO public.asteroid VALUES (6, 'Asteroid_06', 1, 30, 34578.0, 'Asteroid_06 description.', true, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100, 123, 87400.0, 'The galaxy that contains our solar system.', true, true, 1);
INSERT INTO public.galaxy VALUES (2, 'Galaxy_01', 0, 50, 123456.0, 'Galaxy_01 description', true, true, 2);
INSERT INTO public.galaxy VALUES (3, 'Galaxy_02', 0, 20, 178910.1, 'Galaxy_02 description', false, true, 3);
INSERT INTO public.galaxy VALUES (4, 'Galaxy_03', 10, 25, 561789.5, 'Galaxy_03 description', true, true, 4);
INSERT INTO public.galaxy VALUES (5, 'Galaxy_04', 0, 20, 168910.1, 'Galaxy_04 description', false, false, 5);
INSERT INTO public.galaxy VALUES (6, 'Galaxy_05', 0, 30, 361789.5, 'Galaxy_05 description', true, true, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon_01', 1, 10, 1234.0, 'Moon_01 description.', true, true, 1);
INSERT INTO public.moon VALUES (2, 'Moon_02', 2, 2, 235.0, 'moon_02 description.', true, true, 2);
INSERT INTO public.moon VALUES (3, 'Moon_03', 3, 10, 1345.0, 'Moon_03 description.', true, true, 2);
INSERT INTO public.moon VALUES (4, 'Moon_04', 4, 2, 3452.0, 'Moon_04 description.', true, true, 4);
INSERT INTO public.moon VALUES (5, 'Moon_05', 5, 5, 346.0, 'Moon_05 description.', true, true, 4);
INSERT INTO public.moon VALUES (6, 'Moon_06', 6, 30, 578.0, 'Moon_06 description.', true, true, 5);
INSERT INTO public.moon VALUES (7, 'Moon_07', 6, 20, 1567.0, 'Moon_07 description.', true, true, 5);
INSERT INTO public.moon VALUES (8, 'Moon_08', 3, 10, 345.0, 'Moon_08 description.', true, true, 5);
INSERT INTO public.moon VALUES (9, 'Moon_09', 1, 10, 1235.0, 'Moon_09 description.', true, true, 6);
INSERT INTO public.moon VALUES (10, 'Moon_10', 5, 5, 356.0, 'Moon_10 description.', true, true, 6);
INSERT INTO public.moon VALUES (11, 'Moon_11', 1, 10, 123.0, 'Moon_11 description.', true, true, 6);
INSERT INTO public.moon VALUES (15, 'Moon_12', 2, 2, 235.0, 'Moon_12 description.', true, true, 6);
INSERT INTO public.moon VALUES (16, 'Moon_13', 3, 10, 1345.0, 'Moon_13 description.', true, true, 6);
INSERT INTO public.moon VALUES (17, 'Moon_14', 4, 2, 3452.0, 'Moon_14 description.', true, true, 7);
INSERT INTO public.moon VALUES (18, 'Moon_15', 5, 5, 346.0, 'Moon_15 description.', true, true, 8);
INSERT INTO public.moon VALUES (19, 'Moon_16', 6, 30, 578.0, 'Moon_16 description.', true, true, 9);
INSERT INTO public.moon VALUES (20, 'Moon_17', 6, 20, 1567.0, 'Moon_17 description.', true, true, 10);
INSERT INTO public.moon VALUES (21, 'Moon_18', 3, 10, 345.0, 'Moon_18 description.', true, true, 11);
INSERT INTO public.moon VALUES (22, 'Moon_19', 1, 10, 1235.0, 'Moon_19 description.', true, true, 12);
INSERT INTO public.moon VALUES (23, 'Moon_20', 5, 5, 356.0, 'Moon_20 description.', true, true, 13);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planet_01', 1, 10, 1234.0, 'Planet_01 description.', true, true, 1);
INSERT INTO public.planet VALUES (2, 'Planet_02', 2, 2, 2345.0, 'Planet_02 description.', true, true, 1);
INSERT INTO public.planet VALUES (4, 'Planet_03', 3, 10, 12345.0, 'Planet_03 description.', true, true, 2);
INSERT INTO public.planet VALUES (5, 'Planet_04', 4, 2, 23452.0, 'Planet_04 description.', true, true, 2);
INSERT INTO public.planet VALUES (6, 'Planet_05', 5, 5, 3456.0, 'Planet_05 description.', true, true, 3);
INSERT INTO public.planet VALUES (7, 'Planet_06', 6, 30, 34578.0, 'Planet_06 description.', true, true, 3);
INSERT INTO public.planet VALUES (8, 'Planet_07', 6, 20, 123567.0, 'Planet_07 description.', true, true, 3);
INSERT INTO public.planet VALUES (9, 'Planet_08', 3, 10, 12345.0, 'Planet_08 description.', true, true, 3);
INSERT INTO public.planet VALUES (10, 'Planet_09', 4, 2, 23452.0, 'Planet_09 description.', true, true, 3);
INSERT INTO public.planet VALUES (11, 'Planet_10', 5, 5, 3456.0, 'Planet_10 description.', true, true, 4);
INSERT INTO public.planet VALUES (12, 'Planet_11', 6, 30, 34578.0, 'Planet_11 description.', true, true, 5);
INSERT INTO public.planet VALUES (13, 'Planet_12', 6, 20, 123567.0, 'Planet_12 description.', true, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 10, 25, 1390000.0, 'The star where our solar system resides.', true, true, 1);
INSERT INTO public.star VALUES (2, 'Star_01', 5, 5, 123456.0, 'Star_01 description.', true, true, 2);
INSERT INTO public.star VALUES (3, 'Star_02', 0, 15, 1987456.0, 'Star_02 description.', true, true, 3);
INSERT INTO public.star VALUES (4, 'Star_03', 1, 20, 6789123.0, 'Star_03 description.', true, true, 4);
INSERT INTO public.star VALUES (5, 'Star_04', 0, 2, 174567.0, 'Star_04 description.', false, false, 5);
INSERT INTO public.star VALUES (6, 'Star_05', 5, 30, 612345.0, 'Star_05 description.', true, true, 6);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_asteroid_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_asteroid_id_fkey FOREIGN KEY (asteroid_id) REFERENCES public.asteroid(asteroid_id);


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

