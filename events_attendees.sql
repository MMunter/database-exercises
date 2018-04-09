use codeup_test_db;

create table attendees(
  id int(10) UNSIGNED AUTO_INCREMENT not null,
  name VARCHAR(255) not NULL,
  PRIMARY KEY (id)
  );

create table presentations(
  id int(10) UNSIGNED AUTO_INCREMENT not null,
  name VARCHAR(255) not null,
  location VARCHAR(255) not null,
  presentation_time DATETIME not null,
  PRIMARY KEY (id)
);

create table attendee_presentation(
  attendee_id int(10) UNSIGNED not null,
  presentation_id int(10) UNSIGNED not null,
  FOREIGN KEY (attendee_id) REFERENCES attendees(id),
  FOREIGN KEY (presentation_id) REFERENCES presentations(id)
);

insert into attendees (name)
values('Alan'), ('Grace'), ('Ada'), ('Bjarne');

insert into presentations(name, location, presentation_time)
    VALUES ('Test-Driven Development 101', 'Conference Room A', now()),
      ('Intro to Management: Proactively Synergizing Paradigm Shifts', 'Conference Room B', now()),
      ('Java Design Patterns: Factory factories', 'Conference Room A', now()),
      ('Development Methodologies: What the SCRUM?', 'Conference Room A', now());

insert into attendee_presentation(attendee_id, presentation_id)
    values (1,1), (1,3), (2,2), (2,4), (3,2), (3,3), (4,4);

select name from presentations where location = 'Conference Room B';

select a.name from attendee_presentation as ap
join attendees a on ap.attendee_id = a.id
where ap.presentation_id in (select p.id from presentations as p where name = 'Intro to Management: Proactively Synergizing Paradigm Shifts');