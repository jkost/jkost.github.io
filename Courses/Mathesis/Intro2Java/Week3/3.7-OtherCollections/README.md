# 3.7 Άλλες Δομές Δεδομένων {#Java} 
© Γιάννης Κωστάρας

---

[<-](../3.6-Maps/README.md) | [Δ](../../README.md) 
 
---

Οι συλλογές (Collections) που συζητήσαμε στα μαθήματα αυτής της εβδομάδας δεν είναι οι μόνες που υπάρχουν. Οι διάφορες κοινότητες προγραμματιστών έχουν δημιουργήσει μια σειρά από άλλες συλλογές που συμπληρώνουν αυτές τις γλώσσας, υπό μορφή βιβλιοθηκών. Προτού όμως δούμε τις διάφορες βιβλιοθήκες που συμπληρώνουν τις συλλογές που προσφέρει η γλώσσα, ας δούμε κάποιες χρήσιμες μεθόδους επικάλυψης (wrapper methods) που προσφέρει η κλάση ```Collections```.

## Μη μεταβαλλόμενες συλλογές
Συχνά χρειάζεται να επιστρέψετε κάποια συλλογή από τις μεθόδους σας. Αν όμως επιστρέψετε την ίδια τη συλλογή, τότε παρέχετε στον κώδικα που καλεί τη μέθοδό σας τη διεύθυνση (reference) αυτής στη μνήμη, με αποτέλεσμα να μπορεί να την αλλάξει όπως επιθυμεί (τα αντικείμενα στη Java περνιώνται και επιστρέφονται από τις μεθόδους ως αναφορές μνήμης - by reference). Λέμε ότι η συλλογή σας "δραπετεύει (escape)" από την κλάση σας και ξένος κώδικας μπορεί να την αλλάξει όπως θέλει, πράγμα που μπορεί να αποβεί επικίνδυνο. Συνήθως, όταν μια μέθοδος επιστρέφει μια συλλογή, αυτό που ο καλών κώδικας θέλει είναι απλά να προσπελάσει τα στοιχεία της, κι όχι να τα τροποποιήσει. 

Η κλάση ```Collections``` περιλαμβάνει μια σειρά από στατικές μεθόδους επικάλυψης (wrapper methods) που μετατρέπουν τις συλλογές σε ανάγνωσης μόνο ώστε να μην υπάρχει κίνδυνος ξένος κώδικας να τις αλλάξει:

```java
jshell> Collections.unmodifiable
unmodifiableCollection(     unmodifiableList(           unmodifiableMap(            unmodifiableNavigableMap(   
unmodifiableNavigableSet(   unmodifiableSet(            unmodifiableSortedMap(      unmodifiableSortedSet(    
``` 

Έτσι, π.χ. αντί για:

```java
class CarDB {
   private List<Car> cars = new ArrayList<>();
   //...

   public Set<Car> getSportCars() {
   		Set<Car> sportCars = new HashSet<>();
		for (Car car : cars) {
			if (car.getType() == CarType.SPORT) {
				sportCars.add(car);
			}
		}
   	 	return sportCars;
   }
}
```
συμβουλεύεται να χρησιμοποιείτε:

```java
public Set<Car> getSportCars() {
	//...
	return Collections.unmodifiableSet(sportCars);
}
```
Ο καλών της μεθόδου ```getSportCars()``` δεν θα μπορεί πλέον να τροποποιήσει τα στοιχεία του ```Set``` που επιστρέφει η μέθοδος. Φυσικά, μπορείτε να χρησιμοποιήσετε και τις άλλες στατικές μεθόδους που μάθαμε αυτή την εβδομάδα, όπως ```of(), asList()``` και ```singleton()```.

## Apache Commons Collections
Το ίδρυμα Apache παρέχει παραδοσιακά πολλές χρήσιμες βιβλιοθήκες και προγράμματα ανοικτού κώδικα. Πρόσφατα, ακόμα και το NetBeans μεταπήδησε στο Apache. Η βιβλιοθήκη Commons Collections παρέχει:

* Χρήσιμα εργαλεία για τις συλλογές που παρέχει η γλώσσα Java
* Maps
   * Map Iteration
   * Ordered Maps
   * Bidirectional Maps
   * MultiMap
* Bags 

## Eclipse Collections
Ονομάζονταν GS Collections και πρόσφατα έγιναν δωρεάν στο ίδρυμα Eclipse. Παρέχει πολλές χρήσιμες συλλογές που συμπληρώνουν αυτές της Java.

## Google Guava
Η βιβλιοθήκη Guava περιλαμβάνει [συλλογές](https://github.com/google/guava/wiki/CollectionUtilitiesExplained) που συμπληρώνουν αυτές της Java.

## Πώς να τις χρησιμοποιήσετε στις εφαρμογές σας
Όπως μάθαμε στα μαθήματα της 2ης εβδομάδας, μπορούμε να χρησιμοποιήσουμε κλάσεις τρίτων μέσω βιβλιοθηκών (packages) ή αρθρωμάτων (modules).

Ας δούμε πώς μπορούμε να χρησιμοποιήσουμε π.χ. τα Apache Commons Collections στα προγράμματά μας. Κατ' αρχήν, κατεβάστε το ```commons-collections4-x.x-bin.zip``` από τον ιστοτόπο της Apache και αποσυμπιέστε το.

Δημιουργήστε ένα νέο έργο Java στο NetBeans. Στο 2ο βήμα του οδηγού δημιουργίας νέου έργου επιλέξτε **Use Dedicated Folder for Storing Libraries**. Το NetBeans θα δημιουργήσει ένα νέο φάκελο ```lib``` μέσα στο φάκελο του έργου όπου μπορείτε να προσθέσετε βιβλιοθήκες. 

Αφού δημιουργήσατε το νέο έργο, κάντε δεξί κλικ στο φάκελο ```Libraries``` από την προβολή **Projects** και επιλέξτε **Add JAR/Folder...**. Επιλέξτε το ```commons-collections4-x.x.jar``` και **Copy to Libraries Folder** και στη συνέχεια πατήστε το κουμπί **Choose**. Πλέον η βιβλιοθήκη είναι μέρος του έργου σας και έχει αντιγραφεί μέσα στο φάκελο ```lib```. Μπορείτε πλέον να εισάγετε τις κλάσεις της βιβλιοθήκης στον κώδικά σας, π.χ. ως εξής:
```java
import org.apache.commons.collections4.Bag;
```

Π.χ. στο 2ο μάθημα αυτής της εβδομάδας μάθαμε ότι δεν μπορούμε να μετατρέψουμε μια συλλογή σε μια συστοιχία πρωτογενούς τύπου με την ```toArray()```. Χρησιμοποιήστε είτε την ```Ints.toArray(Collection<Integer> collection)``` της βιβλιοθήκης Guava είτε την ```ArrayUtils.toPrimitive()``` της βιβλιοθήκης Apache Commons Collections για το επιτύχετε αυτό. 

Ακολουθήστε τις οδηγίες που θα βρείτε [εδώ](https://stackoverflow.com/questions/43111018/how-to-import-external-libraries-in-jshell-java-9) για να χρησιμοποιήσετε βιβλιοθήκες στο jshell.

## Πηγές:
1. ["The Java Tutorial"](https://docs.oracle.com/javase/tutorial/)
1. [Apache Commons Collections](http://commons.apache.org/proper/commons-collections/)
1. [Eclipse Collections](https://www.eclipse.org/collections/)
1. [Google Guava](https://github.com/google/guava)

---

[<-](../3.5-Queues/README.md) | [Δ](../../README.md) 

---