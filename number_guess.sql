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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: number_guess; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.number_guess (
    username character varying NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.number_guess OWNER TO freecodecamp;

--
-- Data for Name: number_guess; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.number_guess VALUES ('user_1658642370441', 2, 682);
INSERT INTO public.number_guess VALUES ('user_1658642623575', 2, 445);
INSERT INTO public.number_guess VALUES ('user_1658642370442', 5, 202);
INSERT INTO public.number_guess VALUES ('user_1658642623576', 5, 229);
INSERT INTO public.number_guess VALUES ('user_1658642393259', 2, 373);
INSERT INTO public.number_guess VALUES ('user_1658642393260', 5, 218);
INSERT INTO public.number_guess VALUES ('user_1658642642296', 2, 25);
INSERT INTO public.number_guess VALUES ('user_1658642642297', 5, 185);
INSERT INTO public.number_guess VALUES ('user_1658642403719', 2, 371);
INSERT INTO public.number_guess VALUES ('user_1658642403720', 5, 242);
INSERT INTO public.number_guess VALUES ('user_1658642647041', 2, 185);
INSERT INTO public.number_guess VALUES ('user_1658642410702', 2, 506);
INSERT INTO public.number_guess VALUES ('user_1658642647042', 5, 118);
INSERT INTO public.number_guess VALUES ('user_1658642410703', 5, 5);
INSERT INTO public.number_guess VALUES ('C', 1, 1);
INSERT INTO public.number_guess VALUES ('', 1, 1);
INSERT INTO public.number_guess VALUES ('K', 2, 6);


--
-- Name: number_guess number_guess_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess
    ADD CONSTRAINT number_guess_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

