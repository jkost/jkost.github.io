# 4.2 Απαριθμημένοι Τύποι (Enums) {#Java} 
© Γιάννης Κωστάρας

---

[<-](../4.1-Exceptions/README.md) | [Δ](../../README.md) | [->](../4.3-Annotations/README.md)  
 
---
Στα μαθήματα της πρώτης εβδομάδας μιλήσαμε για τους απαριθμημένους τύπους (```enum```s) και μάλιστα μάθαμε ότι μπορούν να χρησιμοποιούνται στις εντολές ```switch```. Οι απαριθμημένοι τύποι είναι ένα σταθερό πλήθος από σταθερές. Συνίσταται να χρησιμοποιείτε ```enum```s αντί για μια σειρά από σταθερές (```public static final```). 

Πριν την έκδοση 5 της Java που εισήγαγε τους απαριθμημένους τύπους, οι προγραμματιστές έπρεπε να γράψουν π.χ.:

```java
public static final int MON = 1;
public static final int TUE = 2;
public static final int WED = 3;
public static final int THU = 4;
public static final int FRI = 5;
public static final int SAT = 6;
public static final int SUN = 7;

public static final int JAN = 1;
public static final int FEB = 2;
...
public static final int DEC = 12;
```
Οι παραπάνω δηλώσεις έχουν ένα σωρό προβλήματα. Καθώς δεν υπάρχουν χώροι ονοματοδοσίας (namespaces) στη Java (όπως υπάρχουν σε άλλες γλώσσες, π.χ. C++), ο μεταγλωττιστής δεν παραπονιέται αν κατά λάθος ο προγραμματιστής γράψει:

```java
int numOfDays = FRI - FEB;
```
το οποίο είναι ένα λογικό λάθος, καθώς ο μεταγλωττιστής "βλέπει" μόνο ακέραιες τιμές. Αν αλλάξουν οι τιμές των σταθερών, το πρόγραμμα θα πρέπει να επαναμεταγγλωτιστεί αλλοιώς ο καλών κώδικας θα χρησιμοποιεί λάθος τιμές. Όταν εμφανίζετε τις τιμές, θα βλέπετε τις ακέραιες τιμές κι όχι το τι σημαίνουν (π.χ. ```1``` αντί για ```MON```) και χρειάζεται κάποια κλάση μετατροπής αν θέλετε να εμφανίζετε ένα ```String``` αντί της τιμής. Δεν είναι επίσης εύκολο να απαριθμήσετε τις τιμές ή να δείτε εύκολα το σύνολο των τιμών (π.χ. σύνολο 7 ημέρες, 12 μήνες).

Για τους παραπάνω λόγους η Java από την έκδοση 5 εισήγαγε τους απαριθμημένους τύπους, π.χ.

```java
enum Day {
  MON, TUE, WED, THU, FRI, SAT, SUN;
}
``` 
Κάθε ```enum``` είναι υποκλάση της κλάσης ```Enum``` και είναι σιωπηρά ```final```. Έτσι, δεν μπορούμε να κληρονομήσουμε έναν απαριθμημένο τύπο. Ένας ```enum``` όμως μπορεί να υλοποιήσει διεπαφές. Οι ```enum```s στη Java όμως έχουν περισσότερες δυνατότητες από άλλες γλώσσες προγραμματισμού.

```java
jshell> Day.values()
$1 ==> Day[7] { MON, TUE, WED, THU, FRI, SAT, SUN }

jshell> Day.MON.toString()
$2 ==> "MON"

jshell> Day.MON.ordinal()			// εμφανίζει τη σειρά του στοιχείου στον enum
$3 ==> 0

jshell> Day.valueOf("MON")			// αντίστροφη της toString()
$4 ==> MON
```
Μη βασίζεστε τόσο στην μέθοδο ```ordinal()```. Αυτή συνήθως χρησιμοποιείται από δομές δεδομένων όπως ```EnumSet``` και ```EnumMap``` που είδαμε στα μαθήματα της προηγούμενης εβδομάδας. 

Οι ```enum```s μπορούν να οριστούν τόσο μέσα όσο και έξω από μια κλάση, αλλά όχι μέσα σε μια μέθοδο.

Καθώς οι ```enum```s είναι κλάσεις, μπορούμε να ορίσουμε μεθόδους μέσα σ' αυτούς, ακόμα και τη ```main()```. Μπορούμε επίσης να ορίσουμε μεθόδους κατασκευής (constructors) και γνωρίσματα, αλλά οι σταθερές πρέπει να ορίζονται πάντα πρώτες.

```java
enum Day {
  MON("Monday"), TUE("Tuesday"), WED("Wednesday"), THU("Thursday"), FRI("Friday"), SAT("Saturday"), SUN("Sunday");
  String day;
  
  Day(String d) {
  	day = d;
  }	
  
  String getDay() {
  	return day;
  }
}
```
Σημειώστε ότι η μέθοδος κατασκευής (constructor) ενός ```enum``` είναι πάντοτε ```private```. Τέλος, οι ```enum```s είναι από τη φύση τους αμετάβλητοι (immutable).

Άλλες δυνατότητες που διαθέτουν οι απαριθμημένοι τύποι (υλοποιήσεις μεθόδων σταθερών τιμών):

```java
// Enum type with constant-specific method implementations
public enum Operation {
	PLUS {public long apply(long x, long y){return x + y;}},
	MINUS {public long apply(long x, long y){return x - y;}},
	TIMES {public long apply(long x, long y){return x * y;}},
	DIVIDE {public long apply(long x, long y){return x / y;}};

	public abstract long apply(long x, long y);
}
```

Επίσης, οι απαριθμημένοι τύποι μπορούν να εμφωλιαστούν (nest), δηλ.

```java
enum OuterEnum {
//...

    private enum InnerEnum {
	
	}

}
```
Τέλος, μπορούν να υλοποιούν διεπαφές, π.χ.

```java
public interface Operation {
	long apply(long x, long y);
}

public enum BasicOperation implements Operation {
	PLUS {public long apply(long x, long y){return x + y;}},
	MINUS {public long apply(long x, long y){return x - y;}},
	TIMES {public long apply(long x, long y){return x * y;}},
	DIVIDE {public long apply(long x, long y){return x / y;}};
}
```

## Ασκήσεις
1. Τροποποιήστε το ```eunm Operation``` ώστε:

```java
jshell> int a = 4, b = 2;
a ==> 4
b ==> 2

jshell> Operation op = Operation.PLUS;
op ==> Operation.PLUS

jshell> System.out.print(a + " " + op + " " + b + " = " + op.apply(x, y));
4 + 2 = 6
``` 
 

## Πηγές:
1. ["The Java Tutorial"](https://docs.oracle.com/javase/tutorial/)
1. Bloch J. (2018), _Effective Java_, 3rd Edition, Addison-Wesley.
1. Deitel P., Deitel H. (2018), _Java How to Program_, 11th Ed., Safari.
1. Downey A. B., Mayfield C. (2016), _Think Java_, O' Reilly. 
1. Eckel B. (2006), _Thinking in Java_, 4th Ed., Prentice-Hall.
1. Hillar G.C. (2017), _Java 9 with JShell_, Packt.
1. Horstmann C. S. (2016), _Core Java, Volume 1 Fundamentals_, 10th Ed., Prentice-Hall.
1. Horstmann C. S. (2018), _Core Java SE 9 for the impatient_, 2nd Ed., Addison-Wesley. 
1. Sharan K. (2017), _Java 9 Revealed: For Early Adoption and Migration_, Apress.
1. Sierra K. & Bates B. (2005), _Head First Java_, 2nd Ed. for Java 5.0, O’Reilly.

---

[<-](../4.1-Exceptions/README.md) | [Δ](../../README.md) | [->](../4.2-Annotations/README.md)  

---