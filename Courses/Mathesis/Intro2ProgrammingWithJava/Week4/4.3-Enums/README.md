# 4.3 Απαριθμημένοι Τύποι (Enums)
© Γιάννης Κωστάρας

---

[<](../4.2-Polymorphism/README.md) | [Δ](../../README.md) | [>](../4.4-JavaDoc/README.md)  
 
---
[![](../../../assets/jupyter_logo.svg)](4.3-Enums.ipynb)

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
public static final int MAR = 3;
public static final int APR = 4;
public static final int MAY = 5;
public static final int JUN = 6;
public static final int JUL = 7;
public static final int AUG = 8;
public static final int SEP = 9;
public static final int OCT = 10;
public static final int NOV = 11;
public static final int DEC = 12;
```
Οι παραπάνω δηλώσεις έχουν ένα σωρό προβλήματα. Καθώς δεν υπάρχουν χώροι ονοματοδοσίας (namespaces) στη Java (όπως υπάρχουν σε άλλες γλώσσες, π.χ. C++), ο μεταγλωττιστής δεν παραπονιέται αν κατά λάθος ο προγραμματιστής γράψει:

```java
jshell> int numOfDays = FRI - FEB;
numOfDays ==> 3
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

Καθώς οι ```enum```s είναι κλάσεις, μπορούμε να ορίσουμε μεθόδους μέσα σ' αυτούς, ακόμα και τη ```main()```. Σημειώστε ότι οι μέθοδοι κατασκευής (constructors) ενός ```enum``` είναι πάντοτε ```private```. Τέλος, οι ```enum```s είναι από τη φύση τους αμετάβλητοι (immutable).

Μπορούμε επίσης να ορίσουμε επιπλέον μεθόδους κατασκευής (constructors) και γνωρίσματα, αλλά οι σταθερές πρέπει να ορίζονται πάντα πρώτες.

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
  
  void setDay(String d) {
  	this.day = d; 
  }
}
```
Αν ορίζονται γνωρίσματα σ' ένα enum, όπως στο ανωτέρω παράδειγμα, επιτρέπεται να υπάρχουν setters που αλλάζουν τη _τιμή_ ενός enum, π.χ.

```java
jshell> Day d = Day.MON;
d ==> MON

jshell> d.setDay("Δευτέρα")

jshell> d.getDay()
$60 ==> "Δευτέρα"
```

Οι απαριθμημένοι τύποι μπορούν να περιέχουν αφηρημένες μεθόδους, αλλά σ' αυτήν την περίπτωση κάθε τιμή του θα πρέπει να υπερσκελίζει τις αφηρημένες μεθόδους αυτή:

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

Η αρχικοποίηση ενός enum είναι αντίστροφη από αυτήν μιας κλάσης: 

1. Πρώτα αρχικοποιούνται οι σταθερές (constants)
2. Στη συνέχεια εκτελούνται οι instance initializers 
3. Μετά οι κατασκευαστές (constructors) και
4. Τέλος οι static initializers 

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

---

[<](../4.2-Polymorphism/README.md) | [Δ](../../README.md) | [>](../4.4-JavaDoc/README.md)    

---