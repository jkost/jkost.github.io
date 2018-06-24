# 1.5 Εντολές Αποφάσεων {#Java} 
© Γιάννης Κωστάρας

---

[<-](../1.4-Strings/README.md)| [->](../1.6-Loops/README.md)

---

Η Java διαθέτει δυο εντολές αποφάσεων ή ελέγχου ροής: ```if``` και ```switch```.

## Εντολή if
Σύνταξη:
```
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
```
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
```
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
```
if (συνθήκη) {
   εντολές
} else {
   εντολές
}
```
μπορεί να γραφεί και ως:
```
μεταβλητή = (συνθήκη) ? εντολές αν true : εντολές αν false
```
Ο τελεστής ```?``` ονομάζεται _τριαδικός τελεστής_.

Π.χ.
```
String result = (num > 0) ? "θετικός" : "αρνητικός";
```

## Εντολή switch
Σύνταξη:

```
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
Η _μεταβλητή_ μπορεί να είναι είτε αριθμητικού τύπου, είτε συμβολοσειρά είτε τύπου ```enum```. ```enum``` είναι ένας ειδικός τύπος δεδομένων που επιτρέπει να ορίζουμε ένα καθορισμένο αριθμό σταθερών τιμών.

Ας δούμε ένα παράδειγμα:
```
enum Choice {
  RED_PILL;
  BLUE_PILL;
}
Choice choice = ...;  // Choice.RED_PILL ή Choice.BLUE_PILL
switch (choice) {
  case Choice.BLUE_PILL:
	System.out.println("Συνέχισε να κοιμάσαι...");
       break;  
  case Choice.RED_PILL:
	System.out.println("Καλωσήρθες στην πραγματικότητα");
       break;
}
```

Π.χ.
```
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

Το πιο πάνω παράδειγμα της εντολής ```if``` μπορεί να γραφτεί κι ως εξής:
```
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

## Ασκήσεις
1. Να γράψετε πρόγραμμα που βρίσκει τις λύσεις της δευτεροβάθμιας εξίσωσης. Ο χρήστης δίνει 3 αριθμούς α,β,γ που είναι οι παράμετροι της δευτεροβάθμιας εξίσωσης αx^2 + βx+ γ = 0. Το πρόγραμμα τυπώνει τις λύσεις της εξίσωσης.
2. Γράψτε ένα πρόγραμμα που θα διαβάζει 3 αριθμούς και θα επιστρέφει τον μεγαλύτερο από τους 3

## Πηγές:
1. ["The Java Tutorial"](https://docs.oracle.com/javase/tutorial/)
1. Bloch J. (2017), Effective Java, 3rd Edition, Addison-Wesley.
1. Sierra K. & Bates B. (2005), Head First Java, 2nd Ed. for Java 5.0, O’Reilly.


---

[<-](../1.4-Strings/README.md)| [->](../1.6-Loops/README.md)

---