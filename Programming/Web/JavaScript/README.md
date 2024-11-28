# Εισαγωγή στη JavaScript {#javascript} 
© Γιάννης Κωστάρας

---

Η JavaScript (JS) είναι μια από τις πιο δημοφιλής γλώσσες προγραμματισμού και σίγουρα η πιο δημοφιλής γλώσσα του Παγκόσμιου Ιστού (World Wide Web - WWW). Είναι η μοναδική γλώσσα προγραμματισμού που μπορεί να εκτελεστεί στον πλοηγό (browser) και σας επιτρέπει να δώσετε "ζωή" στις στατικές ιστοσελίδες σας. Είναι πλέον μέρος του προτύπου HTML 5 το οποίο αποτελείται από:
```
HTML5 + CSS3 + Javascript 
```
Δημιουργήθηκε το 19

## Κατηγορίες γλωσσών προγραμματισμού
Υπάρχουν πολλές κατηγοριοποιήσεις των γλωσσών προγραμματισμού.
Ανάλογα με τον τρόπο εκτέλεσης, χωρίζονται σε: 
* _μεταγλωττισμένες (compiled)_ όπου ολόκληρο το πρόγραμμα μεταγλωττίζεται σε γλώσσα μηχανής, με τη βοήθεια του _μεταγλωττιστή (compiler)_, για πιο γρήγορη εκτέλεση. Σ’ αυτή την κατηγορία ανήκουν γλώσσες όπως C/C++, C#, Erlang, Java, Rust κ.ά. όπου μετά τη φάση της μεταγλώττισης (και ίσως και της σύνδεσης – linker) παράγεται κάποιο εκτελέσιμο αρχείο (π.χ. ```.exe```, ```.class```, ```.beam``` κλπ.)  
* _μεταφραστικές (interpreted)_ όπου κάθε εντολή του προγράμματος εκτελείται ως έχει χωρίς μεταγλώττιση. Παραδείγματα μεταφραστικών γλωσσών: Perl, Python, Ruby, Javascript, Basic, Visual Basic, bash. 
Ανάλογα με τον τρόπο διαχείρισης της μνήμης (μεταβλητών) διακρίνονται σε:
* _Δυναμικές (dynamic)_ όπου σε μια μεταβλητή μπορεί να αποθηκεύονται διαφορετικού τύπου δεδομένα σε διαφορετικές χρονικές στιγμές. Οι μεταφραστικές γλώσσες προγραμματισμού είναι συνήθως δυναμικές. Π.χ. Perl, Python, Ruby, Javascript, Basic, Visual Basic, bash κ.ά. 
* _Στατικές (static)_ όπου δηλώνουμε από την αρχή τον τύπο δεδομένων μιας μεταβλητής κι αυτός δεν μπορεί ν’ αλλάξει αργότερα. Οι μεταγλωττισμένες γλώσσες προγραμματισμού είναι συνήθως στατικές. Π.χ. C/C++, C#, Erlang, Java, Rust κ.ά.  
Ανάλογα με το μοντέλο προγραμματισμού που χρησιμοποιείται σε:
* _Προστακτικές (Imperative)_, όπου το πρόγραμμα αποτελείται από μια σειρά από εντολές που εκτελούνται με τη σειρά και αλλάζουν τιμές σε μεταβλητές. Η κατάσταση του προγράμματος εξαρτάται κάθε φορά από τις τιμές των μεταβλητών. Υπάρχουν οι εξής δυο υπο-κατηγορίες:
  * _Διαδικαστικές (Procedural)_, που διαχειρίζονται τα δεδομένα και τις διαδικασίες ανεξάρτητα, όπως π.χ. C, Pascal, Fortran, κ.ά.
  * _Αντικειμενοστραφής (Object Oriented)_ όπου οι διαδικασίες (μέθοδοι) εφαρμόζονται στα δικά τους δεδομένα, δηλ. δεδομένα και διαδικασίες εσωκλείονται σε κλάσεις. Π.χ. C++, Java, Javascript, Python, Perl, Ruby, Rust κ.ά.
* _Συναρτησιακές (functional)_ που βασίζονται στις συναρτήσεις (λ-λογισμό) οι οποίες όμως δεν αλλάζουν τα δεδομένα αλλά, όπως και στα μαθηματικά, επιστρέφουν νέα δεδομένα. Π.χ. Java 8, Javascript, Scala, Clojure, Haskell, OCaml, Erlang, Rust κ.ά.
      
Οι στατικές γλώσσες προγραμματισμού στοχεύουν σε ταχύτερη εκτέλεση και μεγάλες εφαρμογές. Οι δυναμικές γλώσσες στοχεύουν σε ευκολία χρήσης και μικρότερες εφαρμογές.
Με βάση τις παραπάνω κατηγορίες, μπορούμε να πούμε ότι η Javascript είναι μια αντικειμενοστραφής, συναρτησιακή, δυναμική, μεταφραστική γλώσσα προγραμματισμού.

### Java και Javascript

Παρόλο που η Javascript χρησιμοποιεί το ίδιο συντακτικό με μια άλλη διαδεδομένη γλώσσα προγραμματισμού, τη γλώσσα Java, οι δυο αυτές γλώσσες είναι πολύ διαφορετικές. Ενώ η η Javascript είναι μια αντικειμενοστραφής, συναρτησιακή, δυναμική, μεταφραστική γλώσσα προγραμματισμού που εκτελείται στον πλοηγό ιστού, η Java είναι μια αντικειμενοστραφής (με συναρτησιακά στοιχεία από την έκδοση 8 και μετά), στατική, μεταγλωττισμένη γλώσσα προγραμματισμού. Τα Java Applets εκτελούνταν στους πλοηγούς, αλλά πλέον καταργήθηκαν λόγω προβλημάτων ασφαλείας.

## Επεξεργαστές κειμένου Javascript
Η Javascript τρέχει κατευθείαν στον πλοηγό. Με άλλα λόγια, **δεν** χρειάζεται εγκατάσταση. Θα δούμε αργότερα πώς μπορούμε να ενσωματώσουμε κώδικα JS σε μια ιστοσελίδα, αλλά για την ώρα θα μάθουμε την ίδια τη γλώσσα.
Όλοι οι πλοηγοί παρέχουν εργαλεία όπου μπορείτε να αποσφαλματώσετε κώδικα Javascript:
* Firefox: μενού **Tools -> Browser Tools -> Web Developer Tools**.  
* Chrome, Chromium, Iron: μενού **View -> Developer -> JavaScript Console**.
* Safari: μενού **Develop -> Show JavaScript Console**.
* Edge: μενού **Tools -> Developer -> JavaScript Console**.

Υπάρχουν όμως και επεξεργαστές κειμένου αλλά και ολοκληρωμένα περιβάλλοντα εργασίας που μπορείτε να εγκαταστήσετε στον υπολογιστή σας:

* [Angular IDE](https://www.genuitec.com/products/angular-ide/)
* [Aptana Studio 3](http://www.aptana.com/)
* [Atom](https://atom.io/)
* [BBEdit](https://www.barebones.com/products/bbedit/)
* [Brackets](http://brackets.io/)
* [CodeEnvy](https://codenvy.com/)
* [CodeLight](https://codelite.org/)
* [CodeLobster](http://codelobsteride.com/)
* [Eclipse](https://www.eclipse.org/ide/)
* [Emacs](https://www.gnu.org/software/emacs/)
* [Geany](http://www.geany.org/)
* Gedit (υπάρχει σε κάθε διανομή Linux)
* [GoormIDE](https://ide.goorm.io/)
* [JetBrains WebStorm](https://www.jetbrains.com/webstorm/)
* [JSFiddle](https://jsfiddle.net/)
* [Kite](https://guru99.live/recommends-kite)
* [Komodo Edit](https://www.activestate.com/komodo-edit)
* [Komodo IDE](https://www.activestate.com/products/komodo-ide/)
* [NetBeans](https://netbeans.org/)
* [Notepad++](https://www.dunebook.com/21-notepad-plugins-to-use/) for Windows
* [Observable](https://observablehq.com/)
* [PSPad](http://www.pspad.com/)
* [RJ TextEdit](https://www.rj-texted.se/)
* [RunJS](https://runjs.app)
* [SciTE](http://www.scintilla.org/SciTE.html)
* [SlickEdit](https://www.slickedit.com/)
* [Sublime](http://www.sublimetext.com/)
* [Vim](https://spacevim.org/use-vim-as-a-javascript-ide/)
* [Visual Studio](https://code.visualstudio.com/)
* [Visual Studio Code](https://code.visualstudio.com/)

αλλά και online:

* [AWS Cloud9](https://aws.amazon.com/cloud9/)
* [Codeanywhere](https://codeanywhere.com)
* [CodePen](https://codepen.io/)
* [Online Javascript Editor](https://js.do/)
* [PlayCode](http://playcode.io/)
* [SourceLair](https://www.sourcelair.com/)
* [W3Schools](https://www.w3schools.com/js/js_editor.asp)

Θα χρησιμοποιήσουμε το [CodePen](https://codepen.io/).

## Το πρώτο μας πρόγραμμα Javascript
```javascript
console.log("Hello world!");
```
Η εντολή ```console.log()``` τυπώνει ότι βρίσκεται μέσα στις παρενθέσεις στην οθόνη. Το ```"Hello world!"``` είναι ένα αλφαριθμητικό (string) και γι' αυτό βρίσκεται σε διπλά εισαγωγικά ("), αλλά και απλά εισαγωγικά (') δηλώνουν επίσης ότι πρόκειται για αλφαριθμητικό. Σημειώστε ότι κάθε εντολή στη JavaScript τελειώνει με ελληνικό ερωτηματικό (```;```) που δηλώνει την άνω τελεία (·) στα αγγλικά.

## Σχόλια
Ο σχολιασμός του κώδικά βοηθάει εμάς και άλλους που τυχόν τον διαβάσουν να κατανοήσουν τι θέλαμε να κάνουμε με συγκεκριμένες εντολές. Ο πλοηγός αγνοεί στα σχόλια. Υπάρχουν δυο ειδών σχόλια στη Javascript:
* ```// Σχόλιο μονής γραμμής```
* ```/* Σχόλια 
πολλών 
γραμμών.*/
````
 
## Μεταβλητές και Τύποι Δεδομένων
Οι μεταβλητές είναι αποθήκες μνήμης όπου μπορούμε ν’ αποθηκεύσουμε διάφορες τιμές και να τις ανακτήσουμε πάλι με το όνομα της μεταβλητής:
```javascript
let my_variable = 43;
console.log(my_variable);
43
```
Δηλώσαμε μια μεταβλητή με όνομα ```my_variable``` και αποθηκεύσαμε σ’ αυτή την τιμή ```43``` και στην επόμενη γραμμή εκτυπώσαμε την μεταβλητή αυτή. Παρατηρήστε ότι, αντιθέτως με τις στατικές γλώσσες προγραμματισμού, **δεν** απαιτείται να δηλώσουμε τον τύπο της μεταβλητής ```my_variable```· αυτός εννοείται από τον τύπο δεδομένων της τιμής εκχώρησης (ακέραιος στο παράδειγμά μας). Μάλιστα, οι δυναμικές γλώσσες προγραμματισμού, όπως η Javascript, επιτρέπουν ν’ αλλάξετε τον τύπο δεδομένων μιας μεταβλητής κατά τη διάρκεια του προγράμματος:
```javascript
my_variable = 'Hello';
console.log(my_variable);
Hello
```
Παρατηρήστε ότι χρησιμοποιήσαμε την δεσμευμένη λέξη (keyword) ```let``` μόνο την πρώτη φορά που ορίσαμε τη μεταβλητή ```my_variable```. Αν ξαναγράψετε ```let my_variable = 'Hello';``` αυτό είναι συντακτικό λάθος και ο μεταφραστής JavaScript θα παραπονεθεί:
```javascript
SyntaxError: Cannot declare a let variable twice: 'my_variable'
```
Μπορείτε φυσικά να μη χρησιμοποιήσετε καθόλου την δεσμευμένη λέξη ```let```....

Μπορείτε να χρησιμοποιήσετε και τη δεσμευμένη λέξη ```var``` για να ορίσετε μεταβλητές στη JavaScript, αυτή όμως έχει αντικατασταθεί από την προτιμώμενη ```let``` στις πιο πρόσφατες εκδόσεις της JS. Η ```var``` χρησιμοποποιεί ένα χαρακτηριστικό της γλώσσας με το οποίο μπορεί να χρησιμοποιηθεί μια μεταβλητή προτού οριστεί ([hoisting](https://www.w3schools.com/js/js_hoisting.asp)). Π.χ.

```javascript
var x = 1;
console.log(x);
console.log(y);
var y = 2;
```
όπου το αποτέλεσμα είναι:

```javascript
1
undefined
```
καθώς η μεταβλητή ```y``` αρχικοποιείται μετά από το σημείο στο οποίο καλείται. Για το λόγο αυτό η ```var``` πλέον έχει αντικατασταθεί από τη ```let``` και καλό είναι στην αρχή του αρχείου σας να δηλώνετε την οδηγία:
```javascript
"use strict"; 
```
η οποία σας υποχρεώνει να δηλώνετε όλες τις μεταβλητές σας προτού τις χρησιμοποιήσετε.

Οι μεταβλητές έχουν τα εξής πλεονεκτήματα:
* Δεν χρειάζεται να ξαναγράψετε τα δεδομένα σας κάθε φορά που θέλετε να τα χρησιμοποιήσετε στο πρόγραμμά σας. Έστω π.χ. ότι χρησιμοποιείτε την τιμή 42 7 φορές στο πρόγραμμά σας. Αντί γι' αυτό, καταχωρείτε την τιμή 42 σε μια μεταβλητή ```value``` και χρησιμοποιείτε την μεταβλητή ```value``` 7 φορές στο πρόγραμμά σας.
* Αν αργότερα χρεαστεί να τροποποιήσετε την τιμή 42 π.χ. σε 44 αρκεί να αλλάξετε την τιμή της μεταβλητής ```value``` μια φορά αντί να αλλάζετε την τιμή 42 7 φορές στο πρόγραμμά σας.  

Η Javascript υποστηρίζει 7 βασικούς τύπους δεδομένων:
* αριθμούς ```number``` (ακέραιους και δεκαδικούς):
```javascript
let my_int=7;
let my_float=1.23;
console.log(typeof(my_int));
"number"
console.log(typeof(my_float));
"number"
```
* λογικούς (```boolean```) ```true, false```:
```javascript
let my_bool=true;
console.log(typeof(my_bool));
"boolean"
```
* αλφαριθμητικά (```string```):
```javascript
console.log(typeof(my_variable));
"string"
```
* ```null``` μη ανάθεση τιμής:
```javascript
my_variable=null;
console.log(typeof(my_variable));
"object"
```
* ```Undefined```:
```javascript
let my;
console.log(typeof(my));
"undefined"
```
* σύμβολα (```symbol```)
* αντικείμενα (```object```) δηλ. συλλογές από δεδομένα όπως θα δούμε παρακάτω.

| **Τύπος Δεδομένων** | **Τιμές** | **Πράξεις/τελεστές** |
| Λογικός (boolean)  | ```true, false``` | ```And, & , or, |, xor, ^, not, ~ ```|
| Αριθμός (number)  | | ```+, -, *, /, %``` |
| Αλφαριθμητικό (string) | Μέσα σε ```' '``` ή ```" "``` | ```+``` |
| Null | ```null``` ||
| Undefined | ```undefined``` | |

| **Άλλοι Τελεστές** |
| Σύγκρισης | ```===, !==, >, >=, <, <=``` |
| Εκχώρισης | ```=``` |

Το ```%``` δηλώνει το υπόλοιπο (modulo) μιας διαίρεσης:
```javascript
console.log(5/4);  // πηλίκο
1.25
console.log(5%4);  // ακέραιο υπόλοιπο
1
let my_variable= 'Hello';
console.log(my_variable + ' JavaScript!');  // τελεστής συγχώνευσης αλφαριθμητικών
Hello JavaScript!
console.log(`${my_variable} JavaScript!`);  // template literal, χρήση των `` και ${}
Hello JavaScript!
```
ενώ μόλις είδατε τι σημαίνει ο τελεστής συγχώνευσης - concatenation (```+```) για αλφαριθμητικά! Επίσης, η τελευταία ```console.log()``` δείχνει τη χρήση του template literal (``).
Φυσικά, υπάρχει η προτεραιότητα πράξεων και μπορείτε να την αλλάξετε με χρήση παρενθέσεων:
```javascript
console.log(3+6*2);
15
console.log((3+6)*2);
18
```
Ο τύπος δεδομένων ```string``` είναι επίσης τύπος αντικειμένου ```object``` κι έτσι, όπως θα δούμε, διαθέτει κάποιες ιδιότητες:
```javascript
console.log(my_variable.length);
5
```
Η ιδιότητα (property) ```length``` του τύπου δεδομένων ```string``` επιστρέφει τον αριθμό χαρακτήρων του αλφαριθμητικού. 
Πέραν από ιδιότητες, τα αντικείμενα διαθέτουν, όπως θα δούμε, και μεθόδους (methods). Οι μέθοδοι είναι ενέργειες πάνω στα αντικείμενα. Π.χ.
```javascript
console.log(my_variable.toUpperCase());
HELLO 
console.log(my_variable.startsWith('H'));
true
```
Παραπάνω καλέσαμε δυο μεθόδους, τις ```toUpperCase()``` και ```startsWith('H')```, στο αντικείμενο ```my_variable```. Η διαφορά των μεθόδων από τις ιδιότητες είναι ότι οι πρώτες απαιτούν παρενθέσεις ```()```. Μέσα στις παρενθέσεις μπορούμε να περάσουμε προαιρετικά ορίσματα, όπως π.χ. το ```'H'``` στη μέθοδο ```startsWith('H')```. Μια πλήρης αναφορά με τις μεθόδους που διαθέτει η ```string``` υπάρχουν [εδώ](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/prototype).
Η πρώτη εντολή που γράψαμε, ```console.log()```, είναι επίσης μια μέθοδος, η μέθοδος ```log()``` η οποία καλείται στο αντικείμενο ```console```. Παρατηρήστε άλλη μια χρήση της ```console.log()```:
```javascript
console.log(`my_variable = ${my_variable}`);

```
Πέραν της ```console``` υπάρχουν κι άλλα [αντικείμενα που παρέχονται από τη JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects), π.χ.

```javascript
console.log(Math.random()); // τυπώνει έναν τυχαίο αριθμό μεταξύ 0 και 1 (δεν συμπεριλαμβάνεται)
0.005783424949375893
```
Για να δημιουργήσουμε έναν τυχαίο αριθμό μεταξύ 0 και 100:
```javascript
console.log(Math.random() * 100);
45.21333469044685
console.log(Math.random() * 100 + 1);  // αν θέλουμε να περιλαμβάνεται και το 100
34.407535204175346
```
Για να τον μετατρέψουμε σε ακέραιο, μπορούμε να χρησιμοποιήσουμε μια άλλη μέθοδο της ```Math```:
```javascript
console.log(Math.floor(Math.random() * 100));
99
```
H ```floor()``` στρογγυλοποιεί προς τα κάτω (ενώ η ```ceil()``` προς τα πάνω). Παρατηρήστε ότι περνάμε σαν όρισμα της ```Math.floor()``` το αποτέλεσμα της ```Math.random() * 100```. 
[Μέθοδοι της Math](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math).
[Μέθοδοι της Number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number).

Η συνάρτηση ```int()``` μετατρέπει από έναν τύπο δεδομένων σ’ έναν άλλο, (από ```str``` σε ```int``` στην προκειμένη περίπτωση). Η συνάρτηση ```str()``` κάνει την αντίστροφη μετατροπή (από ```int``` σε ```str```). Υπάρχουν επίσης οι ```oct(), hex()``` και ```bin()```. Υπάρχει όμως και μια δεύτερη έκδοση της ```int()```:
```javascript
console.log(5.toString(2)); 
5
int('AE',16)
174
```
```javascript
x = 0
x += 1   // είναι ισοδύναμη με x = x + 1
console.log(x
1
```
Υπάρχουν και οι τελεστές ```-=, *=, /=, %=, //=, **=``` που δουλεύουν παρόμοια. Τέλος, οι τελεστές ```<<``` (αριστερή ολίσθηση) και ```>>``` (δεξιά ολίσθηση).
```javascript
console.log(014     # οκταδικός (0o14 στην python3)
12
console.log(0xC     # δεκαεξαδικός
12
console.log(0b1100  # δυαδικός
12
x << 1  # αριστερή ολίσθηση (left shift)
24
x >> 1  # δεξιά ολίσθηση (right shift)
6
```
Είδαμε ότι μπορούμε να ορίσουμε ένα αλφαριθμητικό μέσα σε ```' '``` ή ```" "```. Τι γίνεται όμως αν αυτοί οι δυο χαρακτήρες υπάρχουν μέσα στο αλφαριθμητικό μας;
```javascript
console.log('This isn't a joke.'
  File "<stdin>", line 1
    console.log('This isn't a joke.'
                    ^
SyntaxError: invalid syntax
```
Στην περίπτωση αυτή χρησιμοποιούμε τον χαρακτήρα διαφυγής ```\``` (escape character):
```javascript
console.log('This isn\'t a joke.'
This isn't a joke.
```
Ας δούμε  τώρα πώς μπορούμε να γράψουμε ένα πρόγραμμα Python. Στον αγαπημένο σας κειμενογράφο εισάγετε το παρακάτω:
```javascript
#!/usr/bin/env python
console.log('Hello. I am a python program.'
name = raw_input("What is your name? ")
console.log("Hello " + name + ". Welcome to Python!"
```
και αποθηκεύστε το ως π.χ. ```hello-python.py```.
```javascript
$ chmod +x hello-python.py
$ ./hello-python.py 
Hello. I am a python program.
What is your name? John
Hello John. Welcome to Python!
```
Η εντολή ```raw_input()``` θα εμφανίσει το μήνυμα, που του περνάμε ως όρισμα, στη γραμμή εντολών και θα αποθηκεύσει την είσοδο του χρήστη στη μεταβλητή ```name```. 
Ας δοκιμάσουμε και την ελληνική έκδοση του προγράμματος (```hello-python-el.py```):
```javascript
#!/usr/bin/env python
console.log('Γειά σου. Είμαι ένα πρόγραμμα python.'
name = raw_input("Πώς ονομάζεσαι; ")
console.log("Γειά σου " + name + ". Καλωσήρθες στην Python!"

$ chmod +x hello-python-el.py
$ ./hello-python-el.py 
  File "./hello-python-el.py", line 2
SyntaxError: Non-ASCII character '\xce' in file ./hello-python-el.py on line 2, but no encoding declared; see http://www.python.org/peps/pep-0263.html for details
```
Τζίφος! Αν διαβάσουμε τον υπερσύνδεσμο που μας προτείνει τότε αρκεί να κάνουμε την ακόλουθη αλλαγή για να δουλέψει:
```javascript
#!/usr/bin/env python
# -*- coding: utf8 -*-
console.log('Γειά σου. Είμαι ένα πρόγραμμα python.'
name = raw_input("Πώς ονομάζεσαι; ")
console.log("Γειά σου " + name + ". Καλωσήρθες στην Python!"

$ ./hello-python-el.py 
Γειά σου. Είμαι ένα πρόγραμμα python.
Πώς ονομάζεσαι; Γιάννης
Γειά σου Γιάννης. Καλωσήρθες στην Python!
``` 
Ας δοκιμάσουμε με την python 3 (```hello-python-3-el.py```):
```javascript
#!/usr/bin/env python3
# -*- coding: utf8 -*-
print('Γειά σου. Είμαι ένα πρόγραμμα python.')
name = input("Πώς ονομάζεσαι; ")
print("Γειά σου " + name + ". Καλωσήρθες στην Python!")

$ chmod +x hello-python-3-el.py
$ ./hello-python-3-el.py 
Γειά σου. Είμαι ένα πρόγραμμα python.
Πώς ονομάζεσαι; Γιάννης
Γειά σου Γιάννης. Καλωσήρθες στην Python!
```
Παρατηρήστε ότι στην python3 η ```raw_input()``` έχει μετονομαστεί σε ```input()```. Ο χαρακτήρας ```+```, όπως θα δούμε, είναι ο χαρακτήρας συγχώνευσης αλφαριθμητικών. Υπάρχει όμως κι άλλος τρόπος να συγχωνεύσουμε μεταβλητές με αλφαριθμητικά και να τα εμφανίσουμε στην οθόνη. Έτσι η τελευταία εντολή του προγράμματος (python 2) μπορεί να γραφεί και ως εξής:
```javascript
console.log("Γειά σου %s. Καλωσήρθες στην Python!" %(name)
```
Ο τελεστής ```%``` στο τέλος του αλφαριθμητικού θα αντικαταστήσει τα ```%s``` μέσα στο αλφαριθμητικό με τις μεταβλητές μέσα στις παρενθέσεις (χωρισμένες με κόμμα αν είναι περισσότερες από μια). Φυσικά υπάρχουν και ```%i``` ή ```%d```, ```%f``` για ```int, float``` αντίστοιχα. Π.χ. η παρακάτω εντολή σημαίνει δυο ψηφία μετά την υποδιαστολή:
```javascript
console.log("%.2f" % 5.2
5.20
```

## Σχόλια
```javascript
# Αυτό είναι ένα σχόλιο μιας γραμμής
"""Αυτό είναι ένα σχόλιο
πολλών γραμμών"""
```

## Εντολές αποφάσεων και επανάληψης
Όπως κάθε γλώσσα προγραμματισμού, έτσι και η Python υποστηρίζει εντολές αποφάσεων και επανάληψης. 
Η εντολή αποφάσεων if συντάσσεται ως εξής:
```javascript
if συνθήκη1:
    body
elif συνθήκη2:
    body
else:
    body
```
Προσέξτε να μην ξεχάσετε το ```:``` μετά από κάθε συνθήκη.
Ένα σημαντικό θέμα σε κάθε γλώσσα προγραμματισμού είναι πώς να καθορίζουμε ποιες εντολές είναι να εκτελεστούν μαζί, ως μπλοκ, και ποιες όχι. Π.χ. στην Java, C/C++, ένα μπλοκ κώδικα ορίζεται μέσα σε ```{ }```, στην Pascal μεταξύ των εντολών ```BEGIN END``` κλπ. Η Python χρησιμοποιεί τα κενά! Όσες εντολές έχουν εσοχή 4 κενά από την αρχή αποτελούν ένα μπλοκ, 8 κενά αποτελούν ένα εσωτερικό μπλοκ κ.ο.κ. 
_Προσοχή!_ Μπορείτε να χρησιμοποιήσετε και τον στηλοθέτη (tab) μόνο αν τον έχετε ορίσει στους 4 χαρακτήρες.
Ας δούμε ένα παράδειγμα με το παρακάτω πρόγραμμα ```testif.py```:
```javascript
#!/usr/bin/env python3
answer = input("Σου αρέσει η Python (Ν/ν/Ο/ο);")
if answer == 'Ν' or answer == 'ν':
    print("Καλωσήρθες στη Python!")
elif answer == 'Ο' or answer == 'ο':
    console.log(("Μήπως να το ξανασκεφτόσουνα;")
else:
    print("Απάντησε με Ν/Ο")
```
Παρατηρήστε ότι ο έλεγχος για ισότητα γίνεται με ```==``` ενώ για ανισότητα με ```!=```.
```javascript
$ chmod +x testif.py
$ ./testif.py 
Σου αρέσει η Python (Ν/ν/Ο/ο);N
Καλωσήρθες στη Python!
$ ./testif.py 
Σου αρέσει η Python (Ν/ν/Ο/ο);ο
Μήπως να το ξανασκεφτόσουνα;
$ ./testif.py 
Σου αρέσει η Python (Ν/ν/Ο/ο);Μ
Απάντησε με Ν/Ο
```

### Εντολή επανάληψης:
```javascript
while συνθήκη:
    body
```
Π.χ.
```javascript
i = 0
while i < 10: 
...    i += 1
...    console.log(i
... console.log('All Done'
```
εμφανίζει τους ακεραίους από ```1-10``` και στο τέλος ```All Done```.
Ας δούμε άλλο ένα παράδειγμα (```testwhile.py```):
```javascript
#!/usr/bin/env python3
answer = input("Σου αρέσει η Python (Ν/ν/Ο/ο); ")
while not (answer == 'Ν' or answer == 'ν' or answer == 'Ο' or answer == 'ο'):
    answer = input("Σου αρέσει η Python; Απάντησε με (Ν/ν/Ο/ο).")
print('Ευχαριστώ για την απάντηση!')

$ chmod u+x testwhile.py
$ ./testwhile.py
Σου αρέσει η Python (Ν/ν/Ο/ο); λ
Σου αρέσει η Python; Απάντησε με (Ν/ν/Ο/ο): ν
Ευχαριστώ για την απάντηση!
```
Θα μπορούσαμε να γράψουμε τη συνθήκη κι ως εξής, όπως θα μάθουμε παρακάτω:
```while not answer in ['Ν', 'ν', 'Ο', 'ο']:```
Θα πρέπει να προσέχετε η συνθήκη να παίρνει κάποια στιγμή την τιμή ```False```, διαφορετικά πέφτετε σε ατέρμονο βρόγχο και το πρόγραμμά σας δεν τελειώνει ποτέ.
Υπάρχει και μια άλλη έκδοση της ```while```:
```javascript
while συνθήκη:
    body1
else:
    body2
```
Το μπλοκ ```else``` θα εκτελεστεί όταν η συνθήκη γίνει ```False```. Π.χ.
```javascript
#!/usr/bin/env python3
count = 1
answer = input("Σου αρέσει η Python (Ν/ν/Ο/ο); ")
while count < 3 and not answer in ['Ν', 'ν', 'Ο', 'ο']:
    count += 1
    answer = input("Σου αρέσει η Python; Απάντησε με (Ν/ν/Ο/ο): ")
    if answer in ['Ν', 'ν', 'Ο', 'ο']:
        print('Ευχαριστώ για την απάντηση!')    
else:
    print('Ξεπέρασες τον επιτρεπτό αρ. προσπαθειών!')

$ ./testwhile.py
Σου αρέσει η Python (Ν/ν/Ο/ο); α
Σου αρέσει η Python; Απάντησε με (Ν/ν/Ο/ο): σ
Σου αρέσει η Python; Απάντησε με (Ν/ν/Ο/ο): δ
Ξεπέρασες τον επιτρεπτό αρ. προσπαθειών!
```

### Εντολή επανάληψης:
```javascript
for μεταβλητή in λίστα_τιμών:
    body1
else
    body2
```
Π.χ.
```javascript
for i in range(0,10): 
    console.log(i+1
console.log('All Done'
```
Το παραπάνω πρόγραμμα εμφανίζει τους ακεραίους από ```1-10``` και στο τέλος ```All Done```. Η μεταβλητή ```i``` παίρνει τιμές από ```0-9```.
Παρατηρήστε ότι η τελευταία εντολή είναι έξω από το μπλοκ εντολών που εκτελούνται από τη ```for```. Αν κάναμε το λάθος να τη γράψουμε όπως στο παρακάτω:
```javascript
for i in range(0,10): 
    console.log(i+1
    console.log('All Done'
```
το ```All Done``` θα εμφανιζόταν επίσης 10 φορές. Επομένως χρειάζεται μεγάλη προσοχή για το που αρχίζει και που τελειώνει ένα μπλοκ εντολών που ορίζεται με εσοχές.
Παρακάτω θα δούμε κι άλλες χρήσεις της ```for```.

## Δομές Δεδομένων
Η Python υποστηρίζει τις ακόλουθες δομές δεδομένων:

### Λίστες (Lists)
Ορίζονται μέσα σε ```[ ]```. Οι λίστες μπορούν να περιλαμβάνουν οποιονδήποτε τύπο δεδομένων: αριθμούς, αλφαριθμητικά, άλλες λίστες, κλπ. Η σύνταξη μιας λίστας είναι ```[Element1, Element2, ..., ElementN]``` και όπως ειπώθηκε, κάθε ```Element``` μπορεί να ανήκει σε διαφορετικό τύπο δεδομένων:
```javascript
months = ['Ιανουάριος','Φεβρουάριος','Μάρτιος','Απρίλιος','Μάιος','Ιούνιος','Ιούλιος','Αυγούστος','Σεπτέμβριος','Οκτώβριος','Νοέμβριος','Δεκέμβριος']
console.log(months[0]
Ιανουάριος
```
Οι λίστες ξεκινάνε από το δείκτη ```0```.
```javascript 
console.log(months[9:12]
['\xce\x9f\xce\xba\xcf\x84\xcf\x8e\xce\xb2\xcf\x81\xce\xb9\xce\xbf\xcf\x82', '\xce\x9d\xce\xbf\xce\xad\xce\xbc\xce\xb2\xcf\x81\xce\xb9\xce\xbf\xcf\x82', '\xce\x94\xce\xb5\xce\xba\xce\xad\xce\xbc\xce\xb2\xcf\x81\xce\xb9\xce\xbf\xcf\x82']
```
Ενώ στην python 3 η παραπάνω εντολή δουλεύει σωστά επιστρέφοντας ```['Οκτώβριος', 'Νοέμβριος', 'Δεκέμβριος']```, στην 2 όχι. Αν και δοκίμασα τα πάντα που βρήκα στο Διαδίκτυο, δεν κατάφερα να βρω πώς να εμφανίσω σωστά την παραπάνω εντολή στην Python 2.
Παρατηρήστε ότι η παραπάνω εντολή επιστρέφει τα στοιχεία 9, 10 και 11 της λίστας. 
Συνεχίζουμε με Python 3. Υπάρχουν διάφορες συναρτήσεις για λίστες:
```javascript
basket = []
basket.append("πληκτρολόγιο")
basket.append("οθόνη")
basket.append("ποντίκι")
print(basket)
['πληκτρολόγιο', 'οθόνη', 'ποντίκι']
print(len(basket))
3
indx = basket.index("οθόνη")
print(indx)
1
basket.insert(indx, "mousepad")
print(basket)
['πληκτρολόγιο', 'mousepad', 'οθόνη', 'ποντίκι']
for item in basket:
...     print(item)
πληκτρολόγιο
mousepad
οθόνη
ποντίκι
basket.sort()
for i in range(len(basket)):
...     print(basket[i])
mousepad
οθόνη
πληκτρολόγιο
ποντίκι
basket.remove('mousepad')
print(basket)
['οθόνη', 'πληκτρολόγιο', 'ποντίκι']
item = basket.pop() #διαγραφή τελευταίου στοιχείου
print(basket)
['οθόνη', 'πληκτρολόγιο']
del(basket[0])
print(basket)
['πληκτρολόγιο']
basket2 = ['joystick']
print(basket + basket2)  # συγχώνευση
['πληκτρολόγιο', 'joystick']
```
Αν θέλουμε να προσπελάσουμε μόνο τα στοιχεία που βρίσκονται στις ζυγές θέσης στη λίστα, χρησιμοποιούμε τον τελεστή τεμαχισμού ```[start:end:step]``` (Το ```end``` δεν περιλαμβάνεται, δηλ. το διάστημα είναι ```[start, end)```):
```javascript
basket = ['πληκτρολόγιο', 'οθόνη', 'ποντίκι']
print(basket[0::2])
['πληκτρολόγιο', 'ποντίκι']
ae = ['A', 'Β', 'Γ', 'Δ', 'Ε']
print(ae[3:])
['Δ', 'Ε']
print(ae[:2])
['A', 'Β']
print(ae[::2])
['A', 'Γ', 'Ε']
```
Η συνάρτηση ```range(start,stop,step)``` επιστρέφει μια λίστα ακεραίων:
```javascript
range(6) # => [0,1,2,3,4,5]
range(1,6) # => [1,2,3,4,5]
range(1,6,3) # => [1,4] 
```
Η χρήση της ```for``` για λίστες που είδαμε παραπάνω έχει το μειονέκτημα είναι ότι δεν γνωρίζουμε σε ποια θέση βρισκόμαστε στη λίστα. Θα μπορούσαμε να χρησιμοποιήσουμε έναν μετρητή, αλλά υπάρχει κι ο παρακάτω τρόπος:
```javascript
basket = ['πληκτρολόγιο', 'οθόνη', 'ποντίκι']
for index, item in enumerate(basket):
...     print("%d: %s" % (index, item))
0: πληκτρολόγιο
1: οθόνη
2: ποντίκι
```
Επίσης, υποστηρίζονται και iterators όπως και με άλλες γλώσσες προγραμματισμού:
```javascript
i = iter(basket)
while hasNext(i):
...     print(next(i))
πληκτρολόγιο
οθόνη
ποντίκι
Traceback (most recent call last):
  File "<stdin>", line 2, in <module>
StopIteration
```
Η εξαίρεση που βλέπετε στο τέλος είναι φυσιολογική.
Αν θέλουμε να προσπελάσουμε δυο λίστες ταυτόχρονα, τότε η Python παρέχει λύση και γι’ αυτό:
```javascript
for item1, item2 in zip(basket, basket2):
...     print("%s ή %s;" % (item1, item2))
πληκτρολόγιο ή joystick;
```
Η ```zip()``` σταματάει στο τέλος της μικρότερης λίστας.
Φυσικά και υποστηρίζονται n-διάστατες λίστες, π.χ.:
```javascript
matrix2D = [[3,5],[2,-1]] # πίνακας 2x2
console.log(matrix2D[0]
[3, 5]
```
### Λεξικά (dictionaries)
Ορίζονται μέσα σε ```{ }```. Η διαφορά του με τη λίστα είναι ότι αντί για δείκτες για προσπέλαση των τιμών, χρησιμοποιούνται _κλειδιά (keys)_. Ένα κλειδί μπορεί να είναι είτε ακέραιος αριθμός είτε αλφαριθμητικό. Σε άλλες γλώσσες προγραμματισμού ονομάζονται _πίνακες κατακερματισμού (hashmaps)_. Η σύνταξη ενός λεξικού είναι ```{key1 : value1, key2 : value2, ..., keyN : valueN}``` και κάθε ```value``` μπορεί να ανήκει σε διαφορετικό τύπο δεδομένων:
```javascript
stock = {'πληκτρολόγια' : 56, 'ποντίκια' : 85, 'mousepads' : 111}
print(stock['mousepads'])
111
stock['πληκτρολόγια'] = 50
stock['οθόνες'] = 13
print(stock)
{'πληκτρολόγια': 50, 'mousepads': 111, 'οθόνες': 13, 'ποντίκια': 85}
print(stock.get('οθόνες'))
13
print(stock.keys())
dict_keys(['πληκτρολόγια', 'οθόνες', 'mousepads', 'ποντίκια'])
print(stock.values())
dict_values([50, 13, 111, 85])
print(stock.items())
dict_items([('πληκτρολόγια', 50), ('οθόνες', 13), ('mousepads', 111), ('ποντίκια', 85)])
del stock['οθόνες']
print(stock)
{'πληκτρολόγια': 50, 'mousepads': 111, 'ποντίκια': 85}
for key, value in stock.items():
...     print(key, value)
πληκτρολόγια: 50
mousepads: 111
ποντίκια: 85
```
### Πλειάδες (tuples)
Ορίζονται μέσα σε ```( )```. Η πλειάδα είναι μια αμετάβλητη (immutable) λίστα. Μετά τη δημιουργία της, δεν μπορούμε ν’ αλλάξουμε ούτε το μέγεθος ούτε το περιεχόμενό της. Είναι κάτι αντίστοιχο των enumerated types (enum) σε γλώσσες όπως η Java ή οι C/C++/C#. Η σύνταξη μιας πλειάδας είναι ```(Element1, Element2, ..., ElementN)``` και κάθε ```Element``` μπορεί να ανήκει σε διαφορετικό τύπο δεδομένων:
```javascript
colors = ('black', 'blue', 'red', 'green', 'yellow')
colors[1]
'blue'
colors[1] = 'cyan'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: 'tuple' object does not support item assignment 
```
Προσοχή απαιτείται σε πλειάδες που περιέχουν ένα μόνο στοιχείο:
```javascript
singleton = (1)
console.log(singleton
1
singleton_tuple = (1,) # το κόμμα απαιτείται
console.log(singleton_tuple
(1,)
```
Υποστηρίζονται οι τελεστές ```+``` και ```*```, όπως και στις λίστες καθώς και ο τεμαχισμός τους:
```javascript
colors[1:3]
('blue', 'red')
colors[1:3] * 2
('blue', 'red', 'blue', 'red')
```

### Σύνολα (sets)
Ορίζονται μέσα σε ```{ }```. Ένα σύνολο περιέχει μη ταξινομημένα στοιχεία τα οποία είναι μοναδικά, δηλ. δεν υπάρχουν διπλότυπα. Η σύνταξη μιας πλειάδας είναι ```{Element1, Element2, ..., ElementN}``` και κάθε ```Element``` μπορεί να ανήκει σε διαφορετικό τύπο δεδομένων:
```javascript
s1 = {'black', 'blue', 'red'}
s2 = set(['green', 'yellow'])
print(s2)
{'green', 'yellow'}
s2.add('blue')
s2.add('green')  # υπάρχει ήδη
print(s2)
{'green', 'blue', 'yellow'}
s2.remove('green')
print(s2)
{'blue', 'yellow'}
```
Τα σύνολα υποστηρίζουν τις ακόλουθες πράξεις:

| **Πράξη** | **Σύμβολο**  |
| Αφαίρεση | ```-```  |
| Ένωση | ```|``` |
| Τομή | ```&``` |
| Υπερσύνολο | ```&gt;``` |
| Υποσύνολο | ```&lt;```  |
| Ισότητα | ```==``` |
| Ανισότητα | ```!=``` |

```javascript
print(s1 - s2)  # αφαίρεση
{'red', 'black'}
print(s1 | s2)  # ένωση
{'red', 'blue', 'black', 'yellow'}
print(s1 & s2)  # τομή
{'blue'}
print(s1 > s2)
False
print(s1 < s2)
False
print(s1 == s2)
False
print(s1 != s2)
True
print('black' in s1)
True
```
Και μια σύνταξη που μπορεί να σας εκπλήξει:
```javascript
[val * 1.23 for val in stock.values()]
[136.53, 104.55, 61.5]
```
Σύνταξη _List Comprehension_: ```[operation for var in iterable if condition]```
```javascript
[i for i in range(11) if i % 2 == 0]
[0, 2, 4, 6, 8, 10]
```
Η Python 3 υποστηρίζει και:
_Set comprehension_: ```{operation for var in set if condition}```
_Dict comprehension_: ```{key:value for key,value in sequence if condition}```

## Αλφαριθμητικά
Τα αλφαριθμητικά (```str```) είναι κι αυτά λίστες χαρακτήρων που ξεκινάνε από το δείκτη ```0```:
```javascript
day = "Καλημέρα"
console.log(day[0]

>>>
``` 
Τζίφος!
```javascript
$ python3
Python 3.4.3 (default, Sep 14 2016, 12:36:27) 
[GCC 4.8.4] on linux
Type "help", "copyright", "credits" or "license" for more information.
day = "Καλημέρα"
print(day[0])
Κ
```
Αν όμως θέλετε να μάθετε πώς να εκτελέσετε τον παραπάνω κώδικα στην Python 2 μπορείτε να δηλώσετε ότι το ```"Καλημέρα"``` είναι unicode με έναν από δυο τρόπους:
```javascript
day = unicode("Καλημέρα",'utf8')
console.log(day[0]
Κ
day = u"Καλημέρα"
console.log(day[1]
α
console.log(day[4:8]
μέρα
```
Υποστηρίζονται οι ακόλουθες συναρτήσεις:
```javascript
length = len(day)
print(length)
8
print(day.lower())
καλημέρα
day.islower()
False
print(day.upper())
ΚΑΛΗΜΈΡΑ
day.isupper()
False
print(day.find("μέρα")) # σε ποια θέση;
4
print(day[4:len(day)])  # substring
μέρα
s = "Καλημέρα φίλε!"
print(s.split(' '))
['Καλημέρα', 'φίλε!']
s.replace("!","!!")
'Καλημέρα φίλε!!'
print(s.isalpha())    # δεν περιέχει αριθμούς κλπ.
False
print(day.isalpha())
True
for letter in day:
...     if letter == 'α':
...         print(letter)
α
α
```
## Συναρτήσεις και Βιβλιοθήκες
Οι συναρτήσεις είναι μπλοκ εντολών που εκτελούνται ως σύνολο όταν καλούνται. Οι συναρτήσεις στη Python ορίζονται ως εξής:
```javascript
def function_name(parameters):
    body
```
όπου οι παράμετροι μπορεί να είναι οποιονδήποτε τύπου δεδομένων (π.χ. αλφαριθμητικό, λίστα κλπ.)
Ας δούμε μια συνάρτηση η οποία βρίσκει αν μια λέξη είναι παλινδρομική. Κατ’ αρχήν, θα πρέπει να βρούμε την αντίστροφη της λέξης (text):
```javascript
def reverse(text):
    reversedtext = []
    for i in range(len(text)-1, -1, -1):
        reversedtext.append(text[i])
    return ''.join(reversedtext)
```
Υπάρχουν πολλοί τρόποι για ν’ αντιστρέψουμε μια λέξη, όπως μπορείτε να βρείτε στο διαδίκτυο, π.χ. ένας πιο σύντομος κάνει χρήση της συνάρτησης ```reversed()```:
```javascript
''.join(list(reversed(text)))
```
ένας άλλος είναι ```text[::-1]```.
Ας δούμε όμως αυτήν που γράψαμε παραπάνω. Η λέξη ```text``` περνιέται ως παράμετρος στη συνάρτηση ```reverse()```. Η ```range()``` επιστρέφει τους αριθμούς από το μήκος της λέξης παρά ένα, μέχρι το ```-1```, δηλ. αντίστροφα. Οι χαρακτήρες ένας-ένας επισυνάπτονται στη λίστα reservedtext ενώ η τελευταία εντολή μετατρέπει τη λίστα σε αλφαριθμητικό.
Πλέον, η παλινδρομική συνάρτηση μπορεί να γραφτεί πολύ εύκολα ως:
```javascript
def isPalindrome(text):
    return text == reverse(text)
```
Αν θέλουμε να την τεστάρουμε:
```javascript
print('Is \'cat\' palindrome? ' + str(isPalindrome('cat')))
False
print('Is \'abba\' palindrome? ' + str(isPalindrome('abba')))
True
```
Προσοχή θέλει αν τα ορίσματα περνούν ως αναφορά ή ως τιμή:
```javascript
def add1(number, lst):
...     number += 1
...     lst.append(1)
...     print('number= ', number)
...     print('lst= ', lst)
... 
number = 5
lst = ['Hallo']
add1(number, lst)
number=  6
lst=['Hallo',1]
number
5
lst
lst=['Hallo',1]
```
Όπως και σε άλλες γλώσσες προγραμματισμού, η μεταβλητή λίστας είναι μια διεύθυνση μνήμης όπου μπορεί να βρεθεί η λίστα, άρα περνιέται ως αναφορά και άρα μεταβάλλεται η θέση μνήμης. Αντιθέτως, η ```number``` περνιέται ως τιμή, επομένως, παρόλο που και μέσα στη συνάρτηση ορίζεται μια μεταβλητή με το ίδιο όνομα, αυτή δεν έχει καμιά σχέση με την εξωτερική μεταβλητή. Αν θέλουμε όμως σώνει και καλά ν’ αλλάξουμε την τιμή μιας μεταβλητής αμετάβλητου τύπου όπως int, μπορούμε να κάνουμε το εξής:
```javascript
def add1(number, lst):
...     number += 1
...     lst.append(1)
...     return number, lst
... 
number = 5
lst = ['Hallo']
number, lst = add1(number, lst)
number=  6
lst=['Hallo',1]
number
6
lst
lst=['Hallo',1]
```
Η σειρά των παραμέτρων έχει σημασία, αλλά μπορούμε να τους αλλάξουμε τη σειρά όπως στο παρακάτω παράδειγμα:
```javascript
def process(text, word):
    ...
process('Hallo world!', 'world')
process(word='world', text='Hallo world!')
```
Οι παράμετροι μπορούν να λάβουν και εξ’ ορισμού τιμές, π.χ.
```javascript
def process(text, word=''):
    ...
process('Hallo world!')  # η word = ''
```
Αν ο αριθμός των ορισμάτων που περνάμε είναι μεγαλύτερος από τον αριθμό των παραμέτρων, τότε μπορούμε να δηλώσουμε την τελευταία παράμετρο με ένα ```*``` ώστε τα υπόλοιπα ορίσματα να αποθηκευθούν σ’ αυτήν ως πλειάδα ή με ```**``` για ν’ αποθηκευθούν ως λεξικό:
```javascript
def process(*args):
...     return args
process('This', 'is', 'a', 'test')
('This', 'is', 'a', 'test')
watch = ['Seiko', 455, 5]
process(watch)
(['Seiko', 455, 5],)
process(*watch)
('Seiko', 455, 5)
def process(**args):
...     return args
process(brand='Seiko', price=455, guarantee=5)
{'guarantee': 5, 'brand': 'Seiko', 'price': 455}
watch = {'brand': 'Seiko', 'price': 455, 'guarantee': 5}
process(**watch)
{'guarantee': 5, 'brand': 'Seiko', 'price': 455}
process(watch)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: process() takes 0 positional arguments but 1 was given
```
Οι συναρτήσεις είναι κι αυτές αντικείμενα στην Python, οπότε μπορούν να περαστούν με τη σειρά τους ως ορίσματα σε άλλες συναρτήσεις!
```javascript
def inGreek():
...     return 'Καλημέρα!'
...
def inFrench():
...     return 'Bonjour!'
...
def sayGoodMorning(lang, f):
...     print('Good morning in ', lang, ' is ', f())
...
sayGoodMorning('Greek!', inGreek)
Good morning in  Greek  is  Καλημέρα!
```
Φυσικά υποστηρίζεται και η αναδρομή. Μια συνάρτηση (υποπρόγραμμα) λέγεται αναδρομική όταν μπορεί και καλεί τον εαυτό της. Ας δούμε ένα παράδειγμα, τον υπολογισμό του παραγοντικού ενός φυσικού αριθμού ```n```: 

* Αν ```n=0``` τότε ```n! = 1```
* Αν ```n&gt;0``` τότε ```n! = n*(n-1)!```

Από τα παραπάνω βλέπουμε ότι για να υπολογίσουμε το παραγοντικό του ```n``` θα πρέπει πρώτα να υπολογίσουμε το παραγοντικό του ```n-1```. Για να υπολογίσουμε το παραγοντικό του ```n-1``` χρειάζεται πρώτα να υπολογίσουμε το παραγοντικό του ```n-2``` κ.ο.κ. μέχρις ότου φθάσουμε σε μια συνθήκη όπου μπορούμε να υπολογίσουμε το παραγοντικό, η οποία λέγεται συνθήκη διακοπής, και στο παραπάνω παράδειγμα είναι το ```0!=1```. Σημειώστε ότι χωρίς συνθήκη διακοπής το πρόγραμμα μπαίνει σε ατέρμονα βρόγχο.
Δημιουργήστε ένα νέο αρχείο ```factorial.py```:
```javascript
#!/usr/bin/env python3
def factorial(n):
    if n = 0:
        return 1 
    else:
        return n*factorial(n-1)
```
```
print("5!=%d" % factorial(5))
print("0!=%d" % factorial(0))
```
και εκτελέστε το:
```javascript
$ chmod u+x factorial.py
$ ./factorial.py
5!=120
0!=1
```
Η Python υποστηρίζει και συναρτησιακό προγραμματισμό, δηλ. λ-εκφράσεις:
```javascript
pow = lambda x: x ** 2 
pow(3)
9
```
Η παραπάνω έκφραση δηλώνει τη συνάρτηση: ```f(x) = x^2``` και της δίνει το όνομα ```pow```. Είναι σα να γράφαμε:
```javascript
def pow(x):
   return x ** 2
pow(3)
9
```
Η Python υποστηρίζει και [filter-map-reduce](http://www.bogotobogo.com/python/python_fncs_map_filter_reduce.php).
Η συνάρτηση ```filter()``` δέχεται μια λ-έκφραση για να φιλτράρει το δεύτερο όρισμά της:
```javascript
my_list = range(10)
filter(lambda x: x % 2 == 0, my_list)
[0, 2, 4, 6, 8]
```
Στην Python 2 επιστρέφει λίστα, στην Python 3 όμως επιστρέφει ένα αντικείμενο τύπου filter που θα πρέπει να μετατραπεί σε λίστα:
```javascript
my_list = range(10)
list(filter(lambda x: x % 2 == 0, my_list))
[0, 2, 4, 6, 8]
```
Παρατηρήστε ότι η λ-έκφραση που περνάμε στη ```filter()``` πρέπει να επιστρέφει τύπο ```bool```.
Η ```map()``` μετατρέπει κάθε στοιχείο του 2ου ορίσματός της σύμφωνα με τη λ-έκφραση:
```javascript
map(lambda x: x ** 2, my_list) # python2
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
list(map(lambda x: x**2, my_list) # python3
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
```
Τέλος, η ```reduce()``` μετατρέπει τη λίστα σ’ ένα μόνο στοιχείο (στο ακόλουθο παράδειγμα προσθέτει όλα τα στοιχεία της λίστας):
```javascript
reduce(lambda x,y: x + y, my_list) # python2
45
import functools   # python3
functools.reduce(lambda x,y: x + y, my_list) 
45
```
Το παραπάνω μοντέλο προγραμματισμού είναι ιδιαίτερα χρήσιμο όπως φαίνεται στο ακόλουθο πιο ρεαλιστικό παράδειγμα. Ας υποθέσουμε ότι τα δεδομένα προέρχονται από μια βάση δεδομένων και αποθηκεύονται στη λίστα από λεξικά ```data```:
```javascript
data =[
{'προϊόν': 'πληκτρολόγιο', 'τιμή': 26, 'ποσότητα': 2}, 
{'προϊόν': 'ποντίκι', 'τιμή': 12, 'ποσότητα': 2},
{'προϊόν': 'mousepad', 'τιμή': 5, 'ποσότητα': 3} ]
```
Θα θέλαμε να υπολογίσουμε το συνολικό ποσό που θα πρέπει να πληρώσει ο πελάτης. Κατ’ αρχήν θα θέλαμε να αφήσουμε μόνο τα σχετικά πεδία:
```javascript
l = list(map(lambda x: [x['τιμή'], x['ποσότητα']], data))
print(l)
[[26, 2], [12, 2], [5, 3]]
```

Οι βιβλιοθήκες (modules) είναι σαν τα πακέτα (packages) της Java ή οι χώροι ονομασίας (namespaces) της C++. Όπως οι συναρτήσεις μας βοηθούν να οργανώνουμε τον κώδικά μας σε μπλοκ, οι βιβλιοθήκες μας βοηθούν να οργανώνουμε τις συναρτήσεις μας σε βιβλιοθήκες, ακόμα και να επεκτείνουμε την ίδια τη γλώσσα. Μπορούν να είναι υπό τη μορφή πηγαίου κώδικα (```.py```) ή μεταγλωττισμένου κώδικα (```.pyc```) ή ακόμα και δυναμικής βιβλιοθήκης (```.so```). Όπως το ```PATH``` και το ```CLASSPATH```, έτσι κι η Python διαθέτει την ```PYTHONPATH``` για να αναζητεί βιβλιοθήκες (βλ. βιβλιοθήκες).
Η γλώσσα διαθέτει μια μεγάλη γκάμα από βιβλιοθήκες για όλες σχεδόν τις δουλειές όπως μπορείτε να δείτε εδώ. Για να μπορέσετε να χρησιμοποιήσετε τις συναρτήσεις μιας βιβλιοθήκης θα πρέπει πρώτα να την εισάγετε στο πρόγραμμά σας:
```javascript
import math
console.log(math.sqrt(25)
5.0
```
Η εντολή ```import``` είναι παρόμοια με την import της Java ή την include της C/C++. Η συνάρτηση ```sqrt()``` δηλώνεται στη βιβλιοθήκη ```math``` το οποίο πρέπει να εισάγουμε στο πρόγραμμά μας με την εντολή ```import```. Μπορούμε όμως να γίνουμε και πιο συγκεκριμένοι, αν θέλουμε μόνο την ```sqrt()```:
```javascript
from math import sqrt
console.log(sqrt(25)
5.0
```
Ας δούμε μερικά παραδείγματα ακόμα:
```
max(25, -5, 12, 30)
30
abs(-12)
12
```
Μπορούμε να ορίσουμε και τα δικές μας βιβλιοθήκες ως εξής (```mod1.py```):
```javascript
""" 
A simple module
"""
name = "Simple Module"
def printe(s, count):
    print(s * count)
```
και το εκτελούμε κατά τα γνωστά:
```javascript
import mod1
print(mod1.name)
Simple Module
mod1.printe('Hallo Python', 2)
Hallo PythonHallo Python
dir(mod1)
['__builtins__', '__cached__', '__doc__', '__file__', '__loader__', '__name__', '__package__', '__spec__', 'name', 'printe']
```
Εδώ είναι μια λίστα με βιβλιοθήκες της Python. Πολύ χρήσιμη είναι η στάνταρ βιβλιοθήκη (standard library) η οποία είναι μια συλλογή από χρήσιμες συναρτήσεις (όχι μέρος της γλώσσας αυτής καθαυτής), όπως:
* Διαχείριση αρχείων/φακέλων (```os```)
* Πρόσβαση βάσεων δεδομένων (π.χ. ```MySQLdb```)
* Ημερομηνία και Ώρα (```datetime```)
* Κανονικές Εκφράσεις (Regular Expressions) (```glob```, ```re```)
* εργαλεία συμπίεσης
κ.ά.

## Ημερομηνία και Ώρα
Η Python διαθέτει φυσικά μια βιβλιοθήκη για διαχείριση ημερομηνίας και ώρας.  
```javascript
from datetime import datetime
now = datetime.now()
console.log(now
2016-10-16 16:03:13.392686
console.log(now.year
2016
console.log(now.month
10
console.log(now.day
16
console.log('%s/%s/%s' % (now.day, now.month, now.year)
16/10/2016
console.log('%s:%s:%s' % (now.hour, now.minute, now.second)
16:5:40
```

## Αρχεία
Αν έχετε βαρεθεί να εμφανίζετε τ’ αποτελέσματα στην οθόνη τότε η Python (όπως και οι περισσότερες γλώσσες προγραμματισμού) έχει τη λύση:
```javascript
f = open("output.txt", "w")
f.write("Από την πόλη έρχομαι\nκαι στην κορυφή κανέλλα.")
f.close()
```
Στο παραπάνω παράδειγμα ανοίγουμε ένα αρχείο στον τρέχοντα φάκελο για εγγραφή (```"w"```) (το ```f``` λέγεται _διαχειριστής αρχείου (file handler)_), γράφουμε μια πρόταση και δεν ξεχνάμε να το κλείσουμε. Αν ανοίξετε το αρχείο ```output.txt``` θα δείτε την παραπάνω παροιμία. Είναι πολύ σημαντικό να μην ξεχάσετε να κλείσετε το αρχείο, καθώς τότε γράφονται τα δεδομένα σ’ αυτό. Επίσης αφήνοντας αρχεία ανοιχτά σπαταλάτε άσκοπα πόρους του συστήματός σας. Αν θέλετε να μεταφέρετε τα δεδομένα από τον buffer στο αρχείο χωρίς όμως να κλείσετε το αρχείο, χρησιμοποιήστε την flush(). Μπορούμε να ανοίξουμε ένα αρχείο με διάφορους τρόπους: ```"r"``` (ανάγνωση), ```"w"``` (εγγραφή), ```"r+"``` (ανάγνωση και εγγραφή), ```"a"``` (επισύναψη). Για δυαδικό αρχείο προσθέτετε ```"b"```, π.χ. ```"wb"```.
```javascript
f = open("output.txt", "r")
console.log(f.read()
Από την πόλη έρχομαι
και στην κορυφή κανέλλα.
f.close()
```
Η ```read()``` διαβάζει ολόκληρο το αρχείο και το επιστρέφει ως ένα αλφαριθμητικό. Αν θέλουμε να το διαβάσουμε γραμμή-γραμμή τότε χρησιμοποιούμε τη ```readline()```. Μπορούμε επίσης να χρησιμοποιήσουμε την ```readlines()``` η οποία το επιστρέφει ως λίστα από αλφαριθμητικά (κάθε γραμμή αποτελεί ένα στοιχείο της λίστας). Η ```rstrip()```, τέλος,  διαγράφει το χαρακτήρα ```'\n'``` αν αυτός περιέχεται στο αλφαριθμητικό.  Αντίστοιχα, για να γράψουμε σ’ ένα αρχείο χρησιμοποιούμε είτε την ```write()```, που είδαμε πιο πάνω, είτε την ```writelines()``` που γράφει μια λίστα αλφαριθμητικών στο αρχείο. 
Για να μην ξεχνάτε να κλείνετε τα αρχεία, χρησιμοποιήστε την ακόλουθη σύνταξη η οποία κλείνει αυτόματα το αρχείο για σας:
```javascript
with open("output.txt", "w") as f:
    f.write("Μια πάπια μα ποια πάπια!")
```
Μπορούμε να τσεκάρουμε αν ένα αρχείο είναι ανοικτό με την ιδιότητα ```closed``` (π.χ. ```f.closed```).
```javascript
with open("output.txt", "r") as f:
    for line in f:
        line.rstrip()  
```
Κάθε φορά που διαβάζουμε ή γράφουμε σ’ ένα αρχείο μετακινεί τη θέση ενός δρομέα μέσα στο αρχείο (μετριέται σε bytes από την αρχή του αρχείου). Η μέθοδος ```tell()``` επιστρέφει την τρέχουσα θέση του δρομέα σε bytes από την αρχή του αρχείου, ενώ η ```seek(n, start)``` μετακινεί το δρομέα ```n``` bytes από τη θέση ```start``` η οποία μπορεί να έχει μια από τις παρακάτω τιμές: ```0``` (```os.SEEK_SET```): αρχή του αρχείου, ```1``` (```os.SEEK_CUR```) τρέχουσα θέση, ```2``` (```os.SEEK_END```) τέλος του αρχείου.
Η οθόνη και το πληκτρολόγιο μπορούν να θεωρηθούν κι αυτά “αρχεία”:
* ```sys.stdin```: standard input (πληκτρολόγιο)
* ```sys.stdout```: standard output (οθόνη)
* ```sys.stderr```: standard error (συνήθως οθόνη)
Π.χ.
```javascript
originalErr = sys.stderr
sys.stderr = open('error.log', 'a')
sys.stderr.writeline('ERROR')
```
ή πιο εύκολα:
```javascript
print('ERROR') >> sys.stderr
```
Για να διαχειριστείτε δυαδικά αρχεία, υπάρχουν δυο χρήσιμες βιβλιοθήκες που θα μπορούσατε να κοιτάξετε: 
* η ```pickle``` επιτρέπει την ανάγνωση/αποθήκευση δομών δεδομένων όπως λίστες, πλειάδες κλπ. με τις εντολές ```load()/dump()```
* η ```shelve``` η οποία επιτρέπει την απευθείας ανάγνωση/αποθήκευση λεξικών σε αρχεία

## Κλάσεις
Όπως είπαμε, η Python είναι και μια αντικειμενοστραφής γλώσσα προγραμματισμού, δηλ. υποστηρίζει κλάσεις κι αντικείμενα. Μια κλάση αποτελείται από μεταβλητές και συναρτήσεις (που καλούνται μέθοδοι) ως μια οντότητα. Ο αντικειμενοστραφής προγραμματισμός μας βοηθάει να αντιστοιχίσουμε μια αφαίρεση των αντικειμένων της πραγματικότητας στη γλώσσα προγραμματισμού. Η σύνταξη έχει ως εξής:
```javascript
class name(superclass):
    def __init__(παράμετροι):
    ...
    def method(παράμετροι):
    ...
```
Ας δούμε ένα παράδειγμα:
```javascript
class Car(object):
    def __init__(self, mark, maxspeed, ccm, color, doors):
        self.mark = mark
        self.maxspeed = maxspeed
        self.ccm = ccm        
        self.color = color
        self.doors = doors
        self.speed = 0    
    
    def __str__(self):
        return "%s: %d km/h, %d ccm, %s, %d θύρες" % (self.mark, self.maxspeed, self.ccm, self.color, self.doors)
```
Όλες οι κλάσεις μπορούν να κληρονομούν από την κλάση ```object``` (οπότε μπορεί και να παραληφθεί, δηλ. ```class Car:```).
Η συνάρτηση ```__init__()``` ονομάζεται _κατασκευαστής (constructor)_ και είναι η πρώτη που καλείται όταν πρόκειται να κατασκευάσουμε ένα αντικείμενο της κλάσης μας. Για να καταλάβουμε ποια η διαφορά μεταξύ κλάσης και αντικειμένου ας δούμε το παρακάτω τμήμα κώδικα:
```javascript
toyota_yaris = Car('Toyota Yaris', 180, 999, 'white', 5)
subaru_impreza = Car('Subaru Impreza', 220, 1989, 'blue', 2)
```
Ορίζουμε δυο αντικείμενα τύπου ```Car```, το ```toyota_yaris``` και το ```subaru_impreza```. Μπορούμε να πούμε ότι η κλάση ```Car``` είναι μια μήτρα από την οποία μπορούμε να δημιουργήσουμε όσα αντικείμενα τύπου ```Car``` θέλουμε. Όταν γράφουμε την παραπάνω εντολή, καλείται ο κατασκευαστής της κλάσης, δηλ. η συνάρτηση ```__init__()```. Όλες οι μέθοδοι στη Python δέχονται ως πρώτη παράμετρο την ```self``` η οποία δηλώνει το αντικείμενο που δημιουργούμε κάθε φορά και χρησιμοποιείται και για να ξεχωρίσουμε τις μεταβλητές (ιδιότητες) του αντικειμένου από τις παραμέτρους όταν έχουν το ίδιο όνομα. Παρατηρήστε ότι δε χρειάζεται να περάσουμε την παράμετρο ```self``` ως όρισμα στις παραπάνω μεθόδους από τα αντικείμενα.
Μπορούμε να εμφανίσουμε τις ιδιότητες του αντικειμένου ως εξής: 
```javascript
print("Ταχύτητα: %d km/h" % toyota yaris.speed)
Ταχύτητα: 0 km/h
print(toyota_yaris)
Toyota Yaris: 180 km/h, 999 ccm, white, 5 θύρες
```
Η τελευταία εντολή καλή την ειδική συνάρτηση ```__str__()``` η οποία είναι παρόμοια με την ```toString()``` της Java, δηλ. επιστρέφει μια αναπαράσταση του αντικειμένου ως αλφαριθμητικό.
Μπορούμε επίσης να ορίσουμε κι άλλες συναρτήσεις (ονομάζονται μέθοδοι) στην κλάση ```Car```:
```javascript
class Car:
...
    def accelerate(self, speed_factor):
        if speed_factor > 0 and (self.speed + speed_factor) <= self.maxspeed:
            self.speed += speed_factor
        elif speed_factor < 0 and (self.speed + speed_factor) >= 0:
            self.speed += speed_factor
        else:
            print("Λάθος επιτάχυνση: %d km/h" % speed_factor)  
```
Η μέθοδος ```accelerate()``` επιτρέπει στο αυτοκίνητο να επιταχύνει ή να επιβραδύνει ανάλογα του αν η παράμετρος που του περνάμε είναι θετική ή αρνητική:
```javascript
toyota_yaris.accelerate(20)
print("Ταχύτητα: %d km/h" % toyota_yaris.speed)
Ταχύτητα: 20 km/h
toyota_yaris.accelerate(-10)
print("Ταχύτητα: %d km/h" % toyota_yaris.speed)
Ταχύτητα: 10 km/h
toyota_yaris.accelerate(-20)
Λάθος επιτάχυνση -20 km/h
print("Ταχύτητα: %d km/h" % toyota_yaris.speed)
Ταχύτητα: 10 km/h
```
Οι ιδιότητες κλάσης ή στατικές ιδιότητες μιας κλάσης ορίζονται ως:
```javascript
class Car:
...
    availableColors = ('black', 'blue', 'red', 'white')
...
```
Αυτές είναι κοινές για όλα τα αντικείμενα της κλάσης. Αντίστοιχα, οι μέθοδοι κλάσης ή στατικές μέθοδοι ορίζονται περνώντας ```cls``` ως πρώτη παράμετρο:
```javascript
class Car:
... 
    counter = 0
    def productionCounter(cls, n):
        cls.counter = n
...
```
Ας υποθέσουμε τώρα ότι η εφαρμογή μας αντί μόνο για αυτοκίνητα θα πρέπει να διαχειρίζεται και φορτηγά και λεωφορεία. Επειδή όλες αυτές έχουν κάποια κοινά χαρακτηριστικά, και λόγω της αρχής του να μην επαναλαμβάνεσαι (_DRY – Don’t Repeat Yourself_) που ισχύει στον προγραμματισμό, μπορούμε να εφαρμόσουμε ένα χαρακτηριστικό του αντικειμενοστραφούς προγραμματισμού που λέγεται _κληρονομικότητα (inheritance)_. Δημιουργούμε λοιπόν την κλάση ```Vehicle```:
```javascript
class Vehicle:
    def __init__(self, type, mark, maxspeed, ccm, color, doors, speed):
        self.mark = mark
        self.type = type
        self.maxspeed = maxspeed
        self.ccm = ccm        
        self.color = color
        self.doors = doors
        self.speed = 0    
    
    def __str__(self):
        return "%s (%s): %d km/h, %d ccm, %s, %d θύρες" % (self.mark, self.type, self.maxspeed, self.ccm, self.color, self.doors)

    def accelerate(self, speed_factor):
    ...
```
οπότε η κλάση ```Car``` μπορεί να γραφτεί ως:
```javascript
class Car(Vehicle):
    def __init__(self, mark, maxspeed, ccm, color, doors):
        Vehicle.__init__(self, "car", mark, maxspeed, ccm, color, doors, 0)   
    
    def __str__(self):
        return Vehicle.__str__(self)
```
Μέσα στις παρενθέσεις δηλώνουμε την _υπερ-κλάση (super class)_ από την οποία κληρονομεί η κλάση μας. Επίσης, όταν θέλουμε να καλέσουμε μια μέθοδο της υπερ-κλάσης μας, φροντίζουμε να γράφουμε και την κλάση πριν, π.χ. ```Vehicle.__init__()```. Η _υπο-κλάση_ κληρονομεί όλες τις ιδιότητες και τις μεθόδους της υπερ-κλάσης (δεν υπάρχουν περιορισμοί όπως σε άλλες γλώσσες). Όταν ξανα-υλοποιούμε μια μέθοδο στην υποκλάση, λέμε ότι την _υπερκαλύπτουμε (override)_ και αυτό είναι μια ιδιότητα των αντικειμενοστραφών γλωσσών που λέγεται _πολυμορφισμός_.
```javascript
vehicles = [ Vehicle('Hybrid', 'bicycle', 25, 0, 'green', 0, 0), Car('Toyota Yaris', 180, 999, 'white', 5)]
for v in vehicles:
    print(v)
```
και το αποτέλεσμα:
```javascript
$ ./vehicle.py 
...
bicycle (Hybrid): 25 km/h, 0 ccm, green, 0 θύρες
Toyota Yaris (car): 180 km/h, 999 ccm, white, 5 θύρες
```
Η ```print()``` καλεί, όπως είπαμε, την σωστή ```__str__()``` κάθε φορά, ανάλογα με τον τύπο του αντικειμένου. Μια κλάση μπορεί να υπερκαλύψει οποιαδήποτε από τις ειδικές μεθόδους όπως π.χ.  ```__str__(),  __repr__(),``` η οποία είναι παρόμοια με την ```__str__()```, ή ```__add__()``` η οποία αντιστοιχεί στην πράξη ```+```. Π.χ. (```MyList.py```)
```javascript
#!/usr/bin/env python3
class MyList:
    def __init__(self, aList):
        self.aList = aList
        
    def __add__(self, value):
        retList = []
        for e in self.aList:
            retList.append(e + value)
        return retList
        
    def __mul__(self, value):
        retList = []
        for e in self.aList:
            retList.append(e * value)
        return retList

lst = [20, 30, 40]
mylst = MyList(lst)
print(lst, '+ 5 = ', mylst + 5)
print(lst, '* 5 = ', mylst * 5)
```
υπερκαλύπτει την εξ’ ορισμού συμπεριφορά των τελεστών ```+``` και ```*``` για λίστες:
```javascript
$ ./MyList.py 
[20, 30, 40] + 5 =  [25, 35, 45]
[20, 30, 40] * 5 =  [100, 150, 200]
```
Μπορούμε να ορίσουμε και _αφηρημένες (abstract) κλάσεις_ αφήνοντας κάποιες μεθόδους προς υλοποίηση από τις υποκλάσεις, π.χ.:
```javascript
class Vehicle():
...
    def accelerate(self, speed_factor):
        pass
```
Αν θέλουμε να καλέσουμε κάποια μέθοδο της υπερκλάσης από την υποκλάση, τότε χρησιμοποιούμε την παραπάνω σύνταξη:
```javascript
class Car(Vehicle):
    ...
    def acc(self):
        return super(Car,self).accelerate(10) 
```
η οποία στην Python3 μπορεί να γραφτεί και πιο απλά:
```javascript
    def acc(self):
        return super().accelerate(10)
```
Το πλεονέκτημα με το να γράψουμε:
```return Vehicle.accelerate(10)```
είναι ότι αν αργότερα αλλάξουμε την υπερκλάση από ```Vehicle``` σε κάποια άλλη δεν χρειάζεται ν’ αλλάξουμε τη μέθοδο.
Η Python, τέλος, υποστηρίζει πολλαπλή κληρονομικότητα, π.χ.
```javascript
class Amphibian(Vehicle, Boat):
...
```
## Ασκήσεις
1. Γράψτε μια συνάρτηση ```skip_vowels(text)``` η οποία θα επιστρέφει τη φράση που της περνάμε χωρίς φωνήεντα, π.χ. 
```javascript
console.log(skip_vowels('Όλα καλά;')
λ κλ;
```
2. Το Σκραμπλ (Scrabble) είναι ένα παιχνίδι όπου οι παίκτες παίρνουν πόντους συλλαβίζοντας λέξεις. Το σκορ κάθε λέξης υπολογίζεται προσθέτοντας τα σκορ καθενός γράμματος. Γράψτε μια συνάρτηση scrabble_score() που παίρνει ως παράμετρο μια λέξη και επιστρέφει το ισοδύναμο σκραμπλ σκορ γι’ αυτή τη λέξη. Τα σκορ για τα ελληνικά γράμματα (ξεχάστε τους τόνους) δίνονται παρακάτω:
```javascript
score = {"α":1,"β":8,"γ":4,"δ":4,"ε":1,"ζ":10, 
         "η":1,"θ":10,"ι":1,"κ":2,"λ":3,"μ":3, 
         "ν":1,"ξ":10,"ο":1,"π":2,"ρ":2,"σ":1,"ς":1, 
         "τ":1,"υ":2,"φ":8,"χ":8,"ψ":10,"ω":3}
```
3. Γράψτε τη δική σας ναυμαχία. Ο παίχτης έχει 10 προσπάθειες για να βυθίσει το πλοίο που βρίσκεται σε μια τυχαία θέση μιας μήτρας 5x5. Χρησιμοποιήστε τη συνάρτηση randint(start, stop) από τη βιβλιοθήκη random. Θα πρέπει να προσέξετε ώστε ο παίκτης να μην εισάγει τις ίδιες συντεταγμένες περισσότερες από μια φορές καθώς και να εισάγει έγκυρες συντεταγμένες.
```javascript
O O O O O
O O O O O
O O O O O
O O O O O
O O O O O
```
```javascript
Γραμμή: 2
Στήλη: 3
Αστόχησες! Έχεις ακόμα 9 προσπάθειες...
```
```javascript
O O O O O
O O O O O
O O O X O
O O O O O
O O O O O
```
```javascript
Γραμμή: 4
Στήλη: 2
Συγχαρητήρια! Βύθισες το πλοίο!
```
4. Δημιουργήστε μια συνάρτηση ```replace(text, word)``` η οποία αντικαθιστά όσες φορές βρει τη ```word``` στο ```text``` με ```*```.
5. Δημιουργήστε μια κλάση ```Triangle``` με μια στατική μεταβλητή ```number_of_sides = 3```, τη μέθοδο κατασκευής να δέχεται ως ορίσματα τις 3 γωνίες του τριγώνου και μια μέθοδο ```check_angles()``` η οποία να επιστρέφει ```True``` αν το άθροισμα των γωνιών είναι ```180```, διαφορετικά ```False```. Επίσης μια υποκλάση της, ```Equilateral``` με μια στατική μεταβλητή ```angle = 60``` στη μέθοδο κατασκευής της οποίας θα καλείται την μέθοδο κατασκευής της υπερκλάσης περνώντας τρεις φορές τη γωνία ```angle```. Προσθέστε μεθόδους για να υπολογίσετε την περίμετρο και το εμβαδό των παραπάνω.
6. Βρείτε το μεγαλύτερο κοινό αλφαριθμητικό που περιέχεται σ' έναν αριθμός από αλφαριθμητικά. Τα δοθέντα αλφαριθμητικά δεν θα έχουν περισσότερα από ένα κοινό αλφαριθμητικό. Αν δεν υπάρχει κοινό αλφαριθμητικό, τότε θα επιστρέφει ```0```. Π.χ.
```javascript
ορχήστρα
σφυρίχτρα
χαρτορίχτρα
```
επιστρέφει ```τρα```.
7. Προσπαθήστε να λύσετε όσες περισσότερες ασκήσεις μπορείτε από το [Project Euler](https://projecteuler.net/) σε Python.

## Επίλογος
Σ’ αυτό το άρθρο δώσαμε μια σύντομη περιγραφή της γλώσσας προγραμματισμού Python. Η Python είναι μια αντικειμενοστραφής, δυναμική, μεταφραστική γλώσσα προγραμματισμού. Είδαμε πως μπορούμε να γράψουμε προγράμματα τόσο στην Python 2 όσο και στην Python 3. Αν θέλετε να γράψετε προγράμματα που θα χρησιμοποιούν ελληνικούς χαρακτήρες, προτιμήστε την έκδοση 3.

Μέχρι τώρα είδαμε τα πολύ βασικά χαρακτηριστικά της γλώσσας. Αν θέλετε να εντρυφήσετε περαιτέρω θα πρέπει να μάθετε για τις πολλές βιβλιοθήκες της γλώσσας π.χ. για πρόσβαση στο σύστημα αρχείων είτε στις βάσεις δεδομένων κ.ά. Μπορείτε να δημιουργήσετε γραφικά περιβάλλοντα με χρήση του [wxPython](https://wxpython.org/) ή του [Tkinter](https://wiki.python.org/moin/TkInter) καθώς και εφαρμογές ιστού με το [Django](https://www.djangoproject.com/) που ίσως δούμε σε μελλοντικά άρθρα.

Ο ενδιαφερόμενος αναγνώστης καλείται να ανατρέξει στην ιδιαίτερα πλούσια βιβλιογραφία για να εντρυφήσει πάνω στο αντικείμενο και ιδιαίτερα στο διαδραστικό περιβάλλον εκμάθησης της [Codecademy](https://www.codecademy.com/learn/python). Ο καλύτερος τρόπος όμως ίσως θα ήταν να παρακολουθήσετε τα μαθήματα Python στα ελληνικά από το ελληνικό site εκμάθησης [Mathesis](https://mathesis.cup.gr/courses/course-v1:ComputerScience+CS1.1+2017_T4/about).

## Πηγές:

1. [Javascript Tutorial](https://www.w3schools.com/js/).
1. Αβούρης Ν., [Εισαγωγή στην Python](https://mathesis.cup.gr/courses/course-v1:ComputerScience+CS1.1+2017_T4/about), Mathesis.
1. Hunter T. & English B. (2022), _Multithreaded Javascript_, O'Reilly.

---