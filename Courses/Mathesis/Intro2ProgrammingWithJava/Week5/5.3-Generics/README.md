# 5.3 Γενικευμένοι Τύποι (Generics)
© Γιάννης Κωστάρας

---

[<](../5.2-Lists/README.md) | [Δ](../../README.md) |  [>](../5.4-Sets/README.md) 
 
---
[![](../../../assets/jupyter_logo.svg)](5.3-Generics.ipynb)

Όπως είδαμε στα μαθήματα της 2ης εβδομάδας, οι πίνακες ελέγχουν τον τύπο δεδομένων των στοιχείων που προσπαθούμε να προσθέσουμε σ' αυτούς:

```java
jshell> String[] names = new String[3];
names ==> String[3] { null, null, null }

jshell> names[0]="Κώστας"
$12 ==> "Κώστας"

jshell> names[1]="Μαρία"
$13 ==> "Μαρία"

jshell> names[3]=10
|  Error:
|  incompatible types: int cannot be converted to java.lang.String
|  names[3]=10
|           ^^
```

Στο προηγούμενο μάθημα είδαμε πώς μπορούμε να αποθηκεύσουμε μια ακολουθία αντικειμένων σε μια λίστα. Το πρόβλημα είναι ότι δεν γίνεται έλεγχος για τον τύπο των δεδομένων που εισάγονται στη λίστα. Αν π.χ. θέλουμε να αποθηκεύσουμε μόνο συμβολοσειρές, και σε κάποιο σημείο του κώδικά μας εισάγουμε κατά λάθος κάποιον ακέραιο στη λίστα μας, τότε είναι πολύ αργά (δηλ. μόνο κατά την εκτέλεση του προγράμματός μας) προτού καταλάβουμε το λάθος μας.

```java
jshell> List strings = new ArrayList(Arrays.asList("one", "two", "three"));
|  Warning:
|  unchecked call to ArrayList(java.util.Collection<? extends E>) as a member of the raw type java.util.ArrayList
|  List strings = new ArrayList(Arrays.asList("one", "two", "three"));
|                 ^-------------------------------------------------^
strings ==> [one, two, three]

jshell> strings.add(4)
|  Warning:
|  unchecked call to add(E) as a member of the raw type java.util.List
|  strings.add(4)
|  ^------------^
$1 ==> true

jshell> strings
strings ==> [one, two, three, 4]

jshell> for (Object s : strings) 
   ...> System.out.println(((String)s).toUpperCase())
ONE
TWO
THREE
|  java.lang.ClassCastException thrown: java.base/java.lang.Integer cannot be cast to java.base/java.lang.String
|        at (#114:1)
```

Για να αποφύγουμε τέτοια προβλήματα, από την έκδοση 5 η γλώσσα εισήγαγε την έννοια των γενικευμένων τύπων (generics).

Ας δούμε πώς μπορούμε να γράψουμε ένα από τα παραδείγματα του προηγούμενου κεφαλαίου χρησιμοποιώντας generics:

```java
jshell> List<Integer> array = new ArrayList<>();  // ή new ArrayList<Integer>()
array ==> []

jshell> array.add(10);
$1 ==> true

jshell> array.add(20);
$2 ==> true

jshell> array.add(30);
$3 ==> true

jshell> array
array ==> [10, 20, 30]

jshell> array.size()
$4 ==> 3
```

Πλέον δηλώνουμε ότι η λίστα ```array``` μπορεί να δέχεται μόνο στοιχεία τύπου ```Integer```. Χάρις στο autoboxing, τα στοιχεία τύπου ```int``` που προσθέτουμε στη λίστα μετατρέπονται σε τύπου ```Integer``` καθώς οι συλλογές δεν μπορούν ν' αποθηκεύσουν πρωτογενείς τύπους. Ο τελεστής ```<>``` ονομάζεται _τελεστής διαμάντι_ και εισήχθηκε στην έκδοση 7 της γλώσσας. Απλοποιεί τη σύνταξη:

```java
jshell> List<Integer> array = new ArrayList<Integer>();
array ==> []
```

Ας δούμε πώς μπορούμε να εξαφανίσουμε το casting με τη χρήση των generics:
```java
jshell> int sum = 0;
sum ==> 0

jshell> for (int i=0; i < array.size(); i++)
	...>    sum += array.get(i);

jshell> sum
sum ==> 60

jshell> sum = 0
sum ==> 0

jshell> Iterator<Integer> iter = array.iterator();
iter ==> java.util.Arrays$ArrayItr@13805618

jshell> while (iter.hasNext()) 
	...>    sum += i.next();

jshell> sum = 0
sum ==> 0

jshell> for (int n : array) 
	...>    sum += n;
```

Αν διαβάσετε το ΑΡΙ της ```List``` θα παρατηρήσετε ότι ορίζεται ως ```List<E>``` (διαβάζεται 'μια λίστα από αντικείμενα τύπου Ε'), όπου ```Ε``` είναι ο γενικευμένος τύπος που μπορείτε να χρησιμοποιήσετε, π.χ. ```Integer, String, Car, Point``` κλπ. Όταν αντικαθιστούμε το ```Ε``` με κάποιον τύπο δεδομένων (π.χ. ```String```) τότε μιλάμε για _παραμετροποιημένο τύπο δεδομένων (parameterized type)_.

Ως άσκηση, ξαναγράψτε τα παραδείγματα του προηγούμενου μαθήματος χρησιμοποιώντας τον σωστό γενικευμένο τύπο για τη λίστα σας. Παρατηρήστε ότι δεν απαιτείται πλέον να χρησιμοποιείτε casting. 

Παρόλο που οι γενικευμένοι τύποι είναι πολύ χρήσιμοι καθώς επιτρέπουν να βρίσκουμε λάθη κατά τη διάρκεια της μεταγλώττισης, δυστυχώς για λόγους προς τα πίσω συμβατότητας (backwards compatibility) ο μεταγλωττιστής 'διαγράφει' τον γενικευμένο τύπο (type erasure) με αποτέλεσμα κατά την εκτέλεση του προγράμματος όλοι οι γενικευμένοι τύποι έχουν μετατραπεί σε ```Object```. Τύποι δεδομένων που δε 'σβήνονται' κατά τη διάρκεια της εκτέλεσης του προγράμματος ονομάζονται _τυπικοί (reified)_ (π.χ. ```Integer, String```), ενώ αυτοί οι οποίοι 'σβήνονται' λέγονται _μη τυπικοί (non-reified)_ (π.χ. ```List<String>```). Έτσι π.χ. κατά την εκτέλεση του προγράμματος οι τύποι δεδομένων ```List<Integer>``` και ```List<String>``` μετατρέπονται στον ίδιο τύπο δεδομένων ```List<Object>``` ή ```List```. 

Ας δούμε ένα ακόμα παράδειγμα. Η κλάση ```Integer``` κληρονομεί από την κλάση ```Number```.

```java
jshell> List<Integer> ints = new ArrayList<>();
ints ==> []

jshell> ints.add(10);
$13 ==> true

jshell> ints.add(20);
$14 ==> true

jshell> List<Number> nums = ints; // compile-time error
|  Error:
|  incompatible types: java.util.List<java.lang.Integer> cannot be converted to java.util.List<java.lang.Number>
|  List<Number> nums = ints; // compile-time error
|                      ^--^
```	

Με άλλα λόγια, η _Αρχή της Υποκατάστασης (Substitution Principle)_ _δεν_ ισχύει για τους γενικευμένους τύπους. Δηλ., αν και ```Integer extends Number``` δεν ισχύει ότι ```List<Integer> extends List<Number>```.
	
Αν δεν γνωρίζετε τι γενικευμένο τύπο δεδομένων να χρησιμοποιήσετε για να επιλύσετε κάποιο πρόβλημά σας, υπάρχει και ο _μη δεσμευμένος (unbounded)_ τύπος δεδομένων, π.χ. ```List<?>```. Βέβαια, σ' αυτή την περίπτωση μπορείτε να εισάγετε μόνο τιμές ```null``` στη συλλογή αυτή καθώς προσπάθεια προσθήκης άλλου τύπου δεδομένων εμφανίζει λάθος όπως π.χ. ```incompatible types: java.lang.String cannot be converted to capture#2 of ?```.

Για ακόμα μεγαλύτερη ασφάλεια, μπορείτε να χρησιμοποιήσετε τις αντίστοιχες στατικές μεθόδους ```checkedXXX``` της ```Collection```:
```java
checkedCollection()     checkedList()           checkedMap()            
checkedNavigableMap()	checkedNavigableSet()   checkedQueue()         
checkedSet() 	checkedSortedMap()      checkedSortedSet() 
```

Π.χ.:
```java
jshell> List<String> names = Collections.checkedList(new ArrayList<>(), String.class);
names ==> []

jshell> Collections.addAll(names, "Κατερίνα", "Σοφία", "Μαρία");
$15 ==> true

jshell> names.add(42)
|  Error:
|  incompatible types: int cannot be converted to java.lang.String
|  names.add(42)
|            ^^
```
### Boxing, unboxing, autoboxing

Όπως είδαμε σε προηγούμενο μάθημα, κάθε πρωτογενής (raw) τύπος διαθέτει την αντίστοιχη κλάση του:

| _Πρωτογενής τύπος_ | _Τύπος αναφοράς_ |
| ```byte``` | ```Byte``` |
| ```short``` | ```Short``` |
| ```int``` | ```Integer``` |
| ```long``` | ```Long``` |
| ```float``` | ```Float``` |
| ```double``` | ```Double``` |
| ```boolean``` | ```Boolean``` | 
| ```char``` | ```Character``` |

Η μετατροπή ενός πρωτογενής τύπου στην αντίστοιχη κλάση του ονομάζεται _εγκλεισμός (boxing)_ ενώ η αντίστροφη μετατροπή _απεγκλεισμός (unboxing)_. Όταν εισάγουμε έναν πρωτογενή τύπο σε μια συλλογή, αυτός αυτόματα εγκλείεται στον αντίστοιχο τύπο αναφοράς και αντίστροφα όταν ανακτάμε το στοιχείο από τη συλλογή και το αποθηκεύουμε σε μια μεταβλητή πρωτογενή τύπου.

Έτσι π.χ.

```java
List<Integer> arrayOfints = new ArrayList<>();
arrayOfints.add(1);
int n = arrayOfints.get(0);
```
χωρίς autoboxing θα έπρεπε να γραφτεί ως:

```java
List<Integer> arrayOfints = new ArrayList<>();
arrayOfints.add(Integer.valueOf(1));   // ή new Integer(1)
int n = arrayOfints.get(0).intValue();
```

## Υπο- και υπερ-γενικευμένοι τύποι 
Είδαμε προηγουμένως ότι η _Αρχή της Υποκατάστασης (Substitution Principle)_ _δεν_ εφαρμόζεται στους γενικευμένους τύπους. Έτσι δεν μπορούμε π.χ. να γράψουμε:

```java
jshell> List<Number> nums = new ArrayList<Integer>();
|  Error:
|  incompatible types: java.util.ArrayList<java.lang.Integer> cannot be converted to java.util.List<java.lang.Number>
|  List<Number> nums = new ArrayList<Integer>();
|                      ^----------------------^
```

Η γλώσσα όμως μας παρέχει τη δυνατότητα να γράψουμε:

```java
jshell> List<? extends Number> nums = new ArrayList<Integer>();
nums ==> []
```

που σημαίνει μπορούμε να προσθέσουμε στη λίστα ```nums``` τόσο στοιχεία τύπου ```Number``` όσο και στοιχεία οποιασδήποτε υποκλάσης της ```Number```.

Π.χ. η διεπαφή ```Collection``` ορίζει τη μέθοδο:

```java
interface Collection<E> {
	...
	public boolean addAll(Collection<? extends E> c);
		...
	}
```

που σημαίνει ότι μπορούμε να προσθέσουμε στη συλλογή οποιοδήποτε στοιχείο κληρονομεί από την ```Ε```, οπότε θα μπορούσαμε να γράψουμε:

```java
jshell> List<Number> nums = new ArrayList<>();
nums ==> []

jshell> List<Integer> ints = Arrays.asList(10, 20);
ints ==> [10, 20]

jshell> List<Double> dbls = Arrays.asList(2.78, 3.14);
dbls ==> [2.78, 3.14]

jshell> nums.addAll(ints);
$19 ==> true

jshell> nums.addAll(dbls);
$20 ==> true

jshell> nums
nums ==> [10, 20, 2.78, 3.14]
```

Η γλώσσα διαθέτει και τη λέξη κλειδί ```super``` η οποία δηλώνει οποιαδήποτε υπερκλάση της κλάσης, π.χ.:

```java
jshell> List<? super Integer> nums = new ArrayList<>();
```

δηλώνει ότι η ```nums``` δέχεται ως στοιχεία τύπου ```Integer``` αλλά και οποιασδήποτε υπερκλάσης της ```Integer```, δηλ. ```Number``` και ```Object```. 

Πότε χρησιμοποιούμε την ```extends``` και πότε τη ```super```; Σύμφωνα με την _Αρχή Βγάλε και Βάλε (Get And Put Principle)_  χρησιμοποιήστε την ```extends``` όταν θέλετε να βγάλετε τιμές από τη δομή και την ```super``` όταν θέλετε να εισάγετε τιμές στη δομή δεδομένων. Όταν θέλετε να κάνετε και τις δυο ενέργειες, μη χρησιμοποιείτε καμιά από τις δυο.

```java
public static <T> void copy(List<? super T> dst, List<? extends T> src);
```

Χαρακτηριστικό παράδειγμα η μέθοδος ```copy()``` που είδαμε πιο πάνω. Θέλουμε να εξάγουμε στοιχεία από την ```src``` ενώ θέλουμε να εισάγουμε στην ```dst```. Ένας ```iterator``` εξάγει στοιχεία από μια δομή, άρα θα πρέπει να οριστεί με ```extends```.

Άλλο παράδειγμα, η ```java.util.Collections.sort()```:

```java
public static <T extends Comparable<? super T>> void sort(List<T> list) {...}
```
Το ```Τ``` πρέπει να είναι τύπου ```Comparable``` κι αυτό το ```Comparable``` πρέπει να ορίζεται στο ```Τ``` ή σε μια υπερκλάση του ```Τ```.

Η ```List<?>``` είναι ισοδύναμη με ```List<? extends Object>```:

```java
List<?> list = new ArrayList<Object>(); // ok
List<?> list = new ArrayList<?>() // compile-time error
List<?> list = new ArrayList<>(); // ok
```

## Γενικευμένες κλάσεις και μέθοδοι
Μπορούμε να δημιουργήσουμε τις δικές μας γενικευμένες κλάσεις. Θα δούμε παραδείγματα στο μάθημα 3.5 όταν θα μιλήσουμε για τις Ουρές.

```java
public class MyGenericClass<T> {
//...
}
```

Αν όμως η κλάση δεν είναι γενικευμένη αλλά θέλουμε να δηλώσουμε μια γενικευμένη μέθοδο, τότε η σύνταξη είναι ως εξής:

```java
class MyClass {
	public void nonGenericMethod(String v) {}
	public <T> void myMethod(T t) {}
	public <T extends Number & Comparable> void myMethod(T t) {}	
}
```

Όπως η γλώσσα υποστηρίζει απλή κληρονομικότητα για κλάσεις και πολλαπλή κληρονομικότητα για επαφές, το ίδιο ισχύει και για τους γενικευμένους τύπους όπως φαίνεται στα παρακάτω παραδείγματα:

```java
class Test<T extends Number & Runnable> {};				// OK <=> T extends Number implements Runnable 
class Test<T extends Number & Runnable & Comparable> {};	// OK <=> T extends Number implements Runnable, Comparable
class Test<T extends Number & String> {};				// Not OK <=> T extends Number, String
class Test<T extends Runnable & Comparable> {};			// OK <=> T implements Runnable, Comparable
class Test<T extends Comparable & Number> {};  	 		// Not OK <=> T implements Comparable extends Number
```

## Σύγκριση Λίστας με Πίνακα
Οι πίνακες (arrays) είναι _συμμεταβαλλόμενοι (covariant)_ που σημαίνει ότι αν η κλάση ```Cat extends Animal``` τότε η κλάση ```Cat[] extends Animal[]```. Αντιθέτως οι γενικευμένοι τύποι (generics) είναι _μη συμμεταβαλόμενοι (invariant)_ δηλ. η ```List<Cat>``` δε κληρονομεί από τη ```List<Animal>```.
	
Έτσι π.χ.
```java
jshell> Animal[] animals = new Cat[1];
animals ==> Cat[1]

jshell> List<Animal> animals_ = new ArrayList<Cat>();
|  Error:
|  incompatible types: java.util.ArrayList<Cat> cannot be converted to java.util.List<Animal>
|  List<Animal> animals_ = new ArrayList<Cat>();
|                          ^------------------^
```

Άλλη διαφορά, όπως είδαμε προηγουμένως, είναι ότι οι πίνακες είναι _τυπικοί (reified)_ (δηλ. δεν σβήνεται ο τύπος δεδομένων τους κατά την εκτέλεση) ενώ οι γενικευμένοι τύποι είναι _μη τυπικοί (non-reified)_ (π.χ. η ```List<String>``` μετατρέπεται σε ```List``` κατά την εκτέλεση). 

Γι' αυτούς τους λόγους, απαγορεύεται να δημιουργήσετε πίνακες γενικευμένων τύπων. Π.χ.

```java
jshell> List<Animal>[] arrayOfListOfCats = new ArrayList<Animal>[1];
|  Error:
|  generic array creation
|  List<Animal>[] arrayOfListOfCats = new ArrayList<Animal>[1];
|                                     ^----------------------^
```

Παρόλ' αυτά σημειώστε, ότι η παρακάτω δήλωση είναι έγκυρη, αν και όχι ιδιαίτερα χρήσιμη:

```java
jshell> List<?>[] list = new ArrayList<?>[1];
list ==> ArrayList[1] { null }
```

Σημειώστε όμως, ότι μπορείτε να δημιουργήσετε πίνακες που να περιέχουν γενικευμένους τύπους, π.χ.

```java
jshell> List<int[]> listOfInts = new ArrayList<>();
listOfInts ==> []
```

**Πίνακας 5.3.1** _Σύγκριση πίνακα / συλλογής_

| Πίνακες | Συλλογές |
| Σταθερό μέγεθος | Μεταβλητό μέγεθος |
| Αποδοτικότεροι | Λιγότερο αποδοτικές |
| Μόνο ίδιου τύπου στοιχεία | Διαφορετικού τύπου στοιχεία | 
| Αποθηκεύουν πρωτογενείς τύπους και αντικείμενα | Αποθηκεύουν μόνο αντικείμενα |

## Οι διεπαφές ```Collection<E>, List<E>, Iterable<E>```
Στο προηγούμενο μάθημα είδαμε την κλάση ```List<E>``` και είδαμε πως υπάρχουν παγίδες κατά τη χρήση των μεθόδων της κλάσης. 
	
```java
public interface Collection<E> {
...
	public boolean contains(Object o);
	public boolean containsAll(Collection<?> c);
	public Object remove(Object o);
	public void removeAll(Collection<?> c);
	public void retainAll(Collection<?> c);
...
}
```		
Οι σχεδιαστές της γλώσσας θα έπρεπε να είναι πιο αυστηροί κατά τη σχεδίαση αυτών των μεθόδων και να τις είχαν ορίσει ως:
```java
public interface Collection<E> {
...
	public boolean contains(E o);
	public boolean containsAll(Collection<? extends E> c);
	public Object remove(E o);
	public void removeAll(Collection<? extends E> c);
	public void retainAll(Collection<? extends E> c);
...
}
```		
αλλά δεν το έπραξαν λόγω της προς τα πίσω συμβατότητας. Καθώς οι γενικευμένοι τύποι εισήχθηκαν στη γλώσσα στην έκδοση 5, πριν χρησιμοποιούσαν τον τύπο ```Object```.

## Περίληψη
Οι γενικευμένοι τύποι εισήχθηκαν στη γλώσσα για να εμφανιστούν τυχόν λάθη νωρίτερα (κατά τη διάρκεια της μεταγλώττισης αντί κατά τη φάση της εκτέλεσης των προγραμμάτων). Επίσης, βοηθούν στο να εξαφανιστούν οι μετατροπές τύπων (casts).

Συμπερασματικά, χρησιμοποιείτε πάντα τους γενικευμένους τύπους (generic types) και αποφύγετε τη χρήση των πρωτογενών συλλογών (π.χ. ```List, Set``` κλπ.). Οι πρωτογενείς συλλογές μπορούν να εμφανίσουν εξαιρέσεις κατά την εκτέλεση του προγράμματος. Ο γενικευμένος τύπος ```List<Object>``` μπορεί ν' αποθηκεύσει δεδομένα οποιουδήποτε τύπου (προτιμήστε τον από τον πρωτογενή τύπο ```List```) ενώ ο γενικευμένος τύπος ```List<?>``` αναπαριστά μια λίστα που μπορεί ν' αποθηκεύσει αντικείμενα ενός άγνωστου τύπου δεδομένων.

### Ασκήσεις
1. Να γράψετε μια κλάση ```StringIterable implements Iterable<Character>``` η οποία επιστρέφει τους χαρακτήρες ενός αλφαριθμητικού, π.χ.
```java
for (Character character : new StringIterable("abc")) {
	System.out.print(character + ", ");
}
```
1. Στο τελευταίο βίντεο του μαθήματος είδαμε μια υλοποίηση της ```Stack``` με χρήση της ```Deque```. Δοκιμάστε την κλάση ```Stack``` δημιουργώντας ένα νέο αντικείμενο της κλάσης μεγέθους 3 και προσθέστε τρία αντικείμενα σ' αυτή. Τι συμβαίνει όταν γεμίσει η στοίβα; Προσπαθήστε να προσθέσετε ακόμα ένα αντικείμενο. Ποια η συμπεριφορά της στοίβας; Τι επιστρέφει η μέθοδος ```isFull()```; Εξάγετε όλα τ' αντικείμενα που εισάγατε και ακόμα ένα. Τι επιστρέφει η στοίβα; Ελέγξτε τι επιστρέφει η ```isEmpty()```. Τι θα συμβεί αν εισάγετε τιμή ```null``` στη στοίβα;
1. Πώς θα μπορούσατε να 'χακάρετε' την κλάση ```Stack```; Π.χ. μπορείτε να δημιουργήσετε μια στοίβα ```Stack<Integer>``` που να γεμίσει τη μνήμη του υπολογιστή (να μη δουλέψει δηλ. η ```isFull()```); Αφού βρείτε το bug, πώς μπορείτε να το διορθώσετε;
1. Υλοποιήστε την άσκηση 2 του μαθήματος 3.1 χρησιμοποιώντας μια λίστα για ν' αποθηκεύσετε τους μαθητές. Η κλάση ```SchoolClass<Student>``` θα διαθέτει τις εξής μεθόδους: εισαγωγή μαθητή, εμφάνιση πληροφοριών μαθητή με βάση τον ΑΜ, αναζήτηση μαθητή με βάση το επώνυμό του, ενημέρωση πληροφοριών μαθητή, διαγραφή μαθητή, εμφάνιση της λίστας των μαθητών ταξινομημένη κατά ΑΜ και κατά επώνυμο.
1. Τροποποιήστε την κλάση ```SchoolClass``` της προηγούμενης άσκησης ώστε να ικανοποιεί τις απαιτήσεις της άσκησης 2 του μαθήματος 4.1. Στην τάξη θα μπορούν να διδάσκουν και ένας ή περισσότεροι καθηγητές. Πώς θα τροποποιήσετε την κλάση ```SchoolClass``` ώστε να μπορεί ν' αποθηκεύει και καθηγητές; Τι αλλαγές θα πρέπει να κάνετε στο γενικευμένο τύπο της κλάσης ώστε να δέχεται και αντικείμενα τύπου ```Teacher```; 
1. Γράψτε μια κλάση ```LRInsert``` η οποία περιέχει ένα πεδίο τύπου ```LinkedList```. Κάθε φορά που εισάγετε ένα αντικείμενο στη λίστα, αυτό εισάγεται εναλλάξ στην αρχή και στο τέλος της συλλογής. Η μέθοδος ```toString()``` θα πρέπει να επιστρέψει τα αντικείμενα με τη σειρά που αυτά αποθηκεύθηκαν στη λίστα. Όταν διαβάζετε (iterate) τη λίστα, προσπαθήστε να επιστρέψετε τα αντικείμενα με τη σειρά με την οποία εισήχθησαν σ' αυτή. Η υλοποίησή σας θα πρέπει να περνά το ακόλουθο unit test:
```java
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import java.util.Iterator;
public class LRInsertTest {
  @Test
  public void test() {
    for (int i = 0; i < 6; i++) {
      LRInsert<Integer> lri = new LRInsert<Integer>();
      for (int j = 0; j < i; j++) lri.add(j);
      Iterator<Integer> it = lri.iterator();
      for (int j = 0; j < i; j++) {
        assertEquals(j, it.next().intValue());
      }
    }
  }
}
```

## Πηγές
1. Kabutz H. (2017), "Collections.checkedCollection()", [Java Specialists Newsletter Issue 251](https://www.javaspecialists.eu/archive/Issue251.html)

---

[<](../5.2-Lists/README.md) | [Δ](../../README.md) |  [>](../5.4-Sets/README.md) 

---