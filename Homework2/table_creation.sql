CREATE TABLE patient_tab OF patient_obj
(pid PRIMARY KEY)
object id PRIMARY KEY;

CREATE TABLE nurse_tab OF nurse_obj;

CREATE TABLE doctor_tab OF doctor_obj;

CREATE TABLE medicine_tab OF medicine_obj
(code PRIMARY KEY)
object id PRIMARY KEY;

CREATE TABLE employee_tab OF employee_obj
(eid PRIMARY KEY)
object id PRIMARY KEY;

CREATE TABLE room_tab OF room_obj
(room_id PRIMARY KEY)
object id PRIMARY KEY;

CREATE TABLE attends_to_tab OF attends_to_obj
(FOREIGN KEY (room_id)
REFERENCES room_tab ON DELETE CASCADE,
FOREIGN KEY (eid)
REFERENCES nurse_tab ON DELETE CASCADE);

CREATE TABLE is_given_tab OF is_given_obj
(FOREIGN KEY (pid)
REFERENCES patient_tab ON DELETE CASCADE,
FOREIGN KEY (code)
REFERENCES medicine_tab ON DELETE CASCADE); 

CREATE TABLE assigned_tab OF assigned_obj
(FOREIGN KEY (room_id)
REFERENCES room_tab ON DELETE CASCADE,
FOREIGN KEY (pid)
REFERENCES patient_tab ON DELETE CASCADE);

CREATE TABLE cares_tab OF cares_obj
(FOREIGN KEY (pid)
REFERENCES patient_tab ON DELETE CASCADE,
FOREIGN KEY (eid)
REFERENCES doctor_tab ON DELETE CASCADE);