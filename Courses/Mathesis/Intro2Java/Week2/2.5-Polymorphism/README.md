# 2.5 Πολυμορφισμός {#Java} 
© Γιάννης Κωστάρας

---

[<-](../2.4-Inheritance/README.md) | [Δ](../../README.md) | [->](../2.6-JavaDoc/README.md)

---

Η λέξη _πολυμορφισμός (polymorphism)_ σημαίνει "πολλές μορφές". Στον αντικειμενοστραφή προγραμματισμό σημαίνει ότι μια μέθοδος μπορεί να παίρνει πολλές μορφές. Σχετίζεται με την αποσύνδεση των μεθόδων από τους τύπους.

Υπάρχουν τα εξής είδη πολυμορφισμού: 

- υπερφόρτωση μεθόδων (method overloading)
- υπερκάλυψη/υπερσκέλιση μεθόδων (method overriding)
- δυναμική πρόσδεση (Late (Dynamic) Binding)

## Υπερφόρτωση μεθόδων (method overloading)

Αναφέρεται σε μεθόδους που έχουν το ίδιο όνομα αλλά δέχονται διαφορετικές παραμέτρους (είτε διαφορετικό αριθμό παραμέτρων είτε ίδιο αριθμό αλλά με διαφορετικούς τύπους δεδομένων).

Π.χ.

```java
public class Shape {   
  protected abstract void draw();
  protected abstract void draw(Graphics g);
}
```

Η μέθοδος ```draw()``` έχει υπερφορτωθεί. Το ίδιο μπορεί να γίνει και με τις μεθόδους κατασκευής (constructors). Σημειώστε ότι είναι λάθος μεταγλώττισης να ορίσετε δυο μεθόδους με το ίδιο όνομα και αριθμό και τύπο παραμέτρων που να επιστρέφουν όμως διαφορετικό τύπο δεδομένων. Η υπερφόρτωση αφορά μόνο τον τύπο και τον αριθμό των παραμέτρων.

## Υπερκάλυψη μεθόδων (method overriding)
Την είδαμε στο προηγούμενο μάθημα. Π.χ. η κλάση ```Circle``` υπερκάλυψε (δηλ. επανακαθόρισε) τις δυο ```abstract``` μεθόδους ```area()``` και ```perimeter()``` της υπερκλάσης ```Shape```. Αν θέλουμε να καλέσουμε πρώτα τον κώδικα της υπερσκελισμένης μεθόδου της υπερκλάσης μέσα στην μέθοδο της υποκλάσης, χρησιμοποιούμε τη δεσμευμένη λέξη ```super```, π.χ.

```java
public double area() {
	super.area();
	//...
}
```

### Σύγκριση Υπερκάλυψης (Override) και Υπερφόρτωσης (Overload)
Η _Υπερφόρτωση (overloading)_ μπορεί να πραγματοποιηθεί

* είτε στην ίδια κλάση με ορισμό μεθόδων με το ίδιο όνομα
* ή μέσω κληρονομικότητας με ορισμό μεθόδων με το ίδιο όνομα

Επίσης, οι μέθοδοι κατασκευής μπορούν να υπερφορτωθούν.
 
Η _Υπερκάλυψη (Overriding)_ μπορεί να συμβεί μόνο μέσω κληρονομικότητας συνήθως όταν η υπερκλάση έχει ορίσει το γνώρισμα ή τη μέθοδο με τον τροποποιητή ```protected```. Παραδείγματα υπερκάλυψης είδαμε στο προηγούμενο μάθημα όπου π.χ. η κλάση ```Circle``` υπερκάλυψε τις μεθόδους ```area()``` και ```perimeter()``` της κλάσης ```Shape```.

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
public class PaintApp {

	public void draw(Shape s) {
		//...
		s.draw();
	}
}

PaintApp app = new PaintApp();
Shape circle = new Circle()
Shape rectangle = new Rectangle();
app.draw(circle);
app.draw(rectangle);
```

Όπως βλέπουμε, η μέθοδος ```draw()``` δέχεται ως όρισμα ένα αντικείμενο τύπου ```Shape```. Δεν μπορεί να γνωρίζει εκ των προτέρων αν αυτό είναι ```Circle``` ή ```Rectangle``` παρά μόνο κατά την εκτέλεση του προγράμματος. 

Η Java διαθέτει τον τελεστή ```instanceof``` ο οποίος μας επιτρέπει να ελέγξουμε τον τύπο ενός αντικειμένου, π.χ.

```java
if (s instanceof Circle) {
	((Circle)c).getRadius();
}
```

Ένα από τα πιο συνηθισμένα bugs είναι η κλήση μιας υπερσκελισμένης μεθόδου στον constructor της υπερκλάσης. Ας δούμε ένα παράδειγμα:

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
        draw();	// (2)
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
Τι θα τυπώσει ο παραπάνω κώδικας; Το NetBeans ήδη προειδοποιεί: ```Overridable method call in constructor```. Η υπερφορτωμένη μέθοδος ```draw()``` καλείται από τον constructor της ```Shape```. Ενώ θα περιμέναμε η κλήση της ```draw()```
στον constructor της ```Shape``` να καλέσει την ```Shape.draw()```, καλεί την ```Circle.draw()``` γι' αυτό και η έξοδος του προγράμματος εκτυπώνει:

```
Draws a circle...
Draws a circle...
```

Πιο αναλυτικά η ροή του προγράμματος φαίνεται στα νούμερα μέσα στις παρενθέσεις.

---

[<-](../2.4-Inheritance/README.md) | [Δ](../../README.md) | [->](../2.6-JavaDoc/README.md)

---