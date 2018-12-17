# 2.6 Τεκμηρίωση κώδικα - Javadoc {#Java} 
© Γιάννης Κωστάρας

---

[<-](../2.5-Polymorphism/README.md) | [Δ](../../README.md) | [->](../2.7-Debugging/README.md)

---

Η τεκμηρίωση του κώδικα είναι το ίδιο σημαντική όπως και ο ίδιος ο κώδικας. Η Java παρέχει τα σχόλια Javadoc (```/** */```) για το σκοπό αυτό. Η εντολή ```javadoc``` παράγει το λεγόμενο ΑΡΙ (Application Programming Interface - Προγραμματιστική Διεπαφή Εφαρμογής).

```java
/**
  * Αυτή η κλάση περιγράφει έναν <i>παίκτη</i> του παιχνιδιού. Το σκορ του παίκτη αποθηκεύεται σ' αυτήν την κλάση. 
  * Βλ. κλάση {@link Game}.
  * @author ikost
  * @version 1.0
  */
public class Player {
  /** Ηλικία του παίκτη. Μπορεί να είναι (9-99). */
  private int age, score;
  
  /** 
    * Επιστρέφει το σκορ του παίκτη. Βλ. {@code score}.
	* @param wins νίκες
	* @param fails αποτυχίες
	* @return το σκορ του παίκτη 
	*/
  public int score(int wins, int fails) {
	  int score;
	  //...
  	  return score;
  }

}
```

Βλέπουμε ότι μπορούμε να εισάγουμε σχόλια javadoc στο επίπεδο κλάσης, γνωρίσματος και μεθόδου. 

## Ετικέτες (Tags) 
Η εντολή ```javadoc``` αναγνωρίζει έναν αριθμό από ετικέττες (tags) που μπορείτε να προσθέσετε στα σχόλια κώδικα (javadoc) και επιτρέπουν στην εντολή να τα εμφανίσει με ξεχωριστό τρόπο.

| Ετικέττα (tag) | Επίπεδο | Χρήση | Παράμετρος | Παράδειγμα
| ```@author name``` | Κλάση/Διεπαφή | Εισάγει το τμήμα "Author:" με το όνομα συγγραφέα. Για κάθε συγγραφέα, εισάγετε μια νέα ετικέτα ```@author```. Αν δε γνωρίζετε το συγγραφέα, δώστε ```unascribed```. | ```-author``` | ```@author Ioannis Kostaras``` |
| ```{@code text}``` | Inline | Εμφανίζει το κείμενο με εμφάνιση κώδικα | | ```{@code age}``` | 
| ```@deprecated explanation``` | Κλάση/Διεπαφή/Γνώρισμα/Μέθοδος | Εισάγει το τμήμα "Deprecated:" με την εξήγηση γιατί αυτή η/το κλάση/διεπαφή/γνώρισμα/μέθοδος αντικαταθίσταται από κάποια άλλη. Η μόνη ετικέτα που λαμβάνεται υπόψη από τον μεταγλωττιστή. | | ```@deprecated as of version 2.0, this method is replaced by {@link #toURI}.``` |
| ```{@docRoot}``` | Inline | Εισάγει το ριζικό φάκελο (root directory) του παραγόμενου javadoc API. | | ```<img src="{@docroot}/images/logo.gif">``` | 
| ```@exception full-classname description``` | Μέθοδος | Εισάγει το τμήμα "Throws:" με την εξαίρεση που εμφανίζει μια μέθοδος και την περιγραφή τους. | | ```@exception java.io.FileNotFoundException if the specified file could not be found``` |
| ```{@inheritDoc}``` | Inline | Εισάγει το javadoc κείμενο της υπερκλάσης. | | ```return {@inheritDoc}``` | 
| ```{@link reference}``` | Inline | Εισάγει έναν σύνδεσμο. | | ```{@link java.util.regex.Pattern}``` | 
| ```{@linkplain reference}``` | Inline | Εισάγει έναν σύνδεσμο χωρίς μορφοποίηση. | | ```{@linkplain java.util.regex.Pattern}``` | 
| ```{@literal text}``` | Inline | Αγνοεί τις ετικέτες HTML. | | ```{@literal <b>Text</b>``` | 
| ```@param param-name description``` | Μέθοδος | Εισάγει το τμήμα "Parameters:" με τις παραμέτρους μιας μεθόδου και την περιγραφή τους. | | ```@param age Age must be between [9-99]```
| ```@return description``` | Μέθοδος | Εισάγει το τμήμα "Returns:" και την περιγραφή του τι επιστρέφει η μέθοδος. | | ```@return {@code true} if the person found or {@code false} otherwise```
| ```@see reference``` | Κλάση/Διεπαφή/Γνώρισμα/Μέθοδος | Εισάγει το τμήμα "See also:" με μια αναφορά (βλ. παρακάτω) | | ```@see java.util.Collections```
| ```@since version``` | Κλάση/Διεπαφή/Γνώρισμα/Μέθοδος | Πότε εισήχθηκε στο ΑΡΙ. |  | ```@since 1.0``` |
| ```@throws full-classname description``` | Μέθοδος | Συνώνυμη της ```@exception``` | | ```@throws java.io.FileNotFoundException if the specified file could not be found``` |
| ```{@value reference}``` | Inline | Αντικαθίσταται από το static final γνώρισμα στο οποίο αναφέρεται | |  | 
| ```@version version``` | Κλάση/Διεπαφή | Δηλώνει την έκδοση της κλάσης σε συνδυασμό με κάποιο σύστημα διαχείρισης εκδόσεων (version control system). | ```-version``` | ```@version 1.0``` |

Το ```reference``` (βλ. @see, {@link}, {@linkplain} και {@value}) μπορεί να είναι:

* ```pkgname```, π.χ. ```@see java.util```
* ```pkgname.classname```, π.χ. ```@see java.util.Collections```
* ```classname```, π.χ. ```@see Collection```
* ```typename#methodname```, π.χ. ```@see Collection#remove```
* ```typename#methodname(param-types)```, π.χ. ```@see Collection#remove(Object o)```
* ```#methodname```, π.χ. ```@see #setPosition```
* ```#methodname(param-types)```, π.χ. ```@see #setPosition(int x, int y)```
* ```typename#fieldname```, π.χ. ```@see Car#speed```
* ```fieldname```, π.χ. ```@see #speed```

Αν θέλετε να προσθέσετε μια εικόνα, αντιγράψτε τη σε έναν υποφάκελο με όνομα ```doc-files``` στο φάκελο του πηγαίου κώδικα. Δώστε στο αρχείο εικόνας το ίδιο όνομα όπως αυτό της κλάσης ακολουθούμενο από έναν αριθμό που δηλώνει τη σειρά με την οποία θα εμφανίζεται στη σελίδα javadoc για την κλάση (μπορείτε να εισάγετε περισσότερες από μια εικόνες). Π.χ. η 2η εικόνα μιας κλάσης ```Car``` μπορεί να εισαχθεί σε ένα javadoc σχόλιο ως:

```html
<img src="docfiles/Car-2.png">
```

Αν θέλουμε να εμφανίσουμε και μια περίληψη των βιβλιοθηκών (packages), θα πρέπει να προσθέσουμε ένα αρχείο ```package.html``` σε κάθε φάκελο που περιέχει τον πηγαίο κώδικα, το οποίο θα περιέχει μια περιγραφή του πακέτου. Επιπροσθέτως, ένα αρχείο ```overview.html``` στον ριζικό φάκελο με γενικές πληροφορίες.

Η παραγωγή του javadoc API γίνεται με την εντολή ```javadoc``` που παρέχεται μαζί με το JDK, και είναι σε μορφή HTML όπως ήδη γνωρίζετε από το ΑΡΙ της ίδιας της Java. Από την έκδοση 9 και μετά, η εντολή αυτή βρίσκεται στο άρθρωμα ```jdk.javadoc``` και ονομάζεται _doclet_. Από την έκδοση 9 το παραγώμενο javadoc είναι σε HTML 5.

Για να δημιουργήσετε το javadoc API, από το NetBeans, κάντε δεξί κλικ πάνω στο Project και επιλέξτε **Generate Javadoc**. Μέσα στο φάκελο ```dist``` θα παραχθεί ένας νέος φάκελος ```javadoc``` και το παραγόμενο ΑΡΙ θα εμφανιστεί στον αγαπημένο σας πλοηγό. Μπορείτ επίσης να το δείτε στο NetBeans αν επιλέξετε το μενού **Window --> IDE Tools --> Javadoc Documentation**.

## PlantUML
Το [PlantUML](http://plantuml.com/) είναι μια γλώσσα με την οποία μπορεί κάποιος να παράγει διαγράμματα UML. Υποστηρίζονται τα ακόλουθα διαγράμματα:

* Διάγραμμα Ακολουθίας (Sequence diagram)
* Διάγραμμα Σεναρίων ή Περιπτώσεων Χρήσης (Usecase diagram)
* Διάγραμμα Κλάσεων (Class diagram)
* Διάγραμμα Δραστηριοτήτων (Activity diagram)
* Διάγραμμα Συστημάτων (Component diagram)
* Διάγραμμα Κατάστασης (State diagram)
* Διάγραμμα Αντικειμένων (Object diagram)
* Διάγραμμα Εγκατάστασης (Deployment diagram) 
* Διάγραμμα Χρονισμού (Timing diagram) 


Μπορείτε να κατεβάσετε το PlantUML plugin για το NetBeans από [εδώ](http://plugins.netbeans.org/plugin/49069/plantuml). Για να το εγκαταστήσετε, επιλέξτε στο NetBeans το μενού **Tools --> Plugins**, καρτέλα **Downloaded**, κλικ στο κουμπί **Add Plugins**, πλοηγηθείτε στο **PlantUML-NB-x.x.nbm** και **Open** και στη συνέχεια **Install**. Ακολουθήστε τις οδηγίες του οδηγού για να το εγκαταστήσετε. Η PlantUML χρειάζεται τη βιβλιοθήκη [graphviz](https://graphviz.gitlab.io/download/) την οποία πρέπει να εγκαταστήσετε ξεχωριστά. Ελέγξτε την εγκατάσταση από το μενού **Tools --> Options** (ή **NetBeans --> Preferences** αν είστε στο Mac) και κάνοντας κλικ στο **Miscellaneous --> PlantUML**. Πιθανόν να χρειαστεί να ορίσετε χειροκίνητα (manual) τη θέση του graphviz.

Για να δημιουργήσετε ένα διάγραμμα κλάσεων, επιλέξτε οποιαδήποτε κλάση του έργου σας (project) και επιλέξτε το μενού **File --> New File --> PlantUML --> PlantUML from existing Java sources**. Ακολουθήστε τον οδηγό. Θα δημιουργηθεί ένα αρχείο ```.puml``` που θα περιλαμβάνει μια σειρά από εντολές που δείχνουν τις συσχετίσεις μεταξύ των κλάσεων του έργου σας, π.χ.:

```
@startuml
class A
class B
B --|> A
@enduml
```

[Σύνταξη για τα διαγράμματα κλάσεων της PlantUML](http://plantuml.com/class-diagram). Μπορείτε να οπτικοποιήσετε το διάγραμμα κλάσεων επιλέγοντας το μενού **Window --> PlantUML**. Μπορείτε να εισάγετε ένα διάγραμμα κλάσεων στο javadoc API αποθηκεύοντάς το ως εικόνα σ' ένα φάκελο ```doc-files``` όπως είδαμε προηγούμενα. 

_Υπάρχει και το [UML Java Doclet](https://github.com/gboersma/uml-java-doclet) έργο ανοικτού κώδικα το οποίο χρησιμοποιεί το [maven](https://maven.apache.org/) και ξεφεύγει από τα όρια αυτής της σειράς μαθημάτων._

## Πηγές:
1. ["The Java Tutorial"](https://docs.oracle.com/javase/tutorial/)
1. Bloch J. (2018), _Effective Java_, 3rd Edition, Addison-Wesley.
1. Deitel P., Deitel H. (2018), _Java How to Program_, 11th Ed., Safari.
1. Downey A. B., Mayfield C. (2016), _Think Java_, O' Reilly. 
1. Eckel B. (2006), _Thinking in Java_, 4th Ed., Prentice-Hall.
1. Evans B. J., Flanagan (2019), _Java in a Nutshell_, 7th Ed., O' Reilly.
1. Hillar G.C. (2017), _Java 9 with JShell_, Packt.
1. Horstmann C. S. (2016), _Core Java, Volume 1 Fundamentals_, 10th Ed., Prentice-Hall.
1. Horstmann C. S. (2018), _Core Java SE 9 for the impatient_, 2nd Ed., Addison-Wesley. 
1. Sharan K. (2017), _Java 9 Revealed: For Early Adoption and Migration_, Apress.
1. Sierra K. & Bates B. (2005), _Head First Java_, 2nd Ed. for Java 5.0, O’Reilly.

---

[<-](../2.5-Polymorphism/README.md) | [Δ](../../README.md) | [->](../2.7-Debugging/README.md)

---