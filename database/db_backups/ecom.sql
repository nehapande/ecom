--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Homebrew)
-- Dumped by pg_dump version 14.11 (Homebrew)

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
-- Name: cart; Type: TABLE; Schema: public; Owner: neha.pandey
--

CREATE TABLE public.cart (
    cart_id bigint NOT NULL,
    user_id integer,
    product_id integer,
    prod_quantity integer,
    prod_price numeric(10,2)
);


----ALTER TABLE public.cart OWNER TO "neha.pandey";

--
-- Name: cart_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: neha.pandey
--

CREATE SEQUENCE public.cart_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.cart_cart_id_seq OWNER TO "neha.pandey";

--
-- Name: cart_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neha.pandey
--

ALTER SEQUENCE public.cart_cart_id_seq OWNED BY public.cart.cart_id;


--
-- Name: category; Type: TABLE; Schema: public; Owner: neha.pandey
--

CREATE TABLE public.category (
    category_id integer NOT NULL,
    name text
);


--ALTER TABLE public.category OWNER TO "neha.pandey";

--
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: neha.pandey
--

CREATE SEQUENCE public.category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


----ALTER TABLE public.category_category_id_seq OWNER TO "neha.pandey";

--
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neha.pandey
--

ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;


--
-- Name: ecom_order; Type: TABLE; Schema: public; Owner: neha.pandey
--

CREATE TABLE public.ecom_order (
    order_id bigint NOT NULL,
    user_id integer,
    cart_id integer,
    order_status integer
);


--ALTER TABLE public.ecom_order OWNER TO "neha.pandey";

--
-- Name: ecom_order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: neha.pandey
--

CREATE SEQUENCE public.ecom_order_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.ecom_order_order_id_seq OWNER TO "neha.pandey";

--
-- Name: ecom_order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neha.pandey
--

ALTER SEQUENCE public.ecom_order_order_id_seq OWNED BY public.ecom_order.order_id;


--
-- Name: ecom_user; Type: TABLE; Schema: public; Owner: neha.pandey
--

CREATE TABLE public.ecom_user (
    sysid integer NOT NULL,
    id text,
    name text,
    password text,
    email text
);


--ALTER TABLE public.ecom_user OWNER TO "neha.pandey";

--
-- Name: ecom_user_sysid_seq; Type: SEQUENCE; Schema: public; Owner: neha.pandey
--

CREATE SEQUENCE public.ecom_user_sysid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


----ALTER TABLE public.ecom_user_sysid_seq OWNER TO "neha.pandey";

--
-- Name: ecom_user_sysid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neha.pandey
--

ALTER SEQUENCE public.ecom_user_sysid_seq OWNED BY public.ecom_user.sysid;


--
-- Name: products; Type: TABLE; Schema: public; Owner: neha.pandey
--

CREATE TABLE public.products (
    prod_id integer NOT NULL,
    name text,
    category text
);


--ALTER TABLE public.products OWNER TO "neha.pandey";

--
-- Name: products_prod_id_seq; Type: SEQUENCE; Schema: public; Owner: neha.pandey
--

CREATE SEQUENCE public.products_prod_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.products_prod_id_seq OWNER TO "neha.pandey";

--
-- Name: products_prod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neha.pandey
--

ALTER SEQUENCE public.products_prod_id_seq OWNED BY public.products.prod_id;


--
-- Name: cart cart_id; Type: DEFAULT; Schema: public; Owner: neha.pandey
--

ALTER TABLE ONLY public.cart ALTER COLUMN cart_id SET DEFAULT nextval('public.cart_cart_id_seq'::regclass);


--
-- Name: category category_id; Type: DEFAULT; Schema: public; Owner: neha.pandey
--

ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('public.category_category_id_seq'::regclass);


--
-- Name: ecom_order order_id; Type: DEFAULT; Schema: public; Owner: neha.pandey
--

ALTER TABLE ONLY public.ecom_order ALTER COLUMN order_id SET DEFAULT nextval('public.ecom_order_order_id_seq'::regclass);


--
-- Name: ecom_user sysid; Type: DEFAULT; Schema: public; Owner: neha.pandey
--

ALTER TABLE ONLY public.ecom_user ALTER COLUMN sysid SET DEFAULT nextval('public.ecom_user_sysid_seq'::regclass);


--
-- Name: products prod_id; Type: DEFAULT; Schema: public; Owner: neha.pandey
--

ALTER TABLE ONLY public.products ALTER COLUMN prod_id SET DEFAULT nextval('public.products_prod_id_seq'::regclass);


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: neha.pandey
--

COPY public.cart (cart_id, user_id, product_id, prod_quantity, prod_price) FROM stdin;
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: neha.pandey
--

COPY public.category (category_id, name) FROM stdin;
\.


--
-- Data for Name: ecom_order; Type: TABLE DATA; Schema: public; Owner: neha.pandey
--

COPY public.ecom_order (order_id, user_id, cart_id, order_status) FROM stdin;
\.


--
-- Data for Name: ecom_user; Type: TABLE DATA; Schema: public; Owner: neha.pandey
--

COPY public.ecom_user (sysid, id, name, password, email) FROM stdin;
1	neha.pandey	nehapandey	password	neha.pandey@gmail.com
2	neha.pandey	nehapandey	password	neha.pandey@gmail.com
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: neha.pandey
--

COPY public.products (prod_id, name, category) FROM stdin;
\.


--
-- Name: cart_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neha.pandey
--

SELECT pg_catalog.setval('public.cart_cart_id_seq', 1, false);


--
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neha.pandey
--

SELECT pg_catalog.setval('public.category_category_id_seq', 1, false);


--
-- Name: ecom_order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neha.pandey
--

SELECT pg_catalog.setval('public.ecom_order_order_id_seq', 1, false);


--
-- Name: ecom_user_sysid_seq; Type: SEQUENCE SET; Schema: public; Owner: neha.pandey
--

SELECT pg_catalog.setval('public.ecom_user_sysid_seq', 2, true);


--
-- Name: products_prod_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neha.pandey
--

SELECT pg_catalog.setval('public.products_prod_id_seq', 1, false);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: neha.pandey
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (cart_id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: neha.pandey
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- Name: ecom_order ecom_order_pkey; Type: CONSTRAINT; Schema: public; Owner: neha.pandey
--

ALTER TABLE ONLY public.ecom_order
    ADD CONSTRAINT ecom_order_pkey PRIMARY KEY (order_id);


--
-- Name: ecom_user ecom_user_pkey; Type: CONSTRAINT; Schema: public; Owner: neha.pandey
--

ALTER TABLE ONLY public.ecom_user
    ADD CONSTRAINT ecom_user_pkey PRIMARY KEY (sysid);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: neha.pandey
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (prod_id);


--
-- Name: cart cart_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neha.pandey
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(prod_id);


--
-- Name: cart cart_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neha.pandey
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ecom_user(sysid);


--
-- Name: ecom_order ecom_order_cart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neha.pandey
--

ALTER TABLE ONLY public.ecom_order
    ADD CONSTRAINT ecom_order_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.cart(cart_id);


--
-- Name: ecom_order ecom_order_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neha.pandey
--

ALTER TABLE ONLY public.ecom_order
    ADD CONSTRAINT ecom_order_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ecom_user(sysid);


--
-- PostgreSQL database dump complete
--

