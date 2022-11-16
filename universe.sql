--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: dwarf_planets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_planets (
    dwarf_planets_id integer NOT NULL,
    name character varying(40) NOT NULL,
    orbital_period_in_years integer
);


ALTER TABLE public.dwarf_planets OWNER TO freecodecamp;

--
-- Name: dwarf_planets_dwarf_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_planets_dwarf_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarf_planets_dwarf_planet_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_planets_dwarf_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_planets_dwarf_planet_id_seq OWNED BY public.dwarf_planets.dwarf_planets_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    short_desc text,
    radius_in_light_years integer NOT NULL,
    approx_num_of_stars_in_billions integer NOT NULL
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    speed_relative_to_planet_in_km integer,
    age_in_billions integer
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
    name character varying(50),
    habitable boolean,
    populated boolean,
    distance_to_sun_in_km numeric,
    num_of_moons integer,
    star_id integer NOT NULL
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
    name character varying(50),
    num_of_planets integer NOT NULL,
    surface_temp_in_kelvin integer NOT NULL,
    radius_in_km integer NOT NULL
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
-- Name: dwarf_planets dwarf_planets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planets ALTER COLUMN dwarf_planets_id SET DEFAULT nextval('public.dwarf_planets_dwarf_planet_id_seq'::regclass);


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
-- Data for Name: dwarf_planets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_planets VALUES (1, 'Pluto', 248);
INSERT INTO public.dwarf_planets VALUES (2, 'Ceres', 4);
INSERT INTO public.dwarf_planets VALUES (3, 'Eris', 558);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home!', 52851, 200);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Also known as Messier 31!', 110000, 1000);
INSERT INTO public.galaxy VALUES (3, 'Black Eye Galaxy', 'Discovered in 1779', 26481, 100);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'Member of the Virgo II Groups', 25000, 100);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 'Discovered by Pierre Mechain', 85001, 1000);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'Lies in the Canes Venatici constellation', 30000, 100);
INSERT INTO public.galaxy VALUES (7, 'Triangulum Galaxy', '2.7m light years away from earth.', 30000, 40);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 2288, 5);
INSERT INTO public.moon VALUES (2, 'Titan', 3, 6, 4);
INSERT INTO public.moon VALUES (3, 'Enceladus', 3, 45, 1);
INSERT INTO public.moon VALUES (4, 'Mimas', 3, 14, 1);
INSERT INTO public.moon VALUES (5, 'Iaepetus', 3, 3, 1);
INSERT INTO public.moon VALUES (6, 'Dione', 3, 10, 4);
INSERT INTO public.moon VALUES (7, 'Tethys', 3, 11, 4);
INSERT INTO public.moon VALUES (8, 'Hyperion', 3, 5, 1);
INSERT INTO public.moon VALUES (9, 'Epimetheus', 3, 16, 4);
INSERT INTO public.moon VALUES (10, 'Rhea', 3, 8, 4);
INSERT INTO public.moon VALUES (11, 'Phobos', 4, 2, 5);
INSERT INTO public.moon VALUES (12, 'Deimos', 4, 1, 5);
INSERT INTO public.moon VALUES (13, 'Europa', 2, 13, 4);
INSERT INTO public.moon VALUES (14, 'Io', 2, 17, 4);
INSERT INTO public.moon VALUES (15, 'Ganymede', 2, 10, 4);
INSERT INTO public.moon VALUES (16, 'Callisto', 3, 8, 4);
INSERT INTO public.moon VALUES (17, 'Amalthea', 3, 26, 5);
INSERT INTO public.moon VALUES (18, 'Adrastea', 3, 31, 4);
INSERT INTO public.moon VALUES (19, 'Triton', 8, 4, 4);
INSERT INTO public.moon VALUES (20, 'Galatea', 8, 10, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, true, 150000000, 1, 1);
INSERT INTO public.planet VALUES (2, 'Jupiter', false, false, 740000000, 80, 1);
INSERT INTO public.planet VALUES (3, 'Saturn', false, false, 1470000000, 82, 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, false, 226000000, 2, 1);
INSERT INTO public.planet VALUES (5, 'Venus', false, false, 108000000, 0, 1);
INSERT INTO public.planet VALUES (6, 'Mercury', false, false, 69000000, 0, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, false, 2877000000, 27, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, false, 4470000000, 14, 1);
INSERT INTO public.planet VALUES (9, 'Kerbin', true, true, 150000000, 2, 2);
INSERT INTO public.planet VALUES (10, 'Jool', false, false, 68773560, 5, 2);
INSERT INTO public.planet VALUES (11, 'Moho', false, false, 4300000, 0, 2);
INSERT INTO public.planet VALUES (12, 'Duna', false, false, 21300000, 1, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, 5778, 696340);
INSERT INTO public.star VALUES (2, 'Kerbol', 7, 4014, 261600);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 3, 3042, 107280);
INSERT INTO public.star VALUES (4, '61 Virgins', 2, 5585, 686450);
INSERT INTO public.star VALUES (5, 'Lalande 21185', 2, 3828, 273530);
INSERT INTO public.star VALUES (6, 'Luytens Star', 2, 3150, 243500);


--
-- Name: dwarf_planets_dwarf_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_planets_dwarf_planet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: dwarf_planets dwarf_planets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planets
    ADD CONSTRAINT dwarf_planets_name_key UNIQUE (name);


--
-- Name: dwarf_planets dwarf_planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planets
    ADD CONSTRAINT dwarf_planets_pkey PRIMARY KEY (dwarf_planets_id);


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
-- PostgreSQL database dump complete
--

