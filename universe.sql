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
    name character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    num_of_stars_in_bil integer,
    scientific_name character varying(30)
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
    planet_id integer NOT NULL,
    is_habitable boolean NOT NULL,
    color text
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
    star_id integer NOT NULL,
    is_habitable boolean NOT NULL,
    population_in_mil numeric(6,1)
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
-- Name: race; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.race (
    race_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    planets_colonized integer
);


ALTER TABLE public.race OWNER TO freecodecamp;

--
-- Name: race_race_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.race_race_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.race_race_id_seq OWNER TO freecodecamp;

--
-- Name: race_race_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.race_race_id_seq OWNED BY public.race.race_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    type character varying(30) NOT NULL,
    scientific_name character varying(30)
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
-- Name: race race_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.race ALTER COLUMN race_id SET DEFAULT nextval('public.race_race_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100, 'Milky Way Galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 110, 'Andromeda Galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 40, 'Triangulum Galaxy');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 200, 'Virgo A');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 60, 'Whirlpool Galaxy');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Ring', 30, 'Cartwheel Galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Luna', 13, false, 'Grey');
INSERT INTO public.moon VALUES (22, 'Deimos', 14, false, 'Red');
INSERT INTO public.moon VALUES (23, 'Phobos', 14, false, 'Red');
INSERT INTO public.moon VALUES (24, 'Europa', 15, false, 'White');
INSERT INTO public.moon VALUES (25, 'Io', 15, false, 'Yellow');
INSERT INTO public.moon VALUES (26, 'Ganymede', 15, false, 'White');
INSERT INTO public.moon VALUES (27, 'Callisto', 15, false, 'Brown');
INSERT INTO public.moon VALUES (28, 'Endor', 22, true, 'Green');
INSERT INTO public.moon VALUES (29, 'Pandora', 20, false, 'Blue');
INSERT INTO public.moon VALUES (30, 'Krypton Moon 1', 17, false, 'Unknown');
INSERT INTO public.moon VALUES (31, 'Krypton Moon 2', 17, false, 'Unknown');
INSERT INTO public.moon VALUES (32, 'Krypton Moon 3', 17, false, 'Unknown');
INSERT INTO public.moon VALUES (33, 'Krypton Moon 4', 17, false, 'Unknown');
INSERT INTO public.moon VALUES (34, 'Naboo Moon 1', 16, true, 'Green');
INSERT INTO public.moon VALUES (35, 'Naboo Moon 2', 16, true, 'Blue');
INSERT INTO public.moon VALUES (36, 'Alderaan Moon 1', 15, true, 'White');
INSERT INTO public.moon VALUES (37, 'Alderaan Moon 2', 15, true, 'White');
INSERT INTO public.moon VALUES (38, 'Alderaan Moon 3', 15, true, 'White');
INSERT INTO public.moon VALUES (39, 'Tatooine Moon 1', 14, false, 'Brown');
INSERT INTO public.moon VALUES (40, 'Tatooine Moon 2', 14, false, 'Brown');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Earth', 1, true, 7700.0);
INSERT INTO public.planet VALUES (14, 'Mars', 1, false, 0.0);
INSERT INTO public.planet VALUES (15, 'Venus', 2, false, 0.0);
INSERT INTO public.planet VALUES (16, 'Tatooine', 5, false, 0.0);
INSERT INTO public.planet VALUES (17, 'Alderaan', 5, true, 2.0);
INSERT INTO public.planet VALUES (18, 'Naboo', 6, true, 4.5);
INSERT INTO public.planet VALUES (19, 'Krypton', 4, true, 0.0);
INSERT INTO public.planet VALUES (20, 'Coruscant', 6, true, 1.0);
INSERT INTO public.planet VALUES (21, 'Mustafar', 5, false, 0.0);
INSERT INTO public.planet VALUES (22, 'Pandora', 4, true, 0.0);
INSERT INTO public.planet VALUES (23, 'Endor', 4, true, 0.0);
INSERT INTO public.planet VALUES (24, 'Abydos', 4, true, 0.0);


--
-- Data for Name: race; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.race VALUES (4, 'Humans', 13, 1);
INSERT INTO public.race VALUES (5, 'Santi', 24, 46);
INSERT INTO public.race VALUES (6, 'Navi', 22, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type main-sequence', 'Sol');
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 'G2V', 'Alpha Centauri A');
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 1, 'K1V', 'Alpha Centauri B');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'M5.5Ve', 'Proxima Centauri');
INSERT INTO public.star VALUES (5, 'Sirius', 2, 'A1V', 'Sirius A');
INSERT INTO public.star VALUES (6, 'Canopus', 4, 'F0Ib', 'Alpha Carinae');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: race_race_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.race_race_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: race race_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.race
    ADD CONSTRAINT race_name_key UNIQUE (name);


--
-- Name: race race_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.race
    ADD CONSTRAINT race_pkey PRIMARY KEY (race_id);


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
-- Name: race race_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.race
    ADD CONSTRAINT race_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

