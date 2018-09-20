# 3.5 Ουρές (Queues) {#Java} 
© Γιάννης Κωστάρας

---

[<-](../3.4-Sets/README.md) | [Δ](../../README.md) |  [->](../3.6-Maps/README.md) 
 
---

Τα σύνολα (sets) αποθηκεύουν μόνο μοναδικά στοιχεία, δηλ. δεν επιτρέπουν διπλότυπα.

![](assets/Fig1.png)

**Εικόνα 1** _Σύνολα στη Java_

```java
jshell> Set<Integer> set = new HashSet<>();
set ==> []

jshell> set.add(10);
$1 ==> true

jshell> set.add(20);
$2 ==> true

jshell> set.add(20);
$3 ==> false

jshell> set
set ==> [20, 10]
```

Στο πιο πάνω παράδειγμα, βλέπουμε ότι η εισαγωγή της τιμής ```20``` δυο φορές αποτυγχάνει. Παρατηρήστε επίσης ότι τα σύνολα δεν αποθηκεύουν τα στοιχεία τους με κάποια συγκεκριμένη σειρά, όπως οι λίστες, όπου η σειρά των στοιχείων είναι ίδια με τη σειρά εισαγωγής των στοιχείων στη λίστα.

Θα μπορούσαμε ν' αρχικοποιήσουμε το σύνολο και ως εξής:

```java
jshell> Set set = Set.of(10, 20, 30);
set = [10, 20, 30]
```

Προσοχή όμως. Σ' αυτήν την περίπτωση επιστρέφεται ένα σύνολο το οποίο _δεν_ μπορεί να μεταβληθεί.

```java
jshell> set.add(40)
|  Warning:
|  unchecked call to add(E) as a member of the raw type java.util.List
|  array.add(40)
|  ^-----------^
|  java.lang.UnsupportedOperationException thrown
|        at ImmutableCollections.uoe (ImmutableCollections.java:71)
|        at ImmutableCollections$AbstractImmutableSet.add (ImmutableCollections.java:281)
|        at (#62:1)

```
Για να μπορέσουμε να δημιουργήσουμε μια μεταβαλλόμενη λίστα σ' αυτή την περίπτωση, πρέπει να χρησιμοποιήσουμε την μέθοδο κατασκευής της ```HashSet``` που δέχεται μια άλλη συλλογή:

```java
jshell> Set<Integer> set = new HashSet<>(Set.of(10, 20, 30));
set ==> [20, 10, 30]

jshell> set.add(40)
$5 ==> true

jshell> set
array ==> [10, 20, 30, 40]
```

Στη συνέχεια θα δούμε τις διάφορες μεθόδους της κλάσης.

### Προσπέλαση στοιχείων
Παρακάτω βλέπουμε τρόπους προσπέλασης των στοιχείων ενός συνόλου. Καθώς τα στοιχεία ενός συνόλου δεν αποθηκεύονται με τη σειρά, δε μπορούμε να προσπελάσουμε κάποιο στοιχείο του συνόλου χρησιμοποιώντας δείκτες, καθώς δεν υπάρχουν δείκτες.

Για να προσπελάσουμε όλα τα στοιχεία ενός συνόλου, χρησιμοποιούμε τον επαναλήπτη (iterator):

```java
jshell> int sum = 0
sum ==> 0

jshell> Iterator<Integer> iter = set.iterator();
iter ==> java.util.HashMap$KeyIterator@1a1d6a08

jshell> while (iter.hasNext()) 
	...>    sum += iter.next();
```

Η διεπαφή ```Collection```, την οποία επεκτείνει η ```Set```, επεκτείνει με τη σειρά της τη διεπαφή ```Iterable```:
```java
interface Iterable {
	public Iterator iterator();
}

interface Iterator {
	public boolean hasNext();
	public Object next();
	public void remove();
}
```

Άλλος τρόπος είναι με τον αναβαθμισμένο βρόγχο ```for``` που εισήχθηκε στην έκδοση 5:

```java
jshell> sum = 0
sum ==> 0

jshell> for (int n : set) 
	...>    sum += n;
```

### Εισαγωγή στοιχείων
Όπως είδαμε, η εισαγωγή δεδομένων σ' ένα σύνολο γίνεται με την μέθοδο ```add()```. Η μέθοδος επιστρέφει ```true``` αν η εισαγωγή του στοιχείου ήταν επιτυχής, αλλοιώς επιστρέφει ```false```. 

Η μέθοδος ```addAll(Collection<?> c)``` μας επιτρέπει να προσθέσουμε μια συλλογή από στοιχεία στο σύνολό μας.

### Διαγραφή στοιχείων
Η μέθοδος ```remove(Object o)``` διαγράφει το στοιχείο του συνόλου που είναι ίσο με το το ```ο``` αν βρέθηκε και επιστρέφει ```true``` σ' αυτήν την περίπτωση.

Επίσης, πολύ μεγάλη προσοχή χρειάζεται αν διαγράφετε στοιχεία από ένα σύνολο ενώ προσπελάζετε τα στοιχεία του:

```java
jshell> set
set ==> [20, 40, 10, 30]

jshell> for (Iterator<Integer> i = set.iterator(); i.hasNext(); ) {
   ...> int n = i.next(); 
   ...> if (n == 10) i.remove();
   ...> }

jshell> set
set ==> [20, 30, 40]

jshell> for (int n : set) {
   ...> if (n == 30) set.remove(n) ;
   ...> }
}

jshell> set
set ==> [20, 40]
```

Τέλος, η διεπαφή ```Collection``` παρέχει και τις ακόλουθες δυο μεθόδους οι οποίες μπορούν να διαγράψουν με τη μία από το σύνολό μας όλα τα στοιχεία της παρεχόμενης συλλογής ```c``` (```removeAll(Collection<?> c)```) και επιστρέφει ```true``` αν τα κατάφερε (αν δεν κατάφερε να διαγράψει έστω και ένα από τα στοιχεία της ```c``` από το σύνολό μας, τότε επιστρέφει ```false```).

Η ```retainAll(Collection<?> c)``` κρατάει από το σύνολό μας μόνο τα στοιχεία που περιέχονται στη ```c``` και διαγράφει όλα τα υπόλοιπα. 

### Αναζήτηση στοιχείων
Δυστυχώς η κλάση ```Collections``` δε διαθέτει κάποια μέθοδο για να αναζητήσει κάποιο στοιχείο σε ένα σύνολο (οι μέθοδοι ```binarySearch()``` δέχονται ως όρισμα λίστα).

```java
jshell> set 
set ==> [30, 10, 20]

jshell> set.contains(20); 
$9 ==> true
```

### Ταξινόμηση 
Όπως είπαμε, η δομή δεδομένων Σύνολο δεν είναι ταξινομημένη και δεν μπορεί να ταξινομηθεί. Υπάρχει όμως η ```TreeSet``` (η οποία κληρονομεί από την ```SortedSet```) και  ταξινομεί τα στοιχεία της:

```java
jshell> Set sortedSet = new TreeSet<Integer>(set)
sortedSet ==> [10, 20, 30, 40]	
```

### Αντιγραφή 
Ήδη είδαμε τον copy constructor ```HashSet(Collection<?> c)``` που δημιουργεί ένα νέο ```HashSet``` από τη συλλογή που του περνάμε ως όρισμα.

### Συγχώνευση 
Σαν άσκηση, γράψτε μια μέθοδο ```union()``` στο jshell που θα ενώνει τα στοιχεία δυο συνόλων που περνάτε ως ορίσματα στη μέθοδο.

### Διαχωρισμός 
Σαν άσκηση, γράψτε μια μέθοδο ```split()``` στο jshell που θα διαχωρίζει ένα σύνολο με ακέραια στοιχεία σε δυο νέα σύνολα που το ένα θα αποθηκεύει τα ζυγά και η άλλη τα μονά στοιχεία του αρχικού συνόλου.

### Ισότητα
```java
jshell> src
src ==> [1, 2, 3, 4, 5]

jshell> dest
dest ==> [1, 2, 3, 4, 5]

jshell> dest.equals(src); 
$1 ==> true
```

## Συνδεδεμένα Σύνολα (```LinkedHashSet```)

Αντίστοιχα με τη συνδεδεμένη λίστα (```LinkedList```), στο συνδεδεμένο σύνολο (```LinkedHashSet```) οι κόμβοι του συνήθως βρίσκονται σε απομακρυσμένες θέσεις μνήμης και η σύνδεσή τους γίνεται με _δείκτες_. Έτσι διευκολύνονται οι λειτουργίες της εισαγωγής και της διαγραφής δεδομένων. 

```java
jshell> Set<Integer> set = new LinkedHashSet<>();
set ==> []
```
Οι πράξεις στα συνδεδεμένα σύνολα είναι ίδιες με αυτές τα σύνολα κατακερματισμού (```HashSet```).

## ```EnumSet```
Χρησιμοποιείται όταν ο αριθμός των στοιχείων είναι γνωστός εξ' αρχής και δεν αλλάζει.

```java
Set<Rank> faceCards = EnumSet.of(JACK, QUEEN, KING);
```

## Σύγκριση ```HashSet``` και ```LinkedHashSet```

Σύγκριση απόδοσης ```HashSet``` και ```LinkedHashSet``` 

| | ```add``` |  ```contains``` | ```next``` | 
| ```HashSet```  | O(1) | O(n) | O(k/n) |  
| ```LinkedHashSet``` | O(1) | O(1) | O(1) | 
| ```EnumSet``` | O(1) | O(n) | O(1) | 
| ```TreeSet``` | O(logn) | O(logn) | O(logn) | 

*k είναι η χωρητικότητα του συνόλου

_Πηγή: [Naftalin, Wadler (2006)]_

Αν η εφαρμογή σας διαβάζει συχνότερα στοιχεία τότε καλύτερη απόδοση έχει η ```LinkedHashSet```.

## Πηγές:
1. ["The Java Tutorial"](https://docs.oracle.com/javase/tutorial/)
1. Bloch J. (2018), _Effective Java_, 3rd Edition, Addison-Wesley.
1. Deitel P., Deitel H. (2018), _Java How to Program_, 11th Ed., Safari.
1. Downey A. B., Mayfield C. (2016), _Think Java_, O' Reilly. 
1. Eckel B. (2006), _Thinking in Java_, 4th Ed., Prentice-Hall.
1. Hillar G.C. (2017), _Java 9 with JShell_, Packt.
1. Horstmann C. S. (2016), _Core Java, Volume 1 Fundamentals_, 10th Ed., Prentice-Hall.
1. Horstmann C. S. (2018), _Core Java SE 9 for the impatient_, 2nd Ed., Addison-Wesley. 
1. Naftalin M., Wadler P. (2006), _Java Generics and Collections_, O'Reilly. 
1. Sharan K. (2017), _Java 9 Revealed: For Early Adoption and Migration_, Apress.
1. Sierra K. & Bates B. (2005), _Head First Java_, 2nd Ed. for Java 5.0, O’Reilly.

---

[<-](../3.4-Sets/README.md) | [Δ](../../README.md) |  [->](../3.6-Maps/README.md) 

---