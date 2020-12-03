DELIMITER $$

CREATE TRIGGER before_update1
BEFORE UPDATE
ON personal_details FOR EACH ROW
BEGIN
                        
    IF new.email = '' THEN
        SET new.email = upper(old.email);
    ELSE
        SET new.email = upper(new.email);
    END IF;
    
    IF new.phno = 0 THEN 
		SET new.phno = old.phno;
	END IF;
    
	IF new.stname = '' THEN
		SET new.stname = upper(old.stname);
    ELSE
        SET new.stname = upper(new.stname);
    END IF;
    
    IF new.stno = 0 THEN 
		SET new.stno = old.stno;
	END IF;    
    
	IF new.city = '' THEN
		SET new.city = upper(old.city);
    ELSE
        SET new.city = upper(new.city);
    END IF;
    
	IF new.state = '' THEN
		SET new.state = upper(old.state);
    ELSE
        SET new.state = upper(new.state);
    END IF;    
    
    IF new.zipcode = 0 THEN 
		SET new.zipcode = old.zipcode;
	END IF; 

END $$
