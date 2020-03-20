CREATE SCHEMA user_data AUTHORIZATION crguenddesrdki;
CREATE SCHEMA project_data AUTHORIZATION crguenddesrdki;

CREATE TABLE user_data.creds (
	id varchar(255) NOT NULL,
	pass bytea NULL,
	CONSTRAINT creds_pkey PRIMARY KEY (id)
);

CREATE TABLE project_data.admins (
	id varchar(255) NOT NULL,
	email varchar(255) NOT NULL,
	name varchar(255) NOT NULL,
	verified boolean default false,
	CONSTRAINT admins_pkey PRIMARY KEY (id)
);

create table project_data.projects (
	id varchar(255) not null,
	name varchar(255) not null,
	owner_id varchar(255) not null references project_data.admins(id),
	constraint projects_pkey primary key (id)
);