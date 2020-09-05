BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "supermanzer_projectsection" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"class_string"	varchar(200) NOT NULL,
	"is_markdown"	bool NOT NULL,
	"text"	text NOT NULL,
	"project_id"	integer NOT NULL,
	"heading"	varchar(100) NOT NULL,
	FOREIGN KEY("project_id") REFERENCES "supermanzer_project"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "supermanzer_project" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"date_created"	date NOT NULL,
	"date_modified"	date NOT NULL,
	"title"	varchar(200) NOT NULL,
	"github_url"	varchar(200) NOT NULL,
	"image_url"	varchar(100) NOT NULL,
	"summary"	text NOT NULL
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	varchar(150) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag">=0),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL
);
INSERT INTO "supermanzer_projectsection" ("id","class_string","is_markdown","text","project_id","heading") VALUES (1,'problem-statement',1,'I started programming because I thoguht it was fun to start telling the machines what to do, rather than the other way around.  After working through many coding tutorials in Python, JavaScript, and HTML I had picked up the practice of creating TODO comments to highlight where I had left the state of my code and my intent for what should come next.  This has proved rather helpful in keeping track of what I thought was needed and whwere my code was going.  However, as my projects grew more modular and spread across more files, tracking down these comments was not always easy.',1,''),
 (2,'solution',1,'After using the `os` module in Python and particularly the `os.walk()` method to traverse all files and subdirectories in a directory, it occurred to me that one could very easily write a program to scan all files in a directory for TODO comments, so that is what I did.  As with many projects, what started out laughably simple quickly got more complex as I realized what little tweaks would make it more functional.  However, I am pleased to have created something that does the job in just over 100 lines of code (including length doc strings and comments).',1,''),
 (3,'goal',1,'While many current IDEs have features to collect and catalog these comments, my goal with this project was to produce something that would be part of a public (or private) repository and work to improve collaboration.  I envisioned this being used by teams to communicate where one coder had to call it quits and where the next one to pick up the project could get started.  Also it would be useful if a solo developer had to walk away from a project for a while and wanted to pick it up again later, from a hosted repository.',1,''),
 (4,'motivation',1,'This project was initially writtin in `MATLAB`.

Once I started getting into the coding and research work for my M.Sc. thesis, I had to do a lot of work with NDBC buoy data.  For those of you who don''t know, the federal government maintains a large number of buoy stations around the world oceans monitoring oceanographic conditions.  This data is freely available (cool, right?) but the format can sometimes be a pain to deal with (plain `.txt` files or weird archive files).  

After doing an initial gathering of data by hand (downloading text files and manually entering the commands to load & stitch them together), I realized how even a need to simply change the months/years I was examining would take a lot more work.  I also realized _it shouldn''t_!',2,'Motivation'),
 (5,'solution',1,'With this in mind, and realizing that the webmaster(s) at NOAA kept their URL conventions reliably static for a reason, I defined a class (first in `MATLAB`, now in `Python`) that would allow the user to simply specify the range of years and/or months for which data is needed.  With this info my class would perform a series of http requests, parse the data from the text files returned, and return the data as a property of the object instantiated.

Most of the features I''ve built into this were based on the struggles I had when beginning my research. Here are a few examples:
  * `get_station_metadata()`:  This crawls the specific data station''s website for a table of parameters and saves the useful metadata like lat, lon, sensor types and positions, etc., to the DataBuoy instance.

  * `station_search()`:  When your advisor says "this is great but how does it correspond with measurements from nearby buoys?", this is the function you want to use.  I have provided two methods (box and radial) but for my money, the radial search is the really cool one.  This is because, if you''ve already used the function above, you can just specify a distance (in km) and it will perform a radial search for all the data stations with the radius you provided.  Then you''ve got a list of IDs to get you started.',2,'Solution'),
 (6,'',1,'I think, before too many people start actually using this thing, I want to clean up the API.  While I appreciate verbosity and clarity, some names are just too long and provide too much opportunity for typos.

I would also like to not rely on dictionaries too much for data containers and figure out how best to use objects so I can provide clean dot notation access to all data properties.

Greater metadata would likely also be useful to ensure that, when a researcher is ready to write up their work, they have all the information they need without having to go hunting for it.',2,'Next Steps');
INSERT INTO "supermanzer_project" ("id","date_created","date_modified","title","github_url","image_url","summary") VALUES (1,'2020-09-04','2020-09-04','TODO Catalog: Command Line Application','https://github.com/supermanzer/todo-cla','/images/code-typing.jpeg','A command line application that scans a code base and generates a TODO.md that logs all TOOO comments in project directory, written in Python'),
 (2,'2020-09-04','2020-09-04','NDBC Data Buoy Reader','https://github.com/GenSci/NDBC','/images/buoy.jpg','A Python package designed to automate the fetching and organizing of National Data Buoy Center (NDBC) standard meteorological data.  Additionally it provides station metadata and station search functionality.');
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('1sfrfbcvc6h9x9nqiyziujta37z4qhbi','.eJxVjDsOwjAQBe_iGllx_F1Kes5g7a4NDiBbipMKcXcSKQW0b-bNW0RclxLXnuc4JXEWSpx-N0J-5rqD9MB6b5JbXeaJ5K7Ig3Z5bSm_Lof7FyjYy_bG7G5p0AkCau1Gle2o0Qcmx2Qge0JnDBoawBkYgleBQW15skxAVovPF-l7OAE:1kEIgU:scV0c8i3G1xRxaEuXQ5qviqNcGOTMOiWVVTBmeAVqrI','2020-09-18 20:51:46.792485');
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","username","last_name","email","is_staff","is_active","date_joined","first_name") VALUES (1,'pbkdf2_sha256$216000$USKVX8XNpq7g$7h/bF5bLmS/S9D30f0UnsJHp3eOkj+1HytCdekS78eo=','2020-09-04 20:51:46.787051',1,'ryan','','',1,1,'2020-09-04 20:25:56.621972','');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (1,1,'add_logentry','Can add log entry'),
 (2,1,'change_logentry','Can change log entry'),
 (3,1,'delete_logentry','Can delete log entry'),
 (4,1,'view_logentry','Can view log entry'),
 (5,2,'add_permission','Can add permission'),
 (6,2,'change_permission','Can change permission'),
 (7,2,'delete_permission','Can delete permission'),
 (8,2,'view_permission','Can view permission'),
 (9,3,'add_group','Can add group'),
 (10,3,'change_group','Can change group'),
 (11,3,'delete_group','Can delete group'),
 (12,3,'view_group','Can view group'),
 (13,4,'add_user','Can add user'),
 (14,4,'change_user','Can change user'),
 (15,4,'delete_user','Can delete user'),
 (16,4,'view_user','Can view user'),
 (17,5,'add_contenttype','Can add content type'),
 (18,5,'change_contenttype','Can change content type'),
 (19,5,'delete_contenttype','Can delete content type'),
 (20,5,'view_contenttype','Can view content type'),
 (21,6,'add_session','Can add session'),
 (22,6,'change_session','Can change session'),
 (23,6,'delete_session','Can delete session'),
 (24,6,'view_session','Can view session'),
 (25,7,'add_projectsection','Can add project section'),
 (26,7,'change_projectsection','Can change project section'),
 (27,7,'delete_projectsection','Can delete project section'),
 (28,7,'view_projectsection','Can view project section'),
 (29,8,'add_project','Can add project'),
 (30,8,'change_project','Can change project'),
 (31,8,'delete_project','Can delete project'),
 (32,8,'view_project','Can view project');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (1,'admin','logentry'),
 (2,'auth','permission'),
 (3,'auth','group'),
 (4,'auth','user'),
 (5,'contenttypes','contenttype'),
 (6,'sessions','session'),
 (7,'supermanzer','projectsection'),
 (8,'supermanzer','project');
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (1,'2020-09-04 20:53:28.239280','1','Project object (1)','[{"added": {}}, {"added": {"name": "project section", "object": "ProjectSection object (1)"}}]',8,1,1),
 (2,'2020-09-04 20:54:27.170071','1','Project object (1)','[{"added": {"name": "project section", "object": "ProjectSection object (2)"}}, {"added": {"name": "project section", "object": "ProjectSection object (3)"}}]',8,1,2),
 (3,'2020-09-04 21:45:13.383881','2','Project object (2)','[{"added": {}}, {"added": {"name": "project section", "object": "ProjectSection object (4)"}}, {"added": {"name": "project section", "object": "ProjectSection object (5)"}}]',8,1,1),
 (4,'2020-09-04 21:48:33.944650','2','Project object (2)','[{"added": {"name": "project section", "object": "ProjectSection object (6)"}}, {"changed": {"name": "project section", "object": "ProjectSection object (4)", "fields": ["Heading"]}}, {"changed": {"name": "project section", "object": "ProjectSection object (5)", "fields": ["Heading"]}}]',8,1,2);
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (1,'contenttypes','0001_initial','2020-09-04 20:25:39.865394'),
 (2,'auth','0001_initial','2020-09-04 20:25:39.880216'),
 (3,'admin','0001_initial','2020-09-04 20:25:39.893913'),
 (4,'admin','0002_logentry_remove_auto_add','2020-09-04 20:25:39.906102'),
 (5,'admin','0003_logentry_add_action_flag_choices','2020-09-04 20:25:39.917735'),
 (6,'contenttypes','0002_remove_content_type_name','2020-09-04 20:25:39.935445'),
 (7,'auth','0002_alter_permission_name_max_length','2020-09-04 20:25:39.945868'),
 (8,'auth','0003_alter_user_email_max_length','2020-09-04 20:25:39.978740'),
 (9,'auth','0004_alter_user_username_opts','2020-09-04 20:25:39.990216'),
 (10,'auth','0005_alter_user_last_login_null','2020-09-04 20:25:40.000827'),
 (11,'auth','0006_require_contenttypes_0002','2020-09-04 20:25:40.004993'),
 (12,'auth','0007_alter_validators_add_error_messages','2020-09-04 20:25:40.016421'),
 (13,'auth','0008_alter_user_username_max_length','2020-09-04 20:25:40.029273'),
 (14,'auth','0009_alter_user_last_name_max_length','2020-09-04 20:25:40.039485'),
 (15,'auth','0010_alter_group_name_max_length','2020-09-04 20:25:40.049540'),
 (16,'auth','0011_update_proxy_permissions','2020-09-04 20:25:40.060044'),
 (17,'auth','0012_alter_user_first_name_max_length','2020-09-04 20:25:40.074485'),
 (18,'sessions','0001_initial','2020-09-04 20:25:40.079528'),
 (19,'supermanzer','0001_initial','2020-09-04 20:50:42.876788'),
 (20,'supermanzer','0002_projectsection_heading','2020-09-04 21:45:04.014507');
CREATE INDEX IF NOT EXISTS "supermanzer_projectsection_project_id_172f9c4a" ON "supermanzer_projectsection" (
	"project_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
COMMIT;
