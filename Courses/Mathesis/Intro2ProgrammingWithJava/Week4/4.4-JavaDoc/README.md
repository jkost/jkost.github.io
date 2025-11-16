# 4.4 Τεκμηρίωση κώδικα - Javadoc {#Java} 
© Γιάννης Κωστάρας

---

[🏠](https://jkost.github.io) | [⬆️](../../README.md) | [◀️](../4.4-Enums/README.md) |[▶️](../4.5-BestPractices/README.md)

---
[![](../../../assets/jupyter_logo.svg)](4.4-JavaDoc.ipynb)

Η τεκμηρίωση του κώδικα είναι το ίδιο σημαντική όπως και ο ίδιος ο κώδικας. Η Java παρέχει τα σχόλια Javadoc (```/** */```) για το σκοπό αυτό. Η εντολή ```javadoc``` παράγει το λεγόμενο ΑΡΙ (Application Programming Interface - Προγραμματιστική Διεπαφή Εφαρμογής).

```java
/**
  * Αυτή η κλάση περιγράφει έναν <i>παίκτη</i> του παιχνιδιού. 
  * Το σκορ του παίκτη αποθηκεύεται σ' αυτήν την κλάση. 
  * Βλ. κλάση {@link Game}.
  * @author ikost
  * @version 1.0
  */
public class Player {
  /** Ηλικία του παίκτη. Μπορεί να είναι (9-99). */
  private int age;
  /** Σκορ. Μπορεί να είναι θετικός ακέραιος αριθμός. */
  private int score;
  
  /** 
	* Υπολογίζει το σκορ του παίκτη. Βλ. {@code score}.
	* @param wins νίκες (θετικός ή μηδέν)
	* @param fails αποτυχίες (θετικός ή μηδέν)
	* @return το σκορ του παίκτη (θετικός ή μηδέν) 
	*/
  public int score(int wins, int fails) {
	  score = wins - fails;
  	  return score;
  }

}
```

Βλέπουμε ότι μπορούμε να εισάγουμε σχόλια javadoc στο επίπεδο κλάσης, γνωρίσματος και μεθόδου. 

Μια καλή τεκμηρίωση μεθόδου πρέπει να λαμβάνει υπόψιν της ότι μια μέθοδος έχει:

* _προ-συνθήκες (pre-conditions)_ που πρέπει να ικανοποιούνται (από την κατάσταση του αντικειμένου) και από τις παραμέτρους (π.χ. η παράμετρος ```age``` να είναι 9-99). Αποτελούν δικαίωμα της μεθόδου και υποχρέωση του καλούντος.
* _μετά-συνθήκες (post-conditions)_, συνθήκες δηλαδή που πρέπει να ικανοποιούνται μετά την κλήση της μεθόδου. Π.χ. η ```score``` θα πρέπει να επιστρέψει σκορ που θα είναι ένας θετικός ακέραιος αριθμός ή μηδέν (άλλες υλοποιήσεις θα μπορούσαν να επιστρέψουν και αρνητικό σκορ) 
* _αξιώματα ή αναλλοίωτες συνθήκες (invariants)_, οι οποίες είναι συνθήκες οι οποίες πρέπει να ισχύουν πάντα. Π.χ. η ηλικία ενός παίκτη είναι πάντα θετικός αριθμός.

Δυστυχώς το JavaDoc δεν παρέχει ετικέτες (tags), όπως θα δούμε, για τις παραπάνω συνθήκες, αλλά καλό είναι να τις τεκμηριώνετε οι ίδιοι στις μεθόδους σας. Π.χ.

```java
  /** 
	* Υπολογίζει το σκορ του παίκτη. Βλ. {@code score}.
    * <p>Pre-conditions: Η {@code wins} και {@code fails} πρέπει να είναι θετικοί αριθμοί ή μηδέν.</p>
    * <p>Post-conditions: Το σκορ μπορεί να είναι θετικός αριθμός ή μηδέν.</p>
    * <p>Invariants: {@code score = wins - fails}.</p>    
	* @param wins νίκες (θετικός ή μηδέν)
	* @param fails αποτυχίες (θετικός ή μηδέν)
	* @return το σκορ του παίκτη (θετικός ή μηδέν) 
	*/
  public int score(int wins, int fails) {
	  score = wins - fails;
  	  return score;
  }
```

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

Το ```reference``` (βλ. ```@see, {@link}, {@linkplain}``` και ```{@value}```) μπορεί να είναι:

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
<img src="doc-files/Car-2.png">
```

Αν θέλουμε να εμφανίσουμε και μια περίληψη των βιβλιοθηκών (packages), θα πρέπει να προσθέσουμε ένα αρχείο ```package-info.html``` σε κάθε φάκελο που περιέχει την βιβλιοθήκη στην οποία βρίσκεται π.χ. ```gr.cup.mathesis```. Επιπροσθέτως, ένα αρχείο ```overview.html``` στον ριζικό φάκελο με γενικές πληροφορίες.

Η παραγωγή του javadoc API γίνεται με την εντολή ```javadoc``` που παρέχεται μαζί με το JDK, και είναι σε μορφή HTML όπως ήδη γνωρίζετε από το ΑΡΙ της ίδιας της Java. Από την έκδοση 9 και μετά, η εντολή αυτή βρίσκεται στο άρθρωμα ```jdk.javadoc``` και ονομάζεται _doclet_. Από την έκδοση 9 το παραγώμενο javadoc είναι σε HTML 5.

### Δημιουργία JavaDoc με το NetBeans
Για να δημιουργήσετε το javadoc API, από το NetBeans, κάντε δεξί κλικ πάνω στο Project και επιλέξτε **Generate Javadoc**. Μέσα στο φάκελο ```dist``` θα παραχθεί ένας νέος φάκελος ```javadoc``` και το παραγόμενο ΑΡΙ θα εμφανιστεί στον αγαπημένο σας πλοηγό. Μπορείτε επίσης να το δείτε στο NetBeans αν επιλέξετε το μενού **Window --> IDE Tools --> Javadoc Documentation**.

### Δημιουργία JavaDoc με το BlueJ
Η δημιουργία JavaDoc για τις κλάσεις σας είναι πανεύκολη με το BlueJ. 

* Για να παράγετε το JavaDoc για όλες τις κλάσεις του ανοικτού έργου σας επιλέξτε το μενού **Tools -> Project Documentation**. Το JavaDoc που θα παραχθεί θα ανοίξει στον αγαπημένο σας πλοηγό.
* Έχοντας ανοικτή μια κλάση στον κειμενογράφο (ή διορθωτή) του BlueJ επιλέγοντας από την πτυσσόμενη λίστα στα δεξιά της γραμμής εργαλείων **Documentation** αντί για **Source Code** μπορείτε να δείτε το JavaDoc για την συγκεκριμένη κλάση.

### Διαγράμματα UML στο JavaDoc
Στο μάθημα 3.4 μάθαμε για το πρόσθετο PlantUML για NetBeans. Μπορείτε να οπτικοποιήσετε το διάγραμμα κλάσεων επιλέγοντας το μενού **Window --> PlantUML**. Μπορείτε να εισάγετε ένα διάγραμμα κλάσεων στο javadoc API αποθηκεύοντάς το ως εικόνα σ' ένα φάκελο ```doc-files``` όπως είδαμε προηγούμενα. 

_Υπάρχει και το [UML Java Doclet](https://github.com/gboersma/uml-java-doclet) έργο ανοικτού κώδικα το οποίο χρησιμοποιεί το [maven](https://maven.apache.org/) και ξεφεύγει από τα όρια αυτής της σειράς μαθημάτων._

## Ασκήσεις
1. Προσθέστε σχόλια JavaDoc σε όσα περισσότερα στοιχεία μπορείτε στις κλάσεις του έργου _School_.

---

[🏠](https://jkost.github.io) | [⬆️](../../README.md) | [◀️](../4.4-Enums/README.md) |[▶️](../4.5-BestPractices/README.md)

---