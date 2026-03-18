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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    name character varying(50) NOT NULL,
    galaxy_id integer,
    star_id integer NOT NULL,
    constellation_id integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50),
    galaxy_types character varying(50) NOT NULL,
    description text,
    size character varying(10) NOT NULL
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
    name character varying(50),
    is_spherical boolean NOT NULL,
    planet_id integer NOT NULL,
    gravity numeric(4,1)
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
    planet_types character varying(50) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean
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
    distance_from_earth_in_years_light integer,
    galaxy_id integer NOT NULL,
    age_in_millions_of_year integer NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES ('Cão Maior (Canis Major)', 1, 1, 1);
INSERT INTO public.constellation VALUES ('Órion', 1, 2, 2);
INSERT INTO public.constellation VALUES ('Lira (Lyra)', 1, 3, 3);
INSERT INTO public.constellation VALUES ('Andrômeda', 1, 4, 4);
INSERT INTO public.constellation VALUES ('Dourado (Dorado)', 4, 8, 5);
INSERT INTO public.constellation VALUES ('Triângulo (Triangulum)', 3, 9, 6);
INSERT INTO public.constellation VALUES ('Virgem (Virgo)', 5, 10, 7);
INSERT INTO public.constellation VALUES ('Ursa Maior', 6, 11, 8);
INSERT INTO public.constellation VALUES ('Ofiúco', 1, 6, 9);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Láctea', 'Espiral barrada', 'Lar do Sistema Solar, possui braços espirais ricos em estrelas jovens.', 'Grande');
INSERT INTO public.galaxy VALUES (2, 'Andrômeda (M31)', 'Espiral', 'A maior galáxia do Grupo Local e a mais próxima da Via Láctea.', 'Grande');
INSERT INTO public.galaxy VALUES (3, 'Galáxia do Triângulo (M33)', 'Espiral', 'Rica em regiões de formação estelar, terceira maior do Grupo Local.', 'Médio');
INSERT INTO public.galaxy VALUES (4, 'Grande Nuvem de Magalhães', 'Irregular', 'Galáxia satélite da Via Láctea, com intensa formação de estrelas.', 'Pequeno');
INSERT INTO public.galaxy VALUES (5, 'Sombrero (M104)', 'Espiral lenticular', 'Famosa por seu bojo central brilhante e faixa de poeira escura.', 'Médio');
INSERT INTO public.galaxy VALUES (6, 'Galáxia de Bode (M81)', 'Espiral', 'Uma das galáxias espirais mais brilhantes do céu, rica em detalhes estruturais.', 'Grande');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Lua (Selene)', true, 10, 1.6);
INSERT INTO public.moon VALUES (2, 'Fobos', false, 11, 0.0);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 11, 0.0);
INSERT INTO public.moon VALUES (4, 'Io', true, 12, 1.8);
INSERT INTO public.moon VALUES (5, 'Europa', true, 12, 1.3);
INSERT INTO public.moon VALUES (6, 'Ganimedes', true, 12, 1.4);
INSERT INTO public.moon VALUES (7, 'Calisto', true, 12, 1.2);
INSERT INTO public.moon VALUES (8, 'Amalteia', false, 12, 0.0);
INSERT INTO public.moon VALUES (9, 'Titã', true, 13, 1.4);
INSERT INTO public.moon VALUES (10, 'Encélado', true, 13, 0.1);
INSERT INTO public.moon VALUES (11, 'Mimas', true, 13, 0.1);
INSERT INTO public.moon VALUES (12, 'Tétis', true, 13, 0.1);
INSERT INTO public.moon VALUES (13, 'Dione', true, 13, 0.2);
INSERT INTO public.moon VALUES (14, 'Reia', true, 13, 0.3);
INSERT INTO public.moon VALUES (15, 'Jápeto', true, 13, 0.2);
INSERT INTO public.moon VALUES (16, 'Hipérion', false, 13, 0.0);
INSERT INTO public.moon VALUES (17, 'Miranda', true, 14, 0.1);
INSERT INTO public.moon VALUES (18, 'Ariel', true, 14, 0.3);
INSERT INTO public.moon VALUES (19, 'Umbriel', true, 14, 0.2);
INSERT INTO public.moon VALUES (20, 'Titânia', true, 14, 0.4);
INSERT INTO public.moon VALUES (21, 'Oberon', true, 14, 0.3);
INSERT INTO public.moon VALUES (22, 'Tritão', true, 15, 0.8);
INSERT INTO public.moon VALUES (23, 'Nereida', false, 15, 0.1);
INSERT INTO public.moon VALUES (24, 'Caronte', true, 16, 0.3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (9, 'Mercúrio', 'Rochoso', 6, false);
INSERT INTO public.planet VALUES (10, 'Terra', 'Rochoso', 6, true);
INSERT INTO public.planet VALUES (11, 'Marte', 'Rochoso', 6, false);
INSERT INTO public.planet VALUES (12, 'Júpiter', 'Gigante gasoso', 6, false);
INSERT INTO public.planet VALUES (13, 'Saturno', 'Gigante gasoso', 6, false);
INSERT INTO public.planet VALUES (14, 'Urano', 'Gigante gelado', 6, false);
INSERT INTO public.planet VALUES (15, 'Neptuno', 'Gigante gelado', 6, false);
INSERT INTO public.planet VALUES (16, 'Plutão', 'Planeta anão gelado', 6, false);
INSERT INTO public.planet VALUES (17, 'Sirius Ab', 'Possivel gigante gasoso', 1, false);
INSERT INTO public.planet VALUES (18, 'Vega b', 'Possivel gigante gasoso', 3, false);
INSERT INTO public.planet VALUES (19, 'Gliese 581g', 'Superterra rochosa', 12, false);
INSERT INTO public.planet VALUES (20, 'Kepler-186f', 'Rochoso, tipo Terra', 13, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius A', 9, 1, 242);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 498, 1, 9);
INSERT INTO public.star VALUES (3, 'Vega', 25, 1, 455);
INSERT INTO public.star VALUES (4, 'Nu Andromedae', 560, 2, 63);
INSERT INTO public.star VALUES (5, '32 Andromedae', 345, 2, 420);
INSERT INTO public.star VALUES (6, 'Sol', 0, 1, 4500);
INSERT INTO public.star VALUES (7, 'R136a1', 163000, 4, 1);
INSERT INTO public.star VALUES (8, 'S Doradus', 169000, 4, 3);
INSERT INTO public.star VALUES (9, 'Estrelas de NGC 604', 3, 3, 4);
INSERT INTO public.star VALUES (10, 'M104‑GC1', 28, 5, 10000);
INSERT INTO public.star VALUES (11, 'M81‑OB1', 12, 6, 5);
INSERT INTO public.star VALUES (12, 'Gliese 581', 20, 1, 7000);
INSERT INTO public.star VALUES (13, 'Kepler-186', 492, 1, 4000);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 9, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: constellation constellation_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

