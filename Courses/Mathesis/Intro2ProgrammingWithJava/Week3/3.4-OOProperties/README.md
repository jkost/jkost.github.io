# 3.4 Ιδιότητες του Αντικειμενοστραφούς Προγραμματισμού
© Γιάννης Κωστάρας

---

[<](../3.3-UML/README.md) | [Δ](../../README.md) | [>](../3.5-Encapsulation/README.md)

---

[![](../../../assets/jupyter_logo.svg)](3.4-OOProperties.ipynb)

### Μαθησιακοί στόχοι
Σε αυτήν την ενότητα θα:

* δούμε ποιες είναι οι ιδιότητες που χαρακτηρίζουν τον αντικειμενοστραφή προγραμματισμό και θα μάθουμε μια από αυτές σε αυτήν την ενότητα
* μάθουμε για την στατικότητα (static)

Στο πρώτο μάθημα αυτής της βδομάδας εντρυφήσαμε στον αντικειμενοστραφή προγραμματισμό. Ποιες είναι όμως οι ιδιότητες ώστε μια γλώσσα να θεωρείται αντικειμενοστραφής;

## Ιδιότητες αντικειμενοστραφούς προγραμματισμού
Ο αντικειμενοστραφής προγραμματισμός περιλαμβάνει τέσσερεις βασικές ιδιότητες που τον χαρακτηρίζουν:

* Ενθυλάκωση (Encapsulation)
* Αφαιρετικότητα (Abstraction)
* Κληρονομικότητα (Inheritance)
* Πολυμορφισμός (Polymorphism)


## Αφαιρετικότητα
Η Αφαιρετικότητα (Abstraction) μας επιτρέπει να επικεντρωνόμαστε σ' εκείνα τα χαρακτηριστικά (γνωρίσματα) που είναι πιο σημαντικά για το πρόβλημά (την εφαρμογή) μας και να αγνοούμε τα μη σημαντικά. 

Π.χ. αν θέλουμε να φτιάξουμε ένα παιχνίδι αγώνων αυτοκινήτου, τότε μας ενδιαφέρουν τα εξής γνωρίσματα για το αυτοκίνητο: η ταχύτητά του, πόσο γρήγορα επιταχύνει/επιβραδύνει, το χρώμα του, πόσο γρήγορα στρίβει κλπ. Αν θέλουμε να φτιάξουμε μια εφαρμογή βάσης δεδομένων που ν' αποθηκεύει αυτοκίνητα για μια εταιρία ταξί τότε προφανώς ενδιαφέρει πόσες θέσεις έχει το κάθε αυτ/το, πόση είναι η αυτονομία του κλπ. Βλέπουμε λοιπόν ότι ανάλογα με το πρόβλημα που έχουμε να επιλύσουμε, κάθε φορά είναι άλλα τα χαρακτηριστικά που είναι σημαντικά για το πρόβλημά μας. 

Η αφαιρετικότητα είναι επομένως μια επιλεκτική άγνοια! Επιλέγουμε τι είναι σημαντικό και τι όχι. Ένα αυτ/το ή ένα κινητό τηλέφωνο έχει πάρα πολλά χαρακτηριστικά αλλά εμείς επιλέγουμε αυτά που μας ενδιαφέρουν.


## Στατικότητα

### Στατικά γνωρίσματα (Static attributes)

Πολλές φορές υπάρχουν δεδομένα (γνωρίσματα) που είναι τα ίδια για όλα τα αντικείμενα μιας κλάσης. Π.χ. όλα τα αυτοκίνητα έχουν 4 ρόδες, ο μέγιστος αριθμός ημερών αδείας για όλους τους υπαλλήλους κλπ. Αυτά τα γνωρίσματα ονομάζονται _στατικά_ (_static_). Τα στατικά δεδομένα (static) περιγράφουν πληροφορίες που ισχύουν για _όλα_ τα αντικείμενα της κλάσης από την οποία προέρχονται, ανήκουν δηλ. στην κλάση και όχι στο αντικείμενο. Ονομάζονται και _class data_.

Τα στατικά γνωρίσματα αρχικοποιούνται μόνο μία φορά, στην αρχή της εκτέλεσης του προγράμματος και πριν την δημιουργία οποιουδήποτε αντικειμένου της κλάσης. Ένα αντίγραφό τους κατανέμεται σε όλα τα αντικείμενα (στιγμιότυπα) της κλάσης. Μπορούμε να έχουμε πρόσβαση σε ένα στατικό γνώρισμα απευθείας ως εξής: ```<class-name>.<attribute-name>```:

Π.χ.

```java
public class Car {
  // ...
  public static final int WHEELS = 4;
  // ...
}
```

Στο πιο πάνω παράδειγμα ορίσαμε μια στατική μεταβλητή τύπου ```int``` η οποία τυχαίνει να είναι και ```final```, δηλ. η τιμή της δεν μπορεί ν' αλλάξει. Ορίσαμε δηλ. μια καθολική σταθερά. Ανάθεση στις ```final``` μεταβλητές μπορεί να γίνει μόνο μία φορά, είτε κατά τη δήλωσή τους είτε στις μεθόδους κατασκευής (constructors) για μη στατικές σταθερές, είτε σε ένα ```static``` μπλοκ για τις στατικές σταθερές όπως θα δούμε στη συνέχεια. Μπορούμε φυσικά να έχουμε και μη ```final``` στατικές μεταβλητές που η τιμή τους μπορεί ν' αλλάξει κατά την εκτέλεση του προγράμματος. 

Μπορούμε να προσπελάσουμε αυτή τη σταθερά ως εξής: ```Car.WHEELS```. Η τιμή του γνωρίσματος αυτού είναι η ίδια για όλα τα αντικείμενα της κλάσης ```Car```.

Ας δούμε ένα παράδειγμα. Ας υποθέσουμε ότι θα θέλαμε να δώσουμε έναν μοναδικό αύξοντα αριθμό για κάθε αυτοκίνητο που δημιουργούμε. Έστω π.χ. ότι δημιουργούμε 3 αυτοκίνητα, ένα Audi A3 (με αύξοντα αριθμό ```1```), ένα Fiat 500 (με αύξοντα αριθμό ```2```) κι ένα Peugeot 208 (με αύξοντα αριθμό ```3```). Πώς θα το καταφέρουμε αυτό; 


```Java
class Car { // κλάση
  // ιδιότητες/γνωρίσματα
  static int counter = 0;  
  String model;
  int maxSpeed;
  int ccm;
  int speed = 0;
  // μέθοδος δημιουργίας αντικειμένων - κατασκευαστής
  Car(String m, int s, int c) {
    ++counter;
    model = m; maxSpeed = s; ccm = c;
  }
  // ενέργειες/μέθοδοι
  void accelerate() {
     if (speed <= maxSpeed - 10)
        speed+=10;
  }
  void decelerate() {
     if (speed >= 10)
        speed-=10;
  }
  public String toString() {
     return "Car[" + "model=" + model + ", maxSpeed=" + maxSpeed + ", ccm=" + ccm + ", speed=" + speed + "]"; 
  }
    
  public static void main(String... args) {
      Car audiA3 = new Car("Audi A3", 210, 1595);
      System.out.println(audiA3.counter);
      Car fiat500 = new Car("Fiat 500", 160, 1368);
      System.out.println(fiat500.counter);
      Car peugeot208 = new Car("Peugeot 208", 175, 1199);
      System.out.println(Car.counter);      
  }
}

jshell> Car.main(null);
    1
    2
    3
```

Παρατηρήστε ότι ενώ τις δυο πρώτες φορές καλούμε την ```counter``` από τα αντικείμενα, την τρίτη φορά την καλούμε απευθείας από την κλάση (```Car.counter```) που είναι και το πιο σωστό. Πάντα να καλείτε ένα στατικό γνώρισμα από την κλάση κι όχι από το αντικείμενο.

### Στατικές μέθοδοι (Static methods)

Αντίστοιχα με τα στατικά γνωρίσματα, υπάρχουν και στατικές μέθοδοι. Ισχύουν για όλα τα αντικείμενα της κλάσης και ονομάζονται και _class methods_.

Οι στατικές μέθοδοι μπορούν να έχουν πρόσβαση ΜΟΝΟ σε στατικά δεδομένα ενώ μπορούν να καλέσουν ΜΟΝΟ άλλες στατικές μεθόδους. Όπως και με τα στατικά γνωρίσματα, για να καλέσουμε μια στατική μέθοδο αρκεί η σύνταξη: ```<class-name>.<method-name>```. Πιο γνωστό παράδειγμα μιας στατικής μεθόδου είναι η ```public static void main()```. Αυτή δίνει την δυνατότητα στο περιβάλλον της ΕΜ Java (JVM) να καλέσει την μέθοδο ```main()``` και να ξεκινήσει την εκτέλεση του προγράμματος χωρίς να είναι απαραίτητο να δημιουργηθεί πρώτα ένα αντικείμενο της κλάσης. 

Η ```println()``` είναι μια στατική μέθοδος. Παρατηρήστε ότι δεν απαιτείται να δημιουργήσουμε ένα αντικείμενο της ```System.out``` για να την καλέσουμε.

Ας δημιουργήσουμε μια στατική μέθοδο στην κλάση ```Car``` που να μας επιστρέφει τον αύξοντα αριθμό του αυτοκινήτου.


```Java
class Car { // κλάση
  // ιδιότητες/γνωρίσματα
  static int counter = 0;  
  String model;
  int maxSpeed;
  int ccm;
  int speed = 0;
  // μέθοδος δημιουργίας αντικειμένων - κατασκευαστής
  Car(String m, int s, int c) {
    ++counter;
    model = m; maxSpeed = s; ccm = c;
  }
  // ενέργειες/μέθοδοι
  void accelerate() {
     if (speed <= maxSpeed - 10)
        speed+=10;
  }
  void decelerate() {
     if (speed >= 10)
        speed-=10;
  }
  public String toString() {
     return "Car[" + "model=" + model + ", maxSpeed=" + maxSpeed + ", ccm=" + ccm + ", speed=" + speed + "]"; 
  }
    
  public static int getCounter() {
     return counter;   
  }
    
  public static void main(String... args) {
      Car audiA3 = new Car("Audi A3", 210, 1595);
      System.out.println(Car.getCounter());
      Car fiat500 = new Car("Fiat 500", 160, 1368);
      System.out.println(Car.getCounter());
      Car peugeot208 = new Car("Peugeot 208", 175, 1199);
      System.out.println(peugeot208.getCounter());      
  }
}

jshell> Car.main(null);
    1
    2
    3
```

Ένα αντικείμενο μπορεί να καλέσει μια στατική μέθοδο αλλά το σωστό είναι να καλούμε μια στατική μέθοδο από την κλάση (δηλ. ```Car.getCounter()```).

Έχουμε ήδη δει μια χρήση των στατικών μεθόδων στο 1ο μάθημα αυτής της εβδομάδας ως εναλλακτικών μεθόδων κατασκευής (alternative constructors), π.χ.


```Java
public record Point(int x, int y) { 
	public static Point of(int x, int y) {
		return new Point(x, y);
	}
}
```

Ισχύουν οι εξής κανόνες:

* μια στατική μέθοδος (static method) μπορεί να προσπελάσει ένα στατικό γνώρισμα (static attribute)
* μια μη στατική μέθοδος (instance method) μπορεί να προσπελάσει ένα στατικό γνώρισμα (static attribute)
* αντιθέτως, μια στατική μέθοδος (static method) _δεν_ μπορεί να προσπελάσει ένα μη στατικό γνώρισμα (instance attribute)

Ας δούμε ένα παράδειγμα:


```Java
public class StaticExample {
	private int var1;
	private static int var2;
	public void method1() { }
	public static void method2() {} 
   
	public static void main( String args[]) {
		// Error: var1 is NOT static
		var1 = 1;
		// OK var2 is static
		var2 = 2;
		// Error: method1() is NOT static
		method1();
		// OK method2() is static
		method2();
        new StaticExample().anInstanceMethod();
	}
    
    public void anInstanceMethod() {
        var1 = 11;  // OK
        var2 = 12;  // OK
        method1();  // OK
        method2();  // OK
    }
}
|  Error:
|  non-static variable var1 cannot be referenced from a static context
|  		var1 = 1;
|    ^--^
|  Error:
|  non-static method method1() cannot be referenced from a static context
|  		method1();
|    ^-----^
```

### Static block

Τα στατικά γνωρίσματα μπορούν επίσης να αρχικοποιηθούν σε ένα static block κώδικα το οποίο εκτελείται αμέσως μόλις φορτωθεί η κλάση στην ΕΜ, δηλ. πιο πριν και από τον constructor. Π.χ.

```java
static {
   System.out.println("static block");
}
```

```Java
class Car { // κλάση
  // ιδιότητες/γνωρίσματα
  static int counter;  
  String model;
  int maxSpeed;
  int ccm;
  int speed = 0;
 
  static {
    counter = 0;  
    System.out.println("static block " + counter);
  }  
    
  // μέθοδος δημιουργίας αντικειμένων - κατασκευαστής
  Car(String m, int s, int c) {
    ++counter;
    model = m; maxSpeed = s; ccm = c;
  }
  // ενέργειες/μέθοδοι
  void accelerate() {
     if (speed <= maxSpeed - 10)
        speed+=10;
  }
  void decelerate() {
     if (speed >= 10)
        speed-=10;
  }
  public String toString() {
     return "Car[" + "model=" + model + ", maxSpeed=" + maxSpeed + ", ccm=" + ccm + ", speed=" + speed + "]"; 
  }
    
  public static int getCounter() {
     return counter;   
  }
    
  public static void main(String... args) {
      Car audiA3 = new Car("Audi A3", 210, 1595);
      System.out.println(Car.getCounter());
      Car fiat500 = new Car("Fiat 500", 160, 1368);
      System.out.println(Car.getCounter());
      Car peugeot208 = new Car("Peugeot 208", 175, 1199);
      System.out.println(peugeot208.getCounter());      
  }
}

jshell> Car.main(null);
static block 0
1
2
3
|  Warning:
|  non-varargs call of varargs method with inexact argument type for last parameter;
|    cast to java.lang.String for a varargs call
|    cast to java.lang.String[] for a non-varargs call and to suppress this warning
|  Car.main(null);
|           ^--^
```

Παρατηρούμε ότι το static block εκτελείται μόνο μια φορά κατά την δημιουργία της κλάσης και μόνο.

### Instance block

Μπορούμε να αρχικοποιήσουμε μη στατικές μεταβλητές σε ένα μπλοκ αρχικοποίησης, π.χ.
```java
{
   speed = 0;
}
```
Παρατηρήστε ότι αν γράφαμε:
```java
{
   int speed = 0;
}
```
τότε η μεταβλητή ```speed``` ορίζεται μέσα στο μπλοκ επομένως δεν θα υπάρχει μετά το ```}```.


```Java
class Car { // κλάση
  // ιδιότητες/γνωρίσματα
  static int counter;  
  String model;
  int maxSpeed;
  int ccm;
  int speed;
 
  static {
    counter = 0;  
    System.out.println("static block " + counter);
  }
   
  {
    speed = 0;  
    System.out.println("instance block " + speed);
  }
    
  // μέθοδος δημιουργίας αντικειμένων - κατασκευαστής
  Car(String m, int s, int c) {
    ++counter;
    model = m; maxSpeed = s; ccm = c;
  }
  // ενέργειες/μέθοδοι
  void accelerate() {
     if (speed <= maxSpeed - 10)
        speed+=10;
  }
  void decelerate() {
     if (speed >= 10)
        speed-=10;
  }
  public String toString() {
     return "Car[" + "model=" + model + ", maxSpeed=" + maxSpeed + ", ccm=" + ccm + ", speed=" + speed + "]"; 
  }
    
  public static int getCounter() {
     return counter;   
  }
    
  public static void main(String... args) {
      Car audiA3 = new Car("Audi A3", 210, 1595);
      System.out.println(Car.getCounter());
      Car fiat500 = new Car("Fiat 500", 160, 1368);
      System.out.println(Car.getCounter());
      Car peugeot208 = new Car("Peugeot 208", 175, 1199);
      System.out.println(peugeot208.getCounter());      
  }
}

jshell> Car.main(null);
    static block 0
    instance block 0
    1
    instance block 0
    2
    instance block 0
    3
```

Παρατηρούμε ότι το instance block εκτελείται κάθε φορά που δημιουργείται ένα αντικείμενο της κλάσης.

Αυτή είναι η σειρά που αρχικοποιείται ένα αντικείμενο:

1. Πρώτα καλούνται όλοι οι static initializers από πάνω μέχρι κάτω 
1. Στη συνέχεια καλούνται όλοι οι instance initializers από πάνω μέχρι κάτω 
1. Στη συνέχεια καλείται ο constructor.

Επίσης, η αναφορά ```this``` δεν μπορεί να χρησιμοποιηθεί σε στατικές μεθόδους και στατικά μπλοκ αρχικοποίησης (static initializer blocks).


```Java
class Car { // κλάση
  // ιδιότητες/γνωρίσματα
  static int counter;  
  String model;
  int maxSpeed;
  int ccm;
  int speed;
 
  static {
    System.out.println("static block");
    counter = 0;
    this.speed = 0;
  }
   
  {
    System.out.println("instance block");
    speed = 0;  
  }
    
  // μέθοδος δημιουργίας αντικειμένων - κατασκευαστής
  Car(String m, int s, int c) {
    ++counter;
    model = m; maxSpeed = s; ccm = c;
  }
  // ενέργειες/μέθοδοι
  void accelerate() {
     if (speed <= maxSpeed - 10)
        speed+=10;
  }
  void decelerate() {
     if (speed >= 10)
        speed-=10;
  }
  public String toString() {
     return "Car[" + "model=" + model + ", maxSpeed=" + maxSpeed + ", ccm=" + ccm + ", speed=" + speed + "]"; 
  }
    
  public static int getCounter() {
     return counter;   
  }
    
  public static void main(String... args) {
      Car audiA3 = new Car("Audi A3", 210, 1595);
      System.out.println(Car.getCounter());
      Car fiat500 = new Car("Fiat 500", 160, 1368);
      System.out.println(Car.getCounter());
      Car peugeot208 = new Car("Peugeot 208", 175, 1199);
      System.out.println(peugeot208.getCounter());      
  }
}
|  Error:
|  non-static variable this cannot be referenced from a static context
|      this.speed = 0;
|      ^--^
``` 

Τέλος, δεν μπορούμε να δηλώσουμε τον τύπο των στατικών γνωρισμάτων με τη ```var``` καθώς δεν είναι τοπικές μεταβλητές.

```Java
class Car { // κλάση
  // ιδιότητες/γνωρίσματα
  static var counter = 0;  
  String model;
  int maxSpeed;
  int ccm;
  int speed;
 
  static {
    System.out.println("static block");
  }
   
  {
    System.out.println("instance block");
    speed = 0;  
  }
    
  // μέθοδος δημιουργίας αντικειμένων - κατασκευαστής
  Car(String m, int s, int c) {
    ++counter;
    model = m; maxSpeed = s; ccm = c;
  }
  // ενέργειες/μέθοδοι
  void accelerate() {
     if (speed <= maxSpeed - 10)
        speed+=10;
  }
  void decelerate() {
     if (speed >= 10)
        speed-=10;
  }
  public String toString() {
     return "Car[" + "model=" + model + ", maxSpeed=" + maxSpeed + ", ccm=" + ccm + ", speed=" + speed + "]"; 
  }
    
  public static int getCounter() {
     return counter;   
  }
    
  public static void main(String... args) {
      Car audiA3 = new Car("Audi A3", 210, 1595);
      System.out.println(Car.getCounter());
      Car fiat500 = new Car("Fiat 500", 160, 1368);
      System.out.println(Car.getCounter());
      Car peugeot208 = new Car("Peugeot 208", 175, 1199);
      System.out.println(peugeot208.getCounter());      
  }
}
|  Error:
|  'var' is not allowed here
|    static var counter = 0;  
|           ^-^
```

Θα μιλήσουμε για τα υπόλοιπα χαρακτηριστικά του αντικειμενοστραφούς προγραμματισμού σε επόμενα μαθήματα.

Εξασκηθείτε πάνω στην κλάση ```Car``` αυτού του μαθήματος εδώ <a href="sandbox/car.html" target="_blank"><img src="../../../assets/javaalmanac.svg" alt="javaalmanac.io" style="width:5%; height:5%;"></a>

---

[<](../3.3-UML/README.md) | [Δ](../../README.md) | [>](../3.5-Encapsulation/README.md)

---