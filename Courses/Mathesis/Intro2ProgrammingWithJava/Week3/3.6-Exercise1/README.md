# 3.6 Άσκηση 1 Αντικειμενοστραφούς Προγραμματισμού {#Java} 
© Γιάννης Κωστάρας

---

[<](../3.5-Encapsulation/README.md) | [Δ](../../README.md) | [>](../3.7-Exercise2/README.md) 

---

[![](../../../assets/jupyter_logo.svg)](3.6-Exercise1.ipynb)

Θα επιλύσουμε την άσκηση 1 του μαθήματος 3.1. 

----

1) Να δημιουργήσετε μια κλάση ```Student``` για μαθητές λυκείου με τα εξής γνωρίσματα:

* αριθμός μητρώου (θετικός ακέραιος)
* όνομα (αλφαριθμητικό και δεν μπορεί να 'ναι κενό)
* επώνυμο (αλφαριθμητικό και δεν μπορεί να 'ναι κενό)
* ηλικία (ακέραιος μεταξύ 5-18 και πρέπει να 'χει τιμή)
* τάξη (αλφαριθμητικό μπορεί να είναι κενό, π.χ. στην αρχή της χρονιάς)

   και τις αντίστοιχες μεθόδους πρόσβασης. Ο Α.Μ. θα πρέπει να αυξάνεται αυτόματα κατά την κατασκευή του αντικειμένου της κλάσης (υλοποιήστε το αφού κάνετε το μάθημα 3.4) και δε θα μπορεί να μεταβάλλεται μετά την εκχώρησή του. Θα πρέπει να μπορείτε να δημιουργήσετε αντικείμενα της κλάσης ```Student``` ως εξής:

```java
jshell> Student ioannis = new Student("Γιάννης", "Αντεκοτούμπο", 16);
Student{am=1, firstName=Γιάννης, lastName=Αντεκοτούμπο, age=16, classRoom=null}

jshell> System.out.println("AM: " + ioannis.getAm());   // 1
AM: 1

jshell> ioannis.setClassRoom("Β1");

jshell> System.out.println(ioannis.getClassRoom());     // Β1
B1
```
   κλπ. Οι μέθοδοι θα πρέπει να ελέγχουν την εγκυρότητα των ορισμάτων τους.
   
---

Η άσκηση 1 μας ζητάει να δημιουργήσουμε μια κλάση ```Student``` για μαθητές λυκείου με τα εξής γνωρίσματα:

* αριθμός μητρώου (θετικός ακέραιος) - αυξάνεται αυτόματα
* όνομα (αλφαριθμητικό και δεν μπορεί να 'ναι κενό)
* επώνυμο (αλφαριθμητικό και δεν μπορεί να 'ναι κενό)
* ηλικία (ακέραιος μεταξύ 15-18 και πρέπει να 'χει τιμή, ας υποθέσουμε ότι δεν έχουμε μεταξεταστέους)
* τάξη (αλφαριθμητικό μπορεί να είναι κενό, π.χ. στην αρχή της χρονιάς)

Παρατηρούμε ότι δεν μπορούμε να χρησιμοποιήσουμε εγγραφές (records) γι' αυτήν την κλάση (γιατί άραγε;)

## Υλοποίηση με το NetBeans
1. Δημιουργήστε ένα νέο έργο Java από το μενού **File -> New Project**, επιλέξτε την κατηγορία **Java with Ant** και το έργο **Java Application**. Πατήστε το κουμπί **Next**.
1. Στο δεύτερο βήμα του οδηγού δημιουργίας νέου έργου επιλέξτε το φάκελο στον οποίο θα αποθηκεύσετε το έργο και δώστε ένα όνομα στο έργο, π.χ. ```school```. Ονομάστε την κύρια κλάση επίσης ```School``` (μέσα στο πακέτο ```school```). Αυτή θα περιέχει την μέθοδο ```main()```. Πατήστε **Finish**.
1. Κάντε δεξί κλικ πάνω στο ```school``` πακέτο στην καρτέλα **Projects** και επιλέξτε **New -> Java Class...**. Δώστε το όνομα της κλάσης να είναι ```Student``` και πατήστε **Finish**.
1. Θα δημιουργήσουμε τα 5 γνωρίσματα της κλάσης:

   ```java
   private final int am;
   private String firstname;
   private String lastname;
   private int age = -1;  // 15-18
   private String classroom;
   ``` 
1. Κάντε δεξί κλικ μέσα στον κειμενογράφο του NetBeans και επιλέξτε **Insert Code...** από το αναδυόμενο μενού και στη συνέχεια επιλέξτε **Constructor**.
1. Επιλέξτε τα πεδία ```firstName, lastName, age``` και πατήστε **Generate**. Το NetBeans δημιούργησε την μέθοδο κατασκευής για εσάς.
1. Το γνώρισμα ```am``` θα πρέπει να εκχωρείται αυτόματα από έναν counter:
   ```java
   private static int amCounter = 0;
   public Student(String firstname, String lastname, int age) {
        am = ++amCounter;
        this.firstname = firstname;
        this.lastname = lastname;
        this.age = age;
    }
   ```
Παρατηρήστε πώς το πετύχαμε. Δημιουργήσαμε ένα στατικό γνώρισμα, το οποίο αυξάνεται αυτόματα αφού η τιμή του εκχωρηθεί στην ```am```.
1. Με τον ίδιο τρόπο δημιουργούμε getters και setters. Ο χρήστης θα μπορεί να τροποποιήσει τις τιμές των γνωρισμάτων μετά τη δημιουργία ενός αντικειμένου. Κάντε δεξί κλικ μέσα στον κειμενογράφο του NetBeans και επιλέξτε **Insert Code...** από το αναδυόμενο μενού και στη συνέχεια επιλέξτε **Getter and Setter**. Επιλέξτε όλα τα πεδία εκτός του ```am``` και **Generate**.
1. Με τον ίδιο τρόπο δημιουργήστε έναν getter μόνο για το πεδίο ```am```.
1. Με τον ίδιο τρόπο δημιουργήστε την ```toString()``` που να περιλαμβάνει όλα τα πεδία.

Είδατε πόσο εύκολη είναι η δημιουργία κώδικα με το NetBeans και πόση πληκτρολόγηση μας γλυτώνει.

Τώρα πρέπει να ελέγξουμε αν οι παράμετροι που περνάει ο χρήστης είναι έγκυροι. Για το σκοπό αυτό θα δημιουργήσουμε διάφορες μεθόδους εγκυρότητας (validation) για κάθε μια περίπτωση ώστε να τις χρησιμοποιήσουμε και στις μεθόδους κατασκευής και στους setters.

Η ακόλουθη μέθοδος εγκυρότητας ελέγχει αν μια ηλικία είναι στα επιτρεπτά όρια:


```Java
private boolean isAgeValid(int inAge) {
   return inAge >= 15 && inAge <= 18;
}
```

Χρησιμοποιείται ως εξής. Στην μέθοδο κατασκευής:
```java
if (isAgeValid(age)) {
   this.age = age;
}
```
και επίσης:
```java
public void setAge(int age) {
    this.age = isAgeValid(age) ? age : -1;
}
```
Αν ο χρήστης δώσει μη έγκυρη ηλικία τότε δίνουμε μια τιμή εκτός των ορίων, που συνήθως ονομάζεται τιμή φρουρός (sentinel). Άλλος τρόπος, όπως θα μάθουμε, είναι η χρήση εξαιρέσεων.

Η ακόλουθη μέθοδος εγκυρότητας ελέγχει αν το όνομα που παρέχει ο χρήστης είναι κενό ή όχι και αν το μέγεθος δεν ξεπερνάει τους 20 χαρακτήρες. Μάλιστα για το σκοπό αυτό, δημιουργούμε μια σταθερά.


```Java
private static final int MAX_SIZE = 20;
private boolean isNameValid(String name) {
   return name != null && !name.isBlank() && name.length() <= MAX_SIZE;
}
```

και τη χρησιμοποιούμε στη μέθοδο κατασκευής:
```java
if (isNameValid(firstName)) {
   this.firstName = firstName.trim();
}
if (isNameValid(lastName)) {
   this.lastName = lastName.trim();
}
```
και στους setters:
```java
private static final String NONE = "<Κενό>";
private String firstName = NONE;
private String lastName = NONE;

public void setFirstName(String firstName) {
   this.firstName = isNameValid(firstName) ? firstName.trim() : NONE;
}

public void setLastName(String lastName) {
   this.lastName = isNameValid(lastName) ? lastName.trim() : NONE;
}
```
Παρατηρήστε ότι χρησιμοποιούμε την μέθοδο ```trim()``` για να αποκόψουμε τυχόν κενά από την αρχή και το τέλος του αλφαριθμητικού που περνά ο χρήστης. Επίσης, ορίσαμε μια νέα σταθερά που δηλώνει ότι το όνομα είναι ```<Κενό>``` στην περίπτωση που ο χρήστης δεν παρείχε έγκυρο όνομα.

Τέλος, η παρακάτω μέθοδος εγκυρότητας ελέγχει αν η τάξη είναι τη μορφής ```ΧΧ```, π.χ. ```Α2```:


```Java
private static final int CLASSROOM_NAME_LENGTH = 2;
private boolean isClassRoomValid(String classRoom) {
    return classRoom != null && !classRoom.isBlank() 
           && classRoom.length() == CLASSROOM_NAME_LENGTH 
           && (classRoom.startsWith("Α") 
           || classRoom.startsWith("Β")
           || classRoom.startsWith("Γ"))
           && classRoom.charAt(1) >= '1'
           && classRoom.charAt(1) <= '9';
}
```

Κατ' αρχήν ελέγχει αν η συμβολοσειρά που περνάει ο χρήστης είναι κενή ή όχι, το μέγεθός της πρέπει να είναι 2, και το όνομα της τάξης πρέπει να ξεκινάει με το γράμμα ```"Α", "Β"``` ή ```"Γ"``` και να τελειώνει με αριθμό.

Χρησιμοποιείται στη setter:
```java
private static final String NO_CLASSROOM = "--";
public void setClassRoom(String classRoom) {
   this.classRoom = isClassRoomValid(classRoom) ? classRoom : NO_CLASSROOM;
}
```
Παρακάτω ολόκληρη η κλάση ```Student```:

**Σημείωση** _Καθώς το JShell δεν υποστηρίζει πακέτα (packages) στα παραδείγματα των σημειώσεων αυτών θα βάζουμε τις εντολές ```package``` και ```import``` σε σχόλια. Για να εκτελέσετε τα προγράμματα σε κάποιο ΟΠΕ, θα πρέπει να βγάλετε τα σχόλια από αυτές τις εντολές._

```Java
// package school;
public class Student {

    private static final int MAX_SIZE = 20;
    private static final String NONE = "<Κενό>";
    private static final String NO_CLASSROOM = "--";
    private static final int CLASSROOM_NAME_LENGTH = 2;

    private static int amCounter = 0;
    
    private final int am;
    private String firstName = NONE;
    private String lastName = NONE;
    private int age = -1;  // 15-18
    private String classRoom = NO_CLASSROOM;

    public Student(String firstName, String lastName, int age) {
        am = ++amCounter;
        if (isNameValid(firstName)) {
            this.firstName = firstName.trim();
        }
        if (isNameValid(lastName)) {
            this.lastName = lastName.trim();
        }
        if (isAgeValid(age)) {
            this.age = age;
        }
    }

    public int getAm() {
        return am;
    }
    
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = isNameValid(firstName) ? firstName.trim() : NONE;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = isNameValid(lastName) ? lastName.trim() : NONE;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = isAgeValid(age) ? age : -1;
    }

    public String getClassRoom() {
        return classRoom;
    }

    public void setClassRoom(String classRoom) {
        this.classRoom = isClassRoomValid(classRoom) ? classRoom : NO_CLASSROOM;
    }

    @Override
    public String toString() {
        return "Student{" + "am=" + am + ", firstName=" + firstName + ", lastName=" + lastName + ", age=" + age + ", classRoom=" + classRoom + '}';
    }
    
    private boolean isAgeValid(int inAge) {
        return inAge >= 15 && inAge <= 18;
    }
    
    private boolean isNameValid(String name) {
        return !name.isBlank() && name.length() <= MAX_SIZE;
    }
    
    private boolean isClassRoomValid(String classRoom) {
        return !classRoom.isBlank() && classRoom.length() == CLASSROOM_NAME_LENGTH 
                && (classRoom.startsWith("Α") 
                || classRoom.startsWith("Β")
                || classRoom.startsWith("Γ"))
                && classRoom.charAt(1) >= '1'
                && classRoom.charAt(1) <= '9';
    }

}
```

```java
jshell> Student ioannis = new Student("Γιάννης", "Αντεκοτούμπο", 16);
ioannis ==> Student{am=1, firstName=Γιάννης, lastName=Αντεκοτούμπο, age=16, classRoom=null}

jshell> System.out.println("AM: " + ioannis.getAm());   // 1
AM: 1

jshell> ioannis.setClassRoom("Β1");

jshell> System.out.println(ioannis.getClassRoom());     // Β1
Β1
```

Εξασκηθείτε πάνω στην κλάση ```Student``` αυτού του μαθήματος εδώ <a href="sandbox/student.html" target="_blank"><img src="../../../assets/javaalmanac.svg" alt="javaalmanac.io" style="width:5%; height:5%;"></a>

## Υλοποίηση με το BlueJ

1. Δημιουργήστε ένα νέο έργο στο BlueJ από το μενού **Project -> New Project** δίνοντάς του το όνομα ```School```.
1. Δημιουργήστε ένα νέο πακέτο (package) με όνομα ```school```. Κάντε διπλό κλικ πάνω του.
1. Δημιουργήστε μια νέα κλάση ```Student```.
1. Κάντε διπλό κλικ πάνω της και ακολουθήστε τα βήματα που περιγράψαμε στο NetBeans για να δημιουργήσετε τον κώδικα της κλάσης (ή αν δεν έχετε χρόνο απλά επικολλήστε τον κώδικα). Παρατηρήστε ότι ο κειμενογράφος (editor) του BlueJ δεν σας προσφέρει τις ευκολίες που σας παρέχει ο editor του NetBeans.
1. Μεταγλωττίστε τη. 
1. Δημιουργήστε το αντικείμενο που αναφέρεται στην εκφώνηση της άσκησης.

---

[<](../3.5-Encapsulation/README.md) | [Δ](../../README.md) | [>](../3.7-Exercise2/README.md) 

---
