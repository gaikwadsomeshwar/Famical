DELIMITER $$

CREATE TRIGGER before_update_consult
BEFORE UPDATE
ON consults FOR EACH ROW
BEGIN

    IF new.prescriptions = '' THEN
        SET new.prescriptions = upper(old.prescriptions);
    ELSE
        SET new.prescriptions = upper(new.prescriptions);
    END IF;

    IF new.medtests = '' THEN
        SET new.medtests = upper(old.medtests);
    ELSE
        SET new.medtests = upper(new.medtests);
    END IF;

    IF new.diagnosis = '' THEN
        SET new.diagnosis = upper(old.diagnosis);
    ELSE
        SET new.diagnosis = upper(new.diagnosis);
    END IF;

END $$
