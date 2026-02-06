--
-- PostgreSQL database dump
--

\restrict CS2V2Y1BgDpvbeGj5GfldoS8pTIlK5VzDLpWuC9ofgpz2FCmiTXjkhShjqvVFZC

-- Dumped from database version 16.11
-- Dumped by pg_dump version 16.11

-- Started on 2026-02-06 11:33:12

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
-- TOC entry 217 (class 1259 OID 16409)
-- Name: admissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admissions (
    admission_id integer NOT NULL,
    patient_id integer,
    department_id integer,
    admission_date date,
    discharge_date date,
    admission_type character varying(20)
);


ALTER TABLE public.admissions OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16434)
-- Name: billing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.billing (
    bill_id integer NOT NULL,
    patient_id integer,
    cost numeric(10,2)
);


ALTER TABLE public.billing OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16404)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    department_id integer NOT NULL,
    department_name character varying(100)
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16424)
-- Name: doctors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctors (
    doctor_id integer NOT NULL,
    department_id integer,
    doctor_name character varying(100),
    utilization_percent integer
);


ALTER TABLE public.doctors OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16444)
-- Name: outcomes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.outcomes (
    outcome_id integer NOT NULL,
    patient_id integer,
    outcome_status character varying(50)
);


ALTER TABLE public.outcomes OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16399)
-- Name: patients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patients (
    patient_id integer NOT NULL,
    age integer,
    gender character varying(10),
    insurance_type character varying(50)
);


ALTER TABLE public.patients OWNER TO postgres;

--
-- TOC entry 4916 (class 0 OID 16409)
-- Dependencies: 217
-- Data for Name: admissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admissions (admission_id, patient_id, department_id, admission_date, discharge_date, admission_type) FROM stdin;
101	1	1	2026-01-01	2026-01-06	Emergency
102	2	2	2026-01-03	2026-01-08	Scheduled
103	3	3	2026-01-05	2026-01-10	Emergency
104	4	4	2026-01-07	2026-01-09	Scheduled
105	5	5	2026-01-09	2026-01-15	Emergency
\.


--
-- TOC entry 4918 (class 0 OID 16434)
-- Dependencies: 219
-- Data for Name: billing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.billing (bill_id, patient_id, cost) FROM stdin;
201	1	55000.00
202	2	30000.00
203	3	75000.00
204	4	15000.00
205	5	60000.00
\.


--
-- TOC entry 4915 (class 0 OID 16404)
-- Dependencies: 216
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (department_id, department_name) FROM stdin;
1	Cardiology
2	Orthopedics
3	Pediatrics
4	Emergency
5	General Medicine
\.


--
-- TOC entry 4917 (class 0 OID 16424)
-- Dependencies: 218
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctors (doctor_id, department_id, doctor_name, utilization_percent) FROM stdin;
1	1	Dr.Ram	85
2	2	Dr. Aswath	70
3	3	Dr. Geetha	60
4	4	Dr. Anjali	90
5	5	Dr. Ravi	75
\.


--
-- TOC entry 4919 (class 0 OID 16444)
-- Dependencies: 220
-- Data for Name: outcomes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.outcomes (outcome_id, patient_id, outcome_status) FROM stdin;
301	1	Recovered
302	2	Improved
303	3	Recovered
304	4	Recovered
305	5	Transferred
\.


--
-- TOC entry 4914 (class 0 OID 16399)
-- Dependencies: 215
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patients (patient_id, age, gender, insurance_type) FROM stdin;
1	45	Male	Private
2	30	Female	Government
3	60	Male	Private
4	12	Female	Government
5	50	Male	Private
\.


--
-- TOC entry 4759 (class 2606 OID 16413)
-- Name: admissions admissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admissions
    ADD CONSTRAINT admissions_pkey PRIMARY KEY (admission_id);


--
-- TOC entry 4763 (class 2606 OID 16438)
-- Name: billing billing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing
    ADD CONSTRAINT billing_pkey PRIMARY KEY (bill_id);


--
-- TOC entry 4757 (class 2606 OID 16408)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);


--
-- TOC entry 4761 (class 2606 OID 16428)
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (doctor_id);


--
-- TOC entry 4765 (class 2606 OID 16448)
-- Name: outcomes outcomes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outcomes
    ADD CONSTRAINT outcomes_pkey PRIMARY KEY (outcome_id);


--
-- TOC entry 4755 (class 2606 OID 16403)
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (patient_id);


--
-- TOC entry 4766 (class 2606 OID 16419)
-- Name: admissions admissions_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admissions
    ADD CONSTRAINT admissions_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id);


--
-- TOC entry 4767 (class 2606 OID 16414)
-- Name: admissions admissions_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admissions
    ADD CONSTRAINT admissions_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(patient_id);


--
-- TOC entry 4769 (class 2606 OID 16439)
-- Name: billing billing_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing
    ADD CONSTRAINT billing_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(patient_id);


--
-- TOC entry 4768 (class 2606 OID 16429)
-- Name: doctors doctors_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id);


--
-- TOC entry 4770 (class 2606 OID 16449)
-- Name: outcomes outcomes_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outcomes
    ADD CONSTRAINT outcomes_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(patient_id);


-- Completed on 2026-02-06 11:33:13

--
-- PostgreSQL database dump complete
--

\unrestrict CS2V2Y1BgDpvbeGj5GfldoS8pTIlK5VzDLpWuC9ofgpz2FCmiTXjkhShjqvVFZC

