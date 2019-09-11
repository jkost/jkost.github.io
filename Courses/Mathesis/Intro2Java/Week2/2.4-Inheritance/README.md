# 2.4 Κληρονομικότητα {#Java} 
© Γιάννης Κωστάρας

---

[<-](../2.3-Encapsulation/README.md) | [Δ](../../README.md) | [->](../2.5-Polymorphism/README.md)

---

## Κληρονομικότητα

Άλλο ένα "όπλο" που έχουν οι προγραμματιστές αντικειμενοστραφών προγραμμάτων στο "οπλοστάσιό" τους για τη δημιουργία πιο κατανοητού και ευκολότερα συντηρήσιμου κώδικα είναι η κληρονομικότητα (inheritance). Επιτρέπει την επαναχρησιμοποίηση κώδικα (DRY principle - Don't Repeat Yourself).

Τα κοινά στοιχεία δυο ή περισσοτέρων παρόμοιων κλάσεων μπορούν να οριστούν σε μια κοινή _υπερκλάση (superclass)_. Μία _υποκλάση (subclass)_ μπορεί να κληρονομήσει όλα τα "επιτρεπτά" γνωρίσματα και μεθόδους από τους "προγόνους" της (δηλ. όσα είναι δηλωμένα ως ```protected``` και ```public``` αλλά και ```package``` αν βρίσκεται στο ίδιο πακέτο με τους προγόνους της) εκτός από τις μεθόδους κατασκευής. Η σχέση μεταξύ μιας υπερκλάσης και μιας υποκλάσης είναι σχέση τύπου "ΕΊΝΑΙ (IS-A)".

Μια υποκλάση μπορεί να ορίσει νέα γνωρίσματα και μεθόδους, μπορεί να υπερφορτώσει υφιστάμενες μεθόδους (overloading) ή ακόμα και να υπερσκελίσει (επανακαθορίσει) υφιστάμενες μεθόδους (overriding). Όλες οι κλάσεις στη Java κληρονομούν από την κλάση ```Object```.

**Σημείωση**. _Προσοχή! μια υποκλάση δεν μπορεί να υπερσκελίσει (override) στατικές μεθόδους της υπερκλάσης._

Ας δούμε ένα παράδειγμα. Ο κύκλος, το ορθογώνιο παραλληλόγραμμο κλπ. είναι όλα σχήματα (κληρονομούν από την υπερκλάση ```Shape```). Αυτό δηλώνεται με τη λέξη-κλειδί ```extends```.

```java
public abstract class Shape {   
  protected final Point[] points;
 
  Shape(int edges) {
     this.points = new Point[edges];
  }  

  Shape(Point[] points) {
     this.points = points;
  }

  public int getEdges() {
     return this.points.length;
  }
 
  protected abstract double area();

  protected abstract double perimeter();
}

final class Point {
  private final int x, y;

  public Point(int x, int y) {
    this.x = x;
      this.y = y;
  }

  public int getX() {
     return this.x;
  }

  public int getY() {
     return this.y;
  } 

}

public class Circle extends Shape {  
  private final int radius;

  Circle() {
    super(1);
	this.radius = 1;
  }  

  Circle(Point[] points, int radius) {
    super(points);
    this.radius = radius;
  }    
  
  public int getRadius() {
    return radius;
  }

  @Override
  public double area() {
      return Math.PI * (radius * radius);
  } 

  @Override
  public double perimeter() {
    return Math.PI * 2*radius;
  } 
}

public class Rectangle extends Shape {  
  private int width, height; 

  Rectangle(int width, int height) {
    super(4);
    this.width = width;
    this.height = height;
  }  

  Rectangle(Point[] points, int width, int height) {
    super(points);
    this.width = width;
    this.height = height;
  }
  
  public int getWidth() {
  	return width;
  }
  
  public int getHeight() {
  	return height;
  }
  

  @Override
  public double area() {
      return width * height;
  } 
  
  @Override
  public double perimeter() {
    return 2*width + 2*height;
  }  
}

```

Η λέξη-κλειδί ```super``` χρησιμοποιείται για να καλέσει η υποκλάση την υπερκλάση. Μπορεί να χρησιμοποιηθεί με δύο τρόπους:

* Για να καλέσει τον constructor της υπερκλάσης καθώς αυτοί δεν κληρονομούνται. Στην περίπτωση αυτή πρέπει να είναι η πρώτη εντολή στον κώδικα της μεθόδου κατασκευής της υποκλάσης.
* Για να καλέσει μία μέθοδο της υπερκλάσης

Η κληρονομικότητα ονομάζεται και ως _σχέση είναι τύπου (is-a)_ επειδή οι υποκλάσεις είναι του τύπου της υπερκλάσης. Ως συνέπεια αυτού μπορούμε να γράψουμε:

```java
Shape shape = new Circle();
```

Το ```@Override``` είναι ένα _σχόλιο μεταγλώττισης (annotation)_ το οποίο χρησιμοποιείται από τον μεταγλωττιστή για να επιβεβαιώσει ότι υπερσκελίζουμε (override) τη σωστή μέθοδο, διαφορετικά ο μεταγλωττιστής εμφανίζει λάθος μεταγλώττισης (```method does not override or implement a method```). Η γλώσσα διαθέτει κι άλλα τέτοια σχόλια μεταγλώττισης όπως:

* ```@deprecated```: δηλώνει ότι η μέθοδος/κλάση/γνώρισμα κλπ. δεν εγκρίνεται προς χρήση πλέον (είτε γιατί υπάρχει μια καλύτερη υλοποίηση, είτε γιατί η υλοποίησή της ήταν λάθος, είτε γιατί μπορεί να διαγραφεί ή να είναι ασύμβατη σε μελλοντικές εκδόσεις). Ο μεταγλωττιστής παράγει προειδοποιήσεις (warnings) όταν χρησιμοποιείται. Π.χ. ```@deprecated(since="9", forRemoval=true)``` δηλώνει ότι το στοιχείο αυτό (μέθοδος/κλάση/γνώρισμα κλπ.) έχει γίνει παρωχημένο από την έκδοση 9 της Java και ότι πρόκειται να διαγραφεί στο μέλλον
* ```@SuppressWarnings```: προτρέπει τον μεταγλωττιστή να μην εμφανίζει προειδοποιήσεις (warnings) κατά τη μεταγλώττιση, π.χ. ```@SuppressWarnings("unchecked")``` 

Η _Αρχή της Υποκατάστασης (Substitution Principle)_ μας λέει ότι όταν περιμένουμε ένα αντικείμενο μιας κλάσης, μπορούμε να παρέχουμε και μια οποιανδήποτε υπο-κλάσης αυτής της κλάσης:

**Αρχή της Υποκατάστασης (Substitution Principle)**: _σε μια μεταβλητή μιας δοθείσας κλάσης μπορεί να αποθηκευθεί μια τιμή μιας οποιασδήποτε υπο-κλάσης αυτής της κλάσης, και μια μέθοδος με μια παράμετρο μιας δοθείσας κλάσης μπορεί να κληθεί με όρισμα μια οποιαδήποτε υποκλάση αυτής της κλάσης._

Με βάση την αρχή αυτή μπορούμε να γράψουμε:

```java
Shape shape = new Circle();
```

## Αφαιρετικές Κλάσεις (Abstract class)
Ο κύριος λόγος της κληρονομικότητας είναι η εξαφάνιση διπλότυπου κώδικα (αρχή "Μην επαναλαμβάνεσαι" - "Don't Repeat Yourself" ή DRY principle). Δεν μπορούν να δημιουργηθούν αντικείμενα από αφαιρετικές κλάσεις. Πρέπει να κληρονομηθούν και να υλοποιηθούν οι αφαιρετικές μεθόδοι τους από τις υποκλάσεις.

Μια κλάση δηλώνεται ως αφαιρετική με την λέξη-κλειδί ```abstract```. Μια κλάση η οποία περιλαμβάνει έστω και μια «αφαιρετική» μέθοδο, καθίσταται επίσης αφαιρετική και πρέπει να δηλωθεί ως αφαιρετική (abstract). Μια κλάση που κληρονομεί από μια αφαιρετική κλάση θα πρέπει να υλοποιήσει όλες τις αφαιρετικές μεθόδους της υπερκλάσης, διαφορετικά ο μεταφραστής επιβάλλει να οριστεί και η υποκλάση ως αφαιρετική. 

Η κλάση ```Shape``` έχει δυο ```abstract``` μεθόδους (```area()``` και ```perimeter()```) και πρέπει να δηλωθεί κι αυτή ως ```abstract```.

Το παρακάτω UML διάγραμμα αναπαριστά την ανωτέρω ιεραρχία:

![](assets/Fig1.png)

**Εικόνα 1** _Παράδειγμα ιεραρχίας κλάσεων στη UML_

Η σχέση μεταξύ των κλάσεων ```Shape```, ```Circle``` και ```Rectangle``` ονομάζεται _γενίκευση (generalization)_ η οποία είναι μια σχέση τύπου _είναι (is a)_.

```Abstract``` κλάσεις και μέθοδοι αναπαρίστανται με πλάγια γραφή. Στο παραπάνω διάγραμμα βλέπουμε μια ακόμα σχέση μεταξύ κλάσεων, την _συσσωμάτωση (aggregation)_ η οποία είναι μια σχέση τύπου _ανήκει (owns)_. Η σχέση αυτή δηλώνει ότι η κλάση ```Shape``` περιλαμβάνει μια συλλογή από σημεία (```Points```) τα οποία τα αποθηκεύει στην ```protected``` μεταβλητή ```points```.

Όπως μπορείτε να δείτε στην εικόνα 4 του 2ου μαθήματος αυτής τη εβδομάδας (το οποίο επαναλαμβάνεται παρακάτω)

![](../2.2-UML/assets/Fig4.png)

**Εικόνα 2.2.4** _Διαγράμματα κλάσεων_

η UML υποστηρίζει διάφορους τύπους σχέσεων μεταξύ κλάσεων. Είδαμε τη _συσσωμάτωση (aggregation)_ αλλά υπάρχει και η _σύνθετη συσσωμάτωση (composite aggregation ή composition)_ (σχέση τύπου _περιέχει (is part of)_). Η διαφορά τους είναι ότι στη δεύτερη περίπτωση, αν καταστραφεί το αντικείμενο που περιέχει τη συλλογή των συσσωματωμένων αντικειμένων, τότε καταστρέφονται και τα συσσωματωμένα αντικείμενα, ενώ στην περίπτωση της απλής συσσωμάτωσης, τα συσσωματωμένα αντικείμενα παραμένουν και μετά την καταστροφή του αντικειμένου που τα περιέχει και μπορούν να επαναχρησιμοποιηθούν από άλλα αντικείμενα. Π.χ. αν καταστραφεί ένα αντικείμενο τύπου ```Rectangle``` το οποίο περιέχει τα 4 αντικείμενα τύπου ```Point``` για τις κορυφές του, τότε ανάλογα με το αν η εφαρμογή μας υποστηρίζει το ```Point``` ως σχήμα ή όχι, η σχέση θα μπορεί να είναι _aggregation_ (αν υποστηρίζει) ή _composite aggregation_ (αν δεν υποστηρίζει οπότε τα σημεία θα πρέπει να καταστραφούν μαζί με το αντικείμενο). Η σύνθετη συσσωμάτωση υλοποιείται ως εμφωλιασμένη κλάση (ώστε αντικείμενά της να καταστρέφονται όταν καταστρέφονται και τα αντικείμενα που τις περιέχουν) ενώ η συσσωμάτωση ως στατική εμφωλιασμένη κλάση ώστε να μπορεί να υπάρχει και όταν αντικείμενα της κλάσης που την περιέχουν παύσουν να υπάρχουν.

Π.χ. 

```java
public abstract class Shape {   
  protected final Point[] points;
 
  Shape(int edges) {
     this.points = new Point[edges];
  }  

  Shape(Point[] points) {
     this.points = points;
  }

  public int getEdges() {
     return this.points.length;
  }
 
  protected abstract double area();

  protected abstract double perimeter();

  // nested class
  static final class Point {
  	private final int x, y;
  	
  	public Point(int x, int y) {
  	  this.x = x;
  	    this.y = y;
  	}
  	
  	public int getX() {
  	   return this.x;
  	}
  	
  	public int getY() {
  	   return this.y;
  	} 
  }
}
```

Η σχέση _συσχέτιση (association)_ χρησιμοποιείται όταν μια κλάση σχετίζεται με μια άλλη, δηλ. την έχει ως γνώρισμά της (σχέση _has a_).

Π.χ.

```java
class Fighter {
	private Weapon weapon;
}

class Weapon {
}
````

![](assets/Fig2.png)

**Εικόνα 2** _Παράδειγμα association στη UML_

Τέλος, αν μέσα σε μια μέθοδο μιας κλάσης χρησιμοποιούμε ένα αντικείμενο μιας άλλης κλάσης αλλά χωρίς να την ορίζουμε ως γνώρισμα της κλάσης, τότε χρησιμοποιούμε τη σχέση _εξάρτηση (dependency)_.

## Κλάση ```Object```
Όλες οι κλάσεις στη Java κληρονομούν από την κλάση ```Object``` (δηλ. κάθε κλάση μπορεί να γραφτεί και ως ```class MyClass extends Object```). Η κλάση ```Object``` δηλώνει έναν αριθμό από χρήσιμες μεθόδους:

```java
public class Object {
	boolean	equals​(Object obj); 	// Indicates whether some other object is "equal to" this one.
	int	hashCode();					// Returns a hash code value for the object.
	String toString(); 				// Returns a string representation of the object.
}
```
Είναι πολύ σημαντικό να υπερσκελίζουμε (override) αυτές τις μεθόδους όταν ορίζουμε τις κλάσεις μας. 

Η ```equals()``` ελέγχει για ισότητα μεταξύ δυο αντικειμένων και είναι πολύ σημαντική όταν θέλουμε να συγκρίνουμε αντικείμενα. Επιστρέφει ```true``` αν ένα αντικείμενο της κλάσης είναι ίσο μ' ένα άλλο αντικείμενο της κλάσης ή μιας υποκλάσης της κλάσης.

Η ```hashCode()``` επιστρέφει ένα μοναδικό αριθμό με βάση τις τιμές των γνωρισμάτων του αντικειμένου της κλάσης και χρησιμοποιείται όταν το αντικείμενο εισαχθεί σε μια συλλογή (για τις συλλογές θα μιλήσουμε την επόμενη εβδομάδα). 

Τέλος η ```toString()``` επιστρέφει μια αναπαράσταση του αντικειμένου σε φιλική μορφή για τον προγραμματιστή. Μας βοηθάει ώστε να αναγνωρίζουμε εύκολα τι τιμές έχει το αντικείμενό μας. Η κλάση ```Object``` παρέχει μια όχι και τόσο χρήσιμη υλοποίηση της μεθόδου αυτής παρέχοντας το όνομα της κλάσης, το χαρακτήρα ```@``` ακολουθούμενο από τον κωδικό κατακερματισμού (hash) της κλάσης.

Σε γενικές γραμμές, μια καλή υλοποίηση της μεθόδου ```equals()``` πρέπει ν' ακολουθεί τους εξής κανόνες:

1. Έλεγχος αν ένα αντικείμενο είναι ίδιο με τον εαυτό του χρησιμοποιώντας τον τελεστή ```==```
1. Έλεγχος αν το αντικείμενο που περνάμε είναι του ίδιου τύπου, με χρήση της ```instanceof``` (η οποία καλύπτει και την περίπτωση το αντικείμενο που περνάμε να είναι ```null```)
1. Μετατροπή (cast) του αντικειμένου που περνάμε στον σωστό τύπο
1. Έλεγχος για ισότητα όλων των γνωρισμάτων των δυο αντικειμένων
1. Πάντα υπερσκελίστε την ```hashCode()``` όταν υπερσκελίζετε την ```equals()```. Δυο ίσα αντικείμενα (με βάση την ```equals()```) πρέπει να επιστρέφουν την ίδια τιμή ```hashCode()```

Π.χ.

```java
public class Car { // κλάση
  // ιδιότητες/γνωρίσματα
  private String model;
  private int maxSpeed;
  private int ccm;
  private int speed = 0;
//...
  @Override
  public boolean equals(Object o) {
	  if (o == this)
	  	return true;
	  if (!(o instanceof Car))
	  	return false;
	  Car car = (Car)o;
	  return car.model.equals(this.model) && car.maxSpeed == this.maxSpeed && car.ccm == this.ccm;
  }
  
  @Override 
  public int hashCode() {
  	int result = model.hashCode();
  	result = 31 * result + Integer.hashCode(maxSpeed);
  	result = 31 * result + Integer.hashCode(ccm);
  	return result;
	// return Objects.hash(model, maxSpeed, ccm);
  }
  
  @Override
  public String toString() {
  	return "Model: " + model + " max speed: " + maxSpeed + " ccm: " + ccm;
  }

}
```

ΟΠΕ όπως το NetBeans παρέχουν δυνατότητες ώστε να παράγετε εύκολα και γρήγορα αυτές τις μεθόδους. Απλά κάντε δεξί κλικ μέσα σε μια κλάση και επιλέξτε **Insert code --> Generate --> equals() and hashCode()** και αντίστοιχα **Insert code --> Generate --> toString()**. Θα εμφανιστεί ένα διαλογικό παράθυρο που θα σας ρωτήσει ποια γνωρίσματα θέλετε να χρησιμοποιήσετε. Επιλέξτε τα ίδια γνωρίσματα για τις ```equals()``` και ```hashCode()```. Όταν πατήσετε ```ΟΚ``` το NetBeans θα δημιουργήσει τις μεθόδους αυτές για εσάς. Επίσης, το σχόλιο μεταγλώττισης ```@AutoValue``` της [Google](https://github.com/google/auto/blob/master/value/userguide/index.md) κάνει την ίδια δουλειά. 

Για μια πιο λεπτομερή περιγραφή αυτών των μεθόδων και πώς θα πρέπει να τις υλοποιείτε, βλ. πηγή [2] κεφ. 3.

Ο τελεστής ```==``` συγκρίνει αν δυο αντικείμενα έχουν την ίδια ταυτότητα (object ID) κι όχι αν έχουν την ίδια τιμή. Αν θέλουμε να συγκρίνουμε αν οι τιμές δυο αντικειμένων είναι ίσες τότε θα πρέπει να χρησιμοποιήσουμε την μέθοδο ```equals()```.

**Σημαντική σημείωση** _Ενώ για τη σύγκριση πρωτογενών τύπων (raw types) χρησιμοποιούμε τον τελεστή ```==```, κάτι τέτοιο δε συνιστάται για τη σύγκριση αντικειμένων. Ο τελεστής ```==``` δηλώνει σύγκριση ταυτότητας των αντικειμένων αντί για ισότητα των τιμών τους. Συγκρίνει δηλ. αν η ταυτότητα του αντικειμένου ```objA``` είναι ίση με την ταυτότητα του αντικειμένου ```objB```. Για να συγκρίνουμε αν οι τιμές των δυο αντικειμένων είναι ίσες, θα πρέπει να χρησιμοποιήσουμε τη μέθοδο ```equals()```, δηλ. ```objA.equals(objB)```. Έτσι, π.χ._

```java
jshell> int num1 = 5
num1 ==> 5

jshell> int num2 = 5
num2 ==> 5

jshell> num1 == num2
$1 ==> true

jshell> Integer num1 = 5
num1 ==> 5

jshell> Integer num2 = 5
num2 ==> 5

jshell> num1 == num2
$2 ==> true

jshell> num1.equals(num2)
$3 ==> true

jshell> num1 = 150
num1 ==> 150

jshell> num2 = 150
num2 ==> 150

jshell> num1 == num2
$4 ==> false

jshell> num1.equals(num2)
$5 ==> true
``` 

_Η κλάση ```Integer``` θέλει μεγάλη προσοχή καθώς χρησιμοποιεί μια λανθάνουσα μνήμη (cache) για να αποθηκεύει τις τιμές -128 έως 127 όπως βλέπουμε στο παραπάνω δείγμα κώδικα. Επίσης το παραπάνω παράδειγμα μας δείχνει γιατί πρέπει ΠΑΝΤΑ να συγκρίνουμε αντικείμενα με τη μέθοδο ```equals()```._

Η κλάση ```Byte``` αποθηκεύει στη λανθάνουσα μνήμη όλες τις τιμές του πρωτογενούς τύπου ```byte``` (οπότε μπορούμε να συγκρίνουμε δυο τύπους ```Byte``` και με τον τελεστή ```==```). Τέλος ο τύπος ```Character``` αποθηκεύει στη λανθάνουσα μνήμη τους χαρακτήρες ```\u0000 - \u007f```.

## Διεπαφές (Interfaces)
Η Java (αντίθετα με άλλες γλώσσες προγραμματισμού όπως η C++) δεν υποστηρίζει πολλαπλή κληρονομικότητα κλάσεων. Αντιθέτως, υποστηρίζει πολλαπλή κληρονομικότητα διεπαφών.

Μία διεπαφή (interface) είναι μία δομή (παρόμοια με την κλάση) η οποία μπορεί να περιλαμβάνει:

* Δηλώσεις μεθόδων (δηλ. αφαιρετικές - abstract) χωρίς τις υλοποιήσεις τους
* Εξ'ορισμού (default) μεθόδους με τις υλοποιήσεις τους (από την έκδοση 8)
* Σταθερές (constant)

Με άλλα λόγια, αποτελεί ένα "συμβόλαιο" που θα πρέπει να υλοποιήσει μια κλάση. 

```java
public interface IShape {
	double PI = 3.1415;
	double area();
	double perimeter();
} 
```
Οι μέθοδοι και οι σταθερές μιας διεπαφής είναι εξ' ορισμού ```public```. Από την έκδοση 9 υποστηρίζονται και ```private``` μέθοδοι.

Μια κλάση μπορεί να υλοποιεί (```implements```) μια ή περισσότερες διεπαφές. Επίσης, μια διεπαφή μπορεί να κληρονομήσει άλλες διεπαφές (```extends```) αλλά όχι άλλες κλάσεις.

Μία κλάση πρέπει να υλοποιεί _όλες_ τις μεθόδους μίας διεπαφής εκτός και αν είναι δηλωμένη ως ```abstract```. Π.χ.

```java
public abstract Shape implements IShape {
    protected final Point[] points;

    Shape(int edges) {
        this.points = new Point[edges];
    }

    Shape(Point[] points) {
        this.points = points;
    }

    public int getEdges() {
        return this.points.length;
    }
}
```

Η παραπάνω κλάση δηλώνεται ως αφαιρετική (abstract) καθώς δεν υλοποιεί τις μεθόδους της διεπαφής ```IShape```.

Στη UML ένα interface αναπαρίσταται με δυο τρόπους όπως φαίνεται στην ακόλουθη εικόνα (βλ. και Εικόνα 2.2.4). Λέμε ότι η κλάση ```Shape``` _πραγματοποιεί (realizes)_ τη διεπαφή ```IShape```.

![](assets/Fig3.png)

**Εικόνα 3** _όλες_

Χαρακτηριστικές διεπαφές της γλώσσας Java:

* ```Serializable```: ονομάζεται και marker interface καθώς δεν περιέχει καμία μέθοδο προς υλοποίηση.
* ```Comparable```: καθορίζει μία φυσική σειρά για τα αντικείμενα όπως ισχύει π.χ. για τους αριθμούς.
```java
interface Comparable {
	int compareTo(T o);
}
``` 
Π.χ.
```java
class Circle extends Shape implements Comparable {

	public int compareTo(Object o) {
		if (!(o instanceof Circle)) throw new ClassCastException("must be an instance of Circle");
		if (getRadius() > ((Circle) o).getRadius())
			return 1;
		else if (getRadius() < ((Circle) o).getRadius())
			return -1;
		else
			return 0;
	}
}
```
Επιστρέφει ```0``` αν τα δυο αντικείμενα είναι ίσα (έχουν ίσες ακτίνες), ```1``` αν το αντικείμενο ```this``` είναι μεγαλύτερο απ' αυτό που περνάμε για σύγκριση, ή ```-1``` στην αντίθετη περίπτωση.

* ```Cloneable```: επιτρέπει τη δημιουργία κλώνων της κλάσης
* ```Runnable```: υλοποιείται από κάθε κλάση που προορίζεται να εκτελείται ως νήμα (thread)
```java
interface Runnable {
	public void run();
}
```
Π.χ.
```java
public class Job implements Runnable {

	public void run() {
		System.out.println("Runs in a new thread.");
	}
}
```

### Προσθήκες στις διεπαφές
Η έκδοση 8 πρόσθεσε τις έννοιες των _στατικών (static)_ και _εξ' ορισμού (default)_ μεθόδων στις διεπαφές.

Με την εισαγωγή των ροών (streams) στην έκδοση 8, υπήρξε το πρόβλημα επεκτασιμότητας των διεπαφών. Όπως μάθαμε, μια κλάση που υλοποιεί μια διεπαφή θα πρέπει να υλοποιήσει _όλες_ τις μεθόδους της διεπαφής. Αυτό δημιουργεί ζητήματα με κώδικα που χρησιμοποιεί παλαιότερες εκδόσεις της γλώσσας. Οι εξ' ορισμού (default) μέθοδοι επιτρέπουν τη μελλοντική επέκταση της γλώσσας.

Ας δούμε τι εννοούμε με ένα παράδειγμα. Η διεπαφή ```Collection``` που θα δούμε στα μαθήματα της επόμενης εβδομάδας, υπάρχει ήδη από την έκδοση 1.2 της γλώσσας. Στην έκδοση 8 έπρεπε να την αλλάξουν προσθέτοντας νέες μεθόδους (π.χ. ```stream()```). Κάτι τέτοιο όμως θα "έσπαγε" κώδικα που είχε γραφτεί πριν την έκδοση 8, καθώς ο παλιός κώδικας θα έπρεπε, όταν η εφαρμογή αναβαθμιζόταν ώστε να τρέχει με την έκδοση 8 της Java, να υλοποιήσει τις νέες μεθόδους, αλλοιώς δε θα μπορούσε να μεταγλωττιστεί. Με τη χρήση των εξ' ορισμού μεθόδων κάτι τέτοιο δεν είναι πλέον απαραίτητο. Οι εξ' ορισμού μέθοδοι παρέχουν μια εξ'ορισμού υλοποίηση κι έτσι δεν είναι απαραίτητο για τις κλάσεις που υλοποιούν (```implements```) αυτές τις διεπαφές να υλοποιήσουν τις εξ' ορισμού μεθόδους καθώς υπάρχει ήδη μια εξ' ορισμού υλοποίηση που μπορούν να χρησιμοποιήσουν. Με αυτόν τον τρόπο μπορούμε πλέον να επεκτείνουμε τις διεπαφές χωρίς να "χαλάμε" την προς τα πίσω συμβατότητα.

Οι εξ' ορισμού μέθοδοι είναι μέθοδοι με μια εξ'ορισμού υλοποίηση ώστε να λύνουν το πρόβλημα της προς τα πίσω συμβατότητας (backwards compatibility) αλλά που μπορούν να επεκταθούν από τις κλάσεις που τις υλοποιούν ώστε να αλλάξουν την εξ'ορισμού υλοποίηση αν το επιθυμούν.

Μια εξ' ορισμού (default) μέθοδος σε μια διεπαφή ορίζεται με τη λέξη-κλειδί ```default```:

```java
public interface AInterface {
    default String message() {
        return "Hallo A";
    }
}

public class A implements AInterface {
}

jshell> AInterface a = new A();
a ==> A@3c0ecd4b

jshell> a.message()
$1 ==> "Hallo A"		
```

Μια υπο-διεπαφή μπορεί να υπερσκελίσει (override) αυτή τη μέθοδο.

```java
public interface BInterface extends AInterface {
    default String message() {
        return "Hallo B";
    }
}

public class B implements BInterface {
}

jshell> AInterface b = new B();
b ==> B@64bf3bbf

jshell> b.message()
$2 ==> "Hallo B"			
```

Στο ακόλουθο παράδειγμα βλέπουμε ότι η εξ'ορισμού μέθοδος μπορεί να υπερσκελιστεί κι από μια κλάση (όχι μόνο από διεπαφή):

```java
public class C extends B {
    public String message() {
        return "Hallo C";
    }
}

jshell> AInterface c = new C();
c ==> C@6e1ec318

jshell> c.message()
$3 ==> "Hallo C"
```

Έστω η ακόλουθη δήλωση:
```java
public class D extends C implements AInterface {
}

jshell> AInterface d = new D();
d ==> D@31dc339b

jshell> d.message()
```
Τι πιστεύετε ότι θα τυπώσει η πιο πάνω εντολή;

```"Hallo C"```. Με άλλα λόγια, η κλάση νικά.

Επειδή η πολλαπλή κληρονομικότητα ισχύει για τις διεπαφές, ενδέχεται μια διεπαφή να κληρονομήσει από δυο διεπαφές που παρέχουν την ίδια εξ'ορισμού μέθοδο.

```java
public interface X {
    default String message() {
        return "Hallo X";
    }
}

public interface Y {
    default String message() {
        return "Hallo Y";
    }
}

public class XY implements X, Y {
}
```
Σ' αυτήν την περίπτωση ο μεταγλωττιστής εμφανίζει λάθος μεταγλώττισης καθώς είναι αμφίβολο ποια εξ'ορισμού μέθοδο να κληρονομήσει. Μπορούμε φυσικά να υπερσκελίσουμε το λάθος υλοποιώντας τη δική μας εξ'ορισμού μέθοδο, π.χ.:

```java
public class XY implements X, Y {
    default String message() {
        return X.super.message();
    }
}
```

Ισχύουν οι ακόλουθοι 2 κανόνες (σε περίπτωση που έχετε αμφιβολίες):

* Η κλάση υπερισχύει οποιασδήποτε διεπαφής
* Ο υπο-τύπος υπερισχύει του υπερ-τύπου (τύπος: κλάση ή διεπαφή)

Όσων αφορά τις στατικές μεθόδους στις διεπαφές:

```java
jshell> interface Z { static void print() { System.out.println("Hello Z"); }}
|  created interface Z

jshell> class ZZ implements Z {}
|  created class ZZ

jshell> Z z = new ZZ()
z ==> ZZ@3327bd23

jshell> Z.print()
Hello Z
```

Παραδείγματα στατικών μεθόδων σε διεπαφές του Java API: ```Comparator.reverseOrder, Collections.reverseOrder, Collections, sort``` κ.ά.

Η Java 9 πρόσθεσε τη δυνατότητα ορισμού _ιδιωτικών μεθόδων (private methods)_ στις διεπαφές. Πριν από την έκδοση 9, όλες οι μέθοδοι στις διεπαφές έπρεπε να είναι ```public```. Με την εισαγωγή ιδιωτικών μεθόδων στις διεπαφές, μπορείτε να αναδιοργανώσετε (refactor) τον κώδικα default μεθόδων ώστε να εισάγετε ```private``` utility methods. Οι διεπαφές πλέον γίνονται όλο και περισσότερο όμοιες με τις abstract κλάσεις.

Τα δικαιώματα πρόσβασης στις μεθόδους των διεπαφών είναι πλέον όπως περιγράφονται στον ακόλουθο πίνακα:

**Πίνακας 1** _Τροποποιητές πρόσβασης στις δηλώσεις μεθόδων στις διεπαφές_

| _Τροποποιητής Πρόσβασης_ | _Υποστηρίζεται_ | _Σχόλια_
| ```public abstract``` | Ναι | ≥ JDK 1
| ```public static``` | Ναι | ≥ JDK 8
| ```public default``` | Ναι | ≥ JDK 8
| ```private static``` | Ναι | ≥ JDK 9, δεν μπορεί να επεκταθεί (override)
| ```private``` | Ναι | ≥ JDK 9, δεν μπορεί να επεκταθεί (override)
| ```private abstract``` | Όχι | από τη μία πρέπει να επεκταθεί (```abstract```) από την άλλη δεν μπορεί (```private```) 
| ```private default``` | Όχι | από τη μία θα πρέπει να μπορεί να επεκταθεί (```abstract```) από την άλλη δεν μπορεί (```private```)


## Ανώνυμες Εσωτερικές (inner) κλάσεις
Στο προηγούμενο μάθημα μιλήσαμε για τις εσωτερικές (inner) και τις εμφωλιασμένες (nested) κλάσεις. Αφήσαμε τις ανώνυμες εσωτερικές κλάσεις (anonymous inner classes) γι' αυτό το μάθημα. Οι ανώνυμες εσωτερικές κλάσεις είναι μη στατικές εσωτερικές κλάσεις χωρίς όνομα (όταν χρησιμοποιούνται μόνο μια φορά).

```java
public interface MyInterface {

  public void aMethod();
}

MyInterface instance = new MyInterface() {

    public void aMethod() {
        System.out.println("Anonymous class aMethod()");
    }
};

instance.aMethod();  // Anonymous class aMethod()
```

## Ασκήσεις

1. Μετατρέψτε το ακόλουθο UML διάγραμμα σε κώδικα Java

![](assets/Fig4.png)

## Πηγές:
1. ["The Java Tutorial"](https://docs.oracle.com/javase/tutorial/)
1. Bloch J. (2018), _Effective Java_, 3rd Edition, Addison-Wesley.
1. Deitel P., Deitel H. (2018), _Java How to Program_, 11th Ed., Safari.
1. Downey A. B., Mayfield C. (2016), _Think Java_, O' Reilly. 
1. Eckel B. (2006), _Thinking in Java_, 4th Ed., Prentice-Hall.
1. Hillar G.C. (2017), _Java 9 with JShell_, Packt.
1. Horstmann C. S. (2016), _Core Java, Volume 1 Fundamentals_, 10th Ed., Prentice-Hall.
1. Horstmann C. S. (2018), _Core Java SE 9 for the impatient_, 2nd Ed., Addison-Wesley. 
1. Long F. et. al. (2014), _Java Coding Guidelines_, Addison-Wesley.
1. Samoylov N. (2019), _Learn Java 12 Programming_, Packt.
1. Sharan K. (2017), _Java 9 Revealed: For Early Adoption and Migration_, Apress.
1. Sierra K. & Bates B. (2005), _Head First Java_, 2nd Ed. for Java 5.0, O’Reilly.
1. [Jenkov Nested Classes](http://tutorials.jenkov.com/java/nested-classes.html)

---

[<-](../2.3-Encapsulation/README.md) | [Δ](../../README.md) | [->](../2.5-Polymorphism/README.md)

---