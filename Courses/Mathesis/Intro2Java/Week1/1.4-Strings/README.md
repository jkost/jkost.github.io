# 1.4 Συμβολοσειρές {#Java} 
© Γιάννης Κωστάρας

---

[<-](../1.3-JavaBasics/README.md) | [Δ](../../README.md) | [->](../1.5-ControlStatements/README.md)

---

Οι συμβολοσειρές (ή αλφαριθμητικά Strings) είναι ένας ακόμα πολύ σημαντικός τύπος δεδομένων της Java. Μια συμβολοσειρά είναι μια ακολουθία χαρακτήρων που περικλείεται από διπλά εισαγωγικά

```bash
jshell> String name = "Αγαμέμνων" 
name ==> "Αγαμέμνων"
jshell> // <=> char data[] = {'Α', 'γ', 'α', 'μ', 'έ', 'μ', 'ν', 'ω', 'ν'}
jshell> String name = "Οδυσσέας" 
name ==> "Οδυσσέας"
jshell> String surname = "Ελύτης" 
name ==> "Ελύτης"
jshell> name + " " + surname
$1==> "Οδυσσέας Ελύτης"
```
Στο παραπάνω παράδειγμα είδαμε πώς μπορούμε να ορίσουμε αλφαριθμητικά καθώς και τη συγχώνευσή τους με τον τελεστή ```+```.

## Πράξεις συμβολοσειρών

**Πίνακας 1.4.1** _Πράξεις/μέθοδοι συμβολοσειρών_

| ```+, concat()``` | Συγχώνευση (δημιουργεί ένα νέο String)
| ```+=``` | Συγχώνευση και εκχώρηση
| ```equals()``` | Έλεγχος για ισότητα
| ```equalsIgnoreCase()``` | Έλεγχος για ισότητα αγνοώντας πεζά/κεφαλαία
| ```toLowerCase()``` | Μετατροπή σε πεζά
| ```toUpperCase()``` | Μετατροπή σε κεφαλαία
| ```contains(s)``` | Περιέχει το ```s```;
| ```indexOf(s)``` | Σε ποιο δείκτη ξεκινά το ```s```, ή ```-1``` αν δε βρέθηκε
| ```length()``` | Μήκος συμβολοσειράς 
| ```substring(αρχή, τέλος)``` | Eξαγωγή συμβολοσειράς
| ```split()``` | Διαχωρισμός αλφαριθμητικών
| ```join()``` | Συνένωση συμβολοσειρών με κάποιο συνενωτικό χαρ.
| ```toCharArray()``` | Μετατροπή σε ακολουθία χαρακτήρων
| ```trim()``` | Αφαίρεση κενών χαρακτήρων από εμπρός/πίσω
| ```replace(s1, s2)``` | Αντικατάσταση του ```s1``` με το ```s2```
| ```charAt(n)``` | n-στός χαρακτήρας
| ```startsWith(s)``` | Αρχίζει με τη συμβολοσειρά ```s```
| ```endsWith(s)``` | Τελειώνει με τη συμβολοσειρά ```s```
| ```isEmpty()``` | Είναι κενή συμβολοσειρά;
| ```valueOf()``` | Μετατρέπει το όρισμα σε συμβολοσειρά

Παραδείγματα:
```bash
jshell> String s1="Καλήν εσπέραν άρχοντες"
s1 ==> "Καλήν εσπέραν άρχοντες"
jshell> String s2=" άρχοντες"
s2 ==> "άρχοντες"
jshell> s1.equals(s2)
$1 ==> false
jshell> s1.length()
$2 ==> 15
jshell> s1.toLowerCase()
$3 ==> "καλήν εσπέραν άρχοντες"
jshell> s1.contains("Καλήν")
$4 ==> true
jshell> s1.indexOf(s2)
$5 ==> 13
jshell> s1.substring(6,13)
$6 ==> "εσπέραν"
jshell> s1.split(" ")
$7 ==> String[3] { "Καλήν", "εσπέραν", "άρχοντες" }
jshell> String.join(" + ", "1", "2", "3")
$8 ==> "1 + 2 + 3"
jshell> s2.trim()
$9 ==> "άρχοντες"
jshell> s2.charAt(0)
$10 ==> ' '
jshell> s1.replace("εσπ", "ημ")
$11 ==> "Καλήν ημέραν άρχοντες»
jshell> s2.endsWith("ες")
$12 ==> true
jshell> String.valueOf(0b100)
$13 ==> "4"
jshell> Integer.toString(0b100)
$14 ==> "4"
jshell> String empty = ""
empty ==> ""
jshell> String quotedStr = "\""
quotedStr ==> """
jshell> String multilineStr= "Σε γνωρίζω από την κόψη\n του σπαθιού την τρομερή"
multilineStr ==> "Σε γνωρίζω από την κόψη
 του σπαθιού την τρομερή"
```

Μεγάλη προσοχή χρειάζεται ώστε για τη σύγκριση δυο αλφαριθμητικών να χρησιμοποιούμε πάντα την ```equals()``` κι όχι τον τελεστή ισότητας ```==``` ο οποίος στη Java ελέγχει αν η ταυτότητα των δυο αντικειμένων τύπου String είναι η ίδια κι όχι αν οι δυο συμβολοσειρές είναι ίσες.

**Πίνακας 1.4.2** _Ειδικοί χαρακτήρες_

| ```\"``` | Διπλό εισαγωγικό
| ```\'``` | Μονό εισαγωγικό
| ```\\``` | Χαρακτήρας backslash (\)
| ```\n``` | Νέα γραμμή (newline ή ```LF``` – line feed) 
| ```\r``` | Νέα γραμμή (```CR``` – carriage return) 
| ```\t``` | Στηλοθέτης (tab)
| ```\f``` | Χαρακτήρας ```FF``` (form feed)
| ```\b``` | Χαρακτήρας backspace (```BS```)
| ```\<octal>``` | Οκταδικός κωδικός (0-255)
| ```\uΧΧΧΧ``` | Χαρακτήρας unicode (16-bit) όπου κάθε ```Χ``` είναι ένα δεκαεξαδικό ψηφίο

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

[<-](../1.3-JavaBasics/README.md) | [Δ](../../README.md) | [->](../1.5-ControlStatements/README.md)

---