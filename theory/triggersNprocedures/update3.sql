DELIMITER $$

CREATE TRIGGER before_update_patient
BEFORE UPDATE
ON patient FOR EACH ROW
BEGIN

    IF new.weight = 0 THEN
        SET new.weight = old.weight;
    END IF;

    IF new.height = 0 THEN
        SET new.height = old.height;
    END IF;

    IF new.bp = 0 THEN
        SET new.bp = old.bp;
    END IF;

    IF new.allergies = '' THEN
        SET new.allergies = upper(old.allergies);
    ELSE
        SET new.allergies = upper(old.allergies+", "+new.allergies);
    END IF;

END $$
