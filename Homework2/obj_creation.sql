CREATE TYPE date_discharged_obj AS object( d_day number(2), d_month number(2),
d_year number(4) );
/
CREATE TYPE date_admitted_obj AS object( a_day number(2), a_month number(2),
a_year number(4) );
/
CREATE TYPE contact_no AS varray(3) OF varchar2(15);
/
CREATE TYPE stay_period_obj AS object( date_discharged date_discharged_obj,
date_admitted date_admitted_obj ) NOT FINAL;
/
CREATE TYPE patient_obj AS object( pid number(6), p_name varchar2(15), p_sex
varchar2(1), address varchar2(30), stay_period stay_period_obj, contacts
contact_no ) NOT FINAL;
/
CREATE TYPE e_address_obj AS object( street varchar2(30), city varchar2(15),
state varchar2(15), zipcode number(5) );
/
CREATE TYPE employee_obj AS object( eid number(6), salary number(10), e_sex
varchar2(1), e_name varchar2(30), e_contact_no varchar2(15), e_address
e_address_obj ) NOT FINAL;
/
CREATE TYPE nurse_obj under employee_obj( nurse_level number(6) );
/
CREATE TYPE doctor_obj under employee_obj( specialization varchar2(30) );
/
CREATE TYPE cares_obj AS object( pid ref patient_obj, eid ref doctor_obj );
/
CREATE TYPE room_obj AS object( room_id number(6), room_type varchar2(15) ) NOT
FINAL;
/
CREATE TYPE medicine_obj AS object( code number(15), medicine_name varchar2(15) ) NOT
FINAL;
/
CREATE TYPE is_given_obj AS object( pid ref patient_obj, code ref medicine_obj,
quantity varchar2(15) );
/
CREATE TYPE attends_to_obj AS object( eid ref nurse_obj, room_id ref room_obj );
/
CREATE TYPE assigned_obj AS object( room_id ref room_obj, pid ref patient_obj );  