--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-08-23 21:46:59

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

DROP DATABASE shrkh_id;
--
-- TOC entry 4948 (class 1262 OID 17370)
-- Name: shrkh_id; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE shrkh_id WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Indonesian_Indonesia.1252';


ALTER DATABASE shrkh_id OWNER TO postgres;

\connect shrkh_id

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 17428)
-- Name: business_unit_documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.business_unit_documents (
    id integer NOT NULL,
    business_unit_id integer NOT NULL,
    name text NOT NULL,
    cost numeric NOT NULL,
    document_data jsonb NOT NULL,
    expired_at timestamp without time zone NOT NULL,
    remind_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.business_unit_documents OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17427)
-- Name: business_unit_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.business_unit_documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.business_unit_documents_id_seq OWNER TO postgres;

--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 225
-- Name: business_unit_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.business_unit_documents_id_seq OWNED BY public.business_unit_documents.id;


--
-- TOC entry 220 (class 1259 OID 17395)
-- Name: business_units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.business_units (
    id integer NOT NULL,
    name text NOT NULL,
    company_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT '2024-08-23 21:14:14.245533'::timestamp without time zone NOT NULL,
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.business_units OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17394)
-- Name: business_units_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.business_units_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.business_units_id_seq OWNER TO postgres;

--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 219
-- Name: business_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.business_units_id_seq OWNED BY public.business_units.id;


--
-- TOC entry 218 (class 1259 OID 17383)
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies (
    id integer NOT NULL,
    owner_id integer NOT NULL,
    registration_number character varying,
    logo character varying,
    name character varying,
    description character varying,
    type character varying,
    is_private boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT '2024-08-23 21:14:14.245533'::timestamp without time zone NOT NULL,
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.companies OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17382)
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.companies_id_seq OWNER TO postgres;

--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 217
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- TOC entry 230 (class 1259 OID 17448)
-- Name: company_documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_documents (
    id integer NOT NULL,
    company_id integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    documents jsonb DEFAULT '{}'::jsonb
);


ALTER TABLE public.company_documents OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17447)
-- Name: company_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.company_documents_id_seq OWNER TO postgres;

--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 229
-- Name: company_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_documents_id_seq OWNED BY public.company_documents.id;


--
-- TOC entry 224 (class 1259 OID 17417)
-- Name: company_employee_documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_employee_documents (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    hawiyah_wathoniyah jsonb NOT NULL,
    hawiyah_muqim jsonb NOT NULL,
    employment_contract jsonb NOT NULL,
    passport jsonb NOT NULL,
    visa jsonb NOT NULL,
    training_certificate jsonb NOT NULL,
    family_contact jsonb NOT NULL,
    labor_insurance jsonb NOT NULL,
    created_at timestamp without time zone DEFAULT '2024-08-23 21:14:14.245533'::timestamp without time zone NOT NULL,
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.company_employee_documents OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17416)
-- Name: company_employee_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_employee_documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.company_employee_documents_id_seq OWNER TO postgres;

--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 223
-- Name: company_employee_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_employee_documents_id_seq OWNED BY public.company_employee_documents.id;


--
-- TOC entry 222 (class 1259 OID 17406)
-- Name: company_employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_employees (
    id integer NOT NULL,
    main_task character varying NOT NULL,
    direct_spv integer NOT NULL,
    company_id integer NOT NULL,
    business_unit_id integer NOT NULL,
    role_id integer NOT NULL,
    employee_documents_id integer NOT NULL,
    user_id integer,
    leave jsonb,
    resign jsonb,
    status character varying NOT NULL,
    created_at timestamp without time zone DEFAULT '2024-08-23 21:14:14.245533'::timestamp without time zone NOT NULL,
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.company_employees OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17405)
-- Name: company_employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.company_employees_id_seq OWNER TO postgres;

--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 221
-- Name: company_employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_employees_id_seq OWNED BY public.company_employees.id;


--
-- TOC entry 232 (class 1259 OID 17461)
-- Name: tasks_memos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tasks_memos (
    id integer NOT NULL,
    company_id integer,
    business_id integer,
    title character varying,
    description character varying,
    remind_at timestamp without time zone DEFAULT now() NOT NULL,
    created_at timestamp without time zone DEFAULT '2024-08-23 21:14:14.245533'::timestamp without time zone NOT NULL,
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.tasks_memos OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17460)
-- Name: tasks_memos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tasks_memos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tasks_memos_id_seq OWNER TO postgres;

--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 231
-- Name: tasks_memos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tasks_memos_id_seq OWNED BY public.tasks_memos.id;


--
-- TOC entry 228 (class 1259 OID 17437)
-- Name: user_documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_documents (
    id integer NOT NULL,
    user_id integer NOT NULL,
    hawiyah_wathoniyah jsonb NOT NULL,
    hawiyah_muqim jsonb NOT NULL,
    employment_contract jsonb NOT NULL,
    passport jsonb NOT NULL,
    visa jsonb NOT NULL,
    training_certificate jsonb NOT NULL,
    family_contact jsonb NOT NULL,
    labor_insurance jsonb NOT NULL,
    created_at timestamp without time zone DEFAULT '2024-08-23 21:14:14.245533'::timestamp without time zone NOT NULL,
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.user_documents OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17436)
-- Name: user_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_documents_id_seq OWNER TO postgres;

--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 227
-- Name: user_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_documents_id_seq OWNED BY public.user_documents.id;


--
-- TOC entry 216 (class 1259 OID 17372)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    firebase_uid character varying,
    igomah character varying,
    password character varying,
    created_at timestamp without time zone DEFAULT '2024-08-23 21:14:14.245533'::timestamp without time zone NOT NULL,
    updated_at timestamp without time zone DEFAULT now(),
    name character varying,
    is_foreigners boolean
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17371)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4744 (class 2604 OID 17431)
-- Name: business_unit_documents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business_unit_documents ALTER COLUMN id SET DEFAULT nextval('public.business_unit_documents_id_seq'::regclass);


--
-- TOC entry 4735 (class 2604 OID 17398)
-- Name: business_units id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business_units ALTER COLUMN id SET DEFAULT nextval('public.business_units_id_seq'::regclass);


--
-- TOC entry 4731 (class 2604 OID 17386)
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- TOC entry 4748 (class 2604 OID 17451)
-- Name: company_documents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_documents ALTER COLUMN id SET DEFAULT nextval('public.company_documents_id_seq'::regclass);


--
-- TOC entry 4741 (class 2604 OID 17420)
-- Name: company_employee_documents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_employee_documents ALTER COLUMN id SET DEFAULT nextval('public.company_employee_documents_id_seq'::regclass);


--
-- TOC entry 4738 (class 2604 OID 17409)
-- Name: company_employees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_employees ALTER COLUMN id SET DEFAULT nextval('public.company_employees_id_seq'::regclass);


--
-- TOC entry 4752 (class 2604 OID 17464)
-- Name: tasks_memos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks_memos ALTER COLUMN id SET DEFAULT nextval('public.tasks_memos_id_seq'::regclass);


--
-- TOC entry 4745 (class 2604 OID 17440)
-- Name: user_documents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_documents ALTER COLUMN id SET DEFAULT nextval('public.user_documents_id_seq'::regclass);


--
-- TOC entry 4728 (class 2604 OID 17375)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4936 (class 0 OID 17428)
-- Dependencies: 226
-- Data for Name: business_unit_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4930 (class 0 OID 17395)
-- Dependencies: 220
-- Data for Name: business_units; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.business_units (id, name, company_id, created_at, updated_at) VALUES (1, 'Damba Makkah', 2, '2024-08-23 17:52:51.529808', '2024-08-23 18:20:44.607501');
INSERT INTO public.business_units (id, name, company_id, created_at, updated_at) VALUES (2, 'Bakso AA', 1, '2024-08-23 17:52:51.529808', '2024-08-23 18:20:44.607501');
INSERT INTO public.business_units (id, name, company_id, created_at, updated_at) VALUES (3, 'Super Market Alif Asia', 3, '2024-08-23 17:52:51.529808', '2024-08-23 18:20:44.607501');


--
-- TOC entry 4928 (class 0 OID 17383)
-- Dependencies: 218
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.companies (id, owner_id, registration_number, logo, name, description, type, is_private, created_at, updated_at) VALUES (2, 1, NULL, NULL, 'Kuwais International Ltd.', NULL, 'Sharikah', false, '2024-08-23 17:52:51.529808', '2024-08-23 17:55:50.292539');
INSERT INTO public.companies (id, owner_id, registration_number, logo, name, description, type, is_private, created_at, updated_at) VALUES (1, 2, NULL, NULL, 'Sharikah Alif Asia', NULL, 'Sharikah', false, '2024-08-23 17:52:51.529808', '2024-08-23 17:55:50.292539');
INSERT INTO public.companies (id, owner_id, registration_number, logo, name, description, type, is_private, created_at, updated_at) VALUES (3, 2, NULL, NULL, 'Tamwinat Alif Asia', NULL, 'Muasasah', false, '2024-08-23 17:52:51.529808', '2024-08-23 17:56:46.57837');
INSERT INTO public.companies (id, owner_id, registration_number, logo, name, description, type, is_private, created_at, updated_at) VALUES (5, 2, NULL, NULL, 'Muasasah Alif Asia', NULL, 'Muasasah', false, '2024-08-23 17:52:51.529808', '2024-08-23 17:57:53.200719');
INSERT INTO public.companies (id, owner_id, registration_number, logo, name, description, type, is_private, created_at, updated_at) VALUES (4, 2, NULL, NULL, 'Mat’am Alif Asia', NULL, 'Muasasah', false, '2024-08-23 17:52:51.529808', '2024-08-23 17:57:29.476116');


--
-- TOC entry 4940 (class 0 OID 17448)
-- Dependencies: 230
-- Data for Name: company_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.company_documents (id, company_id, created_at, updated_at, documents) VALUES (7, 1, '2024-08-23 20:06:17.607473', '2024-08-23 20:06:17.607473', '{"work_permit": {"expiry_date": null, "company_number": null, "registered_date": null, "validity_period": null, "subscription_fee": null, "employment_system": null, "payroll_management": null, "subscription_period": null, "mudad_application_fee": null, "process_and_document_links": null}, "investor_license": {"license_fee": null, "license_date": null, "business_field": null, "license_number": null, "expiration_date": null, "validity_period": null, "registration_number": null, "process_and_document_links": null}, "company_registration": {"Fee": null, "Mudir": null, "CRDate": null, "CRNumber": null, "ExpiryDate": null, "MasterNumber": null, "ValidityPeriod": null, "BusinessActivity": null, "ProcessAndDocumentLinks": null}}');


--
-- TOC entry 4934 (class 0 OID 17417)
-- Dependencies: 224
-- Data for Name: company_employee_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4932 (class 0 OID 17406)
-- Dependencies: 222
-- Data for Name: company_employees; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4942 (class 0 OID 17461)
-- Dependencies: 232
-- Data for Name: tasks_memos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tasks_memos (id, company_id, business_id, title, description, remind_at, created_at, updated_at) VALUES (1, 1, NULL, 'Recurring Payment', 'CR payments for recurring payments', '2024-08-23 16:43:08', '2024-08-23 20:06:02.182829', '2024-08-23 21:10:06.235099');


--
-- TOC entry 4938 (class 0 OID 17437)
-- Dependencies: 228
-- Data for Name: user_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4926 (class 0 OID 17372)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, firebase_uid, igomah, password, created_at, updated_at, name, is_foreigners) VALUES (1, NULL, '2548160403', '123456', '2024-08-23 17:52:51.529808', '2024-08-23 17:54:32.185082', 'Alip Setyo Wibowo', true);
INSERT INTO public.users (id, firebase_uid, igomah, password, created_at, updated_at, name, is_foreigners) VALUES (2, NULL, '1104632300', '123456', '2024-08-23 17:52:51.529808', '2024-08-23 17:54:32.185082', 'Abid Osman Fallata', false);


--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 225
-- Name: business_unit_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.business_unit_documents_id_seq', 1, false);


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 219
-- Name: business_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.business_units_id_seq', 1, true);


--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 217
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_id_seq', 2, true);


--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 229
-- Name: company_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_documents_id_seq', 8, true);


--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 223
-- Name: company_employee_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_employee_documents_id_seq', 1, false);


--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 221
-- Name: company_employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_employees_id_seq', 1, false);


--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 231
-- Name: tasks_memos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tasks_memos_id_seq', 1, true);


--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 227
-- Name: user_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_documents_id_seq', 1, false);


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 4767 (class 2606 OID 17435)
-- Name: business_unit_documents PK_2627b15430bd49ee2a2e78fe894; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business_unit_documents
    ADD CONSTRAINT "PK_2627b15430bd49ee2a2e78fe894" PRIMARY KEY (id);


--
-- TOC entry 4761 (class 2606 OID 17404)
-- Name: business_units PK_685f717d6fba03f34e19aa51b9d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business_units
    ADD CONSTRAINT "PK_685f717d6fba03f34e19aa51b9d" PRIMARY KEY (id);


--
-- TOC entry 4775 (class 2606 OID 17471)
-- Name: tasks_memos PK_745f070dd9b15ef93b3b60be1a9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks_memos
    ADD CONSTRAINT "PK_745f070dd9b15ef93b3b60be1a9" PRIMARY KEY (id);


--
-- TOC entry 4763 (class 2606 OID 17415)
-- Name: company_employees PK_913862d311bedb965e320c1ad4f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_employees
    ADD CONSTRAINT "PK_913862d311bedb965e320c1ad4f" PRIMARY KEY (id);


--
-- TOC entry 4757 (class 2606 OID 17381)
-- Name: users PK_a3ffb1c0c8416b9fc6f907b7433; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433" PRIMARY KEY (id);


--
-- TOC entry 4765 (class 2606 OID 17426)
-- Name: company_employee_documents PK_b10ed7eb77d23080637f4169c29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_employee_documents
    ADD CONSTRAINT "PK_b10ed7eb77d23080637f4169c29" PRIMARY KEY (id);


--
-- TOC entry 4769 (class 2606 OID 17446)
-- Name: user_documents PK_cea43819156528b63504c4afd4b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_documents
    ADD CONSTRAINT "PK_cea43819156528b63504c4afd4b" PRIMARY KEY (id);


--
-- TOC entry 4759 (class 2606 OID 17393)
-- Name: companies PK_d4bc3e82a314fa9e29f652c2c22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT "PK_d4bc3e82a314fa9e29f652c2c22" PRIMARY KEY (id);


--
-- TOC entry 4771 (class 2606 OID 17457)
-- Name: company_documents PK_df54bfe584d2de1b722f3072629; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_documents
    ADD CONSTRAINT "PK_df54bfe584d2de1b722f3072629" PRIMARY KEY (id);


--
-- TOC entry 4773 (class 2606 OID 17948)
-- Name: company_documents UQ_43830ec86bb6c8a2f2bc1f2b5f5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_documents
    ADD CONSTRAINT "UQ_43830ec86bb6c8a2f2bc1f2b5f5" UNIQUE (company_id);


--
-- TOC entry 4780 (class 2606 OID 17497)
-- Name: tasks_memos FK_38304945ec5be778c74a8043392; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks_memos
    ADD CONSTRAINT "FK_38304945ec5be778c74a8043392" FOREIGN KEY (business_id) REFERENCES public.business_units(id);


--
-- TOC entry 4778 (class 2606 OID 17482)
-- Name: business_unit_documents FK_39c9887fa4c79cbbffac1b01120; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business_unit_documents
    ADD CONSTRAINT "FK_39c9887fa4c79cbbffac1b01120" FOREIGN KEY (business_unit_id) REFERENCES public.business_units(id);


--
-- TOC entry 4779 (class 2606 OID 17950)
-- Name: company_documents FK_43830ec86bb6c8a2f2bc1f2b5f5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_documents
    ADD CONSTRAINT "FK_43830ec86bb6c8a2f2bc1f2b5f5" FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- TOC entry 4781 (class 2606 OID 17492)
-- Name: tasks_memos FK_7807b3dbc49875a5e70ba5c5340; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks_memos
    ADD CONSTRAINT "FK_7807b3dbc49875a5e70ba5c5340" FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- TOC entry 4776 (class 2606 OID 17472)
-- Name: companies FK_df63e1563bbd91b428b5c50d8ad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT "FK_df63e1563bbd91b428b5c50d8ad" FOREIGN KEY (owner_id) REFERENCES public.users(id);


--
-- TOC entry 4777 (class 2606 OID 17477)
-- Name: business_units FK_fd504b2eb9fbfaa94fc943b1123; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business_units
    ADD CONSTRAINT "FK_fd504b2eb9fbfaa94fc943b1123" FOREIGN KEY (company_id) REFERENCES public.companies(id);


-- Completed on 2024-08-23 21:46:59

--
-- PostgreSQL database dump complete
--

