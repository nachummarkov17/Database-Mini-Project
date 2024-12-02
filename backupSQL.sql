--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2024-12-02 18:38:35

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.libraryemployee DROP CONSTRAINT IF EXISTS unique_employee_name;
DROP TABLE IF EXISTS public.storeoperator;
DROP TABLE IF EXISTS public.socialmedia;
DROP TABLE IF EXISTS public.security;
DROP TABLE IF EXISTS public.marketer;
DROP TABLE IF EXISTS public.manages;
DROP TABLE IF EXISTS public.libraryemployee;
DROP TABLE IF EXISTS public.librarian;
DROP TABLE IF EXISTS public.deskpersonnel;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 33039)
-- Name: deskpersonnel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deskpersonnel (
    id integer NOT NULL,
    workstation character varying(255) NOT NULL,
    desknumber character varying(255) NOT NULL,
    floor integer NOT NULL
);


ALTER TABLE public.deskpersonnel OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 33044)
-- Name: librarian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.librarian (
    id integer NOT NULL,
    section character varying(255) NOT NULL,
    expertise character varying(255) NOT NULL,
    yearsofexperience integer NOT NULL
);


ALTER TABLE public.librarian OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 33049)
-- Name: libraryemployee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libraryemployee (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    dateofbirth date NOT NULL,
    salary integer NOT NULL,
    expirationofcontract date NOT NULL,
    CONSTRAINT check_salary_range CHECK (((salary >= 20000) AND (salary <= 80000)))
);


ALTER TABLE public.libraryemployee OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 33052)
-- Name: manages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manages (
    marketerid integer NOT NULL,
    platform character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    followercount integer NOT NULL,
    targetaudience character varying(255) NOT NULL
);


ALTER TABLE public.manages OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 33057)
-- Name: marketer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marketer (
    id integer NOT NULL,
    specialisation character varying(255) NOT NULL,
    certification character varying(255) NOT NULL,
    creativeskill character varying(255) NOT NULL
);


ALTER TABLE public.marketer OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 33062)
-- Name: security; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.security (
    id integer NOT NULL,
    area character varying(255) NOT NULL,
    role character varying(255) NOT NULL,
    clearancelevel integer NOT NULL,
    CONSTRAINT check_clearance_level CHECK (((clearancelevel >= 2) AND (clearancelevel <= 5))),
    CONSTRAINT security_clearancelevel_check CHECK (((clearancelevel >= 1) AND (clearancelevel <= 5)))
);


ALTER TABLE public.security OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 33068)
-- Name: socialmedia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialmedia (
    platform character varying(255) NOT NULL,
    distributionrating integer NOT NULL,
    CONSTRAINT socialmedia_distributionrating_check CHECK (((distributionrating >= 1) AND (distributionrating <= 5)))
);


ALTER TABLE public.socialmedia OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 33072)
-- Name: storeoperator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storeoperator (
    id integer NOT NULL,
    storetype character varying(255) NOT NULL,
    storename character varying(255) NOT NULL,
    storelocation character varying(255) NOT NULL
);


ALTER TABLE public.storeoperator OWNER TO postgres;

--
-- TOC entry 4873 (class 0 OID 33039)
-- Dependencies: 217
-- Data for Name: deskpersonnel; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4874 (class 0 OID 33044)
-- Dependencies: 218
-- Data for Name: librarian; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4875 (class 0 OID 33049)
-- Dependencies: 219
-- Data for Name: libraryemployee; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4876 (class 0 OID 33052)
-- Dependencies: 220
-- Data for Name: manages; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4877 (class 0 OID 33057)
-- Dependencies: 221
-- Data for Name: marketer; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4878 (class 0 OID 33062)
-- Dependencies: 222
-- Data for Name: security; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4879 (class 0 OID 33068)
-- Dependencies: 223
-- Data for Name: socialmedia; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4880 (class 0 OID 33072)
-- Dependencies: 224
-- Data for Name: storeoperator; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4727 (class 2606 OID 33125)
-- Name: libraryemployee unique_employee_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libraryemployee
    ADD CONSTRAINT unique_employee_name UNIQUE (name);


-- Completed on 2024-12-02 18:38:37

--
-- PostgreSQL database dump complete
--

