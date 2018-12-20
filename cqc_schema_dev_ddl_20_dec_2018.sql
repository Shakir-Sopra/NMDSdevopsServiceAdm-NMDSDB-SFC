--
-- PostgreSQL database dump
--

-- Dumped from database version 11.0
-- Dumped by pg_dump version 11.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: cqc; Type: SCHEMA; Schema: -; Owner: sfcadmin
--

CREATE SCHEMA cqc;


ALTER SCHEMA cqc OWNER TO sfcadmin;

--
-- Name: est_employertype_enum; Type: TYPE; Schema: cqc; Owner: postgres
--

CREATE TYPE cqc.est_employertype_enum AS ENUM (
    'Private Sector',
    'Voluntary / Charity',
    'Other'
);


ALTER TYPE cqc.est_employertype_enum OWNER TO postgres;

SET default_tablespace = sfcdevtbs_logins;

SET default_with_oids = false;

--
-- Name: CqcLog; Type: TABLE; Schema: cqc; Owner: postgres; Tablespace: sfcdevtbs_logins
--

CREATE TABLE cqc."CqcLog" (
    id integer NOT NULL,
    success boolean,
    message character varying(255),
    createdat timestamp with time zone NOT NULL,
    "lastUpdatedAt" text
);


ALTER TABLE cqc."CqcLog" OWNER TO postgres;

--
-- Name: Establishment; Type: TABLE; Schema: cqc; Owner: sfcadmin; Tablespace: sfcdevtbs_logins
--

CREATE TABLE cqc."Establishment" (
    "EstablishmentID" integer NOT NULL,
    "Name" text NOT NULL,
    "Address" text,
    "LocationID" text,
    "PostCode" text,
    "IsRegulated" boolean NOT NULL,
    "MainServiceId" integer,
    "EmployerType" cqc.est_employertype_enum,
    "ShareDataWithCQC" boolean DEFAULT false,
    "ShareDataWithLA" boolean DEFAULT false,
    "ShareData" boolean DEFAULT false
);


ALTER TABLE cqc."Establishment" OWNER TO sfcadmin;

SET default_tablespace = '';

--
-- Name: EstablishmentCapacity; Type: TABLE; Schema: cqc; Owner: postgres
--

CREATE TABLE cqc."EstablishmentCapacity" (
    "EstablishmentCapacityID" integer NOT NULL,
    "EstablishmentID" integer,
    "ServiceCapacityID" integer NOT NULL,
    "Answer" integer
);


ALTER TABLE cqc."EstablishmentCapacity" OWNER TO postgres;

--
-- Name: EstablishmentCapacity_EstablishmentCapacityID_seq; Type: SEQUENCE; Schema: cqc; Owner: postgres
--

CREATE SEQUENCE cqc."EstablishmentCapacity_EstablishmentCapacityID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cqc."EstablishmentCapacity_EstablishmentCapacityID_seq" OWNER TO postgres;

--
-- Name: EstablishmentCapacity_EstablishmentCapacityID_seq; Type: SEQUENCE OWNED BY; Schema: cqc; Owner: postgres
--

ALTER SEQUENCE cqc."EstablishmentCapacity_EstablishmentCapacityID_seq" OWNED BY cqc."EstablishmentCapacity"."EstablishmentCapacityID";


--
-- Name: EstablishmentJobs; Type: TABLE; Schema: cqc; Owner: sfcadmin
--

CREATE TABLE cqc."EstablishmentJobs" (
    "JobID" integer NOT NULL,
    "EstablishmentID" integer,
    "EstablishmentJobID" integer
);


ALTER TABLE cqc."EstablishmentJobs" OWNER TO sfcadmin;

--
-- Name: EstablishmentJobs_JobID_seq; Type: SEQUENCE; Schema: cqc; Owner: sfcadmin
--

CREATE SEQUENCE cqc."EstablishmentJobs_JobID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cqc."EstablishmentJobs_JobID_seq" OWNER TO sfcadmin;

--
-- Name: EstablishmentJobs_JobID_seq; Type: SEQUENCE OWNED BY; Schema: cqc; Owner: sfcadmin
--

ALTER SEQUENCE cqc."EstablishmentJobs_JobID_seq" OWNED BY cqc."EstablishmentJobs"."JobID";


--
-- Name: EstablishmentLocalAuthority; Type: TABLE; Schema: cqc; Owner: sfcadmin
--

CREATE TABLE cqc."EstablishmentLocalAuthority" (
    "EstablishmentID" integer,
    "EstbLaID" integer,
    "LocalCustodianCode" integer
);


ALTER TABLE cqc."EstablishmentLocalAuthority" OWNER TO sfcadmin;

--
-- Name: EstablishmentServices; Type: TABLE; Schema: cqc; Owner: sfcadmin
--

CREATE TABLE cqc."EstablishmentServices" (
    "EstablishmentID" integer NOT NULL,
    "ServiceID" integer NOT NULL
);


ALTER TABLE cqc."EstablishmentServices" OWNER TO sfcadmin;

--
-- Name: Establishment_EstablishmentID_seq; Type: SEQUENCE; Schema: cqc; Owner: sfcadmin
--

CREATE SEQUENCE cqc."Establishment_EstablishmentID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cqc."Establishment_EstablishmentID_seq" OWNER TO sfcadmin;

--
-- Name: Establishment_EstablishmentID_seq; Type: SEQUENCE OWNED BY; Schema: cqc; Owner: sfcadmin
--

ALTER SEQUENCE cqc."Establishment_EstablishmentID_seq" OWNED BY cqc."Establishment"."EstablishmentID";


--
-- Name: Job; Type: TABLE; Schema: cqc; Owner: sfcadmin
--

CREATE TABLE cqc."Job" (
    "JobID" integer NOT NULL,
    "JobName" text
);


ALTER TABLE cqc."Job" OWNER TO sfcadmin;

--
-- Name: LocalAuthority ; Type: TABLE; Schema: cqc; Owner: sfcadmin
--

CREATE TABLE cqc."LocalAuthority " (
    "LocalCustodianCode" integer,
    "LocalAuthorityName" text
);


ALTER TABLE cqc."LocalAuthority " OWNER TO sfcadmin;

SET default_tablespace = sfcdevtbs_logins;

--
-- Name: Login; Type: TABLE; Schema: cqc; Owner: sfcadmin; Tablespace: sfcdevtbs_logins
--

CREATE TABLE cqc."Login" (
    "ID" integer NOT NULL,
    "RegistrationID" integer NOT NULL,
    "Username" character varying(120) NOT NULL,
    "Password" character varying(120) NOT NULL,
    "SecurityQuestion" character varying(255) NOT NULL,
    "SecurityQuestionAnswer" character varying(255) NOT NULL,
    "Active" boolean NOT NULL,
    "InvalidAttempt" integer NOT NULL,
    "Salt" character varying(255),
    "Hash" character varying(255),
    "FirstLogin" timestamp(4) without time zone
);


ALTER TABLE cqc."Login" OWNER TO sfcadmin;

--
-- Name: Login_ID_seq; Type: SEQUENCE; Schema: cqc; Owner: sfcadmin
--

CREATE SEQUENCE cqc."Login_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cqc."Login_ID_seq" OWNER TO sfcadmin;

--
-- Name: Login_ID_seq; Type: SEQUENCE OWNED BY; Schema: cqc; Owner: sfcadmin
--

ALTER SEQUENCE cqc."Login_ID_seq" OWNED BY cqc."Login"."ID";


SET default_tablespace = '';

--
-- Name: ServicesCapacity; Type: TABLE; Schema: cqc; Owner: sfcadmin
--

CREATE TABLE cqc."ServicesCapacity" (
    "ServiceID" integer,
    "Question" text,
    "Sequence" integer,
    "ServiceCapacityID" integer NOT NULL
);


ALTER TABLE cqc."ServicesCapacity" OWNER TO sfcadmin;

SET default_tablespace = sfcdevtbs_logins;

--
-- Name: User; Type: TABLE; Schema: cqc; Owner: sfcadmin; Tablespace: sfcdevtbs_logins
--

CREATE TABLE cqc."User" (
    "RegistrationID" integer NOT NULL,
    "FullName" character varying(120) NOT NULL,
    "JobTitle" character varying(255) NOT NULL,
    "Email" character varying(255) NOT NULL,
    "Phone" character varying(50) NOT NULL,
    "DateCreated" timestamp without time zone NOT NULL,
    "EstablishmentID" integer NOT NULL,
    "AdminUser" boolean NOT NULL
);


ALTER TABLE cqc."User" OWNER TO sfcadmin;

--
-- Name: User_RegistrationID_seq; Type: SEQUENCE; Schema: cqc; Owner: sfcadmin
--

CREATE SEQUENCE cqc."User_RegistrationID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cqc."User_RegistrationID_seq" OWNER TO sfcadmin;

--
-- Name: User_RegistrationID_seq; Type: SEQUENCE OWNED BY; Schema: cqc; Owner: sfcadmin
--

ALTER SEQUENCE cqc."User_RegistrationID_seq" OWNED BY cqc."User"."RegistrationID";


--
-- Name: cqclog_id_seq; Type: SEQUENCE; Schema: cqc; Owner: postgres
--

CREATE SEQUENCE cqc.cqclog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cqc.cqclog_id_seq OWNER TO postgres;

--
-- Name: cqclog_id_seq; Type: SEQUENCE OWNED BY; Schema: cqc; Owner: postgres
--

ALTER SEQUENCE cqc.cqclog_id_seq OWNED BY cqc."CqcLog".id;


--
-- Name: location_cqcid_seq; Type: SEQUENCE; Schema: cqc; Owner: sfcadmin
--

CREATE SEQUENCE cqc.location_cqcid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cqc.location_cqcid_seq OWNER TO sfcadmin;

--
-- Name: location; Type: TABLE; Schema: cqc; Owner: sfcadmin; Tablespace: sfcdevtbs_logins
--

CREATE TABLE cqc.location (
    cqcid integer DEFAULT nextval('cqc.location_cqcid_seq'::regclass) NOT NULL,
    locationid text,
    locationname text,
    addressline1 text,
    addressline2 text,
    towncity text,
    county text,
    postalcode text,
    mainservice text,
    createdat timestamp without time zone NOT NULL,
    updatedat timestamp without time zone
);


ALTER TABLE cqc.location OWNER TO sfcadmin;

--
-- Name: log_id_seq; Type: SEQUENCE; Schema: cqc; Owner: postgres
--

CREATE SEQUENCE cqc.log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cqc.log_id_seq OWNER TO postgres;

--
-- Name: pcodedata; Type: TABLE; Schema: cqc; Owner: sfcadmin; Tablespace: sfcdevtbs_logins
--

CREATE TABLE cqc.pcodedata (
    uprn bigint,
    sub_building_name character varying,
    building_name character varying,
    building_number character varying,
    street_description character varying,
    post_town character varying,
    postcode character varying,
    local_custodian_code bigint,
    county character varying,
    rm_organisation_name character varying
);


ALTER TABLE cqc.pcodedata OWNER TO sfcadmin;

--
-- Name: services; Type: TABLE; Schema: cqc; Owner: sfcadmin; Tablespace: sfcdevtbs_logins
--

CREATE TABLE cqc.services (
    id integer NOT NULL,
    name text,
    category text,
    capacityquestion text,
    currentuptakequestion text,
    iscqcregistered boolean,
    ismain boolean DEFAULT true
);


ALTER TABLE cqc.services OWNER TO sfcadmin;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: cqc; Owner: sfcadmin
--

CREATE SEQUENCE cqc.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cqc.services_id_seq OWNER TO sfcadmin;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: cqc; Owner: sfcadmin
--

ALTER SEQUENCE cqc.services_id_seq OWNED BY cqc.services.id;


--
-- Name: CqcLog id; Type: DEFAULT; Schema: cqc; Owner: postgres
--

ALTER TABLE ONLY cqc."CqcLog" ALTER COLUMN id SET DEFAULT nextval('cqc.cqclog_id_seq'::regclass);


--
-- Name: Establishment EstablishmentID; Type: DEFAULT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc."Establishment" ALTER COLUMN "EstablishmentID" SET DEFAULT nextval('cqc."Establishment_EstablishmentID_seq"'::regclass);


--
-- Name: EstablishmentCapacity EstablishmentCapacityID; Type: DEFAULT; Schema: cqc; Owner: postgres
--

ALTER TABLE ONLY cqc."EstablishmentCapacity" ALTER COLUMN "EstablishmentCapacityID" SET DEFAULT nextval('cqc."EstablishmentCapacity_EstablishmentCapacityID_seq"'::regclass);


--
-- Name: EstablishmentJobs JobID; Type: DEFAULT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc."EstablishmentJobs" ALTER COLUMN "JobID" SET DEFAULT nextval('cqc."EstablishmentJobs_JobID_seq"'::regclass);


--
-- Name: Login ID; Type: DEFAULT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc."Login" ALTER COLUMN "ID" SET DEFAULT nextval('cqc."Login_ID_seq"'::regclass);


--
-- Name: User RegistrationID; Type: DEFAULT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc."User" ALTER COLUMN "RegistrationID" SET DEFAULT nextval('cqc."User_RegistrationID_seq"'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc.services ALTER COLUMN id SET DEFAULT nextval('cqc.services_id_seq'::regclass);


SET default_tablespace = '';

--
-- Name: CqcLog CQCLog_pkey; Type: CONSTRAINT; Schema: cqc; Owner: postgres
--

ALTER TABLE ONLY cqc."CqcLog"
    ADD CONSTRAINT "CQCLog_pkey" PRIMARY KEY (id);


--
-- Name: EstablishmentCapacity EstablishmentCapacity_pkey1; Type: CONSTRAINT; Schema: cqc; Owner: postgres
--

ALTER TABLE ONLY cqc."EstablishmentCapacity"
    ADD CONSTRAINT "EstablishmentCapacity_pkey1" PRIMARY KEY ("ServiceCapacityID");


--
-- Name: EstablishmentJobs EstablishmentJobs_pkey; Type: CONSTRAINT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc."EstablishmentJobs"
    ADD CONSTRAINT "EstablishmentJobs_pkey" PRIMARY KEY ("JobID");


--
-- Name: EstablishmentCapacity EstablishmentServiceCapacity_unq1; Type: CONSTRAINT; Schema: cqc; Owner: postgres
--

ALTER TABLE ONLY cqc."EstablishmentCapacity"
    ADD CONSTRAINT "EstablishmentServiceCapacity_unq1" UNIQUE ("EstablishmentID", "ServiceCapacityID");


--
-- Name: Establishment Establishment_pkey; Type: CONSTRAINT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc."Establishment"
    ADD CONSTRAINT "Establishment_pkey" PRIMARY KEY ("EstablishmentID");


--
-- Name: Job Job_pkey; Type: CONSTRAINT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc."Job"
    ADD CONSTRAINT "Job_pkey" PRIMARY KEY ("JobID");


--
-- Name: EstablishmentServices OtherServices_pkey; Type: CONSTRAINT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc."EstablishmentServices"
    ADD CONSTRAINT "OtherServices_pkey" PRIMARY KEY ("EstablishmentID", "ServiceID");


--
-- Name: ServicesCapacity ServicesCapacity_pkey; Type: CONSTRAINT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc."ServicesCapacity"
    ADD CONSTRAINT "ServicesCapacity_pkey" PRIMARY KEY ("ServiceCapacityID");


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (cqcid);


--
-- Name: Login pk_Login; Type: CONSTRAINT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc."Login"
    ADD CONSTRAINT "pk_Login" PRIMARY KEY ("ID");


--
-- Name: User pk_User; Type: CONSTRAINT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc."User"
    ADD CONSTRAINT "pk_User" PRIMARY KEY ("RegistrationID");


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: Login uc_Login_Username; Type: CONSTRAINT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc."Login"
    ADD CONSTRAINT "uc_Login_Username" UNIQUE ("Username");


--
-- Name: location uniqlocationid; Type: CONSTRAINT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc.location
    ADD CONSTRAINT uniqlocationid UNIQUE (locationid);


--
-- Name: services unq_serviceid; Type: CONSTRAINT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc.services
    ADD CONSTRAINT unq_serviceid UNIQUE (id);


--
-- Name: ServicesCapacity unq_servicescapacityid; Type: CONSTRAINT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc."ServicesCapacity"
    ADD CONSTRAINT unq_servicescapacityid UNIQUE ("ServiceCapacityID");


--
-- Name: User unq_userregistrationid; Type: CONSTRAINT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc."User"
    ADD CONSTRAINT unq_userregistrationid UNIQUE ("RegistrationID");


--
-- Name: Establishment unqestbid; Type: CONSTRAINT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc."Establishment"
    ADD CONSTRAINT unqestbid UNIQUE ("EstablishmentID");


--
-- Name: ServicesCapacity unqsrvcid; Type: CONSTRAINT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc."ServicesCapacity"
    ADD CONSTRAINT unqsrvcid UNIQUE ("ServiceID", "Sequence");


SET default_tablespace = sfcdevtbs_index;

--
-- Name: Postcodedata_postcode_Idx; Type: INDEX; Schema: cqc; Owner: sfcadmin; Tablespace: sfcdevtbs_index
--

CREATE INDEX "Postcodedata_postcode_Idx" ON cqc.pcodedata USING btree (postcode text_pattern_ops);


--
-- Name: EstablishmentCapacity EstablishmentServiceCapacity_Establishment_fk1; Type: FK CONSTRAINT; Schema: cqc; Owner: postgres
--

ALTER TABLE ONLY cqc."EstablishmentCapacity"
    ADD CONSTRAINT "EstablishmentServiceCapacity_Establishment_fk1" FOREIGN KEY ("EstablishmentID") REFERENCES cqc."Establishment"("EstablishmentID");


--
-- Name: EstablishmentCapacity EstablishmentServiceCapacity_ServiceCapacity_fk1; Type: FK CONSTRAINT; Schema: cqc; Owner: postgres
--

ALTER TABLE ONLY cqc."EstablishmentCapacity"
    ADD CONSTRAINT "EstablishmentServiceCapacity_ServiceCapacity_fk1" FOREIGN KEY ("ServiceCapacityID") REFERENCES cqc."ServicesCapacity"("ServiceCapacityID");


--
-- Name: ServicesCapacity constr_srvcid_fk; Type: FK CONSTRAINT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc."ServicesCapacity"
    ADD CONSTRAINT constr_srvcid_fk FOREIGN KEY ("ServiceID") REFERENCES cqc.services(id);


--
-- Name: Login constraint_fk; Type: FK CONSTRAINT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc."Login"
    ADD CONSTRAINT constraint_fk FOREIGN KEY ("RegistrationID") REFERENCES cqc."User"("RegistrationID");


--
-- Name: Establishment estloc_fk; Type: FK CONSTRAINT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc."Establishment"
    ADD CONSTRAINT estloc_fk FOREIGN KEY ("LocationID") REFERENCES cqc.location(locationid);


--
-- Name: EstablishmentServices estsrvc_estb_fk; Type: FK CONSTRAINT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc."EstablishmentServices"
    ADD CONSTRAINT estsrvc_estb_fk FOREIGN KEY ("EstablishmentID") REFERENCES cqc."Establishment"("EstablishmentID");


--
-- Name: EstablishmentServices estsrvc_services_fk; Type: FK CONSTRAINT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc."EstablishmentServices"
    ADD CONSTRAINT estsrvc_services_fk FOREIGN KEY ("ServiceID") REFERENCES cqc.services(id);


--
-- Name: Establishment mainserviceid_fk; Type: FK CONSTRAINT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc."Establishment"
    ADD CONSTRAINT mainserviceid_fk FOREIGN KEY ("MainServiceId") REFERENCES cqc.services(id) MATCH FULL;


--
-- Name: User user_establishment_fk; Type: FK CONSTRAINT; Schema: cqc; Owner: sfcadmin
--

ALTER TABLE ONLY cqc."User"
    ADD CONSTRAINT user_establishment_fk FOREIGN KEY ("EstablishmentID") REFERENCES cqc."Establishment"("EstablishmentID");


--
-- Name: TABLE "CqcLog"; Type: ACL; Schema: cqc; Owner: postgres
--

GRANT ALL ON TABLE cqc."CqcLog" TO sfcadmin;


--
-- Name: SEQUENCE cqclog_id_seq; Type: ACL; Schema: cqc; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE cqc.cqclog_id_seq TO sfcadmin;


--
-- Name: SEQUENCE log_id_seq; Type: ACL; Schema: cqc; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE cqc.log_id_seq TO sfcadmin;


--
-- PostgreSQL database dump complete
--

