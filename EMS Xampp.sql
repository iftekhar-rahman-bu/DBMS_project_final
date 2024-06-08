create table events(
eventID int not null primary key auto_increment,
event_name varchar(100),
date_time datetime,
description varchar(300),
status enum('Done', 'On progress', 'Cancelled'),
venueID int not null,
customerID int not null,
organizerID int not null
);

create table customer(
customerID int not null auto_increment,
name varchar(100),
address varchar(300),
contact varchar(20),
eventID int not null,
attendeesID int not null,
primary key(customerID)
    );
	
create table organizers(
organizerID int not null auto_increment,
organizer_name varchar(100),
contact varchar(20),
email varchar(100) unique,
role enum('Main organizer', 'Sub organizer'),
eventID int not null,
sponsorID int not null,
vendorID int not null,
primary key (organizerID)
    );
	
create table attendees(
attendeesID int not null auto_increment,
name varchar(100),
contact varchar(20),
eventID int not null,
primary key(attendeesID),
foreign key(eventID) references events(eventID)
);

create table requirement(
requirementID int not null auto_increment,
description varchar(300),
organizerID int not null,
eventID int not null,
customerID int not null,
primary key(requirementID),
foreign key(organizerID) references organizers(organizerID),
foreign key(eventID) references events(eventID),
foreign key(customerID) references customer(customerID)
);
	
create table venues(
venueID int not null auto_increment,
venue_name varchar(100),
capacity int,
address varchar(300),
contact varchar(20),
eventID int not null,
organizerID int not null, 
primary key(venueID),
foreign key(eventID) references events(eventID),
foreign key(organizerID) references organizers(organizerID)
);
	
create table speakers(
speakerID int not null auto_increment,
name varchar(100),
contact varchar(20),
eventID int not null,
attendeesID int not null,
primary key(speakerID),
foreign key(eventID) references events(eventID),
foreign key(attendeesID) references attendees(attendeesID)
);

CREATE TABLE Sponsors(
sponsorID int auto_increment,
name varchar(100) not null,
contact varchar(20),
email varchar(100),
contribution_type enum('Checkbook', 'Cash', 'Card', 'Online Payment'),
amount decimal(10,2),
eventID int not null,
organizerID int not null,
primary key(sponsorID),
foreign key(eventID) references events(eventID),
foreign key(organizerID) references organizers(organizerID)
);

create table vendors(
vendorID int not null auto_increment,
name varchar(100) not null,
service_type varchar(200),
contact varchar(20),
eventID int not null,
organizerID int not null,
primary key(vendorID),
foreign key(eventID) references events(eventID),
foreign key(organizerID) references organizers(organizerID)
);

create table expenses(
expenseID int not null auto_increment,
total_amount decimal(10,2),
payment_type enum('Checkbook', 'Cash', 'Card', 'Online Payment'),
eventID int not null,
primary key(expenseID),
foreign key(eventID) references events(eventID)
);

create table feedback(
feedbackID int not null auto_increment,
rating enum('0 Stars','1 Star', '2 Stars', '3 Stars', '4 Stars', '5 Stars'),
descrpition varchar(300),
eventID int not null,
attendeesID int not null,
customerID int not null,
primary key(feedbackID),
foreign key(eventID) references events(eventID),
foreign key(attendeesID) references attendees(attendeesID),
foreign key(customerID) references customer(customerID)
);

ALTER TABLE `feedback` ADD `date_time` TIMESTAMP NOT NULL AFTER `descripition`;

alter table events
add constraint fk_venues
foreign key(venueID) references venues(venueID);

alter table events
add constraint fk_customer
foreign key(customerID) references customer(customerID);

alter table events
add constraint fk_organizers
foreign key(organizerID) references organizers(organizerID);


alter table customer
add constraint fk_events
foreign key(eventID) references events(eventID);

alter table customer
add constraint fk_attendees
foreign key(attendeesID) references attendees(attendeesID);


alter table organizers
add constraint fk_sponsors
foreign key(sponsorID) references Sponsors(sponsorID);

alter table organizers
add constraint fk_vendors
foreign key(vendorID) references vendors(vendorID);