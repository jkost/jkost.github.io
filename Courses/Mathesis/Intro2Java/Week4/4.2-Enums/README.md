# 4.2 Απαριθμημένοι Τύποι (Enums) {#Java} 
© Γιάννης Κωστάρας

---

[<-](../4.1-Exceptions/README.md) | [Δ](../../README.md) | [->](../4.3-Assertions/README.md)  
 
---
Στα μαθήματα της πρώτης εβδομάδας μιλήσαμε για τους απαριθμημένους τύπους (```enum```s) και μάλιστα μάθαμε ότι μπορούν να χρησιμοποιούνται στις εντολές ```switch```. Οι απαριθμημένοι τύποι είναι ένα σύνολο από σταθερές.

```java
enum Day {
  MON, TUE, WED, THU, FRI, SAT, SUN;
}
``` 
Κάθε ```enum``` είναι υποκλάση της κλάσης ```Enum``` και είναι σιωπηρά ```final```. Έτσι, δεν μπορούμε να κληρονομήσουμε έναν απαριθμημένο τύπο. Ένας ```enum``` όμως μπορεί να υλοποιήσει διεπαφές.

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

[<-](../4.1-Exceptions/README.md) | [Δ](../../README.md) | [->](../4.2-Assertions/README.md)  

---