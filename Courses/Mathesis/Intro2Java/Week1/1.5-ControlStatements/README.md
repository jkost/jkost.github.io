# 1.5 Εντολές Αποφάσεων {#Java} 
© Γιάννης Κωστάρας

---

[<-](../1.4-Strings/README.md) | [Δ](../../README.md) | [->](../1.6-Loops/README.md)

---

Η Java διαθέτει δυο εντολές αποφάσεων ή ελέγχου ροής: ```if``` και ```switch```.

## Εντολή ```if```
Σύνταξη:
```java
if (συνθήκη) {
   εντολές
} else if (συνθήκη) {
   εντολές
} ... 
} else {
   εντολές
}
```
Η _συνθήκη_ είναι μια λογική μεταβλητή (boolean) ή μια έκφραση που επιστρέφει λογική τιμή.

Π.χ.
```java
if (grade > 17) {
  System.out.println("Άριστα");
} else if (grade > 15) { 
  System.out.println("Πολύ καλά");
} else if (grade > 13) {
  System.out.println("Καλά");
} else if (grade >= 10) {
  System.out.println("Μέτρια");
} else {
  System.out.println("Απορριπτέος");
}
```

Μπορούμε να εμφωλιάσουμε εντολές ```if```:
```java
if ("ν".equals(answer)) {
   if (i >= 0) {
	k += 1;
   } else {
	k -= 1
   }
}
```
Στο πιο πάνω παράδειγμα βλέπουμε μια εντολή ```if``` η οποία περιέχει άλλη μια εντολή ```if```.

## Τριαδικός τελεστής

Η εντολή απόφασης
```java
if (συνθήκη) {
   εντολές
} else {
   εντολές
}
```
μπορεί να γραφεί και ως:
```java
μεταβλητή = (συνθήκη) ? εντολές αν true : εντολές αν false
```
Ο τελεστής ```?``` ονομάζεται _τριαδικός τελεστής_.

Π.χ.
```java
String result = (num > 0) ? "θετικός" : "αρνητικός";
```

## Εντολή ```switch```
Σύνταξη:

```java
switch(μεταβλητή) {
  case τιμή: 
    εντολές
    break;
  case τιμή: 
    εντολές
    break;
  ...
  default:
   εντολές
}
```
Η _μεταβλητή_ μπορεί να είναι είτε αριθμητικού τύπου (```char, byte, short, int, Character, Byte, Short, Integer```), είτε συμβολοσειρά (```String```), είτε τύπου ```enum```. ```enum``` είναι ένας ειδικός τύπος δεδομένων που επιτρέπει να ορίζουμε ένα καθορισμένο αριθμό σταθερών τιμών. ```Character, Byte, Short, Integer``` είναι οι αντίστοιχες κλάσεις των πρωτογενών τύπων ```char, byte, short, int```. Θα μιλήσουμε για τις κλάσεις την επόμενη εβδομάδα.

Ας δούμε ένα παράδειγμα όπου ο έλεγχος γίνεται με ```enum```:
```java
enum Choice {
  RED_PILL, BLUE_PILL
}
Choice choice = ...;  // Choice.RED_PILL ή Choice.BLUE_PILL
switch (choice) {
  case Choice.BLUE_PILL:
	System.out.println("Συνέχισε να κοιμάσαι...");
       break;  
  case Choice.RED_PILL:
	System.out.println("Καλωσήρθες στο Matrix!");
       break;
}
```

Παράδειγμα ελέγχου με αλφαριθμητικό:

```java
final String dayOfWeek = "Saturday";
String result = ""; 
switch (dayOfWeek) {
  case "Sunday":                 
    result = "Κυριακή"; 
    break; 
  case "Monday": 
    result = "Δευτέρα"; 
    break; 
  case "Tuesday": 
    result = "Τρίτη"; 
    break; 
  case "Wednesday": 
    result = "Τετάρτη"; 
    break; 
  case "Thursday": 
    result = "Πέμπτη"; 
    break; 
  case "Friday": 
    result = "Παρασκευή"; 
    break; 
  case "Saturday": 
    result = "Σάββατο"; 
    break; 
  default: 
    result = "Error: " + dayOfWeek + 
             " is not a day of the week"; 
    break; 
} 
System.out.println(result);
``` 
Έξοδος:
```bash
> Σάββατο
```

Ακόμα ένα παράδειγμα:
```java
Scanner scan = new Scanner(System.in);
String choice = scan.next();
switch (choice) {
  case "one":
	System.out.println(1);
       break;
  case "two":
	System.out.println(2);
       break;  
  default:
	System.out.println(-1);
}
```
Η ```Scanner``` μας επιτρέπει να διαβάζουμε την μονάδα εισόδου (δηλ. το πληκτρολόγιο). Στο πιο πάνω παράδειγμα διαβάζει μια συμβολοσειρά από την είσοδο, την αποθηκεύει στη μεταβλητή ```choice``` και αν είναι ```"one"``` ή ```"two"``` εμφανίζει στην είσοδο ```1``` ή ```2``` αλλοιώς ```-1```.

Το πιο πάνω παράδειγμα της εντολής ```if``` μπορεί να γραφτεί κι ως εξής (_fall through_):
```java
switch (grade) {
  case 20:
  case 19:
  case 18:
	System.out.println("Άριστα");
       break;
  case 17:
  case 16:
	System.out.println("Πολύ καλά");
       break;
  ...  
  default:
	System.out.println("Απορριπτέος");
}
```

### Νέα ```switch```
Στην έκδοση 12 της γλώσσας εισήχθηκε μια νέα σύνταξη για τη ```switch``` η οποία ήταν στη φάση της προεπισκόπισης (preview) μέχρι και την έκδοση 14 (οπότε και έγινε κανονικό χαρακτηριστικό της γλώσσας) ώστε οι προγραμματιστές να μπορούν να παρέχουν ανατροφοδότηση (feedback) από τη χρήση της και πιθανές βελτιώσεις σε μελλοντικές εκδόσεις της γλώσσας. Για να μπορέσετε να τη χρησιμοποιήσετε θα πρέπει να περάσετε την παράμετρο ```--enable-preview``` στο jshell της έκδοσης 12 και 13 όπως φαίνεται ακολούθως (δεν απαιτείται πλέον στην έκδοση 14 ή νεώτερη):

```java
$> jshell --enable-preview
|  Welcome to JShell -- Version 12
|  For an introduction type: /help intro

jshell> 
```

Η εντολή ```switch```, όπως την περιγράψαμε προηγουμένως, έχει αρκετά μειονεκτήματα. Π.χ. αν ξεχάσουμε μια εντολή ```break``` τότε η εκτέλεση του προγράμματος συνεχίζεται και στο επόμενο μπλοκ εντολής όπως είδαμε στο προηγούμενο παράδειγμα με τις βαθμολογίες. Αυτό μπορεί να γίνει εσκεμμένα, αλλά είναι πολύ εύκολο να γίνει και από λάθος το οποίο δε μπορεί να βρει ο μεταγλωττιστής (δηλ. είναι λογικό λάθος). 

Η νέα σύνταξη έχει ως εξής: 

```java
switch(μεταβλητή) {
  case τιμή -> εντολές;
  case τιμή -> εντολές;
  ...
  default -> εντολές;
}
```
Ας ξαναγράψουμε ένα από τα προηγούμενα παραδείγματα με τη νέα σύνταξη:

```java
jshell> String dayOfWeek = "Saturday";
dayOfWeek ==> "Saturday"

jshell> String result = "";
result ==> ""
 
jshell> switch (dayOfWeek) {
  case "Sunday" -> result = "Κυριακή"; 
  case "Monday" -> result = "Δευτέρα"; 
  case "Tuesday" -> result = "Τρίτη"; 
  case "Wednesday" -> result = "Τετάρτη"; 
  case "Thursday" -> result = "Πέμπτη"; 
  case "Friday" -> result = "Παρασκευή"; 
  case "Saturday" -> result = "Σάββατο"; 
  default -> result = "Error: " + dayOfWeek + 
             " is not a day of the week"; 
} 
$3 ==> "Σάββατο"

jshell> System.out.println(result);
Σάββατο
```
Βλέπετε πως δεν απαιτείται η ```break```. Η περίπτωση _fall through_ μπορεί να γραφτεί ως εξής:

```java
jshell> int grade = 17;
grade ==> 17

jshell> switch (grade) {
  case 20, 19, 18 -> System.out.println("Άριστα");
  case 17, 16 -> System.out.println("Πολύ καλά");
  case 15, 14 -> System.out.println("Καλά");
  case 10, 13 -> System.out.println("Μέτρια");
  default -> System.out.println("Απορριπτέος");
}
Πολύ καλά
```
Τέλος, η ```switch``` δεν είναι πλέον απλά μια εντολή, αλλά έχει μετατραπεί σε έκφραση, δηλ. μπορείτε να επιστρέψετε κάποια τιμή:

```java
jshell> String result = switch (dayOfWeek) {
  case "Sunday" -> result = "Κυριακή"; 
  case "Monday" -> result = "Δευτέρα"; 
  case "Tuesday" -> result = "Τρίτη"; 
  case "Wednesday" -> result = "Τετάρτη"; 
  case "Thursday" -> result = "Πέμπτη"; 
  case "Friday" -> result = "Παρασκευή"; 
  case "Saturday" -> result = "Σάββατο"; 
  default -> result = "Error: " + dayOfWeek + 
             " is not a day of the week"; 
} 
result ==> "Σάββατο"
```
Τέλος, μπορούμε να γράψουμε και μπλοκ εντολών μετά το ```->```, όπως φαίνεται στο παρακάτω παράδειγμα, χρησιμοποιώντας την ```yield``` για να επιστρέψουμε την τιμή:

```java
int score = switch (day) {
    case MONDAY, FRIDAY, SUNDAY -> 6;
    case TUESDAY                -> 7;
    default -> {
      String s = day.toString();
      int result = s.length();
      yield result;
    }
};
```

## Ασκήσεις
1. Να γράψετε πρόγραμμα που βρίσκει τις λύσεις της δευτεροβάθμιας εξίσωσης. Ο χρήστης δίνει 3 αριθμούς α,β,γ που είναι οι παράμετροι της δευτεροβάθμιας εξίσωσης αx&sup2; + βx+ γ = 0. Το πρόγραμμα τυπώνει τις λύσεις της εξίσωσης.
2. Γράψτε ένα πρόγραμμα που θα διαβάζει 3 αριθμούς και θα επιστρέφει τον μεγαλύτερο από τους 3.
3. Υπολογίστε αν ένα έτος είναι δίσεκτο. Ένα έτος είναι δίσκεκτο αν διαιρείται με το 4 αλλά όχι με το 100 ή διαιρείται με το 400. 
4. Δοθείσας μιας ημερομηνίας, να υπολογίσετε την ημέρα από την αρχή του έτους. Π.χ. αν δώσει ο χρήστης ```14/2/2020``` το πρόγραμμα θα εκτυπώνει: ```Η 14/2/2020 είναι η 45η ημέρα του 2020. Μένουν άλλες 321 ημέρες μέχρι το τέλος του έτους```. (Μην ξεχάσετε τα δίσεκτα έτη.)
5. Να γραφτεί ένα πρόγραμμα που να επιστρέφει τα ρέστα μετά την αγορά ενός αντικειμένου. Μια τυπική εκτύπωση του προγράμματος είναι η παρακάτω:
```
Κόστος αγοράς αντικειμένου:  82.53€
Πλήρωσα                   : 100.00€
Ρέστα:
  0 x 500€
  0 x 200€
  0 x 100€
  0 x 50€
  0 x 20€
  1 x 10€
  1 x 5€
  1 x 2€
  0 x 1€
  0 x 0.50€
  2 x 0.20€
  0 x 0.10€
  1 x 0.05€
  1 x 0.02€
  0 x 0.01€
```
ή η παρακάτω (στην κρίση του μαθητή τι θέλει να υλοποιήσει):
```  
  1 x 10€
  1 x 5€
  1 x 2€
  2 x 0.20€
  1 x 0.05€
  1 x 0.02€  
```

## Πηγές:
1. ["The Java Tutorial"](https://docs.oracle.com/javase/tutorial/)
1. Bloch J. (2018), _Effective Java_, 3rd Edition, Addison-Wesley.
1. Deitel P., Deitel H. (2018), _Java How to Program_, 11th Ed., Safari.
1. Downey A. B., Mayfield C. (2016), _Think Java_, O' Reilly. 
1. Eckel B. (2006), _Thinking in Java_, 4th Ed., Prentice-Hall.
1. Liguori R. & Liguori P. (2014), _Java 8 Pocket Guide_, O'Reilly.
1. Hillar G.C. (2017), _Java 9 with JShell_, Packt.
1. Horstmann C. S. (2016), _Core Java, Volume 1 Fundamentals_, 10th Ed., Prentice-Hall.
1. Horstmann C. S. (2018), _Core Java SE 9 for the impatient_, 2nd Ed., Addison-Wesley. 
1. Long F. et. al. (2014), _Java Coding Guidelines_, Addison-Wesley.
1. Samoylov N. (2019), _Learn Java 12 Programming_, Packt.
1. Sharan K. (2017), _Java 9 Revealed: For Early Adoption and Migration_, Apress.
1. Sierra K. & Bates B. (2005), _Head First Java_, 2nd Ed. for Java 5.0, O’Reilly.
1. Urma R.-G. & Warburton R. (2019), "New switch Expressions in Java 12", _Java Magazine_, May/June 2019.
1. Urma R.-G. & Warburton R. (2019), "Inside Java 13’s switch Expressions and Reimplemented Socket API", [Java Magazine](https://blogs.oracle.com/javamagazine/inside-java-13s-switch-expressions-and-reimplemented-socket-api), October 2019.

---

[<-](../1.4-Strings/README.md) | [Δ](../../README.md) | [->](../1.6-Loops/README.md)

---