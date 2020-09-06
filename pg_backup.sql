--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0 (Debian 12.0-2.pgdg100+1)
-- Dumped by pg_dump version 12.4 (Ubuntu 12.4-0ubuntu0.20.04.1)

-- Started on 2020-09-06 13:08:37 PDT

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
-- TOC entry 3054 (class 0 OID 16416)
-- Dependencies: 209
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 16398)
-- Dependencies: 205
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	supermanzer	project
8	supermanzer	projectsection
\.


--
-- TOC entry 3052 (class 0 OID 16408)
-- Dependencies: 207
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add project	7	add_project
26	Can change project	7	change_project
27	Can delete project	7	delete_project
28	Can view project	7	view_project
29	Can add project section	8	add_projectsection
30	Can change project section	8	change_projectsection
31	Can delete project section	8	delete_projectsection
32	Can view project section	8	view_projectsection
\.


--
-- TOC entry 3056 (class 0 OID 16426)
-- Dependencies: 211
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3058 (class 0 OID 16434)
-- Dependencies: 213
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$216000$USKVX8XNpq7g$7h/bF5bLmS/S9D30f0UnsJHp3eOkj+1HytCdekS78eo=	2020-09-04 20:51:46.787051+00	t	ryan				t	t	2020-09-04 20:25:56.621972+00
\.


--
-- TOC entry 3060 (class 0 OID 16444)
-- Dependencies: 215
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 3062 (class 0 OID 16452)
-- Dependencies: 217
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3064 (class 0 OID 16512)
-- Dependencies: 219
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 3048 (class 0 OID 16387)
-- Dependencies: 203
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-09-06 20:01:53.252826+00
2	auth	0001_initial	2020-09-06 20:01:53.2918+00
3	admin	0001_initial	2020-09-06 20:01:53.367062+00
4	admin	0002_logentry_remove_auto_add	2020-09-06 20:01:53.384175+00
5	admin	0003_logentry_add_action_flag_choices	2020-09-06 20:01:53.393199+00
6	contenttypes	0002_remove_content_type_name	2020-09-06 20:01:53.40916+00
7	auth	0002_alter_permission_name_max_length	2020-09-06 20:01:53.416818+00
8	auth	0003_alter_user_email_max_length	2020-09-06 20:01:53.423421+00
9	auth	0004_alter_user_username_opts	2020-09-06 20:01:53.430076+00
10	auth	0005_alter_user_last_login_null	2020-09-06 20:01:53.437465+00
11	auth	0006_require_contenttypes_0002	2020-09-06 20:01:53.439188+00
12	auth	0007_alter_validators_add_error_messages	2020-09-06 20:01:53.445835+00
13	auth	0008_alter_user_username_max_length	2020-09-06 20:01:53.456339+00
14	auth	0009_alter_user_last_name_max_length	2020-09-06 20:01:53.463546+00
15	auth	0010_alter_group_name_max_length	2020-09-06 20:01:53.472606+00
16	auth	0011_update_proxy_permissions	2020-09-06 20:01:53.479048+00
17	auth	0012_alter_user_first_name_max_length	2020-09-06 20:01:53.486321+00
18	sessions	0001_initial	2020-09-06 20:01:53.493993+00
19	supermanzer	0001_initial	2020-09-06 20:01:53.513843+00
20	supermanzer	0002_projectsection_heading	2020-09-06 20:01:53.522111+00
\.


--
-- TOC entry 3065 (class 0 OID 16543)
-- Dependencies: 220
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
1sfrfbcvc6h9x9nqiyziujta37z4qhbi	.eJxVjDsOwjAQBe_iGllx_F1Kes5g7a4NDiBbipMKcXcSKQW0b-bNW0RclxLXnuc4JXEWSpx-N0J-5rqD9MB6b5JbXeaJ5K7Ig3Z5bSm_Lof7FyjYy_bG7G5p0AkCau1Gle2o0Qcmx2Qge0JnDBoawBkYgleBQW15skxAVovPF-l7OAE:1kEIgU:scV0c8i3G1xRxaEuXQ5qviqNcGOTMOiWVVTBmeAVqrI	2020-09-18 20:51:46.792485+00
\.


--
-- TOC entry 3067 (class 0 OID 16555)
-- Dependencies: 222
-- Data for Name: supermanzer_project; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.supermanzer_project (id, date_created, date_modified, title, github_url, image_url, summary) FROM stdin;
1	2020-09-04	2020-09-05	TODO Catalog - CLA	https://github.com/supermanzer/todo-cla	/images/code-typing.jpeg	A command line application that scans a code base and generates a TODO.md that logs all TOOO comments in project directory, written in Python
2	2020-09-04	2020-09-04	NDBC Data Buoy Reader	https://github.com/GenSci/NDBC	/images/buoy.jpg	A Python package designed to automate the fetching and organizing of National Data Buoy Center (NDBC) standard meteorological data.  Additionally it provides station metadata and station search functionality.
\.


--
-- TOC entry 3069 (class 0 OID 16566)
-- Dependencies: 224
-- Data for Name: supermanzer_projectsection; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.supermanzer_projectsection (id, class_string, is_markdown, text, project_id, heading) FROM stdin;
1	problem-statement	t	I started programming because I thoguht it was fun to start telling the machines what to do, rather than the other way around.  After working through many coding tutorials in Python, JavaScript, and HTML I had picked up the practice of creating TODO comments to highlight where I had left the state of my code and my intent for what should come next.  This has proved rather helpful in keeping track of what I thought was needed and whwere my code was going.  However, as my projects grew more modular and spread across more files, tracking down these comments was not always easy.	1	
2	solution	t	After using the `os` module in Python and particularly the `os.walk()` method to traverse all files and subdirectories in a directory, it occurred to me that one could very easily write a program to scan all files in a directory for TODO comments, so that is what I did.  As with many projects, what started out laughably simple quickly got more complex as I realized what little tweaks would make it more functional.  However, I am pleased to have created something that does the job in just over 100 lines of code (including length doc strings and comments).	1	
3	goal	t	While many current IDEs have features to collect and catalog these comments, my goal with this project was to produce something that would be part of a public (or private) repository and work to improve collaboration.  I envisioned this being used by teams to communicate where one coder had to call it quits and where the next one to pick up the project could get started.  Also it would be useful if a solo developer had to walk away from a project for a while and wanted to pick it up again later, from a hosted repository.	1	
4	motivation	t	This project was initially writtin in `MATLAB`.\n\nOnce I started getting into the coding and research work for my M.Sc. thesis, I had to do a lot of work with NDBC buoy data.  For those of you who don't know, the federal government maintains a large number of buoy stations around the world oceans monitoring oceanographic conditions.  This data is freely available (cool, right?) but the format can sometimes be a pain to deal with (plain `.txt` files or weird archive files).  \n\nAfter doing an initial gathering of data by hand (downloading text files and manually entering the commands to load & stitch them together), I realized how even a need to simply change the months/years I was examining would take a lot more work.  I also realized _it shouldn't_!	2	Motivation
5	solution	t	With this in mind, and realizing that the webmaster(s) at NOAA kept their URL conventions reliably static for a reason, I defined a class (first in `MATLAB`, now in `Python`) that would allow the user to simply specify the range of years and/or months for which data is needed.  With this info my class would perform a series of http requests, parse the data from the text files returned, and return the data as a property of the object instantiated.\n\nMost of the features I've built into this were based on the struggles I had when beginning my research. Here are a few examples:\n  * `get_station_metadata()`:  This crawls the specific data station's website for a table of parameters and saves the useful metadata like lat, lon, sensor types and positions, etc., to the DataBuoy instance.\n\n  * `station_search()`:  When your advisor says "this is great but how does it correspond with measurements from nearby buoys?", this is the function you want to use.  I have provided two methods (box and radial) but for my money, the radial search is the really cool one.  This is because, if you've already used the function above, you can just specify a distance (in km) and it will perform a radial search for all the data stations with the radius you provided.  Then you've got a list of IDs to get you started.	2	Solution
6		t	I think, before too many people start actually using this thing, I want to clean up the API.  While I appreciate verbosity and clarity, some names are just too long and provide too much opportunity for typos.\n\nI would also like to not rely on dictionaries too much for data containers and figure out how best to use objects so I can provide clean dot notation access to all data properties.\n\nGreater metadata would likely also be useful to ensure that, when a researcher is ready to write up their work, they have all the information they need without having to go hunting for it.	2	Next Steps
\.


--
-- TOC entry 3075 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);


--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 214
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 216
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 218
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 204
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 221
-- Name: supermanzer_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.supermanzer_project_id_seq', 1, false);


--
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 223
-- Name: supermanzer_projectsection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.supermanzer_projectsection_id_seq', 1, false);


-- Completed on 2020-09-06 13:08:37 PDT

--
-- PostgreSQL database dump complete
--

