# 4.2 Πολυμορφισμός
© Γιάννης Κωστάρας

---

[<](../4.1-Inheritance/README.md) | [Δ](../../README.md) | [>](../4.3-Enums/README.md)

---
[![](../../../assets/jupyter_logo.svg)](4.2-Polymorphism.ipynb)

### Μαθησιακοί στόχοι
Σε αυτήν την ενότητα θα μάθουμε:

* τι είναι η πολυμορφισμός (polymorphism) και τα διάφορα είδη του
* τι είναι στατική και δυναμική πρόσδεση (static and dynamic binding)
* τον τελεστή ```instanceof```

## Εισαγωγή
Η λέξη _πολυμορφισμός (polymorphism)_ σημαίνει "πολλές μορφές". Στον αντικειμενοστραφή προγραμματισμό σημαίνει ότι μια μέθοδος μπορεί να παίρνει πολλές μορφές. Σχετίζεται με την αποσύνδεση των μεθόδων από τους τύπους.

Υπάρχουν τα εξής είδη πολυμορφισμού: 

- υπερφόρτωση μεθόδων (method overloading)
- υπερκάλυψη/υπερσκέλιση μεθόδων (method overriding)
- δυναμική πρόσδεση (Late (Dynamic) Binding)

## Υπερφόρτωση μεθόδων (method overloading)

Αναφέρεται σε μεθόδους που έχουν το ίδιο όνομα αλλά δέχονται διαφορετικές παραμέτρους (είτε διαφορετικό αριθμό παραμέτρων είτε ίδιο αριθμό αλλά με διαφορετικούς τύπους δεδομένων).

Π.χ.

```java
import java.awt.Graphics;
import java.awt.Window;
public abstract class Shape {   
  protected abstract void draw();
  protected abstract void draw(Graphics g);
  protected abstract void draw(Graphics g, Window w);
}
```

Η μέθοδος ```draw()``` έχει υπερφορτωθεί. Το ίδιο μπορεί να γίνει και με τις μεθόδους κατασκευής (constructors). Σημειώστε ότι είναι λάθος μεταγλώττισης να ορίσετε δυο μεθόδους με το ίδιο όνομα και αριθμό και τύπο παραμέτρων που να επιστρέφουν όμως διαφορετικό τύπο δεδομένων. Η υπερφόρτωση αφορά μόνο τον τύπο και τον αριθμό των παραμέτρων.

## Επικάλυψη ή Υπερσκέλιση μεθόδων (method overriding)
Την είδαμε στο προηγούμενο μάθημα. Π.χ. η κλάση ```Circle``` επικάλυψε (δηλ. επανακαθόρισε) τις δυο ```abstract``` μεθόδους ```area()``` και ```perimeter()``` της υπερκλάσης ```Shape```. Αν θέλουμε να καλέσουμε πρώτα τον κώδικα της υπερσκελισμένης μεθόδου της υπερκλάσης μέσα στην μέθοδο της υποκλάσης, χρησιμοποιούμε τη δεσμευμένη λέξη ```super```, η οποία πρέπει να είναι η πρώτη εντολή της μεθόδου, π.χ.

```java
public double area() {
	super.area();
	//...
}
```
**Σημείωση!** _Υπερκαλυμμένες μέθοδοι μπορούν να έχουν διαφορετικούς τύπους επιστροφής φθάνει αυτοί να είναι συμμεταβλητοί (covariant), δηλ. ο τύπος δεδομένων επιστροφής της υπερκαλυμμένης μεθόδου πρέπει να είναι υποκλάση του τύπου δεδομένων επιστροφής της μεθόδου της υπερκλάσης._

Π.χ.
```java
abstract class SuperClass {
    abstract Number doCalculation(Integer a, Integer b);   
}

class SubClass extends SuperClass {
    Integer doCalculation(Integer a, Integer b) {
        return a * b;
    }
}
```
Βλέπουμε ότι ο μεταγλωττιστής δεν παραπονιέται παρόλο που η μέθοδος της υποκλάσης επιστρέφει ```Integer``` αντί για ```Number``` επειδή η ```Integer``` είναι υποκλάση της ```Number```.

Ισχύουν οι εξής κανόνες ώστε να επικαλύψουμε μια μέθοδο της υπερκλάσης:

1. Η μέθοδος της υποκλάσης πρέπει να έχει το ίδιο όνομα και τύπο και αριθμό παραμέτρων όπως και η μέθοδος της υπερκλάσης.
2. Η μέθοδος της υποκλάσης πρέπει να έχει την ίδια πρόσβαση (accessibility) ή ευρύτερη από τη μέθοδο της υπερκλάσης. Π.χ. αν η πρόσβαση στην μέθοδο της γονικής κλάσης είναι π.χ. ```protected```, η υπερσκελισμένη μέθοδος στην κλάση παιδί πρέπει να είναι ```protected``` ή ```public``` (δεν μπορεί να είναι ```private```).
3. Αν η μέθοδος επιστρέφει κάποια τιμή πρέπει να είναι του ίδιου τύπου ή υποκλάσης της υπερσκελισμένης μεθόδου της γονικής κλάσης, δηλ. συμμεταβλητή (covariant) με τον τύπο της υπερκλάσης.

### Σύγκριση Υπερκάλυψης (Override) και Υπερφόρτωσης (Overload)
Η _Υπερφόρτωση (overloading)_ μπορεί να πραγματοποιηθεί

* είτε στην ίδια κλάση με ορισμό μεθόδων με το ίδιο όνομα
* ή μέσω κληρονομικότητας με ορισμό μεθόδων με το ίδιο όνομα

Επίσης, οι μέθοδοι κατασκευής μπορούν να υπερφορτωθούν.
 
Η _Υπερκάλυψη (Overriding)_ μπορεί να συμβεί μόνο μέσω κληρονομικότητας συνήθως όταν η υπερκλάση έχει ορίσει τη μέθοδο με τον τροποποιητή ```protected```. Παραδείγματα υπερκάλυψης είδαμε στο προηγούμενο μάθημα όπου π.χ. η κλάση ```Circle``` υπερκάλυψε τις μεθόδους ```area()``` και ```perimeter()``` της κλάσης ```Shape```.

Οι ακόλουθες δηλώσεις μεθόδων _δεν_ μπορούν να υπερκαλυφθούν:

* ```private```
* ```static```
* ```final```

Μία υποκλάση δεν μπορεί να κάνει override μια ```static``` μέθοδο (στην περίπτωση αυτή γίνεται _επικάλυψη (hiding)_ όπως είδαμε στο προηγούμενο μάθημα). Μία υποκλάση δεν μπορεί να κάνει override μία ```final``` μέθοδο. Οι μέθοδοι κατασκευής δεν υπερκαλύπτονται.

Όταν μια υποκλάση υπερκαλύπτει μια μέθοδο της υπερκλάσης, θα πρέπει να δώσει τα ίδια ή περισσότερα δικαιώματα πρόσβασης, αλλά όχι λιγότερα. Π.χ. αν η γονική μέθοδος παρέχει ```protected``` πρόσβαση, τότε η υποκλάση δεν μπορεί να δώσει π.χ. πρόσβαση ```private``` (λάθος μεταγλώττισης).

## Πρόσδεση (Binding) και τύποι πρόσδεσης
Με τον όρο _Πρόσδεση (Binding)_ εννοούμε την σύνδεση δυο πραγμάτων, π.χ. τη σύνδεση μιας μεταβλητής με μια τιμή είτε το κάλεσμα μιας μεθόδου με τις παραμέτρους που της περνάμε. Υπάρχουν δυο είδη πρόσδεσης:

* _Στατική (Early ή static)_ συμβαίνει προτού εκτελεστεί το πρόγραμμα από τον μεταγλωττιστή ή τον συνδέτη (linker). Τέτοιου είδους πρόσδεση υποστηρίζεται από γλώσσες όπως η C ή η C++
* _Δυναμική (Late ή dynamic)_ γίνεται κατά την εκτέλεση του προγράμματος και υποστηρίζεται από την Java. Ο μεταγλωττιστής δε γνωρίζει εκ των προτέρων (δηλ. κατά τη μεταγλώττιση) ποιος τύπος δεδομένων θα χρησιμοποιηθεί κατά την εκτέλεση του προγράμματος. 

Π.χ.

```java
record Point(int x, int y) {}

public interface Shape {   
  double area();
  double perimeter();
  void draw();
}

record Circle(Point center, int radius) implements Shape {  

  @Override
  public double area() {
      return Math.PI * (radius * radius);
  } 

  @Override
  public double perimeter() {
    return Math.PI * 2*radius;
  } 
    
  @Override 
  public void draw() {
    System.out.println("Drawing " + this);   
  }
}

record Rectangle(Point upperLeft, int width, int height) implements Shape {  
  @Override
  public double area() {
      return width * height;
  } 
  
  @Override
  public double perimeter() {
    return 2*width + 2*height;
  }
    
  @Override 
  public void draw() {
    System.out.println("Drawing " + this);   
  }
}

jshell> Shape shape = new Circle(new Point(0,0), 10);
shape ==> Circle[center=Point[x=0, y=0], radius=10]

jshell> shape.draw();
Drawing Circle[center=Point[x=0, y=0], radius=10]

jshell> Shape shape = new Rectangle(new Point(0,0), 10, 20);
shape ==> Rectangle[upperLeft=Point[x=0, y=0], width=10, height=20]

jshell> shape.draw();
Drawing Rectangle[upperLeft=Point[x=0, y=0], width=10, height=20]
```
Όπως βλέπουμε, αποθηκεύουμε ένα αντικείμενο τύπου ```Circle``` και ένα αντικείμενο τύπου ```Rectangle``` σε ένα αντικείμενο τύπου ```Shape```. Αντί να κληθεί η ```draw()``` της ```Shape```, καλείται κάθε φορά η ```draw()``` του αντικειμένου που αποθηκεύεται στην ```shape```. Αυτό είναι αποτέλεσμα του πολυμορφισμού και της δυναμικής πρόσδεσης που υποστηρίζει η γλώσσα.

Η Java διαθέτει τον τελεστή ```instanceof``` ο οποίος μας επιτρέπει να ελέγξουμε τον τύπο ενός αντικειμένου, π.χ.

```java
if (shape instanceof Rectangle r) {
	r.draw();
}
```
Η παραπάνω σύνταξη μάλιστα είναι αυτή που εισήχθηκε στην έκδοση 14. Πριν από την έκδοση 14 κάποιος έπρεπε να γράψει:
```java
if (shape instanceof Rectangle) {
	((Rectangle)shape).draw();
}
```
### Επικάλυψη (hiding or shadowing) στατικών μεθόδων και γνωρισμάτων
**Προσοχή!** _Μια υποκλάση δεν μπορεί να υπερκαλύψει (override) τις μεθόδους κατασκευής, τις στατικές μεθόδους ή τα γνωρίσματα της υπερκλάσης. Γνωρίσματα και στατικές μέθοδοι μπορούν μόνο να επικαλυφθούν (hidden or shadowed) από γνωρίσματα και στατικές μέθοδους με το ίδιο όνομα στην υποκλάση._

Στο παρακάτω παράδειγμα ορίζουμε μια στατική μέθοδο ```display()``` στην υποκλάση με την ίδια δήλωση όπως και στην υπερκλάση. Όπως είπαμε πιο πάνω, οι στατικές μέθοδοι δεν μπορούν να υπερκαλυφθούν, με αποτέλεσμα στην ουσία να _αποκρύπτουμε (hide)_ την μέθοδο της υπερκλάσης.

```java
jshell> class SuperClass {
   ...>     public static void display() {
   ...>         System.out.println("I 'm the SuperClass");
   ...>     } 
   ...> }
|  created class SuperClass
    
jshell> SuperClass sc = new SuperClass();
sc ==> SuperClass@5910e440
    
jshell> sc.display();
I 'm the SuperClass    

jshell> class SubClass extends SuperClass {
   ...>     public static void display() {
   ...>         System.out.println("I 'm the SubClass");
   ...>     } 
   ...> }
|  created class SubClass

jshell> SuperClass ssc = new SubClass();
ssc ==> SubClass@246b179d

jshell> ssc.display();
I 'm the SuperClass
```

Βέβαια, θα πρέπει πάντα να καλείτε στατικές μεθόδους και γνωρίσματα από την κλάση κι όχι από κάποιο αντικείμενο καθώς ανήκουν στην κλάση κι όχι σε κάποιο αντικείμενο:

```java
jshell> SuperClass.display();
I 'm the SuperClass

jshell> SubClass.display();
I 'm the SubClass
```
Με άλλα λόγια, η δυναμική πρόσδεση ισχύει μόνο για τις μη στατικές μεθόδους (instance methods).

Ας δούμε ένα ακόμα παράδειγμα:

```java
jshell> class Item {
   ...>     protected int price = 10; // default price
   ...> }
|  created class Item

jshell> class Mouse extends Item {
   ...>     protected int price = 20;
   ...> }
|  created class Mouse

jshell> Item i = new Item();
i ==> Item@6193b845

jshell> i.price
$6 ==> 10

jshell> Item i = new Mouse();
i ==> Mouse@c4437c4

jshell> i.price
$8 ==> 10
    
jshell> Mouse m = new Mouse();
m ==> Mouse@1a6c5a9e

jshell> m.price
$10 ==> 20
```
Η δυναμική πρόσδεση δεν ισχύει για γνωρίσματα. Στο παραπάνω παράδειγμα η δήλωση του γνωρίσματος ```price``` στην υποκλάση επισκιάζει (shadow/hide) το γνώρισμα με το ίδιο όνομα της υπερκλάσης. Θεωρήστε τα ότι είναι δυο διαφορετικά γνωρίσματα παρόλο που έχουν το ίδιο όνομα.

### Σειρά εκτέλεσης υπερσκελισμένης μεθόδου στον constructor
Ένα από τα πιο συνηθισμένα bugs είναι η κλήση μιας υπερσκελισμένης μεθόδου στον constructor της υπερκλάσης. Ας δούμε ένα ακόμα παράδειγμα (είδαμε άλλο ένα στο προηγούμενο μάθημα):
```java
public interface IShape {
    double area();
    double perimeter();
    void draw();
}

public abstract class Shape implements IShape {

    protected final Point[] points;

    Shape(int edges) {
        this.points = new Point[edges];
        draw(); // (2)
    }

    Shape(Point[] points) {
        this.points = points;
    }

    public int getEdges() {
        return this.points.length;
    }
    
    @Override
    public void draw() {
        System.out.println("Draws a shape...");
    }
}

public class Rectangle extends Shape {

    private final int width, height;

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
        return 2 * width + 2 * height;
    }
    
    @Override
    public void draw() {
        System.out.println("Draws a rectangle...");
    }    
}

public class Circle extends Shape {

    private final int radius;

    Circle() {
        super(1);	// (1)
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
        return Math.PI * 2 * radius;
    }

    @Override
    public void draw() {
        System.out.println("Draws a circle...");	// (3)
    }
}

public class Main {
    public static void main(String[] args) {
        Shape s = new Circle();
        s.draw();	// (4)
    }
}
```
Τι θα τυπώσει ο παραπάνω κώδικας; Το NetBeans ήδη προειδοποιεί: ```Overridable method call in constructor```. Η επικαλυμμένη (overriden) μέθοδος ```draw()``` καλείται από τον constructor της ```Shape```. Ενώ θα περιμέναμε η κλήση της ```draw()``` στον constructor της ```Shape``` να καλέσει την ```Shape.draw()```, καλεί την ```Circle.draw()``` γι' αυτό και η έξοδος του προγράμματος εκτυπώνει:

```
Draws a circle...
Draws a circle...
```

Πιο αναλυτικά η ροή του προγράμματος φαίνεται στα νούμερα μέσα στις παρενθέσεις.

Εξασκηθείτε εδώ <a href="sandbox/shape.html" target="_blank"><img src="../../../assets/javaalmanac.svg" alt="javaalmanac.io" style="width:5%; height:5%;"></a>.

## Περίληψη
Ας δούμε περιληπτικά τι μάθαμε σε αυτό το μάθημα.

* Υπάρχουν τρία είδη πολυμορφισμού: υπερφόρτωση μεθόδων (overloading), επικάλυψη μεθόδων (overriding) και πρόσδεση (binding) που μπορεί να είναι στατική (δεν υποστηρίζεται από τη Java) ή δυναμική (υποστηρίζεται από την Java).
* Ενώ overloading υποστηρίζεται και από μεθόδους κατασκευής και από στατικές και μη στατικές μεθόδους τόσο στην ίδια κλάση όσο και στις υποκλάσεις της, η επικάλυψη μεθόδων (overriding) υποστηρίζεται μόνο από τις υποκλάσεις και μόνο για τις μη στατικές (instance) μεθόδους
* Μέθοδοι κατασκευής, στατικές μέθοδοι και γνωρίσματα _δεν_ υπερσκελίζονται, αλλά επισκιάζονται (hidden/shadowed).
*  Μια στατική μέθοδος δεν μπορεί να επικαλύψει μια μη στατική μέθοδο της υπερκλάσης και το αντίθετο (δηλ. μια instance method δεν μπορεί να υπερσκελίσει μια static μέθοδο).

---

[<](../4.1-Inheritance/README.md) | [Δ](../../README.md) | [>](../4.3-Enums/README.md)

---