DELIMITER $$

CREATE TRIGGER before_update_doctor
BEFORE UPDATE
ON doctor FOR EACH ROW
BEGIN

    IF new.qualification = '' THEN
        SET new.qualification = upper(old.qualification);
    ELSE
        SET new.qualification = upper(new.qualification);
    END IF;             

    IF new.hospital = '' THEN
        SET new.hospital = upper(old.hospital);
    ELSE
        SET new.hospital = upper(new.hospital);
    END IF;
    
    IF new.department = '' THEN
        SET new.department = upper(old.department);
    ELSE
        SET new.department = upper(new.department);
    END IF;

END $$
