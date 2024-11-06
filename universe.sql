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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    is_supermassive boolean NOT NULL,
    name character varying(50) NOT NULL,
    black_hole_id integer NOT NULL
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50),
    galaxy_type text NOT NULL,
    has_live boolean DEFAULT false NOT NULL,
    has_supermassive_black_holes boolean DEFAULT false NOT NULL
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
    name character varying(50),
    distance_from_planet numeric(4,3) NOT NULL,
    planet_id integer,
    temperature integer NOT NULL
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
    name character varying(50),
    star_id integer,
    has_moon boolean NOT NULL,
    has_live boolean NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    age_in_million_years integer NOT NULL,
    diameter integer,
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (true, 'Sagittarius A*', 1);
INSERT INTO public.black_hole VALUES (true, 'M87*', 2);
INSERT INTO public.black_hole VALUES (true, 'TON 618', 3);
INSERT INTO public.black_hole VALUES (true, 'NGC 4889', 4);
INSERT INTO public.black_hole VALUES (true, 'IC 1101', 5);
INSERT INTO public.black_hole VALUES (true, 'Holm 15A', 6);
INSERT INTO public.black_hole VALUES (true, 'NGC 1277', 7);
INSERT INTO public.black_hole VALUES (true, 'Cygnus A', 8);
INSERT INTO public.black_hole VALUES (true, 'NGC 1600', 9);
INSERT INTO public.black_hole VALUES (true, 'Centaurus A', 10);
INSERT INTO public.black_hole VALUES (false, 'Cygnus X-1', 11);
INSERT INTO public.black_hole VALUES (false, 'V404 Cygni', 12);
INSERT INTO public.black_hole VALUES (false, 'GRO J1655-40', 13);
INSERT INTO public.black_hole VALUES (false, 'GX 339-4', 14);
INSERT INTO public.black_hole VALUES (false, 'LMC X-1', 15);
INSERT INTO public.black_hole VALUES (false, 'XTE J1650-500', 16);
INSERT INTO public.black_hole VALUES (false, 'GRS 1915+105', 17);
INSERT INTO public.black_hole VALUES (false, 'A0620-00', 18);
INSERT INTO public.black_hole VALUES (false, 'MAXI J1820+070', 19);
INSERT INTO public.black_hole VALUES (false, 'Swift J1753.5-0127', 20);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Láctea', 'Espirais', false, false);
INSERT INTO public.galaxy VALUES (3, 'Andrômeda', 'Espiral', false, false);
INSERT INTO public.galaxy VALUES (4, 'Triângulo', 'Espiral', false, false);
INSERT INTO public.galaxy VALUES (5, 'Galáxia do Charuto', 'Irregular', false, false);
INSERT INTO public.galaxy VALUES (6, 'Galáxia do Sombreiro', 'Lenticular', false, false);
INSERT INTO public.galaxy VALUES (7, 'Messier 87', 'Elíptica', false, false);
INSERT INTO public.galaxy VALUES (8, 'Centaurus A', 'Elíptica', false, false);
INSERT INTO public.galaxy VALUES (9, 'Galáxia de Bode', 'Espiral', false, false);
INSERT INTO public.galaxy VALUES (10, 'Galáxia do Escultor', 'Irregular', false, false);
INSERT INTO public.galaxy VALUES (11, 'Galáxia de Magalhães', 'Irregular', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3.123, 3, -20);
INSERT INTO public.moon VALUES (2, 'Fobos', 9.123, 4, -40);
INSERT INTO public.moon VALUES (3, 'Deimos', 2.123, 4, -40);
INSERT INTO public.moon VALUES (4, 'Io', 4.123, 5, -143);
INSERT INTO public.moon VALUES (5, 'Europa', 6.123, 5, -160);
INSERT INTO public.moon VALUES (6, 'Ganimedes', 1.123, 5, -160);
INSERT INTO public.moon VALUES (7, 'Calisto', 1.123, 5, -139);
INSERT INTO public.moon VALUES (8, 'Titã', 1.123, 6, -179);
INSERT INTO public.moon VALUES (9, 'Encélado', 2.123, 6, -201);
INSERT INTO public.moon VALUES (10, 'Mimas', 1.123, 6, -198);
INSERT INTO public.moon VALUES (11, 'Tétis', 2.123, 6, -187);
INSERT INTO public.moon VALUES (12, 'Reia', 5.123, 6, -174);
INSERT INTO public.moon VALUES (13, 'Dione', 3.123, 6, -186);
INSERT INTO public.moon VALUES (14, 'Miranda', 1.123, 7, -187);
INSERT INTO public.moon VALUES (15, 'Ariel', 1.123, 7, -213);
INSERT INTO public.moon VALUES (16, 'Umbriel', 2.123, 7, -214);
INSERT INTO public.moon VALUES (17, 'Titânia', 4.123, 7, -203);
INSERT INTO public.moon VALUES (18, 'Oberon', 5.123, 7, -193);
INSERT INTO public.moon VALUES (19, 'Tritão', 3.123, 8, -235);
INSERT INTO public.moon VALUES (20, 'Caronte', 4.123, 9, -229);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercúrio', 3, false, false);
INSERT INTO public.planet VALUES (2, 'Vênus', 3, false, false);
INSERT INTO public.planet VALUES (3, 'Terra', 3, true, true);
INSERT INTO public.planet VALUES (4, 'Marte', 3, true, false);
INSERT INTO public.planet VALUES (5, 'Júpiter', 3, true, false);
INSERT INTO public.planet VALUES (6, 'Saturno', 3, true, false);
INSERT INTO public.planet VALUES (7, 'Urano', 3, true, false);
INSERT INTO public.planet VALUES (8, 'Netuno', 3, true, false);
INSERT INTO public.planet VALUES (9, 'Plutão', 3, true, false);
INSERT INTO public.planet VALUES (10, 'Ceres', 3, false, false);
INSERT INTO public.planet VALUES (11, 'Haumea', 3, true, false);
INSERT INTO public.planet VALUES (12, 'Makemake', 3, true, false);
INSERT INTO public.planet VALUES (13, 'Éris', 3, true, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Sol', 4600, 1392700, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 300, 2370000, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 10000, 887000000, 1);
INSERT INTO public.star VALUES (6, 'Rigel', 800, 108000000, 1);
INSERT INTO public.star VALUES (7, 'Vega', 455, 2450000, 1);
INSERT INTO public.star VALUES (8, 'Aldebaran', 6400, 61700000, 1);
INSERT INTO public.star VALUES (9, 'Antares', 12000, 850000000, 1);
INSERT INTO public.star VALUES (10, 'Alpha Centauri A', 4500, 1670000, 1);
INSERT INTO public.star VALUES (11, 'Alpha Centauri B', 4500, 1280000, 1);
INSERT INTO public.star VALUES (12, 'Proxima Centauri', 4500, 200000, 1);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 20, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 11, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 13, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 12, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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

