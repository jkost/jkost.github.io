# 2.1 Εντολές Αποφάσεων {#Java} 
© Γιάννης Κωστάρας

---

[Δ](../../README.md) | [>](../2.2-Loops/README.md)

---

[![](../../../assets/jupyter_logo.svg)](2.1-ControlStatements.ipynb)

_"Δύο δρόμους έχει η ζωή"_

### Μαθησιακοί στόχοι
Σε αυτήν την ενότητα θα μάθουμε:

* τις διάφορες εντολές αποφάσεων (```if, switch```) και τον τριαδικό τελεστή ```?``` 

## Εισαγωγή

Κατά την επίλυση της 3ης άσκησης του προηγούμενου μαθήματος είδαμε τι θα συνέβαινε αν ο χρήστης έδινε τιμή για την ```dayIndex``` εκτός ορίων και διερωτηθήκαμε πώς θα μπορούσαμε να αντιμετωπίσουμε αυτήν την περίπτωση. Η Java, όπως και άλλες γλώσσες προγραμματισμού, διαθέτουν εντολές ελέγχου ροής ή αποφάσεων που μας επιτρέπουν να αλλάξουμε τη ροή ενός προγράμματος ανάλογα με το αν μια συνθήκη είναι αληθής ή ψευδής. 

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
Η _συνθήκη_ είναι μια λογική μεταβλητή (boolean) ή μια έκφραση που επιστρέφει λογική τιμή. Τα άγκιστρα μπορούν να παραληφθούν αν ακολουθεί μία μόνο εντολή, δηλ.

```java
if (συνθήκη) 
   εντολή
else if (συνθήκη)
   εντολή
... 
else 
   εντολή
```

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
Θα παρουσιάσουμε πρώτα την παραδοσιακή εντολή ```switch```, ώστε να την αναγνωρίζετε όταν τη συναντήσετε σε προγράμματα, αλλά συνίσταται να χρησιμοποιείτε τη νέα ```switch``` στα προγράμματά σας, η οποία περιγράφεται στην επόμενη ενότητα.

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
Η _μεταβλητή_ μπορεί να είναι είτε αριθμητικού τύπου (```char, byte, short, int, Character, Byte, Short, Integer```), είτε συμβολοσειρά (```String```), είτε τύπου ```enum```. ```enum``` είναι ένας ειδικός τύπος δεδομένων που επιτρέπει να ορίζουμε ένα καθορισμένο αριθμό σταθερών τιμών και την οποία θα μάθουμε σε επόμενα μαθήματα. ```Character, Byte, Short, Integer``` είναι οι αντίστοιχες κλάσεις των πρωτογενών τύπων ```char, byte, short, int```. Θα μιλήσουμε για τις κλάσεις την επόμενη εβδομάδα. Επίσης και η ```var``` είναι αποδεκτή.

Παρατηρήστε ότι κάθε περίπτωση (```case```) χρειάζεται μια εντολή ```break``` για να δηλώσει το τέλος της. Αν ξεχάσετε την ```break``` τότε η εκτέλεση θα συνεχίσει στην επόμενη περίπτωση (fall through). Θα δούμε ένα παράδειγμα στη συνέχεια.

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
Scanner sc = new Scanner(System.in);
String choice = sc.next();
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
  case 15:
  case 14:
        System.out.println("Καλά");
        break; 
  case 13:
  case 12:
  case 11:
  case 10:
        System.out.println("Μέτρια");
        break;
  default:
	System.out.println("Απορριπτέος");
}
```
Η ```default``` αν και συνηθίζεται να γράφεται πάντα στο τέλος, αυτό δεν περιορίζεται από τη γλώσσα, έτσι μπορείτε να την ορίσετε σε οποιαδήποτε θέση μέσα στη ```switch```.

Ας δούμε ένα παράδειγμα όπου ο έλεγχος γίνεται με ```enum```:
```java
enum Choice {
  RED_PILL, BLUE_PILL
}
Choice choice = ...;  // Choice.RED_PILL ή Choice.BLUE_PILL
switch (choice) {
  case BLUE_PILL:
     System.out.println("Συνέχισε να κοιμάσαι...");
     break;  
  case RED_PILL:
     System.out.println("Καλωσήρθες στο Matrix!");
     break;
}
```
Προσέξτε, ότι είναι λάθος:
```java
case Choice.BLUE_PILL:

|  Error:
|  an enum switch case label must be the unqualified name of an enumeration constant
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
Βλέπετε πως _δεν_ απαιτείται η ```break```. Η περίπτωση _fall through_ μπορεί να γραφτεί ως εξής:

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
Η ```switch``` δεν είναι πλέον απλά μια εντολή, αλλά έχει μετατραπεί σε _έκφραση_, δηλ. μπορεί να επιστρέψει κάποια τιμή:

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

## Εφαρμογές
Ας επανέλθουμε επομένως στο πώς μπορούμε να βελτιώσουμε το πρόγραμμα της άσκησης 3 του προηγούμενου μαθήματος. Ας δούμε το πρόγραμμά μας μέχρι στιγμής:

```java
jshell> var days="ΚυρΔευΤριΤετΠεμΠαρΣαβ";
days ==> "ΚυρΔευΤριΤετΠεμΠαρΣαβ"

jshell> Scanner sc = new Scanner(System.in);
sc ==> java.util.Scanner[delimiters=\p{javaWhitespace}+] ... \E][infinity string=\Q∞\E]

jshell> int dayIndex = sc.nextInt() 
5
dayIndex ==> 5

jshell> var day = days.substring(dayIndex*3, dayIndex*3+3)
day ==> "Παρ"

jshell> int dayIndex = sc.nextInt() 
9
dayIndex ==> 9

jshell> var day = days.substring(dayIndex*3, dayIndex*3+3)
|  Exception java.lang.StringIndexOutOfBoundsException: Range [27, 30) out of bounds for length 21
|        at Preconditions$1.apply (Preconditions.java:55)
|        at Preconditions$1.apply (Preconditions.java:52)
|        at Preconditions$4.apply (Preconditions.java:213)
|        at Preconditions$4.apply (Preconditions.java:210)
|        at Preconditions.outOfBounds (Preconditions.java:98)
|        at Preconditions.outOfBoundsCheckFromToIndex (Preconditions.java:112)
|        at Preconditions.checkFromToIndex (Preconditions.java:349)
|        at String.checkBoundsBeginEnd (String.java:4589)
|        at String.substring (String.java:2703)
|        at do_it$Aux (#6:1)
|        at (#6:1)
```

ή σα γραμμές εντολών:

```java
var days="ΚυρΔευΤριΤετΠεμΠαρΣαβ";
Scanner sc = new Scanner(System.in);
int dayIndex = sc.nextInt();
var day = days.substring(dayIndex*3, dayIndex*3+3);
System.out.println(day);
```

Το πρόβλημα εμφανίζεται στην γραμμή που διαβάζουμε αυτό που έδωσε ο χρήστης. Μετά από αυτήν την γραμμή, επομένως, θα πρέπει να ελέγξουμε κατά πόσο είσοδος του χρήστη είναι μέσα στα επιτρεπτά όρια (0-6), κι αν όχι, να εμφανίσουμε ένα μήνυμα λάθους.

```java
var days="ΚυρΔευΤριΤετΠεμΠαρΣαβ";
Scanner sc = new Scanner(System.in);
int dayIndex = sc.nextInt();
if (dayIndex >= 0 && dayIndex < 7) {
   var day = days.substring(dayIndex*3, dayIndex*3+3);
   System.out.println(day);
} else {
   System.out.println("Δώσατε λάθος αριθμό ημέρας");
}
```
Αν τρέξετε το πρόγραμμα στο jshell και δώσετε αριθμό ημέρας εκτός ορίων:

```bash
dayIndex ==> 8
Δώσατε λάθος αριθμό ημέρας
```

Ας δούμε την άσκηση 3. Ένα έτος είναι δίσκεκτο αν διαιρείται με το 4 αλλά όχι με το 100 ή διαιρείται με το 400. Πώς μεταφράζεται ο αλγόριθμος αυτός σε κώδικα Java; Μπορείτε να ελέγξετε αν το πρόγραμμά σας είναι σωστό σε κάποιο [online site](https://www.gigacalculator.com/calculators/leap-year-calculator.php).

```java
jshell> int year = sc.nextInt();
year ==> 2014

jshell> boolean leapYear = (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
leapYear ==> false

jshell> int year = sc.nextInt();
year => 2004

jshell> boolean leapYear = (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
leapYear ==> true
```
Παρατηρήστε πώς το πρόγραμμα υλοποιεί απευθείας τον αλγόριθμο. Για να είναι ένα έτος δίσεκτο, θα πρέπει να διαιρείται με το 4, άρα το υπόλοιπο της διαίρεσης θα πρέπει να είναι μηδέν (```year % 4 == 0```), να μην διαιρείται με το 100, άρα το υπόλοιπο της διαίρεσης δεν θα πρέπει να είναι μηδέν (```year % 100 != 0```) ή να διαιρείται με το 400 (```year % 400 == 0```). Η έκφραση αυτή είναι μια λογική έκφραση, άρα μπορούμε να την αποθηκεύσουμε σε μια μεταβλητή τύπου ```boolean```.

Ας λύσουμε την άσκηση 1. Αν θυμάστε από το σχολείο για να επιλύσουμε μια δευτεροβάθμια εξίσωση χρειάζεται πρώτα να υπολογίσουμε την διακρίνουσα: Δ=β<sup>2</sup>-4αγ. 

* Αν Δ>0 τότε υπάρχουν δυο πραγματικές λύσεις: x<sub>1</sub>=(-β-&#8730;Δ)/2α, x<sub>2</sub>=(-β+&#8730;Δ)/2α.
* Αν Δ=0 τότε υπάρχει μια πραγματική λύση: ```x=-β/2α```.
* Αν Δ<0 τότε δεν υπάρχει πραγματική λύση.

```java
jshell> System.out.print("Δώσε το α: ");
Δώσε το α: 
jshell> Scanner sc = new Scanner(System.in);
sc ==> java.util.Scanner[delimiters=\p{javaWhitespace}+] ... \E][infinity string=\Q∞\E]

jshell> var a = sc.nextInt();
2
a ==> 2

jshell> System.out.print("Δώσε το β: ");
Δώσε το β:

jshell> var b = sc.nextInt();
3
b ==> 3

jshell> System.out.print("Δώσε το γ: ");
Δώσε το γ:

jshell> var c = sc.nextInt();
-2
c ==> -2

jshell> var d = b*b-4*a*c;
d ==> 25

jshell> System.out.println("Η διακρίνουσα είναι: " + d);
Η διακρίνουσα είναι: 25

jshell> if (d > 0) {
   ...>     var x1 = (-b+Math.sqrt(d))/(2*a);
   ...>     var x2 = (-b-Math.sqrt(d))/(2*a);
   ...>     System.out.println("Δυο πραγματικές λύσεις: x1=" + x1 + " x2=" + x2);
   ...> } else if (d == 0) {
   ...>     var x = -b/2*a;
   ...>     System.out.println("Μια πραγματική λύση: x=" + x);
   ...> } else {
   ...>     System.out.println("Καμία πραγματική λύση");
   ...> }
Δυο πραγματικές λύσεις: x1=0.5 x2=-2.0
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

## Πηγές
1. Horstmann C., [Big Java 5 - Chapter 5 - Decisions](https://www.cs.ryerson.ca/~aferworn/courses/CPS109/CLASSES/week05/ch05/index.html)
1. Urma R.-G. & Warburton R. (2019), "New switch Expressions in Java 12", _Java Magazine_, May/June 2019.
1. Urma R.-G. & Warburton R. (2019), "Inside Java 13’s switch Expressions and Reimplemented Socket API", [Java Magazine](https://blogs.oracle.com/javamagazine/inside-java-13s-switch-expressions-and-reimplemented-socket-api), October 2019.

---

[Δ](../../README.md) | [>](../2.2-Loops/README.md)

---