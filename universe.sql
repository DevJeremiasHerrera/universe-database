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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_in_million_of_years numeric(9,4),
    has_life boolean,
    has_supermasive_black_hole boolean,
    amount_stars bigint,
    satellite_galaxies integer,
    galaxy_structure_id integer
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
-- Name: galaxy_structure; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_structure (
    galaxy_structure_id integer NOT NULL,
    name character varying(50) NOT NULL,
    amount_galaxies integer,
    structure_type character varying(20)
);


ALTER TABLE public.galaxy_structure OWNER TO freecodecamp;

--
-- Name: galaxy_structure_galaxy_structure_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_structure_galaxy_structure_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_structure_galaxy_structure_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_structure_galaxy_structure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_structure_galaxy_structure_id_seq OWNED BY public.galaxy_structure.galaxy_structure_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_in_million_of_years numeric(9,4),
    is_spherical boolean,
    has_water boolean,
    radius_km integer,
    orbital_period_hours integer,
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
    name character varying(50) NOT NULL,
    description text,
    age_in_million_of_years numeric(9,4),
    has_life boolean,
    has_atmosphere boolean,
    radius_km integer,
    number_of_moons integer,
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
    name character varying(50) NOT NULL,
    description text,
    age_in_million_of_years numeric(9,4),
    has_life boolean,
    has_planets boolean,
    num_planets integer,
    radius_km integer,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_structure galaxy_structure_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_structure ALTER COLUMN galaxy_structure_id SET DEFAULT nextval('public.galaxy_structure_galaxy_structure_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'A barred spiral galaxy that contains the Solar System.', 13000.0000, true, true, 200000000000, 2, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'A large spiral galaxy and one of the Milky Way''s nearest major galactic neighbors.', 10000.0000, false, true, 1000000000000, 20, 1);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A spiral galaxy in the Local Group, smaller than the Milky Way and Andromeda.', 10000.0000, false, true, 40000000000, 0, 1);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'A giant elliptical galaxy known for its supermassive black hole and relativistic jet.', 13000.0000, false, true, 1000000000000, 50, 2);
INSERT INTO public.galaxy VALUES (5, 'Messier 49', 'A giant elliptical galaxy and one of the brightest members of the Virgo Cluster.', 13000.0000, false, true, 200000000000, 10, 2);
INSERT INTO public.galaxy VALUES (6, 'NGC 1399', 'A giant elliptical galaxy located near the center of the Fornax Cluster.', 12000.0000, false, true, 100000000000, 10, 3);


--
-- Data for Name: galaxy_structure; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_structure VALUES (1, 'Local group', 50, 'Group');
INSERT INTO public.galaxy_structure VALUES (2, 'Virgo cluster', 1300, 'Cluster');
INSERT INTO public.galaxy_structure VALUES (3, 'Fornax cluster', 600, 'Cluster');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s natural satellite, with a rocky surface covered in impact craters.', 4500.0000, true, true, 1737, 656, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger and innermost of Mars'' two moons, with an irregular shape.', 4500.0000, false, false, 11, 8, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller and more distant natural satellite of Mars.', 4500.0000, false, false, 6, 30, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'A moon of Jupiter with intense volcanic activity and a rocky surface.', 4500.0000, true, false, 1822, 42, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'An icy moon of Jupiter believed to have a global ocean beneath its surface.', 4500.0000, true, true, 1561, 85, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon in the Solar System, with an icy crust and a likely subsurface ocean.', 4500.0000, true, true, 2631, 172, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'A heavily cratered moon of Jupiter that may contain a subsurface ocean.', 4500.0000, true, true, 2410, 400, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'A small irregular moon of Jupiter with a reddish surface.', 4500.0000, false, false, 84, 12, 5);
INSERT INTO public.moon VALUES (9, 'Titan', 'Saturn''s largest moon, with a dense atmosphere and lakes of liquid methane.', 4500.0000, true, true, 2575, 382, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'An icy moon of Saturn that releases water-rich plumes from its south polar region.', 4500.0000, true, true, 252, 33, 6);
INSERT INTO public.moon VALUES (11, 'Mimas', 'A small moon of Saturn known for its enormous Herschel impact crater.', 4500.0000, true, true, 198, 23, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 'Saturn''s second-largest moon, composed mainly of water ice and rock.', 4500.0000, true, true, 764, 108, 6);
INSERT INTO public.moon VALUES (13, 'Iapetus', 'A moon of Saturn with contrasting bright and dark hemispheres.', 4500.0000, true, true, 735, 1903, 6);
INSERT INTO public.moon VALUES (14, 'Dione', 'An icy moon of Saturn with impact craters, cliffs, and fractured terrain.', 4500.0000, true, true, 561, 66, 6);
INSERT INTO public.moon VALUES (15, 'Tethys', 'An icy moon of Saturn featuring a giant impact crater and a large canyon.', 4500.0000, true, true, 531, 45, 6);
INSERT INTO public.moon VALUES (16, 'Titania', 'The largest moon of Uranus, with large canyons and an icy surface.', 4500.0000, true, true, 789, 209, 7);
INSERT INTO public.moon VALUES (17, 'Oberon', 'A large moon of Uranus with an ancient, heavily cratered surface.', 4500.0000, true, true, 761, 323, 7);
INSERT INTO public.moon VALUES (18, 'Miranda', 'A small moon of Uranus with unusual cliffs, grooves, and varied terrain.', 4500.0000, true, true, 236, 34, 7);
INSERT INTO public.moon VALUES (19, 'Triton', 'Neptune''s largest moon, with a retrograde orbit and a surface rich in frozen nitrogen.', 4500.0000, true, true, 1353, 141, 8);
INSERT INTO public.moon VALUES (20, 'Proteus', 'A dark, irregular moon of Neptune with a heavily cratered surface.', 4500.0000, false, true, 210, 27, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest planet in the Solar System. It has a heavily cratered rocky surface.', 4540.0000, false, false, 2439, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'A rocky planet with a dense carbon dioxide atmosphere and extremely high surface temperatures.', 4540.0000, false, true, 6052, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'A rocky planet with liquid water on its surface and the only known world to support life.', 4540.0000, true, true, 6371, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'A cold rocky planet with a thin atmosphere, ancient river valleys, and polar ice caps.', 4540.0000, false, true, 3390, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in the Solar System, a gas giant with a vast system of moons and rings.', 4540.0000, false, true, 69911, 101, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'A gas giant famous for its extensive ring system and numerous natural satellites.', 4540.0000, false, true, 58232, 274, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'An ice giant with a blue-green appearance and an extreme axial tilt.', 4540.0000, false, true, 25362, 29, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'A distant ice giant known for its deep blue appearance and extremely fast winds.', 4540.0000, false, true, 24622, 16, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'An exoplanet orbiting Proxima Centauri, located in the approximate habitable zone of its star.', 4800.0000, false, false, 7000, 0, 2);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri d', 'A small exoplanet orbiting Proxima Centauri with a short orbital period.', 4800.0000, false, false, 7000, 0, 2);
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 'An exoplanet orbiting Kepler-452, often studied as a potentially rocky world around a Sun-like star.', 6000.0000, false, false, 12000, 0, 5);
INSERT INTO public.planet VALUES (12, 'Rigel b', 'A hypothetical example of a planet associated with the star Rigel; its existence is not confirmed.', 8.0000, false, false, 10000, 0, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of the Solar System. It is a G-type main-sequence star.', 4600.0000, true, true, 8, 696340, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'A small red dwarf star and the closest known star to the Sun.', 4500.0000, true, true, 3, 107280, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'The brightest star in the night sky as seen from Earth. It is part of a binary star system.', 242.0000, false, false, 0, 1189640, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'A red supergiant star in the constellation Orion, nearing the end of its stellar evolution.', 10.0000, false, false, 0, 700000000, 1);
INSERT INTO public.star VALUES (5, 'Vega', 'A bright A-type main-sequence star located in the constellation Lyra.', 455.0000, false, false, 0, 1640000, 1);
INSERT INTO public.star VALUES (6, 'Rigel', 'A luminous blue supergiant star located in the constellation Orion.', 8.0000, false, false, 0, 54000000, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_structure_galaxy_structure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_structure_galaxy_structure_id_seq', 3, true);


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
-- Name: galaxy_structure galaxy_structure_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_structure
    ADD CONSTRAINT galaxy_structure_name_key UNIQUE (name);


--
-- Name: galaxy_structure galaxy_structure_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_structure
    ADD CONSTRAINT galaxy_structure_pkey PRIMARY KEY (galaxy_structure_id);


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
-- Name: galaxy galaxy_galaxy_structure_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_structure_id_fkey FOREIGN KEY (galaxy_structure_id) REFERENCES public.galaxy_structure(galaxy_structure_id);


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

