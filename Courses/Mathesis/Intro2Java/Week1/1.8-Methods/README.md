# 1.8 Μέθοδοι {#Java} 
© Γιάννης Κωστάρας

---

[<-](../1.7-Arrays/README.md) | [^](../../README.md) | [->](../1.9-Debugging/README.md)

---

## Διαίρει και βασίλευε

Για να αντιμετωπιστούν πολύπλοκα προβλήματα, ένας καλός τρόπος είναι ο μοιρασμός τους («σπάσιμο») σε μικρότερα. Άλλος λόγος είναι η αποφυγή επαναλαμβανόμενου κώδικα 

**Αξίωμα: «Μην Επαναλαμβάνεσαι» (DRY – Don’t Repeat Yourself)**

Στη Java αυτό το πετυχαίνουμε τμηματοποιώντας τον κώδικα σε μεθόδους.

Μια μέθοδος ορίζεται ως εξής:
```java
τύπος_επιστροφής όνομα_μεθόδου(παράμετροι);
```
Π.χ.
```java
jshell> double perimeter(double r) {  // y = perimeter(r)
           return 2*Math.PI*r;
        }
| created method perimeter(double)
jshell> int x = 10
x ==> 10
jshell> perimeter(x)
$3 ==> 62.83185307179586
jshell> /methods
|    perimeter (double)double
```
Παραπάνω ορίσαμε μια μέθοδο ```perimeter()``` η οποία λαμβάνει ως όρισμα (παράμετρο) έναν ```double``` και επιστρέφει έναν ```double```. Μια μέθοδος είναι σαν μια συνάρτηση στα μαθηματικά, π.χ. ```y = f(x)```. Δέχεται ένα όρισμα ```x``` και επιστρέφει μια τιμή ```y```.

```java
jshell> void myPrint(String... lines) {  // varargs
           for (String e : lines) {
		       System.out.println(e);
           }
        }    
|  created method myPrint(String...)
jshell> String[] sentences = new String[] {
"Καλήν εσπέραν άρχοντες",
"πώς είναι ο ορισμός σας"
};
sentences ==> String[2] { "Καλήν εσπέραν άρχοντες", ... }
jshell> myPrint(sentences)
Καλήν εσπέραν άρχοντες
πώς είναι ο ορισμός σας
```
Η σύνταξη ```String...``` είναι ισοδύναμη με ```String[]``` και ονομάζεται _vararg_.

## Εμβέλεια μεταβλητών

Οι μεταβλητές είναι ορατές μόνο στο μπλοκ που ορίζονται μέσα σε { } και σε εμφωλιασμένα μπλοκ.

```java
{                                     __
   int x;                               |
   {                           __       |
	int y;                       | y    | x
   }                           __       |
   ...  // η y δεν υπάρχει              |
}                                      __
```
```java
void printTree(int treeWidth) {
   int i;                                              __
   for (i = 1; i < treeWidth; i = i + 2) {               |
      int j;                                       __    |
      for (j = 0; j < (treeWidth - i) / 2; j++)	     |   |
         System.out.print(' ');                      |   |
      for (j = 0; j < i; j++)                        |   |
         System.out.print('*');	                     |   |
      System.out.println();                          |   |
   }                                                __   |
}                                                       __
```

## Αναδρομή
Μια μέθοδος ονομάζεται αναδρομική όταν καλεί τον εαυτό της.

```java
// υπολογισμός του n παραγοντικό
jshell> int factorial(int n) {
	     if (n <= 2) {
        	return 1;
	     } else {
		return n * factorial(n-1);
	     }	
        }
|  created method factorial(int)
jshell> factorial(3)
$4 ==> 6
```
![](assets/Fig1.png)

**Εικόνα 1.8.1** _Υπολογισμός παραγοντικού αναδρομικά_

## Ασκήσεις
1. Να γράψετε δυο μεθόδους που θα δέχονται ως παραμέτρους την ακτίνα σφαίρας και θα υπολογίζουν η μία την επιφάνεια και η άλλη τον όγκο της σφαίρας. 
2. Να γράψετε μια μέθοδο που μετράει τα κεφαλαία και μικρά γράμματα σε μια φράση που περνιέται σ’ αυτή ως παράμετρος. 
3. Να γράψετε μια μέθοδο που λαμβάνει ως παράμετρο έναν πίνακα από αριθμούς ή ένα vararg και επιστρέφει έναν πίνακα με τα μοναδικά στοιχεία του αρχικού. 
4. Να γράψετε μέθοδο ```initials(String text)``` που δέχεται ως είσοδο ένα κείμενο και επιστρέφει το κείμενο με το αρχικό μόνο σύμβολο κάθε λέξης του (π.χ. αν ```text = "Καλημέρα σας"```, επιστρέφει ````"Κ. Σ."````
5. Να γράψετε  μια μέθοδο που να επιστρέφει αν ένας ακέραιος αριθμός είναι πρώτος ή όχι. Πρώτος ονομάζεται ένας αριθμός αν διαιρείται μόνο από το 1 και τον εαυτό του.
6. Να γράψετε μια αναδρομική μέθοδο που θα υπολογίζει τον αριθμό fibonacci. Ο αριθμός fibonacci ορίζεται ως: ```fib(n) = fib(n-1) + fib(n-2)```


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

[<-](../1.7-Arrays/README.md) | [^](../../README.md) | [->](../1.9-Debugging/README.md)

---