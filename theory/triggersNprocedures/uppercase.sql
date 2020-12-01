delimiter //

CREATE TRIGGER uppercase1 BEFORE INSERT ON consults FOR EACH ROW
BEGIN
  SET NEW.pid = UPPER(NEW.pid);
  SET NEW.docid = UPPER(NEW.docid);
  SET NEW.prescriptions = UPPER(NEW.prescriptions);
  SET NEW.medtests = UPPER(NEW.medtests);
  SET NEW.diagnosis = UPPER(NEW.diagnosis);
END //

CREATE TRIGGER uppercase2 BEFORE INSERT ON doctor FOR EACH ROW
BEGIN
  SET NEW.userid = UPPER(NEW.userid);
  SET NEW.docid = UPPER(NEW.docid);
  SET NEW.qualification = UPPER(NEW.qualification);
  SET NEW.hospital = UPPER(NEW.hospital);
  SET NEW.department = UPPER(NEW.department);
END //


CREATE TRIGGER uppercase3 BEFORE INSERT ON patient FOR EACH ROW
BEGIN
  SET NEW.userid = UPPER(NEW.userid);
  SET NEW.bldgrp = UPPER(NEW.bldgrp);
  SET NEW.allergies = UPPER(NEW.allergies);
END //

CREATE TRIGGER uppercase4 BEFORE INSERT ON personal_details FOR EACH ROW
BEGIN
  SET NEW.userid = UPPER(NEW.userid);
  SET NEW.fname = UPPER(NEW.fname);
  SET NEW.lname = UPPER(NEW.lname);
  SET NEW.email = UPPER(NEW.email);
  SET NEW.stname = UPPER(NEW.stname);
  SET NEW.city = UPPER(NEW.city);
  SET NEW.state = UPPER(NEW.state);
  SET NEW.gender = UPPER(NEW.gender);
END //

CREATE TRIGGER uppercase5 BEFORE INSERT ON family FOR EACH ROW
BEGIN
  SET NEW.userid = UPPER(NEW.userid);
  SET NEW.memberid = UPPER(NEW.memberid);
  SET NEW.type= UPPER(NEW.type);
END //

delimiter ;
