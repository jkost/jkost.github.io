# Προγραμματισμός κελύφους με το Bash {#bash} 
© Γιάννης Κωστάρας

---

Το κέλυφος (ή shell) είναι μια διεπαφή γραμμής εντολών (command line interface) με το λειτουργικό σύστημα (Λ.Σ.) ανεξάρτητη του Λ.Σ. Οι ίδιες γραμμές κελύφους δουλεύουν σε διάφορα Λ.Σ. όπως Linux, Unix, FreeBSD, Mac OS/X, Windows (π.χ. το κέλυφος DOS) κλπ. Το κέλυφος είναι επίσης μια γλώσσα εντολών ή/και γλώσσα προγραμματισμού. 
Αν και τη σήμερον ημέρα ο προγραμματισμός συστήματος γίνεται με σύγχρονες scripting γλώσσες προγραμματισμού όπως Perl, Ruby, Python κ.ά. πολλές φορές χρειάζεται να διαχειριστείτε ένα σύστημα το οποίο δε διαθέτει τίποτα άλλο από ένα παλιό καλό κέλυφος Unix. Σ' αυτές τις περιπτώσεις, ανατρέξτε σε τούτο το άρθρο! Παρακάτω θα επικεντρωθούμε στα διάφορα κελύφη των συστημάτων Unix.

## Ολίγη ιστορία
Το πρώτο κέλυφος Unix, το ```sh```, γράφτηκε από τον Ken Thompson  συνδημιουργό του Unix μαζί με τον Dennis Ritchie. 
Το 1977 ο Steven Bourne της ΑΤ&Τ έγραψε το πρώτο ευρέως χρησιμοποιούμενο κέλυφος, το Bourne shell, επίσης ```sh```, το οποίο αντικατέστησε το κέλυφος του Thompson στα συστήματα Unix 7.  
Ο Bill Joy του Berkeley έγραψε το πρώτο εναλλακτικό κέλυφος, το C shell, ```csh```, το 1978, ενώ το T shell, ```tcsh```, αποτέλεσε την ανοικτού κώδικα έκδοση του πρώτου.  
Ο David Korn της ΑΤ&Τ επέκτεινε τις δυνατότητες του Bourne shell το 1988 και το 1993 και το Korn shell, ή ```ksh```, αποτέλεσε το standard κέλυφος για Unix. 
Τέλος, το 1989 αναπτύχθηκε το «Bourne again shell», ή ```bash```, ως μέρος του GNU project, μια ανοικτού κώδικα έκδοση του ```sh```.

## Τα κελύφη του Ubuntu
Το πρώτο ερώτημα που ίσως σας έρθει στο μυαλό όταν συνδέεστε στο Ubuntu είναι «ποιο κέλυφος χρησιμοποιώ»;
Στο ```/etc/passwd```, η γραμμή που περιέχει το όνομα χρήστη που συνδεθήκατε στο Ubuntu ορίζει το κέλυφος που χρησιμοποιείτε, π.χ.
```bash
john:x:1000:1000:john,,,:/home/john:/bin/bash
```
Μπορείτε να αλλάξετε το κέλυφος με την εντολή ```chsh```, π.χ.:
```bash
$ chsh -s /usr/bin/ksh
```
Βέβαια, το Ubuntu δε διαθέτει το Korn ή κάποιο άλλο shell εξ' ορισμού. Αν θέλετε να δουλέψετε με το ksh θα πρέπει να το εγκαταστήσετε κατά τα γνωστά:
```bash
$ sudo aptitude install ksh
```
Κάθε κέλυφος διαθέτει μια μεταβλητή που περιέχει πληροφορίες για την έκδοσή του, έτσι:
```bash
$ echo $BASH_VERSION
4.1.5(1)-release
```
## Το κέλυφος bash
Όπως ίσως ήδη γνωρίζετε, μπορείτε να καλέσετε το ιστορικό των εντολών που έχετε δώσει με τα βέλη ↑ και ↓. Μπορείτε να ορίσετε ποιον κειμενογράφο θέλετε να χρησιμοποιείτε για να επεξεργάζεστε τις εντολές του κελύφους με την εντολή ```set -o```, π.χ.:
```bash
$ set -o vi
```
Χρήσιμο είναι να γνωρίζετε τη σημασία των παρακάτω μεταβλητών κελύφους:

* ```PS1```: η προτροπή (prompt) όταν περιμένει μια νέα εντολή.
* ```PS2```: η δευτερεύουσα προτροπή, όταν η εντολή που δίνετε συνεχίζεται σε επόμενη γραμμή (συνήθως είναι το ```>```)
* ```PWD```: η πλήρης διαδρομή του τρέχοντος καταλόγου
* ```HOME```: η πλήρης διαδρομή του καταλόγου του χρήστη (το έκτο πεδίο του αρχείου ```/etc/passwd```).
* ```PATH```: η λίστα των καταλόγων που ψάχνει το Λ.Σ. για τις διάφορες εντολές. Μπορείτε να βάλετε και τον τρέχοντα κατάλογο στο ```PATH``` ώστε να ψάχνει κι εκεί για εντολές δηλ. 
```bash
$ PATH=$PATH:. 
```
αλλά αυτό αποτελέσει ρίσκο ασφαλείας καθώς κάποιος μπορεί να τοποθετήσει κάποια κακόβουλη εντολή στον τρέχοντα κατάλογό σας η οποία θα εκτελεστεί κατά λάθος επειδή βρέθηκε στο ```PATH```. 
* ```IFS```: περιέχει το χαρακτήρα διαχωρισμού που χρησιμοποιείτε από την εντολή read για το διαχωρισμό μιας πρότασης σε λέξεις· θα δούμε τη χρήση της παρακάτω.

Μπορείτε να ορίσετε και δικές σας μεταβλητές κελύφους όπως π.χ. 
```bash
$ MYVAR=Play
```
θα πρέπει όμως να προσέξετε ο πρώτος χαρακτήρας του ονόματος της μεταβλητής να μην είναι ψηφίο και να μην υπάρχουν κενά πριν και μετά το ίσον (```=```).
Πλέον μπορείτε να καλέσετε τη μεταβλητής σας από το κέλυφος:
```bash
$ echo $MYVAR
Play
$ echo ${MYVAR}mobil
Playmobil
```
Για να δείτε όλες τις μεταβλητές περιβάλλοντος δώστε την εντολή ```set```. Μπορείτε επίσης να διαγράψετε μια μεταβλητή από το περιβάλλον του κελύφους:
```bash
$ unset MYVAR
$ echo $MYVAR
```
Και κάτι πιο προχωρημένο:
```bash
$ name=John
$ myname=name
$ echo $myname
name
$ eval echo \$$myname
John
```

| Σύμβολο | Επεξήγηση |
| ~ | $HOME |
| ~+ | $PWD |
| ~- | $OLDPWD |
| ~user | $HOME of user |

Κάθε φορά που κάνετε login στο Ubuntu, φορτώνεται ένα κέλυφος login. Η διαδικασία είναι η εξής (bash): καλούνται με τη σειρά τα
1. ```/etc/profile```
2. ```$HOME/.bash_profile``` (αν υπάρχει)
3. ```$HOME/.bashrc```
4. ```bash```
Αν θέλετε να ορίσετε μόνιμα μια μεταβλητή ή κάποιο alias δεν έχετε παρά να την ορίσετε σε κάποιο από τα αρχεία ```.bash_profile``` ή ```.bashrc```.

## Προγραμματισμός κελύφους
Μετά την πιο πάνω εισαγωγή, ας ξεκινήσουμε με το πρώτο μας πρόγραμμα κελύφους. Στον αγαπημένο σας κειμενογράφο (```vi, emacs, gedit``` κλπ.)  δημιουργήστε το παρακάτω αρχείο και αποθηκεύστε το με το όνομα ```myecho.sh```:
```bash
#!/bin/bash
echo 'Hello world!'
```
Μην ξεχάσετε ν' αλλάξετε τα δικαιώματα του αρχείου:
```bash
$ chmod u+x myecho.sh
$ ./myecho.sh
Hello world!
```
και μόλις δημιουργήσατε το πρώτο σας πρόγραμμα συνόδου (script) για το κέλυφος Linux.
Προσέξτε την πρώτη γραμμή του αρχείου· δηλώνει το πρόγραμμα που θα αναλάβει να εκτελέσει τις εντολές, δηλ. το κέλυφος. Καλό είναι να μη βασίζεστε στο κέλυφος που συνδεθήκατε για να εκτελέσετε το πρόγραμμά σας αλλά να δηλώνετε επακριβώς ότι το script που θέλετε να εκτελεστεί από το bash.

Πολλές φορές χρειάζεται να περάσετε ορίσματα ή παραμέτρους σε κάποιες εντολές κελύφους, π.χ.
```bash
$ cp myfile.txt myfile.backup
```
Τα ```myfile.txt``` και ```myfile.backup``` είναι ορίσματα ή παράμετροι της εντολής ```cp```. Μπορείτε να προσπελάσετε αυτές τις παραμέτρους από το script σας χρησιμοποιώντας τις μεταβλητές θέσης ```$1, $2``` κλπ. Στο παράδειγμά μας ```$1``` είναι το ```myfile.txt``` και το ```$2``` το  ```myfile.backup```. Αν έχετε παραπάνω από 9 ορίσματα, τότε αναφέρεστε π.χ. στο 10ο ως ```${10}```. Η εντολή ```cp``` είναι το ```$0```. ```$#``` είναι ο αριθμός των ορισμάτων (2 στο παράδειγμά μας). ```$*``` και ```$@``` είναι η λίστα με τα ορίσματα (δηλ. ```myfile.txt``` και ```myfile.backup```)· θα εξηγήσουμε τη διαφορά τους αργότερα. Η εντολή ```shift n``` διαγράφει τα πρώτα ```n``` ορίσματα.
Ας δούμε ένα παράδειγμα. Δημιουργήστε το ακόλουθο αρχείο ```params.sh``` και κάντε το εκτελέσιμο:
```bash
#!/bin/bash
echo Number of parameters is $#
echo Parameters are $1 $2 $3
shift 2
echo Number of parameters is $#
echo Parameters are $1 $2 $3
```
Εκτελέστε το:
```bash
$ ./params.sh one two three
Number of parameters is 3
Parameters are one two three
Number of parameters is 1
Parameters are three
```
Ας δούμε τώρα τη διαφορά μεταξύ ```'``` και ```"```. 
```bash
$ echo '$HOME does not expand'
$HOME does not expand
$ echo "$HOME does expand"
/home/john does expand
```
Στα διπλά εισαγωγικά οι παρακάτω χαρακτήρες έχουν ειδική μεταχείρηση:
```$``` αντικατάσταση μεταβλητής
```$(), ` ` ``` εκτέλεση εντολής
```\``` χαρακτήρας διαφυγής (escape character) του επόμενου χαρακτήρα.
```bash
$ echo "\$HOME does not expand"
$HOME does not expand
```

Ας δούμε τώρα τη διαφορά μεταξύ $* και $@. Τροποποιήστε το πρόγραμμα params.sh αντικαθιστώντας τις τρεις τελευταίες γραμμές με τις παρακάτω:
```bash
echo Parameters are $@
echo Parameters are $*
echo "Parameters are $@"
echo "Parameters are $*"
```
και καλέστε το πρόγραμμα ως εξής:
```bash
$ ./params.sh "New York" Athens Brussels
Number of parameters is 3
Parameters are New York Athens Brussels
Parameters are New York Athens Brussels
Parameters are New York Athens Brussels
Parameters are New York Athens Brussels
Parameters are New York Athens Brussels
```

Το ```"$@"``` διατηρεί την ομαδοποίηση, το ```"$*"``` όχι, δηλ. επιστρέφει όλες τις παραμέτρους ως αλφαριθμητικά μέσα σε απλές αποστρόφους. Το ίδιο επιστρέφουν και τα ```$*``` και ```$@```.

Ας δούμε τώρα το ακόλουθο πρόγραμμα ```read2words.sh```:
```bash
#!/bin/bash
echo Enter two words:
read param1 param2 
echo First word was $param1
echo Second word was $param2
```
το οποίο καλούμε ως εξής:
```bash
$ ./read2words.sh 
Enter two words:
one two
First word was one
Second word was two
$ ./read2words.sh 
Enter two words:
one two three
First word was one
Second word was two three
$ ./read2words.sh 
Enter two words:
one
First word was one
Second word was 
```
Όπως βλέπετε, η read καταλαβαίνει ότι πρόκειται για διαφορετικές παραμέτρους επειδή ο εξ' ορισμού ```IFS``` είναι είτε το κενό, είτε το tab, είτε το newline. Τροποποιήστε ελαφρώς το πρόγραμμα ως εξής:
```bash
#!/bin/bash
IFS=|
echo Enter two words:
read param1 param2 
echo First word was $param1
echo Second word was $param2
και καλέστε το ως εξής:
$ ./read2words.sh 
Enter two words:
one two|three four
First word was one two
Second word was three four
$ ./read2words.sh 
Enter two words:
one two three four
First word was one two three four
Second word was
```
Χρήσιμοι είναι και οι χαρακτήρες ανακατεύθυνσης:

```<``` Ανακατεύθυνση stdin από αρχείο
```>``` Ανακατεύθυνση stdout σε αρχείο το οποίο σβήνεται αν υπάρχει ήδη, διαφορετικά δημιουργία του
```>>```  Ανακατεύθυνση και επισύναψη stdout στο τέλος του αρχείου αν υπάρχει, διαφορετικά δημιουργία του
```2>```  Ανακατεύθυνση stderr σε αρχείο το οποίο  σβήνεται αν υπάρχει ήδη, διαφορετικά δημιουργία του
```2>>``` Ανακατεύθυνση και επισύναψη stderr στο τέλος του αρχείου αν υπάρχει, διαφορετικά δημιουργία του

Ας δούμε μερικά παραδείγματα:
```bash
$ read ip hostname < /etc/hosts
$ echo $ip $hostname
127.0.0.1 localhost.localdomain localhost
$ echo $hostname has > host.log
$ echo ip $ip >> host.log
$ echo cp /etc/hosts hosts 2>> error.log
$ read ip hostname < /etc/hosts >> host.log 2> /dev/null
```
Η τελευταία εντολή συνδυάζει πολλές ανακατευθύνσεις σε μια γραμμή. Το ```/dev/null``` είναι μια καταβόθρα και οτιδήποτε ανακατευθύνεται σ' αυτήν χάνεται. Στο συγκεκριμένο παράδειγμα απλά του λέμε ότι δεν μας ενδιαφέρουν τυχόν λάθη οπότε μην τα εμφανίσεις στην οθόνη (που είναι το εξ' ορισμού stderr).

## Τύποι δεδομένων: Αριθμοί, αλφαριθμητικά
Κάθε τι που δηλώνετε σε μια μεταβλητή είναι αλφαριθμητικό. Π.χ.:
```bash
$ a=2 b=3
$ c=$a+$b
$ echo $c 
2+3
```
Αν θέλετε να εκτελέσετε αριθμητικές πράξεις στο κέλυφος, θα πρέπει να χρησιμοποιήσετε τον τελεστή ```(( ))``` ή την εντολή ```let```. Προτού δούμε κάποια παραδείγματα, θα πρέπει να 'χετε υπόψιν σας τα εξής:

* Δεν απαιτείται το $ μπροστά απ' τις μεταβλητές
* Ισχύουν οι κανόνες της C
* Αν το αποτέλεσμα της αριθμητικής έκφρασης είναι μη μηδενικό, τότε η κατάσταση εξόδου (exit status) της εντολής είναι ```0```, διαφορετικά είναι ```1```

Η κατάσταση εκτέλεσης μιας εντολής αποθηκεύεται στη μεταβλητή ```$?```. Όσοι έχετε γνώσεις C θα γνωρίζετε ότι ένα πρόγραμμα τερματίζει με την εντολή ```exit(n)``` όπου ```n``` ένας ακέραιος που δηλώνει την κατάσταση εξόδου (exit status) της εντολής. Έτσι, ```exit(0)``` δηλώνει ότι η εντολή εκτελέστηκε μ' επιτυχία, ενώ οποιαδήποτε άλλη τιμή δηλώνει σφάλμα. Η μεταβλητή ```$?``` αποθηκεύει την κατάσταση εξόδου της τελευταίας εντολής που εκτελέστηκε.
```bash
$ a=2 b=3
$ ((c = a + b))
$ echo $? $c 
0 5
$ ((c = a - 2))
$ echo $? $c 
1 0
$ let "c = a / 0" 2>/dev/null
$ echo $?
1
$ echo "$a * $b = $((a*b))"
2 * 3 = 6
```
Η τελευταία εντολή δείχνει τη χρήση του τελεστή ```$(( ))``` η τιμή του οποίου είναι η τιμή της αριθμητικής έκφρασης που περικλείει.
Ο παρακάτω πίνακας παρέχει όλους τους αριθμητικούς τελεστές κατά σειρά προτεραιότητας:

| Τελεστής | Επεξήγηση | 
| ```( )``` | Παρενθέσεις |
| ```++ --``` | Προσαύξηση/προσαφαίρεση κατά 1 |
| ```-``` | Μοναδιαίο πρόσημο |
| ```!``` | Λογική άρνηση (NOT) |
| ```* / %``` | Πολλ/σμός, διαίρεση, υπόλοιπο |
| ```+ -``` | Πρόσθεση, αφαίρεση |
| ```> >= < <= ``` | Τελεστές σύγκρισης |
| ```!= ==``` | Άνισο, ίσο |
| ```&& ||``` | Λογικό ΚΑΙ, λογικό ΑΝ |
| ```= += -= *= /= %= ``` | Τελεστές εκχώρησης τιμής |

## Εντολές ελέγχου
Υπάρχουν δυο εντολές ελέγχου: ```if``` και ```case```.
```bash
if <condition>
then
   <commands-if-condition-is-true>
fi
--------------------------------
if <condition1>
then
   <commands-if-condition1-is-true>
elif <condition2>
then
   <commands-if-condition2-is-true>
else
   <commands-if-condition-is-false>
fi
--------------------------------
if <condition1> ; then <true-commands> ; else <false-commands> ; fi
```
Παρατηρήστε ότι μπορούμε να γράψουμε την εντολή ```if``` σε μια γραμμή διαχωρίζοντας τα μέρη της με το ελληνικό ερωτηματικό (```;```) και κενά πριν και μετά.
Η εντολή ```if``` ελέγχει την κατάσταση εξόδου της εντολής συνθήκης (<condition>) (δηλ. τη μεταβλητή ```$?```). Αν η τιμή της  μεταβλητής αυτής είναι μηδέν (0), σημαίνει ότι η εντολή συνθήκης ήταν επιτυχής (δηλ. αληθής), διαφορετικά ήταν ψευδής, και εκτελούνται οι ανάλογες εντολές.
Ας δούμε ένα παράδειγμα:
```bash
mycp.sh
#!/bin/bash
if cp $1 $2
then
   echo 'Copy was successful.'
else
   echo "An error occurred with exit code: $?"
fi
```
Αν το αρχείο ```$1``` υπάρχει και μπορεί να διαβαστεί (```r```) και αντίστοιχα το αρχείο/φάκελος ```$2``` έχει δικαιώματα εγγραφής (```w```) τότε η εντολή ```cp $1 $2``` είναι επιτυχής, επομένως επιστρέφει ως κατάσταση εξόδου ```0``` στη μεταβλητή ```$?``` και άρα εκτελείται η εντολή μετά το ```then```. Αν συμβεί κάποιο λάθος κατά την εκτέλεση της ```cp```, τότε εκτελείται η εντολή μετά το ```else```.

```bash
$ chmod u+x mycp.sh
$ ./mycp.sh mycp.sh mycp.bak
Copy was successful.
$ ./mycopy.sh nofile.txt nofile.bak 
cp: cannot stat `nofile.txt': No such file or directory 
An error occurred with exit code: 1
```
Κι αν δε θέλετε να βλέπετε το λάθος της εντολής ```cp```, αλλάξτε την δεύτερη γραμμή του αρχείου ```mycp.sh``` ως εξής:
```bash
if cp $1 $2 >/dev/null 2>/dev/null
```
Μια συνθήκη περιγράφεται συνήθως με τον τελεστή ```[[ <συνθήκη> ]]```. Κι εδώ ισχύουν τα ίδια σχετικά με την κατάσταση εξόδου της εντολής που αποθηκεύεται στη μεταβλητή ```$?```. Π.χ. η εντολή
```bash
[[ -f text1.txt ]]
```
ελέγχει αν το ```text1.txt``` είναι αρχείο.

| Δείκτης | Επεξήγηση |
| ```-f``` | Έλεγχος αν είναι αρχείο |
| ```-d``` | Έλεγχος αν είναι κατάλογος |
| ```-r``` | Έλεγχος αν επιτρέπεται η ανάγνωση |
| ```-w``` | Έλεγχος αν επιτρέπεται η εγγραφή |
| ```-x``` | Έλεγχος αν επιτρέπεται η εκτέλεση |
| ```-s``` | Μέγεθος > 0 |
| ```-e``` | Έλεγχος ύπαρξης αρχείου/φακέλου |

Έτσι, το ```mycp.sh``` μπορεί να γραφεί ως εξής:
```bash
#!/bin/bash
if [[ -f $1 ]]
then 
  if [[ -r $1 ]]
  then 
    if cp $1 $2
    then
      echo 'Copy was successful.'
    else
      echo "An error occurred with exit code: $?"
    fi
  fi
fi
```

| Τελεστής | Επεξήγηση |
| ```&&``` |  Λογικό ΚΑΙ |
| ```||``` | Λογικό Ή |
| ```!``` | Λογικό ΌΧΙ |

Έτσι, το ```mycp.sh``` μπορεί να γραφεί και ως εξής:
```bash
#!/bin/bash
if [[ -f $1 && -r $1]]
then  
  if cp $1 $2
  then
    echo 'Copy was successful.'
  else
    echo "An error occurred with exit code: $?"
  fi
fi
```

| Προτεραιότητα τελεστών |
| ```( )```|
| ```!``` |
| ```&&```|
| ```||```|

Η παραπάνω προτεραιότητα τελεστών ισχύει μέσα στα ```[[ ]]```. Έξω από τα ```[[ ]]``` τα ```&&``` και ```||``` έχουν την ίδια προτεραιότητα.

| Τελεστής | Επεξήγηση |
| ```-ot``` | Παλαιότερο  (older than) |
| ```-nt``` | Νεώτερο (newer than) |
| ```-ef``` | Ίδιο αρχείο (equal file). Δουλεύει και για hard και soft links. |

Ας δούμε το παρακάτω αρχείο συνόδου που ελέγχει αν δυο αρχεία είναι ίδια (δηλ. αν δυο ονόματα αρχείων αναφέρονται στο ίδιο αρχείο):
```bash
samefile.sh
#!/bin/bash
if [[ ! -f $1 ]]
then  
  echo $1 is not a file or does not exist.
  exit 1
elif [[ ! -f $2 ]]
then
  echo $2 is not a file or does not exist.
  exit 2
else 
  if [[ $1 -ef $2 ]]
  then
    echo $1 and $2 are the same.
    exit 0
  else
    echo $1 and $2 are not the same.
    exit 3
  fi
fi
```
```bash
$ chmod u+x samefile.sh
$ ./samefile.sh samefile.sh samefile.sh 
samefile.sh and samefile.sh are the same.
$ echo $? 
0
$ ./samefile.sh samefile.sh params.sh 
samefile.sh and params.sh are not the same. 
$ echo $? 
3 
```
κλπ.

| Τελεστής | Επεξήγηση |
|```-eq```  | Ίσο (equal) |
|```-ne```  | Άνισο (not equal) |
|```-gt```  | Μεγαλύτερο (greater than) |
|```-ge```  | Μεγαλύτερο ή ίσο (greater or equal) |
|```-lt```  | Μικρότερο (less than) |
|```-le```  | Μικρότερο ή ίσο (less or equal) |
|```>  ``` | Μεγαλύτερο (greater than) |
|```>= ```  | Μεγαλύτερο ή ίσο (greater or equal) |
|```<  ``` | Μικρότερο (less than) |
|```<= ``` | Μικρότερο ή ίσο (less or equal) |

Στις περίπτωση που οι τελεστέοι είναι αλφαριθμητικά κι όχι αριθμοί, τότε οι τελεστές σύγκρισης συγκρίνουν τα αλφαριθμητικά λεξικογραφικά, π.χ.
```bash
$ [[ 'cmd' < 'abc' ]]
$ echo $?
1               # --> ψευδής
```
Για τ' αλφαριθμητικά υπάρχουν ακόμα οι εξής τελεστές:

| Τελεστής | Επεξήγηση |
| ```-z``` | Αληθής αν το αλφαριθμητικό είναι κενό, δηλ. το μήκος του είναι 0.
| ```-n``` | Αληθής αν το αλφαριθμητικό δεν είναι κενό, δηλ. το μήκος του είναι μεγαλύτερο του 0.

Σημειωτέον ότι το μήκος ενός αλφαριθμητικού υπολογίζεται με την εντολή ```${#string}```, π.χ.:
```bash
$ s = 'John';
$ echo ${#s}
4
```

| ```string == pattern``` |

| Ειδικός χαρακτήρας | Επεξήγηση |
| ```?``` | Οποιοσδήποτε ένας χαρακτήρας. |
| ```*``` | Οποιοιδήποτε χαρακτήρες (0 ή περισσότεροι). |
| ```[]``` |  Ανήκει στους χαρακτήρες |
| ```[!]``` | Δεν ανήκει στους χαρακτήρες |

Π.χ.:
```bash
$ [[ $s == ?ohn ]]
$ echo $?
0
$ [[ $s == J* ]]
$ echo $?
0
$ [[ $s == [Jj]ohn ]]
$ echo $?
0
$ [[ $s == [!Jj]ohn ]]
$ echo $?
1
$ [[ $s == [Α-J]ohn ]]
$ echo $?
0
$ [[ $s == [A-J][a-z]?? ]]
$ echo $?
0
$ [[ $s != John ]]
$ echo $?
1
```
Μπορείτε να χρησιμοποιήσετε και τους ειδικούς χαρακτήρες ```-, ], !, \```  ως pattern βάζοντας πριν τον χαρακτήρα διαφυγής ```\```, π.χ. ```\-``` ή ```\\```.
Και μερικοί χρήσιμοι τελεστές αποκοπής αλφαριθμητικών προτού προχωρήσουμε:

|```${string τελεστής pattern}```|

| Τελεστής | Επεξήγηση |
| ```# ``` | Αποκόπτει μικρότερο pattern από αριστερά. |
| ```##```  | Αποκόπτει μεγαλύτερο pattern από αριστερά. |
| ```% ``` | Αποκόπτει μικρότερο pattern από δεξιά. |
| ```%%```  | Αποκόπτει μεγαλύτερο pattern από δεξιά. |

```bash
$ url=ubuntistas.ubuntu-gr.org
# cut shortest from right matching .*
$ echo ${url%.*}
ubuntistas.ubuntu-gr
# cut longest from right matching .*
$ echo ${url%%.*}
ubuntistas
# cut shortest from left matching *.
$ echo ${url#*.}
ubuntu-gr.org
# cut longest from left matching *.
$ echo ${url##*.}
org
```
Ας υποθέσουμε ότι θέλουμε να μορφοποιήσουμε την παρακάτω ημερομηνία σε ελληνική μορφή:
```bash
$ adate=20110713
# cut the 4 right characters
$ year=${adate%????}
# cut the 4 left and 2 right characters
$ month=${adate#????}
$ month=${month%??}
# cut the 6 left characters
$ day=${adate#??????}
$ echo $day/$month/$year
13/07/2011
```
Υπάρχουν ακόμα και οι εξής εντολές εξαγωγής αλφαριθμητικών:
```bash
${string:offset} και 
${string:offset:length}
```
Π.χ.
```bash
$ echo ${url:11}
ubuntu-gr.org
$ echo ${url:11:9}
ubuntu-gr
```
| ```${string τελεστής pattern/str}``` |

| Τελεστής | Επεξήγηση |
| ```/ ```| Αντικαθιστά την 1η εμφάνιση του pattern με το str. |
| ```/#``` | Αντικαθιστά το pattern με το str μόνο αν το string ξεκινά με το pattern. |
| ```/%``` | Αντικαθιστά το pattern με το str μόνο αν το string τελειώνει με το pattern. |
| ```//``` | Αντικαθιστά όλες τις εμφανίσεις του pattern με το str. |

```bash
$ echo ${url/org/gr}
ubuntistas.ubuntu-gr.gr
$ echo ${url/#ubu/aba}
abantistas.ubuntu-gr.org
$ echo ${url/%org/gr}
ubuntistas.ubuntu-gr.gr
$ echo ${url//ubu/aba}
abantistas.abantu-gr.org
```
Ας προχωρήσουμε όμως στην ```case```:
```bash
case <var> in
  pattern) <command> ;;
  pattern) <command> ;;
  *) <command>;;
esac
```
Π.χ.
```bash
menu.sh
#!/bin/bash
echo "Menu"
echo "1) Play Game"
echo "2) See score"
echo "q) Exit"
read selection
case $selection in
  "1") echo "Game is loading..." ;;
  "2") echo "Top ten" ;;
  "q") echo "Exiting" ;;
    *) echo "Wrong choice. Try again." ;;  
esac
```
```bash
$ chmod u+x menu.sh
$ ./menu.sh
Menu 
1) Play Game 
2) See score 
q) Exit 
1
Game is loading... 
$ ./menu.sh
Menu 
1) Play Game 
2) See score 
q) Exit 
q
Exiting 
```

## Εντολές επανάληψης

Υπάρχουν τρεις εντολές επανάληψης: ```while, until``` και ```for```.
```bash
while <condition>
do
   <commands-if-condition-is-true>
done
--------------------------------
until <condition>
do
   <commands-if-condition-is-false>
done
--------------------------------
for <variable> in <list> 
do
   <commands>
done
--------------------------------
for (( <init>; <test>; <step> )) 
do
   <commands>
done
```
Ας δούμε μερικά παραδείγματα χρήσης. Έστω το αρχείο δεδομένων:

```bash
phonebook.txt
Γιάννης Κυπραίος:2108020222
Μαρία Στρουμπούλη:6977454545
Κώστας Κωστάκος:6945555555
while.sh
#!/bin/bash
IFS=: 
echo "Όνομα             Τηλέφωνο"
echo "-----------------------------"
while read name phone
do
  echo $name $phone
done < $1
```
```bash
$ chmod u+x while.sh
$ ./while.sh phonebook.txt
Όνομα             Τηλέφωνο
-----------------------------
Γιάννης Κυπραίος 2108020222
Μαρία Στρουμπούλη 6977454545
Κώστας Κωστάκος 6945555555
```
```bash
menu2.sh
#!/bin/bash
selection = ''
until [[ $selection == [12q] ]]
do
  echo "Menu"
  echo "1) Play Game"
  echo "2) See score"
  echo "q) Exit"
  read selection
done
case $selection in
  "1") echo "Game is loading..." ;;
  "2") echo "Top ten" ;;
  "q") echo "Exiting" ;;
    *) echo "Wrong choice. Try again." ;;  
esac
```
```bash
args.sh
#!/bin/bash
i=0
for arg in "$@"
do
  let "i+=1"
  echo "Argument $i is $arg"
done
Η μεταβλητή "$@" περιέχει, όπως είπαμε, τις παραμέτρους της γραμμής εντολών.
$ ./args.sh "bye bye" 1 john
Argument 1 is bye bye
Argument 2 is 1
Argument 3 is john
```
```bash
factorial.sh
#!/bin/bash
factorial=1
for ((i=1; i<=$1; i++))
do
  let "factorial *= i" 
done
echo "$1! = $factorial"
```
```bash
$ chmod u+x factorial.sh
$ ./factorial.sh 5
5! = 120
```
Φυσικά υπάρχουν κι οι εντολές ```break``` και ```continue``` οι οποίες τερματίζουν τον τρέχοντα βρόγχο ή συνεχίζουν με την επόμενη επανάληψη του βρόγχου, αντίστοιχα. Υπάρχουν και ```break n``` και ```continue n``` όπου ```n``` είναι ο n-στός βρόγχος.
Οι κανόνες σωστού προγραμματισμού υπογραμμίζουν ότι καλό είναι ν' αποφεύγονται οι παραπάνω δυο εντολές.

Μια ακόμα χρήσιμη εντολή είναι η select για τη δημιουργία μενού:
```bash
select <variable> in <list>
do
   <commands>
done
```
Ας δούμε τη χρήση της μ' ένα παράδειγμα:
```bash
selectmenu.sh
#!/bin/bash
# Prompt string for menu
PS3="Make your choice 1)Play Game 2)See score 3)Exit"
select choice in play score exit
do 
 case $choice in
  play) echo "Game is loading..." ;;
  score) echo "Top ten" ;;
  exit) echo "Exiting" 
        break ;;
    *) echo "Wrong choice. Try again." ;;  
 esac
done
```
```bash
$ chmod u+x selectmenu.sh
$ ./selectmenu.sh 
1) play
2) score
3) exit
Make your choice 1)Play Game 2)See score 3)Exit : 1
Game is loading...
Make your choice 1)Play Game 2)See score 3)Exit : 2
Top ten
Make your choice 1)Play Game 2)See score 3)Exit : 3
Exiting
```
Το πρόγραμμα χρειάζεται κάποιες επεξηγήσεις. Η εντολή ```select``` δημιουργεί ένα μενού (```play score exit```) και στο τέλος του εμφανίζεται η προτροπή ```PS3``` (η οποία έχει την εξ' ορισμού τιμή ```#?``` γι' αυτό και την αλλάξαμε). Η επιλογή του χρήστη αποθηκεύεται στη μεταβλητή ```choice``` και με βάση αυτή μια case αποφασίζει τι θα εκτελέσει το πρόγραμμα.

## Πίνακες
```bash
array.sh
#!/bin/bash
# Declare an array with 4 elements
array=( Debian Fedora SUSE Ubuntu )
# get number of elements 
echo "Array length = ${#array[@]}"
# echo "${#array[*]}" does the same 
# for loop echo's each element
# arrays are 0-based, i.e. index starts from 0
for ((i=0;i<${#array[@]};i++)); do
    echo "array[$i] = ${array[i]}"
done
echo 
# Assign a 5th element
array[4]='Madriva'
# Another way to loop through the elements
for distro in "${array[@]}"; do
    echo $distro
done
array[4]='Mint Linux'
echo 
echo "${array[@]}"
echo "${array[*]}"
echo "${!array[@]}"
echo "${!array[*]}"
echo "${array[@]:2:2}"
```
```bash
$ ./array.sh
Array length = 4
array[0] = Debian
array[1] = Fedora
array[2] = SUSE
array[3] = Ubuntu
```
```bash
Debian
Fedora
SUSE
Ubuntu
Madriva
```
```bash
Debian Fedora SUSE Ubuntu Mint Linux
Debian Fedora SUSE Ubuntu Mint Linux
0 1 2 3 4
0 1 2 3 4
SUSE Ubuntu
```
Μερικές επεξηγήσεις. Μπορούμε ν' αρχικοποιήσουμε έναν πίνακα είτε:
```bash
array=( Debian Fedora SUSE Ubuntu )
```
είτε
```bash
array[0]='Debian'
array[1]='Fedora'
array[2]='SUSE'
array[3]='Ubuntu'
είτε
index=0
for value in Debian Fedora SUSE Ubuntu 
do 
   array[index]=$value
   ((index++))
done
```
Ο αρχικός δείκτης είναι πάντα το ```0```.
Εκχώρηση στοιχείου του πίνακα
```bash
array[2]='Mint'
```
Τιμή 3ου στοιχείου του πίνακα
```bash
echo ${array[2]}
```
Το πλήθος των στοιχείων του πίνακα
```bash
${#array[*]} ή ${#array[@]} 
```
Όλα τα στοιχεία του πίνακα
```bash
${array[*]} ή ${array[@]} 
```
Η διαφορά τους είναι ότι μέσα σε εισαγωγικά (```"```) η πρώτη εντολή επιστρέφει ένα μόνο αλφαριθμητικό με όλα τα στοιχεία ενώ η δεύτερη μια λίστα με κάθε στοιχείο σε εισαγωγικά.

Οι δείκτες  του πίνακα με τη διαφορά που είπαμε προηγουμένως:
```bash
${!array[*]} ή ${!array[@]} 
```

Υποπίνακες
```bash
${array[@]:offset:length} 
```

## Υπολογισμός εκφράσεων 
Το κέλυφος είναι κι ένα χρήσιμο κομπιουτεράκι, αν τύχει και δεν σας βρίσκεται κάποιο πρόχειρο. Η αντίστοιχη εντολή είναι η ```expr```:
```bash
# \* γιατί το * είναι ο χαρακτήρας μπαλαντέρ
$ expr 5 – 3 \* 2
-1
$ expr \( 5 - 3 \) \* 2
4
# / = div ακέραια διαίρεση
$ expr 10 / 3 + 4
7
# % = modulo ακέραιο υπόλοιπο
$ expr 20 % \( 7 + 2 \)
2
$ expr substr "playground" 5 6
ground
# γιατί το u βρίσκεται στη θέση 3
$ expr index "Ubuntu" "stu"
3
$ expr length "Ubuntu"
6
```
Δώστε μεγάλη σημασία στο να αφήνετε κενά μεταξύ των τελεστέων, των τελεστών και των παρενθέσεων αλλοιώς θα δείτε μηνύματα λάθους όπως τα παρακάτω:
```bash
expr: syntax error
expr: non-integer argument 
```
Φυσικά ισχύουν όσα είπαμε και στο προηγούμενο τεύχος όσων αφορά την προτεραιότητα των τελεστών.
Εναλλακτικά μπορείτε να χρησιμοποιήσετε και τους τελεστές ```$(( ))``` και ```$[ ]```:
```bash
$ echo $((5 – 3 * 2))
-1
$ echo $[10 / 3 + 4]
7
```

## Σήματα και παγίδες
_Σήμα (signal)_ είναι μια _διακοπή (interrupt)_ που στέλνεται σε μια διεργασία από το λειτουργικό σύστημα. Συνήθως, μια διεργασία τερματίζεται όταν δέχεται ένα τέτοιο σήμα. Στο πρόγραμμά σας όμως τέτοια σήματα μπορεί να είναι χρήσιμα για να κάνετε π.χ. ξεκαθάρισμα πόρων πριν τερματίσετε τη διεργασία σας, να τ' αγνοήσετε μέσα σε κρίσιμα τμήματα κλπ. Βέβαια, μπορείτε κι εσείς μέσα από το πρόγραμμά σας να στέλνετε σήματα σε διεργασίες, αλλά μια διεργασία αγνοεί όλα τ' άλλα σήματα πέραν αυτών που 'ρχονται από τον υπερχρήστη (```root```) ή τον χρήστη που τη δημιούργησε. 
Η εντολή είναι η 
```bash
kill -signal PID|JOBID
```
όπου ```signal``` ένα από τα παρακάτω. Το εξ' ορισμού είναι το ```TERM```. 

| Σήμα | Κωδ. | Επεξήγηση
| ```HUP ``` | 1 | Η διεργασία τερματίστηκε |
| ```INT ``` | 2 | ```(^C)``` |
| ```QUIT```  | 3 | ```(^C)``` δημιουργεί core dump |
| ```KILL```  | 9 | Άμεσος τερματισμός διεργασίας |
| ```TERM```  | 15 | Τερματισμός διεργασίας |
| ```USR1```  | | Σήμα καθορισμένο απ' το χρήστη |
| ```USR2```  | | Σήμα καθορισμένο απ' το χρήστη |

Κάθε εντολή ή πρόγραμμα που εκτελείται στο κέλυφος του Linux αποκτά από το σύστημα έναν μοναδικό αριθμό ταυτότητας που ονομάζεται _PID_ ή _Process ID_. Η εντολή ps μας δίνει μια λίστα με τις διεργασίες (processes) που τρέχουν στο σύστημά μας:
```bash
$ ps
  PID TTY          TIME CMD
 2476 pts/3    00:00:00 bash
 8034 pts/3    00:00:00 ps
Η τιμή της μεταβλητής $ είναι το PID της τρέχουσας διεργασίας, όπως φαίνεται από την εντολή:
$ echo $$
2476
Η τιμή της μεταβλητής ! είναι το PID της τελευταίας διεργασίας που εκτελέστηκε στο παρασκήνιο:
$ xterm &    <-- στο background
[1] 3000     <-- jobid=1, pid=3000
$ echo $!
3000
$ jobs
[1]+  Running          xterm &
$ kill $!
$ jobs
[1]+  Exit 15          xterm &
```
Μπορείτε να συλλάβετε ένα σήμα με την εντολή
```bash
trap action signal
```
όπου ```action``` είναι οι ```εντολές``` που θα εκτελεστούν μόλις ληφθεί το σήμα ```signal```. Η εντολή αυτή πρέπει να εκτελεστεί προτού σταλεί το σήμα διαφορετικά το σήμα δε θα επεξεργαστεί.

| Ενέργεια | Επεξήγηση |
| Επεξεργασία | ```trap 'command' signal```  |
| Αγνόηση | ```trap ' ' signal```  |
| Επαναφορά | ```trap - signal``` |

Ας δούμε ένα παράδειγμα:
```bash
trap.sh
#!/bin/bash
trap 'echo HUP interrupt was received!' HUP
trap 'echo INT interrupt was received!' INT
trap 'echo QUIT interrupt was received!' QUIT
trap 'echo TERM interrupt was received!
      echo This process will be terminated! 
      exit 0' TERM
trap 'echo USR1 interrupt was received!' USR1
trap 'echo USR2 interrupt was received!' USR2
```
```bash
while true
do 
  echo "Current time: $(date +%T)"
  sleep 60
done
```
Όπως είπαμε, οι εντολές ```trap``` πρέπει να εκτελεστούν στην αρχή του προγράμματος προτού σταλεί κάποιο σήμα ώστε να μπορέσουν να το συλλάβουν.
Σημειώστε ότι το σήμα ```KILL``` δεν μπορεί να συλληφθεί/επεξεργαστεί.
```bash
$ chmod u+x trap.sh
$ ./trap.sh &
[1] 3165
$ Current time: 13:37:38
kill -HUP %1
$ Hangup
HUP interrupt was received!
Current time: 13:38:01
kill -USR1 %1
User defined signal 1
USR1 interrupt was received!
$ Current time: 13:38:07
kill -TERM %1
$ Terminated
TERM interrupt was received!
This process will be terminated!
```
```bash
[1]+  Done                    ./trap.sh
```
Οι εντολές με έντονη γραφή είναι αυτές που στέλνουμε εμείς (τις πληκτρολογείτε δηλ.) και είναι αυτές που στέλνουν τα σήματα στο πρόγραμμα ```trap.sh```. Το ```%1``` δηλώνει το jobid 1. Θα μπορούσαμε να χρησιμοποιήσουμε και το PID της διεργασίας.

## Κελύφη και Υποκελύφη
Μια μεταβλητή είναι τοπική στο κέλυφος που ορίστηκε, αλλά όχι σε άλλα κελύφη, π.χ.
```bash
$ DOCUMENTS=$HOME/Documents
$ echo $DOCUMENTS
/home/john/Documents
$ set | grep DOCUMENTS
DOCUMENTS=/home/john/Documents
$ bash
$ echo $DOCUMENTS
```
```bash
$ exit
```
Ένας ακόμα έλεγχος. Δημιουργήστε το ακόλουθο ```testvar.sh```:
```bash
#!/bin/bash
echo HOME=$HOME
echo DOCUMENTS=$DOCUMENTS
```
και εκτελέστε το στο αρχικό κέλυφος που ορίσατε τη μεταβλητή ```DOCUMENTS```:
```bash
$ chmod u+x testvar.sh
$ echo $DOCUMENTS
/home/john/Documents
$ ./testvar.sh
HOME=/home/john
DOCUMENTS=
```
Γιατί συμβαίνει αυτό; Γιατί το ```testvar.sh``` εκτελείται σε διαφορετικό κέλυφος, σε ένα _υποκέλυφος_ για την ακρίβεια. Ένα υποκέλυφος κληρονομεί από το πατρικό κέλυφος όλα τα ανοικτά αρχεία, τα δικαιώματα πρόσβασης, τον τρέχοντα κατάλογο, την τιμή της ```umask```, τους περιορισμούς στους υπάρχοντες πόρους και τις εξαγώμενες μεταβλητές (δηλ. όσες έχουν γίνει ```export```). 
Πώς μπορούμε λοιπόν να κάνουμε τη μεταβλητή μας ```DOCUMENTS``` προσβάσιμη κι από άλλα κελύφη και υποκελύφη; Κάνοντάς τη μεταβλητή περιβάλλοντος (environment variable) με την εντολή ```export```:
```bash
$ export DOCUMENTS=$HOME/Documents
$ echo $DOCUMENTS
/home/john/Documents
$ env | grep DOCUMENTS
DOCUMENTS=/home/john/Documents
$ bash
$ echo $DOCUMENTS
/home/john/Documents
$ exit
$ ./testvar.sh
HOME=/home/john
DOCUMENTS=/home/john/Documents
```
Παρατηρήστε ότι η εντολή env εμφανίζει τις μεταβλητές περιβάλλοντος ενώ η ```set``` τις τοπικές μεταβλητές.

## Ενσωμάτωση αρχείου συνόδου
Μπορείτε να καλέσετε ένα αρχείο συνόδου (script) από ένα άλλο αρχείο συνόδου προσθέτοντας μπροστά του την τελεία:
```bash
testvar2.sh
#!/bin/bash
. testvar.sh      # ή ./testvar.sh
echo Inside $0
echo HOME=$HOME
echo DOCUMENTS=$DOCUMENTS
```
και εκτελώντας το:
```bash
$ chmod u+x testvar2.sh
$ ./testvar2.sh
HOME=/home/john
DOCUMENTS=/home/john/Documents
Inside ./testvar2.sh
HOME=/home/john
DOCUMENTS=/home/john/Documents
```
Η εντολή (```.```) διαβάζει το εισαγώμενο script, το εξάγει και το εκτελεί στην τρέχουσα διεργασία.

## Συναρτήσεις
Καθώς τα προγράμματα γινόντουσαν όλο και μεγαλύτερα, έπρεπε να βρεθεί ένας τρόπος να 'σπάσουν' σε μικρότερα τμήματα ώστε ο κώδικας να είναι καλύτερα διαχειρίσιμος. Έτσι, εμφανίστηκαν οι συναρτήσεις. Μια συνάρτηση ορίζεται ως εξής:
```bash
function <name>() {
   <commands>
}
ή 
<function name>() {
   <commands>
}
```
Το ```}``` πρέπει να βρίσκεται σε ξεχωριστή γραμμή ή να προηγείται ```;```. 
Ας δούμε ένα παράδειγμα:
```bash
factorial.sh
#!/bin/bash
function factorial() {
  local n=$1
  fact=1
  until [ $n -eq 0 ] 
  do 
     fact=`expr $fact \* $n`
  n=`expr $n - 1`
  done
  return $fact
}
```
```bash
echo -n "Give number: "
read number
factorial $number
echo "$number!=$fact"
```
Κατ' αρχήν, οι συναρτήσεις πρέπει να δηλώνονται στην αρχή του αρχείου συνόδου. Περνάμε ένα όρισμα σε μια συνάρτηση κατά τα γνωστά:
```bash
factorial $number
```
και μέσα στη συνάρτηση προσπελάζουμε το όρισμα ως ```$1, $2``` κλπ.
Τέλος, μπορούμε να επιστρέψουμε μια τιμή επιστροφής στο καλών πρόγραμμα με την εντολή ```return```. Παρατηρήστε ότι τόσο οι μεταβλητές της συνάρτησης όσο κι οι μεταβλητές του καλούντος προγράμματος είναι καθολικές (global) δηλ. προσπελάσιμες παντού μέσα στο αρχείο συνόδου αφού η ```$fact``` είναι επίσης προσπελάσιμη από το κύριο πρόγραμμα. Τοπικές μεταβλητές ορίζονται με την κωδική λέξη ```local``` ή ```typeset``` Μεταβλητές ανάγνωσης μόνο μπορούν να οριστούν ως ```typeset/local -r```. 
Το καλών πρόγραμμα προσπελάζει την κατάσταση εξόδου (exit status) της συνάρτησης με τη μεταβλητή ```$?```. Αν δεν υπάρχει εντολή ```return```, τότε η τιμή της ```$?``` είναι η κατάσταση εξόδου (exit status) της τελευταίας εντολής της συνάρτησης που εκτελέστηκε. Μπορούμε επίσης να τερματίσουμε μια συνάρτηση δίνοντας ως τελευταία εντολή της την εντολή ```exit``` μ' έναν κωδικό κατάστασης εξόδου (π.χ. ```0``` για επιτυχημένη εκτέλεση).
```bash
$ chmod u+x factorial.sh
$ ./factorial
Give number: 5
5!=120
```
Είναι χρήσιμο να δημιουργήσετε αρχεία βιβλιοθηκών με συναρτήσεις τις οποίες να καλείτε στα προγράμματά σας με την εντολή (```.```) όπως είδαμε προηγούμενα.
Αν υπάρχουν πολλές εντολές με το ίδιο όνομα, τότε η ακολουθία εκτέλεσης (αν δε δώσουμε απόλυτο path) στο αρχείο συνόδου μας είναι η ακόλουθη:
    1. η συνάρτηση
    2. ενσωματωμένες (built-in) εντολές
    3. εντολές στο PATH

## Υποκατάσταση εντολών
Όπως είδαμε στο πρόγραμμα ```factorial.sh```, η εκτέλεση των εντολών 
```bash
fact=`expr $fact \* $n`
n=`expr $n - 1`
```
έγινε με τη χρήση του τελεστή ``` ` ` ```, ο οποίος υποκαθιστά την αριθμητική έκφραση κι αποθηκεύει το αποτέλεσμα σε μια μεταβλητή.
Όμοια θα μπορούσε να χρησιμοποιηθεί κι ο τελεστής ```$( )```. Π.χ.
```bash
$ echo $(date)
Sat Oct 8 21:47:22 CEST 2011
$ echo $(hostname)
ubuntu
$ hosts=$(cat /etc/hosts)
$ echo "$hosts"
127.0.0.1 localhost.localdomain localhost
::1 ubuntu  localhost6.localdomain6 localhost6
127.0.1.1 ubuntu
```
```bash
$ echo $(grep $(whoami) /etc/passwd)
john:x:1000:1000:john,,,:/home/john:/bin/bash
```
```bash
$ echo $(awk -F: '{print $1}' /etc/passwd | sort)
```
```bash
$ for user in $(awk -F: '{print $1}' /etc/passwd | sort)
do
   who | grep $user
done
```
Όπως βλέπετε, πολλές εντολές μπορούν να εμφωλιαστούν ή να χρησιμοποιηθούν ως είσοδο σε άλλες εντολές. Αυτά είναι τα πλεονεκτήματα του τελεστή ```$( )``` έναντι της παλαιότερης σύνταξης ``` ` ` ```.

## Ανακατεύθυνση Εισόδου
Η εντολή
```bash
command <<label
```
ανακατευθύνει την είσοδο (standard input) στην εντολή μέχρις ότου να συναντήσει την ετικέτα. Π.χ.
```bash
$ mail -s 'user list' john@ubuntu <<End
  $(who)
End
echo 'Email was sent to john@ubuntu'
```
Η εντολή ```mail``` δέχεται είσοδο μέχρις ότου συναντήσει την ετικέτα ```End``` που δηλώνει το τέλος της εισόδου.
Η εντολή ```command <<-word``` επιπλέον διαγράφει στηλοθέτες στην αρχή των γραμμών εισόδου.
Η εντολή ```command <</word``` επιπλέον δεν εκτελεί τις μεταβλητές που διαβάζει από την είσοδο, δηλ. η είσοδος εκλαμβάνεται σα να συμπεριλαμβάνεται σε ```' '``` κι όχι σε ```" "```. Π.χ. αν στην είσοδο έχουμε τη μεταβλητή ```$HOME``` αυτή θα θεωρηθεί από την εντολή ως το αλφαριθμητικό ```'$HOME'```.

## Είσοδος/Έξοδος
Μια διεργασία έχει πρόσβαση σε 10 το πολύ αρχεία εισόδου, τα πρώτα 3 από τα οποία είναι τα παρακάτω:

| Περιγραφέας αρχείου | Αρχείο | Σύμβολο Ανακατεύθυνσης |
| ```0``` | ```stdin ```|  ```0<   0<< ``` |
| ```1``` | ```stdout``` | ``` 1>   1>> ``` |
| ```2``` | ```stderr``` | ``` 2>   2>> ``` |

Οι εντολές ```n<&x``` και ```n>&x``` δημιουργούν ένα αντίγραφο του περιγραφέα αρχείου ```n```, π.χ. η παρακάτω εντολή ανακατευθύνει το stderr στο stdout.
```bash
$ find . -name "*.java" 2>&1
```
Άρα, μια διεργασία μπορεί να έχει πρόσβαση σε ακόμα 7 αρχεία με περιγραφείς 3 – 9.

| Σύμβολο ανακατ/νσης | Σημασία |
| ```n<file``` | Άνοιγμα αρχείου για ανάγνωση |
| ```n<&-``` | Κλείσιμο αρχείου |
| ```n>file``` | Άνοιγμα αρχείου για εγγραφή |
| ```n>>file``` | Άνοιγμα αρχείου για προσάρτηση |
| ```n>&-``` | Κλείσιμο αρχείου |

Το ακόλουθο πρόγραμμα αντιγράφει το αρχείο κειμένου εισόδου στο αρχείο εξόδου διαβάζοντας μια-μια γραμμή:
```bash
copy.sh
#!/bin/bash
if (( $# < 2 ))
then
   echo "Usage: $0 <source file> <destination file>" >&2
   exit 1
fi 
source=$1
dest=$2
exec 3< $source
exec 4> $dest
while read -u3 line
do
  echo "$line" >&4
done
exec 3<&- 4>&-
echo File copied.
```
Η εντολή ```>&2``` ανακατευθύνει το stdin στο stderr. Είναι ίδια με την ```1>&2```.
Η εντολή ```exec``` ανοίγει τον περιγραφέα αρχείου για επεξεργασία (ανάγνωση ή εγγραφή). Η εντολή ```read -u3``` διαβάζει από τον περιγραφέα αρχείου 3 ενώ η εντολή ```>&4``` ανακατευθύνει την εγγραφή στον περιγραφέα αρχείου 4. Η τελευταία εντολή ```exec```, τέλος, κλείνει τους περιγραφείς αρχείων.

## Αλληλεπίδραση με το χρήστη
Θα έχετε προσέξει ότι διάφορες εντολές του Linux περιέχουν κάποιες επιλογές (options), π.χ.
```bash
$ ls -al
```
Τα ```-al``` είναι επιλογές της εντολής ```ls```. Η εντολή ```getopts``` μας βοηθάει να επεξεργαζόμαστε αυτές τις επιλογές στα προγράμματά μας.
```bash
getopts optionsList optionVar
```
π.χ.
```bash
while getopts optionsList optionVar
do
   case $optionVar in
    ...
   esac
done
```
```optionsList``` είναι μια λίστα με τις έγκυρες επιλογές ενώ η ```optionVar``` είναι μια μεταβλητή που περιέχει την επόμενη απ' αυτές κάθε φορά που καλείται η ```getopts```. Για μια μη έγκυρη επιλογή, η ```optionVar``` έχει την τιμή ```?```. 
Ας δούμε ένα παράδειγμα:
```bash
options.sh:
#!/bin/bash
optionsList='al'
a_option=false
l_option=false
```
```bash
while getopts $optionsList option
do
  case $option in
     'a') a_option=true ;;
  'l') l_option=true ;;
  esac
done
[[ $a_option = true ]] && echo '-a option passed'
[[ $l_option = true ]] && echo '-l option passed'
```
και ας το εκτελέσουμε:
```bash
$ chmod u+x options.sh
$ ./options.sh
$ ./options.sh -a
-a option passed
$ ./options.sh -al
-a option passed
-l option passed
$ ./options.sh -a -l
-a option passed
-l option passed
$ ./options.sh -alv
./options.sh: illegal option -- v
-a option passed
-l option passed
```
Παρατηρήστε ότι το πρόγραμμα δεν μπερδεύεται αν περάσετε τις επιλογές ως ```-al``` ή ως ```-a -l``` ενώ εμφανίζει ένα μήνυμα λάθους αν περάσετε άγνωστη επιλογή. Αν δε θέλετε να εμφανίζει μήνυμα λάθους τότε βάζετε το ```:``` μπροστά από την ```optionsList```, π.χ.
```bash
optionsList=':al'
...
case $option in
     'a') a_option=true ;;
  'l') l_option=true ;;
  '?') echo "Illegal option $OPTARG" >&2
esac
```
Έτσι, αντί για το εξ' ορισμού μήνυμα λάθους εμφανίζεται το δικό σας:
```bash
$ ./options.sh -avl
Illegal option -v
-a option passed
-l option passed
```
Η μεταβλητή ```OPTARG``` περιέχει την εσφαλμένη επιλογή (όπως είπαμε η ```optionsList``` είναι μια λίστα με τις έγκυρες μόνο επιλογές).
Αν θέλετε να περάσετε ένα όρισμα σε μια επιλογή τότε προσθέστε το ```:``` μετά από την επιλογή, π.χ.:
```bash
#!/bin/bash
optionsList=':al:'
a_option=false
l_option=false
```
```bash
while getopts $optionsList option
do
  case $option in
      'a') a_option=true ;;
   'l') l_option=true 
        l_argument=$OPTARG ;;
   '?') echo "Illegal option -$OPTARG" >&2
  esac
done
[[ $a_option = true ]] && echo '-a option passed'
[[ $l_option = true ]] && echo "-l option passed with argument $l_argument"
```
οπότε:
```bash
$ ./options.sh -a -l bla
-a option passed
-l option passed with argument bla
```
Τέλος, τι γίνεται αν θέλετε να περάσετε και παραμέτρους στο πρόγραμμά σας, δηλ.
```bash
$ ./options.sh -al bla Hello world!
```
Εύκολο θα πείτε! Ας προσθέσουμε τις παρακάτω γραμμές στο τέλος του προγράμματος, όπως μάθαμε.
```bash
for param in "$@"
do
  echo Param $param received
done
```
Αν εκτελέσουμε όμως το πρόγραμμα θα πάρουμε:
```bash
$ ./options.sh -al bla Hello world!
-a option passed
-l option passed with argument bla
Param -al received
Param bla received
Param Hello received
Param world! received
```
Χμ! Η μεταβλητή ```$@``` δεν μπορεί να ξεχωρίσει ποιες είναι επιλογές (options) και ποιες παράμετροι. Θα πρέπει κάπως να 'διαγράψουμε' τις επιλογές αφού τις επεξεργαστούμε ώστε να μπορέσουμε να επεξεργαστούμε τις παραμέτρους.
Η μεταβλητή ```OPTIND``` είναι ένας αύξων δείκτης της επόμενης επιλογής/παραμέτρου που επεξεργάζεται από την ```getopts```. Η παρακάτω εντολή διαγράφει τις επιλογές από τις παραμέτρους, επιτρέποντάς μας να επεξεργαστούμε μόνο τις παραμέτρους:
```bash
shift $(( OPTIND – 1 ))
for param in "$@"
do
  echo Param $param received
done
```
οπότε η έξοδος είναι σωστή:
```bash
$ ./options.sh -al bla Hello world!
-a option passed
-l option passed with argument bla
Param Hello received
Param world! received
```
Ο ακόλουθος πίνακας είναι μια περίληψη της εντολής ```getopts```:

| Εντολή | Επεξήγηση |
| ```getopts ```| Εντολή επεξεργασίας επιλογών |
| ```optionsList``` | Λίστα με έγκυρες επιλογές |
| ```optionVar``` | Τρέχουσα επιλογή |
| ```$OPTARG ```| Όρισμα τρέχουσας επιλογής |
| ```$OPTIND ```| Δείκτης τρέχουσας επιλογής/παραμέτρου |
| ```: (πριν)``` | Δεν εμφανίζει το εξ' ορισμού μήνυμα λάθους |
| ```: (μετά)``` | Δηλώνει ότι ακολουθεί όρισμα μετά την επιλογή που αποθηκεύεται στην ```$OPTARG``` |

## Μορφοποιημένη εκτύπωση
Το bash υποστηρίζει και την ```printf``` από τη C.
```bash
printf format args
```
όπου ```format``` είναι χαρακτήρες μορφοποίησης:
```bash
%[flagsWidth.precision]Conversion
```
όπου:

| Σημαία | Επεξήγηση |
| ```+``` | Προσθήκη προσήμου στους αριθμούς (+, -) |
| ```-``` | Αριστερή στοίχιση |

```width```: ελάχιστος αριθμός χαρακτήρων που θα εμφανιστούν· αγνοείται αν ο αριθμός χαρακτήρων είναι μεγαλύτερος
```precision```: αριθμός δεκαδικών ψηφίων για πραγματικούς αριθμούς / μέγιστος αριθμός χαρακτήρων για αλφαριθμητικά. 

```Conversion```: καθορίζει πως θα εμφανιστεί το όρισμα

| Μετατροπέας | Επεξήγηση |
| ```c``` | Χαρακτήρας |
| ```f``` | Πραγματικός αριθμός |
| ```d``` | Προσημασμένος ακέραιος |
| ```s``` | Αλφαριθμητικό |
| ```E/e``` | Επιστημονική γραφή |

Π.χ.
```bash
$ printf 'Hello world!\n'
Hello world!
$ pi=3.14159265358979
$ printf 'pi = %6.2f\n' $pi
pi =   3.14
```
Ο ελάχιστος αριθμός χαρακτήρων (```width```) στο δεύτερο παράδειγμα είναι 6. Το ```3.14``` έχει όμως 4 χαρακτήρες, επομένως προσθέτονται και δυο κενά στην αρχή του.

## Ασκήσεις
Αν θέλετε να εντρυφίσετε περισσότερο, ορίστε και μερικές ασκήσεις:
1. Γράψτε ένα πρόγραμμα συνόδου που ν' αντιστρέφει δοσμένες από το χρήστη συμβολοσειρές και να υπολογίζει τα μήκη τους.
2. Να γραφεί πρόγραμμα συνόδου που να υπολογίζει το μέγιστο συνολικό χώρο που καταλαμβάνουν τα περιεχόμενα δοσμένων από το χρήστη καταλόγων.
3. Να γραφεί πρόγραμμα συνόδου που να τυπώνει όλα τα αρχεία που βρίσκονται μέσα σ' ένα δοθέντα κατάλογο.
4. Να γραφεί πρόγραμμα συνόδου που να μετράει τα αρχεία σ' έναν κατάλογο δοσμένο απ' το χρήστη.
5. Να γραφεί πρόγραμμα συνόδου που να ψάχνει συγκεκριμένη συμβολοσειρά μέσα στα αρχεία ενός δοθέντος καταλόγου. Η έξοδος του προγράμματος να είναι το όνομα του αρχείου και οι γραμμές που περιέχουν τη συμβολοσειρά.

## Επίλογος
Σ' αυτό το άρθρο μιλήσαμε για τα διάφορα κελύφη και επικεντρωθήκαμε στο bash, το εξ' ορισμού κέλυφος του Ubuntu. Μιλήσαμε για τις μεταβλητές συστήματος και επικεντρωθήκαμε στις εντολές ελέγχου και βρόγχου. Στη συνέχεια μιλήσαμε για συναρτήσεις, είσοδο/έξοδο και διεργασίες ελπίζοντας να 'χουμε καλύψει το μεγαλύτερο μέρος των εντολών κελύφους με χρήσιμα παραδείγματα. Π.χ. αν καταλάβατε τη διαφορά μεταξύ των:
```bash
$ echo $date
$ echo $(date)
$ echo $((date))
```
τότε ο χρόνος σας δεν πήγε και τόσο χαμένος! Happy scripting! :)

## Πηγές:
1. [Ken Thompson](http://en.wikipedia.org/wiki/Ken_Thompson) 
2. [Shell computing](http://en.wikipedia.org/wiki/Shell_\(computing\)) 
3. [Bourne shell](http://en.wikipedia.org/wiki/Bourne_shell) 
4. [C shell](http://en.wikipedia.org/wiki/C_shell) 
5. [Bash](http://en.wikipedia.org/wiki/Bash_(Unix_shell)) 
6. Cooper M. (2005), [Advanced Bash-Scripting Guide](http://tldp.org/LDP/abs/html/) 
7. Sober M. (2005), _A Practical Guide to Linux® Commands, Editors, and Shell Programming_, Prentice Hall.
8. Matthew N. & Stones R. (2007), _Beginning Linux Programming_, 4th Edition, Wiley.
9. Natarajan R. (2009), [Linux 101 Hacks](http://www.thegeekstuff.com/2009/02/linux-101-hacks-download-free-ebook/)
10. Σημειώσεις μαθήματος “Προγραμματισμός Συστήματος” τμήματος Πληροφορικής πανεπιστημίου Αθηνών, 93-94.

---