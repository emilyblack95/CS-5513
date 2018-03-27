package CS5513;

//import all necessary libraries
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import oracle.jdbc.pool.OracleDataSource;
import java.sql.Statement;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;

/**
 * This class is in charge of communicating with the Oracle Database
 * to perform the queries to insert, find and delete.
 * @author Emily Black
 * @homework 2
 * @date 03/21/18
 * @source lectures
 */
public class DataHandler {
    String jdbcUrl = "jdbc:oracle:thin:@//oracle.cs.ou.edu:1521/pdborcl.cs.ou.edu";
    Connection conn;
    String userid = "username";
    String password = "password";
    Statement stmt;
    ResultSet rset;

    /**
     * This class gets the current DB connection.
     *
     * @throws SQLException
     */
    public void getDBConnection() throws SQLException {
        OracleDataSource ds;
        ds = new OracleDataSource();
        ds.setURL(jdbcUrl);
        conn = ds.getConnection(userid, password);
    }

    /** Authenticates user.
     *
     * @throws SQLException
     */
    public boolean authenticateUser(String jdbcUrl, String userid, String password, HttpSession session) throws SQLException {
        this.jdbcUrl = jdbcUrl;
        this.userid = userid;
        this.password = password;
        try {
            OracleDataSource ds = new OracleDataSource();
            ds.setURL(jdbcUrl);
            conn = ds.getConnection(userid, password); //connect to DB
            return true;
        } catch (SQLException ex) {
            System.out.println("Invalid user credentials");
            session.setAttribute("loginerrormsg", "Invalid Login. Try Again...");
            this.jdbcUrl = null;
            this.userid = null;
            this.password = null;
            return false;
        }
    }

    /**
     * Query 1 - Insert the complete information for a patient.
     *
     * @return Patient table
     * @throws SQLException, FileNotFoundException
     */
    public ResultSet queryOne(int pid, String p_name, String p_sex, String address, String d_day, String d_month, String d_year, String a_day, String a_month, String a_year, String[] contacts) throws SQLException, FileNotFoundException {
        // Connect to the database.
        getDBConnection();

        /**
         * Here we create a string with '?' placeholders.
         */
        String contactsStr = "contact_no(";

        for (int i = 0; i < contacts.length - 1; i++) {
            contactsStr += "?, ";
        }
        if (contacts.length > 0) {
            contactsStr += "?";
        }
        contactsStr += ")";
        String sqlInsertPatient =
            "INSERT INTO patient_tab VALUES(?, ?, ?, ?, stay_period_obj(date_discharged_obj(?, ?, ?), date_admitted_obj(?, ?, ?)), " +
            contactsStr + ")";

        try (PreparedStatement stmt = conn.prepareStatement(sqlInsertPatient);) {
            stmt.setInt(1, pid);
            stmt.setString(2, p_name);
            stmt.setString(3, p_sex);
            stmt.setString(4, address);
            stmt.setString(5, d_day);
            stmt.setString(6, d_month);
            stmt.setString(7, d_year);
            stmt.setString(8, a_day);
            stmt.setString(9, a_month);
            stmt.setString(10, a_year);

            // Now set the contacts
            for (int i = 0; i < contacts.length; i++) {
                stmt.setString(11 + i, contacts[i]);
            }

            // Run the query
            stmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Return patient table
        String sqlGetAllPatients =
            "SELECT P.pid, " +
            "P.p_name, " +
            "P.p_sex, " +
            "P.address, " +
            "P.stay_period.date_discharged.d_day, " +
            "P.stay_period.date_discharged.d_month, " +
            "P.stay_period.date_discharged.d_year, " +
            "P.stay_period.date_admitted.a_day, " +
            "P.stay_period.date_admitted.a_month, " +
            "P.stay_period.date_admitted.a_year, " +
            "P.contacts " +
            "FROM patient_tab P";

        // Prepare the SQL query.
        PreparedStatement stmt = conn.prepareStatement(sqlGetAllPatients);

        //execute the query and store the result in the ResultSet rset
        rset = stmt.executeQuery();
        return rset;
    }

    /**
     * Query 2 - Insert the complete information for a nurse.
     *
     * @return Nurse table
     * @throws SQLException, FileNotFoundException
     */
    public ResultSet queryTwo(int eid, int salary, String e_sex, String e_name, String e_contact_no, String street, String city, String state, int zipcode, int nurse_level) throws SQLException, FileNotFoundException {
        // Connect to the database.
        getDBConnection();

        // Elaborate a string with the content of the insertion query
        String sqlInsertNurse =
            "INSERT INTO nurse_tab VALUES(?, ?, ?, ?, ?, e_address_obj(?, ?, ?, ?), ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sqlInsertNurse);) {
            stmt.setInt(1, eid);
            stmt.setInt(2, salary);
            stmt.setString(3, e_sex);
            stmt.setString(4, e_name);
            stmt.setString(5, e_contact_no);
            stmt.setString(6, street);
            stmt.setString(7, city);
            stmt.setString(8, state);
            stmt.setInt(9, zipcode);
            stmt.setInt(10, nurse_level);

            // Run the query
            stmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Return nurse table
        String sqlGetAllNurses =
            "SELECT N.eid, " +
            "N.salary, " +
            "N.e_sex, " +
            "N.e_name, " +
            "N.e_contact_no, " +
            "N.e_address.street, " +
            "N.e_address.city, " +
            "N.e_address.state, " +
            "N.e_address.zipcode, " +
            "N.nurse_level " +
            "FROM nurse_tab N";

        // Prepare the SQL query.
        PreparedStatement stmt = conn.prepareStatement(sqlGetAllNurses);

        //execute the query and store the result in the ResultSet rset
        rset = stmt.executeQuery();
        return rset;
    }

    /**
     * Query 3 - Insert the complete information for a doctor and associate him/her with a patient.
     *
     * @return Doctor table
     * @throws SQLException, FileNotFoundException
     */
    public ResultSet queryThree(int eid, int salary, String e_sex, String e_name, String e_contact_no, String street, String city, String state, int zipcode, String specialization, int pid) throws SQLException, FileNotFoundException {
        // Connect to the database.
        getDBConnection();

        // Elaborate a string with the content of the insertion query.
        // Doctor table
        String sqlInsertDoctor =
            "INSERT INTO doctor_tab VALUES(?, ?, ?, ?, ?, e_address_obj(?, ?, ?, ?), ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sqlInsertDoctor);) {
            stmt.setInt(1, eid);
            stmt.setInt(2, salary);
            stmt.setString(3, e_sex);
            stmt.setString(4, e_name);
            stmt.setString(5, e_contact_no);
            stmt.setString(6, street);
            stmt.setString(7, city);
            stmt.setString(8, state);
            stmt.setInt(9, zipcode);
            stmt.setString(10, specialization);

            // Run the query
            stmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Cares table
        String sqlInsertCares =
            "INSERT INTO cares_tab (SELECT cares_obj (REF(P), REF(D)) " +
            "FROM patient_tab P, doctor_tab D " +
            "WHERE P.pid = ? AND D.eid = ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sqlInsertCares);) {
            stmt.setInt(1, pid);
            stmt.setInt(2, eid);

            // Run the query
            stmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Return doctor table
        String sqlGetAllDoctors =
            "SELECT D.eid, " +
            "D.salary, " +
            "D.e_sex, " +
            "D.e_name, " +
            "D.e_contact_no, " +
            "D.e_address.street, " +
            "D.e_address.city, " +
            "D.e_address.state, " +
            "D.e_address.zipcode, " +
            "D.specialization " +
            "FROM doctor_tab D";

        // Prepare the SQL query.
        PreparedStatement stmt = conn.prepareStatement(sqlGetAllDoctors);

        //execute the query and store the result in the ResultSet rset
        rset = stmt.executeQuery();
        return rset;
    }

    /**
     * Query 4 - Insert the complete information for a room and associate it with a patient and a nurse.
     *
     * @return Room table
     * @throws SQLException, FileNotFoundException
     */
    public ResultSet queryFour(int room_id, String room_type, int pid, int eid) throws SQLException, FileNotFoundException {
        // Connect to the database.
        getDBConnection();

        // Elaborate a string with the content of the insertion query.
        // Room table
        String sqlInsertRoom =
            "INSERT INTO room_tab VALUES(?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sqlInsertRoom);) {
            stmt.setInt(1, room_id);
            stmt.setString(2, room_type);

            // Run the query
            stmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Assigned table
        String sqlInsertAssigned =
            "INSERT INTO assigned_tab (SELECT assigned_obj (REF(R), REF(P)) " +
            "FROM room_tab R, patient_tab P " +
            "WHERE R.room_id = ? AND P.pid = ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sqlInsertAssigned);) {
            stmt.setInt(1, room_id);
            stmt.setInt(2, pid);

            // Run the query
            stmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Attends_to table
        String sqlInsertAttendsTo =
            "INSERT INTO attends_to_tab (SELECT attends_to_obj (REF(N), REF(R)) " +
            "FROM nurse_tab N, room_tab R " +
            "WHERE N.eid = ? AND R.room_id = ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sqlInsertAttendsTo);) {
            stmt.setInt(1, eid);
            stmt.setInt(2, room_id);

            // Run the query
            stmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Return room table
        String sqlGetAllRooms =
            "SELECT R.room_id, " +
            "R.room_type " +
            "FROM room_tab R";

        // Prepare the SQL query.
        PreparedStatement stmt = conn.prepareStatement(sqlGetAllRooms);

        //execute the query and store the result in the ResultSet rset
        rset = stmt.executeQuery();
        return rset;
    }

    /**
     * Query 5 - Insert the complete information for a medicine and associate it with a patient.
     *
     * @return Medicine table
     * @throws SQLException, FileNotFoundException
     */
    public ResultSet queryFive(int code, String medicine_name, int pid, String quantity) throws SQLException, FileNotFoundException {
        // Connect to the database.
        getDBConnection();

        // Elaborate a string with the content of the insertion query.
        // Medicine table
        String sqlInsertMedicine =
            "INSERT INTO medicine_tab VALUES(?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sqlInsertMedicine);) {
            stmt.setInt(1, code);
            stmt.setString(2, medicine_name);

            // Run the query
            stmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Is_given table
        String sqlInsertIsGiven =
            "INSERT INTO is_given_tab (SELECT is_given_obj (REF(P), REF(M), ?) " +
            "FROM patient_tab P, medicine_tab M " +
            "WHERE P.pid = ? AND M.code = ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sqlInsertIsGiven);) {
            stmt.setString(1, quantity);
            stmt.setInt(2, pid);
            stmt.setInt(3, code);

            // Run the query
            stmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Return medicine table
        String sqlGetAllMedicines =
            "SELECT T.code, " +
            "T.medicine_name " +
            "FROM medicine_tab T";

        // Prepare the SQL query.
        PreparedStatement stmt = conn.prepareStatement(sqlGetAllMedicines);

        //execute the query and store the result in the ResultSet rset
        rset = stmt.executeQuery();
        return rset;
    }

    /**
     * Query 6 - Find the complete information for all the patients who were in the hospital during a particular month of a particular year (e.g. during July of 2017).
     *
     * @return Patient table
     * @throws SQLException, FileNotFoundException
     */
    public ResultSet querySix(int month, int year) throws SQLException, FileNotFoundException {
        // Connect to the database.
        getDBConnection();
        String sqlFindPatients;

        // Query for all patients if inputs are null
        if (month == -1 && year == -1) {
            sqlFindPatients =
                "SELECT P.pid, " +
                "P.p_name, " +
                "P.p_sex, " +
                "P.address, " +
                "P.stay_period.date_discharged.d_day, " +
                "P.stay_period.date_discharged.d_month, " +
                "P.stay_period.date_discharged.d_year, " +
                "P.stay_period.date_admitted.a_day, " +
                "P.stay_period.date_admitted.a_month, " +
                "P.stay_period.date_admitted.a_year, " +
                "P.contacts " +
                "FROM patient_tab P";

            // Prepare the SQL query.
            PreparedStatement stmt = conn.prepareStatement(sqlFindPatients);

            //execute the query and store the result in the ResultSet rset
            rset = stmt.executeQuery();
            return rset;

        } else {
            sqlFindPatients =
                "SELECT P.pid, " +
                "P.p_name, " +
                "P.p_sex, " +
                "P.address, " +
                "P.stay_period.date_discharged.d_day, " +
                "P.stay_period.date_discharged.d_month, " +
                "P.stay_period.date_discharged.d_year, " +
                "P.stay_period.date_admitted.a_day, " +
                "P.stay_period.date_admitted.a_month, " +
                "P.stay_period.date_admitted.a_year, " +
                "P.contacts " +
                "FROM patient_tab P " +
                "WHERE ((? BETWEEN P.stay_period.date_admitted.a_month AND P.stay_period.date_discharged.d_month) OR NOT (? BETWEEN P.stay_period.date_admitted.a_month AND P.stay_period.date_discharged.d_month)) " +
                "AND (? BETWEEN P.stay_period.date_admitted.a_year AND P.stay_period.date_discharged.d_year)";

            // Prepare the SQL query.
            PreparedStatement stmt = conn.prepareStatement(sqlFindPatients);
            stmt.setInt(1, month);
            stmt.setInt(2, month);
            stmt.setInt(3, year);

            //execute the query and store the result in the ResultSet rset
            rset = stmt.executeQuery();
            return rset;

        }
    }

    /**
     * Query 7 - Find the complete information for all the doctors who care for more than two patients.
     *
     * For this one, to make the web page more dynamic to use, we let the user custom enter a number.
     * The suggested/hinted number defaults to 2 though, because the homework description says 2.
     *
     * @throws SQLException, FileNotFoundException
     */
    public ResultSet querySeven(int numOfPatients) throws SQLException, FileNotFoundException {
        // Connect to the database.
        getDBConnection();
        String sqlFindDoctors;

        // Query for all doctors if inputs are null
        if (numOfPatients == -1) {
            sqlFindDoctors =
                "SELECT D.eid, " +
                "D.salary, " +
                "D.e_sex, " +
                "D.e_name, " +
                "D.e_contact_no, " +
                "D.e_address.street, " +
                "D.e_address.city, " +
                "D.e_address.state, " +
                "D.e_address.zipcode, " +
                "D.specialization " +
                "FROM doctor_tab D";

            // Prepare the SQL query.
            PreparedStatement stmt = conn.prepareStatement(sqlFindDoctors);

            // Run the query
            rset = stmt.executeQuery();
            return rset;
        } else {
            sqlFindDoctors = "SELECT D.eid, D.salary, D.e_sex, D.e_name, D.e_contact_no, D.e_address.street, D.e_address.city, D.e_address.state, D.e_address.zipcode, D.specialization " +
                "FROM doctor_tab D " +
                "WHERE (SELECT COUNT((T1.pid).pid) FROM cares_tab T1 WHERE ((T1.eid).eid) = D.eid) > ?";
            // Prepare the SQL query.
            PreparedStatement stmt = conn.prepareStatement(sqlFindDoctors);
            stmt.setInt(1, numOfPatients);

            // Run the query
            rset = stmt.executeQuery();
            return rset;
        }
    }

    /**
     * Query 8 - Find the complete information for all the nurses who tend to patients that are given a certain medicine (e.g. medicine code: 123).
     *
     * @throws SQLException, FileNotFoundException
     */
    public ResultSet queryEight(int code) throws SQLException, FileNotFoundException {
        // Connect to the database.
        getDBConnection();
        String sqlFindNurses = "SELECT N1.eid, N1.salary, N1.e_sex, N1.e_name, N1.e_contact_no, N1.e_address.street, N1.e_address.city, N1.e_address.state, N1.e_address.zipcode, N1.nurse_level " +
            "FROM nurse_tab N1 " +
            "WHERE N1.eid IN (SELECT (T1.eid).eid FROM attends_to_tab T1 WHERE (T1.eid).eid = N1.eid " +
            "AND (T1.room_id).room_id IN (SELECT (T2.room_id).room_id FROM assigned_tab T2 WHERE (T2.room_id).room_id = (T1.room_id).room_id " +
            "AND (T2.pid).pid IN (SELECT (T3.pid).pid FROM is_given_tab T3 WHERE (T3.pid).pid = (T2.pid).pid AND (T3.code).code = ?)))";

        // Prepare the SQL query.
        PreparedStatement stmt = conn.prepareStatement(sqlFindNurses);
        stmt.setLong(1, code);

        // Run the query
        rset = stmt.executeQuery();
        return rset;
    }

    /**
     * Query 9 - Delete all the patients who were discharged before a particular year.
     *
     * @return Patient table
     * @throws SQLException, FileNotFoundException
     */
    public ResultSet queryNine(int year) throws SQLException, FileNotFoundException {
        // Connect to the database.
        getDBConnection();

        // Elaborate a string with the content of the insertion query
        String sqlDeletePatientsYear =
            "DELETE FROM patient_tab P " +
            "WHERE P.stay_period.date_discharged.d_year < ?";
        try (PreparedStatement stmt = conn.prepareStatement(sqlDeletePatientsYear);) {
            stmt.setInt(1, year);

            // Run the query
            stmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Return patient table
        String sqlGetAllPatients =
            "SELECT P.pid, " +
            "P.p_name, " +
            "P.p_sex, " +
            "P.address, " +
            "P.stay_period.date_discharged.d_day, " +
            "P.stay_period.date_discharged.d_month, " +
            "P.stay_period.date_discharged.d_year, " +
            "P.stay_period.date_admitted.a_day, " +
            "P.stay_period.date_admitted.a_month, " +
            "P.stay_period.date_admitted.a_year, " +
            "P.contacts " +
            "FROM patient_tab P";

        // Prepare the SQL query.
        PreparedStatement stmt = conn.prepareStatement(sqlGetAllPatients);

        //execute the query and store the result in the ResultSet rset
        rset = stmt.executeQuery();
        return rset;
    }

    /**
     * Query 10 - Delete all the patients who have not been assigned a room.
     *
     * @return Patient table
     * @throws SQLException, FileNotFoundException
     */
    public ResultSet queryTen() throws SQLException, FileNotFoundException {
        // Connect to the database.
        getDBConnection();

        // Elaborate a string with the content of the insertion query
        String sqlDeletePatientsNoRoom =
            "DELETE FROM patient_tab P " +
            "WHERE P.pid NOT IN (SELECT (T1.pid).pid FROM assigned_tab T1)";
        try (PreparedStatement stmt = conn.prepareStatement(sqlDeletePatientsNoRoom);) {
            // Run the query
            stmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Return patient table
        String sqlGetAllPatients =
            "SELECT P.pid, " +
            "P.p_name, " +
            "P.p_sex, " +
            "P.address, " +
            "P.stay_period.date_discharged.d_day, " +
            "P.stay_period.date_discharged.d_month, " +
            "P.stay_period.date_discharged.d_year, " +
            "P.stay_period.date_admitted.a_day, " +
            "P.stay_period.date_admitted.a_month, " +
            "P.stay_period.date_admitted.a_year, " +
            "P.contacts " +
            "FROM patient_tab P";

        // Prepare the SQL query.
        PreparedStatement stmt = conn.prepareStatement(sqlGetAllPatients);

        //execute the query and store the result in the ResultSet rset
        rset = stmt.executeQuery();
        return rset;
    }

}