# 5.4 Επικοινωνία με Βάσεις Δεδομένων {#Java} 
© Γιάννης Κωστάρας

---
[<-](../5.3-NIO/README.md)  | [Δ](../../README.md) | [->](../5.5-XML/README.md) 
---

Στα προηγούμενα μαθήματα είδαμε πώς μπορούμε ν' αποθηκεύουμε μόνιμα τα δεδομένα μας σε συστήματα αρχείων. Σ' αυτό το μάθημα θα μάθουμε πώς ν' αποθηκεύουμε τα δεδομένα μας σε βάσεις δεδομένων.

## Κατηγορίες Βάσεων Δεδομένων
Υπάρχουν διάφορες κατηγορίες βάσεων δεδομένων:

* Σχεσιακές Βάσεις Δεδομένων
* Αντικειμενοστραφής Βάσεις Δεδομένων
* XML Βάσεις Δεδομένων
* NoSQL Βάσεις Δεδομένων

### Σχεσιακές Βάσεις Δεδομένων
Το πιο παραδοσιακό μοντέλο είναι οι σχεσιακές βάσεις δεδομένων (Σχεσιακά Συστήματα Διαχείρισης Βάσεων Δεδομένων - ΣΣΔΒΔ ή Relational Database Management Systems - RDBMS). Σ' αυτές, τα δεδομένα αποθηκεύονται σε πίνακες οι οποίοι σχετίζονται μεταξύ τους. Η επικοινωνία μ' αυτές γίνεται με τη 4ης γενιάς γλώσσα _Structured Query Language (SQL)_. Οι εντολές της SQL χωρίζονται στις εξής δυο κατηγορίες:

* Γλώσσα Ορισμού Δεδομένων (Data Definition Language - DDL): ```CREATE (DROP) TABLE/VIEW/INDEX, ALTER TABLE```
* Γλώσσα Διαχείρισης Δεδομένων (Data Manipulation Language - DML): ```SELECT, INSERT, UPDATE, DELETE```

Τα πιο δημοφιλή ΣΣΔΒΔ είναι τα ακόλουθα:

* [Apache Derby](https://db.apache.org/derby/)
* [HSQLDB](http://hsqldb.org/)
* [IBM DB2](https://www.ibm.com/analytics/db2/)
* [MS Access](http://office.microsoft.com/access)
* [MS SQL Server](https://www.microsoft.com/en-us/sql-server)
* [MySQL](https://www.mysql.com/)
* [Oracle](http://oracle.com/database)
* [Postgresql](https://postgresql.org/)
* [SQLite](sqlite.org)


Η Java μπορεί να επικοινωνήσει με ΣΣΔΒΔ για να επεξεργαστεί δεδομένα που είναι αποθηκευμένα σ' αυτά, χάρις στο _Java Database Connectivity Bridge (JDBC)_ (τελευταία έκδοση [4.3](https://jcp.org/aboutJava/communityprocess/mrel/jsr221/index3.html)). Η ιδέα πίσω από το JDBC είναι ότι κάθε κατασκευαστής προσφέρει τον οδηγό του (driver) που υλοποιεί το JDBC.

### Επικοινωνία με Σχεσιακές ΒΔ

Στα παρακάτω θα χρησιμοποιήσουμε την SQLite ως ΣΔΒΔ και θα δημιουργήσουμε το σχήμα (schema) της ακόλουθης ΒΔ η οποία αποτελείται από έναν πίνακα ```Users```:

![](assets/Fig1.png)

**Εικόνα 1** _Πίνακας Users_

Κατεβάστε τα:

* [SQLiteBrowser](https://sqlitebrowser.org/)
* [SQLite JDBC Driver](https://bitbucket.org/xerial/sqlite-jdbc/downloads/) 

Με τον SQLiteBrowser δημιουργήστε μια νέα ΒΔ με όνομα ```UserDB.sqlite3``` και τον πίνακα ```Users``` όπως φαίνεται στην ακόλουθη εικόνα:

![](assets/Fig2.png)

**Εικόνα 2** _Δημιουργία πίνακα Users με τον SQLiteBrowser_

Συγχαρητήρια! Μόλις δημιουργήσατε μια SQLite3 ΒΔ. Μπορείτε να εισάγετε κάποι

Ας δούμε τώρα πώς μπορούμε να δημιουργήσουμε την ίδια ΒΔ με το NetBeans και πώς μπορούμε να επικοινωνήσουμε μ' αυτή.

1. Κάντε κλικ στο μενού **Window --> Services** για να εμφανίσετε το παράθυρο _Services_
1. Εμφανίστε τον κόμβο _Databases_ και κάντε δεξί κλικ στον κόμβο _Drivers_ και επιλέξτε **New Driver**
1. Στο διαλογικό παράθυρο _New JDBC Driver_ που εμφανίζεται, πατήστε το κουμπί **Add...** και επιλέξτε το αρχείο ```sqlite-jdbc-3.xx.xx.jar``` που κατεβάσατε. Ως όνομα δώστε ```SQLite3```
1. Κάντε δεξί κλικ στον κόμβο _Databases_ και επιλέξτε **New Connection**. Στο διαλογικό παράθυρο που εμφανίζεται, επιλέξτε τον οδηγό _SQLite3_ που δημιουργήσατε στο προηγούμενο βήμα και πατήστε **Next**. 
1. Προαιρετικά δώστε ένα _User Name_ και _Password_ για να συνδεθείτε στη ΒΔ, και ως _JDBC URL_ δώστε τη διαδρομή που θέλετε ν' αποθηκεύσετε τη ΒΔ (ή τη διαδρομή της ΒΔ που δημιουργήσαμε προηγούμενα): ```jdbc:sqlite:<path>/UserDB.sqlite3```
1. Πατήστε **Finish**

Το NetBeans δημιούργησε μια νέα σύνδεση (Connection) στη ΒΔ που δημιουργήσατε που περιέχει 3 κόμβους: _Tables, Views, Procedures_. Μπορείτε να δημιουργήσετε πίνακες, να δείτε τα δεδομένα τους κλπ.	

![](assets/Fig3.png)

**Εικόνα 3** _Πίνακας Users στο NetBeans_

Στη συνέχεια θα δημιουργήσουμε ένα πρόγραμμα Java για να επικοινωνήσουμε με τη ΒΔ ```UserDB.sqlite3```.

1. Στο NetBeans, δημιουργήστε ένα νέο έργο Java Application και δώστε ένα όνομα στην εφαρμογή, π.χ. ```UserDBApp```
1. Επιλέξτε τα _Use Dedicated Folder for Storing Libraries_ και _Create Main Class_, αφήστε τα προτεινόμενα ονόματα και πατήστε το **Finish**
1. Δεξί κλικ στο _Libraries_ και **Add JAR/Folder**. Επιλέξτε το ```sqlite-jdbc-3.xx.xx.jar``` και **Copy to Libraries Folder** και στη συνέχεια το κουμπί **Choose**
1. Στη ```main()``` μέθοδο της κλάσης εισάγετε τον εξής κώδικα:

```java
import java.sql.*;

public class UserDBApp {
    private static final String URL = "jdbc:sqlite:<path_to>/UserDB.sqlite3";
    private static final String DB_ADMIN_USERNAME = "admin";
    private static final String DB_ADMIN_PASSWORD = "admin";	
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Connection dbConnection = getConnection();
    }

    /**
     * @return connection to database
     */
    public static Connection getConnection() {
        Connection connection = null;
        try {
            // create a connection to the database
            connection = DriverManager.getConnection(URL, DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return connection;
    }
}
```
Η μέθοδος ```getConnection()``` δημιουργεί μια σύνδεση (```Connection```) με τη ΒΔ που ορίζεται με το ```URL```. Το όνομα χρήστη και ο κωδικός του διαχειριστή της ΒΔ δεν απαιτούνται από την SQLite, αλλά απαιτούνται από άλλες ΒΔ όπως π.χ. MySQL κλπ.

Ας δούμε πώς μπορούμε να διαβάσουμε τα περιεχόμενα του πίνακα ```Users```:

```java
//...
	private static final String SQL_SELECT_ALL = "SELECT username, password FROM users ORDER BY username";

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Connection dbConnection = getConnection();
        selectAll(dbConnection);
    }
	
    /**
     * Select all rows in the {@code Users} table
     * @param dbConnection database connection
     */
    public static void selectAll(Connection dbConnection) {
        try (Statement stmt = dbConnection.createStatement();
             ResultSet rs = stmt.executeQuery(SQL_SELECT_ALL)) {

            // loop through the result set
            while (rs.next()) {
                System.out.println(rs.getString("username") + "\t"
                        + rs.getString("password"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }	
//...	
```
Η μέθοδος ```selectAll()``` δημιουργεί μια νέα εντολή (```Statement```) με την οποία εκτελεί ένα ερώτημα SQL στη ΒΔ με τη μέθοδο ```executeQuery```. Το αποτέλεσμα αποθηκεύεται σ' ένα αντικείμενο τύπου ```ResultSet```. Στη συνέχεια ανακτούμε ένα ένα τα αποθηκευμένα δεδομένα στην ```ResultSet``` και τα εμφανίζουμε στην οθόνη. Η ```ResultSet``` μοιάζει με έναν ```Iterator``` αλλά διαφέρει αρκετά απ' αυτόν. Π.χ. δεν υπάρχει μέθοδος ```hasNext()```, η ```next()``` δείχνει αρχικά πριν από την πρώτη εγγραφή, και πρέπει να την καλέσετε τουλάχιστο μια φορά ώστε να μετακινηθεί στην πρώτη εγγραφή, εκτός κι αν δεν υπάρχει καμία εγγραφή οπότε επιστρέφει ```false```.

Η ```executeQuery()``` παράγει μια εντολή SQL ```SELECT```. Για αλλαγή των δεδομένων (εντολές SQL ```INSERT, UPDATE, DELETE, CREATE, DROP, ALTER```), χρησιμοποιήστε την ```executeUpdate()```. 

Ανάλογα με τον τύπο των δεδομένων, υπάρχουν διάφορες μέθοδοι ανάκτησης αυτών π.χ. ```getString(), getDouble()``` κλπ. Προσέξτε ότι υπάρχει η ```getDate()``` η οποία επιστρέφει ```java.sql.Date``` (κι όχι ```java.util.Date```), η ```getTime()``` η οποία επιστρέφει ```java.sql.Time``` και η ```getTimeStamp()``` η οποία επιστρέφει ```java.sql.TimeStamp```. Θα πρέπει να τις μετατρέψετε στις αντίστοιχες κλάσεις ημερομηνίας και ώρας για να τις χρησιμοποιήσετε στο Java πρόγραμμά σας.

Επίσης, χρησιμοποιήσαμε την try-with-resources για να κλείσουμε αυτόματα τη σύνδεση με την ΒΔ, διαφορετικά θα 'πρεπε να έχουμε μια ακόμα μέθοδο:

```java
    /**
     * Close connection
     *
     * @param connection to close
     */
    public static void closeConnection(Connection connection) {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
```  

Ας δούμε ένα ακόμα παράδειγμα. Η παρακάτω μέθοδος ```isValid()``` ελέγχει αν ένας χρήστης είναι έγκυρος για σύνδεση στην εφαρομγή ή όχι:

```java
    /**
     * @param username username
     * @param pwd password
     * @return {@code true} if the user credentials are valid 
     */
    public static boolean isValid(String username, String pwd) {
        if (username == null || username.isBlank() || pwd == null || pwd.isBlank()) {
            return false;
        }
        final String sqlString
                = "SELECT * FROM users WHERE username = '" + username
                + "' AND password = '" + pwd + "'";
        try (Connection dbConnection = getConnection();
                Statement stmt = dbConnection.createStatement();
                ResultSet rs = stmt.executeQuery(sqlString)) {
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
```
Με τον ίδιο τρόπο όπως και πριν, η ```executeQuery()``` καλεί την κατάλληλη εντολή SQL. Αν αυτή επιστρέψει κάποιο αποτέλεσμα, αυτό σημαίνει ότι υπάρχει κάποια εγγραφή στον πίνακα και άρα η μέθοδος επιστρέφει ```true``` διαφορετικά ```false```.  Έτσι, π.χ. η παρακάτω εντολή επιστρέφει ```Username: user, Password: user is valid? true``` (ή ```false```) αν ο χρήστης ```user``` με κωδικό ```user``` υπάρχει στον πίνακα ```Users```.

```java
System.out.println("Username: user, Password: user is valid? " + isValid("user", "user"));
```

Ένας χρήστης όμως δίνει τα εξής διαπιστευτήρια:

```
Username: user' OR '1'='1
Password: any
```
τα οποία μεταφράζονται:

```java
System.out.println("Username: user' OR '1'='1, Password: any is valid? " + isValid("user' OR '1'='1", "any"));
```

και λαμβάνει το αποτέλεσμα: ```Username: user' OR '1'='1, Password: any is valid? true```!

Πώς τα καταφέρνει; Ας δούμε πώς διαμορφώνεται το τελικό ```sqlString``` με αυτές τις παραμέτρους:

```sql
SELECT * FROM users WHERE username = 'user' OR '1'='1' AND password = 'any';
```
Με αυτόν τον τρόπο, όπως καταλαβαίνετε, καταφέρνει να περάσει μια συνθήκη η οποία είναι πάντα αληθής (```'1'='1'```) και να ξεγελάσει το πρόγραμμά μας ώστε να παρακάμψει τον έλεγχο και να συνδεθεί στην εφαρμογή μας χωρίς εξουσιοδότηση. Αυτού του είδους η 'επίθεση' λέγεται _SQL Injection_ και είναι πολύ συνήθης.

Ευτυχώς, υπάρχει λύση. Χρησιμοποιείτε **πάντα** ```PreparedStatement``` αντί για ```Statement```:

```java
    /**
     * @param username username
     * @param pwd password
     * @return {@code true} if the user credentials are valid
     */
    public static boolean isValid2(String username, String pwd) {
        if (username == null || username.isBlank() || pwd == null || pwd.isBlank()) {
            return false;
        }
        final String sqlString
                = "SELECT * FROM users WHERE username = ? AND password = ?";
        try (Connection dbConnection = getConnection();
                PreparedStatement stmt = dbConnection.prepareStatement(sqlString)) {
            stmt.setString(1, username);
            stmt.setString(2, pwd);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
```
Προσέξτε ότι στις ΒΔ η πρώτη εγγραφή είναι η ```1``` (κι όχι η ```0``` όπως στις συστοιχίες ή στις συλλογές της Java). 

Πλέον το SQL Injection δεν έχει καμία πιθανότητα:

```java
System.out.println("Username: user' OR '1'='1, Password: any is valid? " + isValid2("user' OR '1'='1", "any"));

Username: user' OR '1'='1, Password: any is valid? false
```
Φυσικά, δεν είναι καθόλου καλή τεχνική να αποθηκεύουμε τα διαπιστευτήρια χρηστών ή του διαχειριστή της ΒΔ μέσα στον κώδικά μας καθώς είναι πολύ εύκολο για κάποιον τρίτο να τα βρει:

```java
connection = DriverManager.getConnection(URL, DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);
```
Το σωστό είναι να τ' αποθηκεύσουμε σε κάποιο αρχείο στο οποίο περιορίζουμε την πρόσβαση σε τρίτους ή να τα ζητάμε από τον χρήστη κατά την εκτέλεση του προγράμματος. (Γενικά είναι καλή τεχνική ν' αποθηκεύουμε όλα τα δεδομένα που απαιτούνται για τη σύνδεση σε μια ΒΔ σ' ένα αρχείο ```.properties``` και να τα διαβάζουμε από κει, ώστε αν μελλοντικά αλλάξουμε ΣΔΒΔ να μη χρειάζεται να επαναμεταγλωττίσουμε το πρόγραμμά μας).

Επίσης, είναι πολύ κακή τεχνική να αποθηκεύουμε τους κωδικούς ως έχει στη ΒΔ. Όποιος αποκτήσει πρόσβαση στη ΒΔ θα μπορεί να διαβάσει τους κωδικούς των χρηστών της εφαρμογής. Μια συνήθης τεχνική είναι αντί για τους ίδιους τους κωδικούς ν' αποθηκεύονται τα hash codes αυτών. Μ' αυτόν τον τρόπο αρκεί να συγκρίνουμε αν το hashCode που περνά ο χρήστης ως διαπιστευτήριο είναι ίδιο με το hashCode που είναι αποθηκευμένο στη ΒΔ. 

```java
//...
String hashPassword(char[] password) {
// δημιουργία hash
}
//...
public static boolean isValid2(String username, String pwd) {
//...
String pwdHash = hashPassword(pwd);
//...
stmt.setString(2, pwdHash);
}
```
Μπορείτε ακόμα να αποθηκεύσετε τα αποτελέσματα σε μια προσωρινή μνήμη (cache) ώστε να είναι διαθέσιμα και αφού κλείσει η σύνδεση με τη ΒΔ, με τη βοήθεια των rowsets 

```java
import javax.sql.rowset.*;
//...
    public static void selectAllCached(Connection dbConnection) {
        try {
            RowSetFactory rsFactory = RowSetProvider.newFactory();
            try (CachedRowSet crs = rsFactory.createCachedRowSet()) {
                try (Statement stmt = dbConnection.createStatement();
                        ResultSet rs = stmt.executeQuery(SQL_SELECT_ALL)) {
                    crs.populate(rs);
                    // loop through the result set
                } catch (SQLException e) {
                    System.out.println(e.getMessage());
                } finally {
                    dbConnection.close();
                }
                while (crs.next()) {
                    System.out.println(crs.getString("username") + "\t"
                            + crs.getString("password"));
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDBApp.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBApp.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
```

Η 

```java
 try (Statement stmt = dbConnection.createStatement();
         ResultSet rs = stmt.executeQuery(SQL_SELECT_ALL)) {
     crs.populate(rs);
     // loop through the result set
 } catch (SQLException e) {
     System.out.println(e.getMessage());
 } finally {
     dbConnection.close();
 }
```
κλείνει τη σύνδεση με τη ΒΔ (αν και η ```finally``` δεν είναι απαραίτητη καθώς χρησιμοποιούμε try-with-resources).

Με τη βοήθεια των ```RowSetFactory``` και ```CachedRowSet``` βλέπουμε ότι μπορούμε ν' ανακτήσουμε δεδομένα χωρίς να είμαστε συνδεδεμένοι με τη ΒΔ. Υπάρχουν επίσης οι ```WebRowSet, FilteredRowSet, JoinRowSet``` και ```JdbcRowSet```.

Μπορείτε επίσης να ορίσετε τη μέθοδο ```crs.setPageSize(20)``` για να λάβετε π.χ. μόνο 20 αποτελέσματα (στην περίπτωση που σας επιστρέφονται πολλά αποτελέσματα). Για να μεταβείτε στην επόμενη σελ. αποτελεσμάτων, ```crs.nextPage()```, ενώ αν τροποποιήσατε τα δεδομένα, θα πρέπει να καλέσετε την ```crs.acceptChanges()``` για να ενημερώσετε τη ΒΔ.

Τέλος, αν θέλετε να μάθετε περισσότερα για τη δομή (σχήμα) της ΒΔ σας, χρησιμοποιήστε την 

```java
DatabaseMetaData metadata = dbConnection.getMetaData()
metadata.getTables(null, null, null, new String[]{"TABLE"}); // (String catalog, String Schema, String tableNamepattern, string type)
ResultSetMetaData metadata = rs.getMetaData();
for (int i = 1; i <= metadata.getColumnCount(); i++) {
    System.out.println(metadata.getColumnLabel(i) + "\t" + metadata.getColumnDisplaySize(i));
}
```
Τέλος, αν θέλετε να χρησιμοποιήσετε _συναλλαγές (transactions)_ δηλ. να εκτελέσετε μαζικά μια σειρά από SQL queries που θα πρέπει να επιτύχουν όλες (αν αποτύχει έστω και μία τότε αποτυγχάνουν όλες), θα πρέπει να:

```java
dbConnection.setAutoCommit(false);
//...
stmt.executeUpdate(sqlCommand1);
stmt.executeUpdate(sqlCommand2);
dbConnection.commit();
```
ενώ σε περίπτωση λάθους:
```java
dbConnection.rollback();
```

Μπορείτε ακόμα να χρησιμοποιήσετε Batch Updates και Save Points αλλά ξεφεύγουν από το σκοπό ενός εισαγωγικού μαθήματος. 
### Επικοινωνία με NoSQL ΒΔ

## Περίληψη
Στο μάθημα αυτό μάθαμε πώς να χρησιμοποιούμε βάσεις δεδομένων για ν' αποθηκεύουμε τα δεδομένα μας. Είδαμε πώς να επικοινωνούμε με σχεσιακές βάσεις δεδομένων μέσω JDBC. Στα μαθήματα της προχωρημένης Java θα δούμε έναν άλλο (πιο αντικειμενοστραφή) τρόπο, το Java Persistence API (JPA). Είδαμε επίσης πώς να επικοινωνούμε με NoSQL βάσεις δεδομένων, δηλ. ΒΔ που δεν ακολουθούν το σχεσιακό μοντέλο.

Στο επόμενο μάθημα, θα δούμε έναν ακόμα τρόπο αναπαράστασης δεδομένων, τα αρχεία XML.

## Πηγές
1. Darwin I. F. (2014), _Java Cookbook_, 3rd Ed., O’ Reilly.
1. Horstmann C. S. (2018), _Core Java, Volume II--Advanced Features_, 11th Edition, 
1. Long F. et al. (2012), _The CERT® Oracle® Secure Coding Standard for Java™_, Addison-Wesley. 
1. Ξένος Μ. & Χριστοδουλάκης Δ. (2000), _Βάσεις Δεδομένων_, Τόμος Γ', ΕΑΠ.
1. [SQLite Java](http://www.sqlitetutorial.net/sqlite-java/)

---
[<-](../5.3-NIO/README.md)  | [Δ](../../README.md) | [->](../5.5-XML/README.md) 