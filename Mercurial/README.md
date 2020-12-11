# Εισαγωγή στο Mercurial
Από τις αρχές της ιστορίας του προγραμματισμού κρίθηκε αναγκαία η ύπαρξη εκδόσεων των πηγαίων αρχείων. Ο έλεγχος των διαφόρων εκδόσεων γινόταν αρχικά από τον ίδιο τον προγραμματιστή. Γρήγορα έγινε φανερό ότι ακόμα και ο έλεγχος των εκδόσεων ενός μόνο αρχείου υπόκειται στην πιθανότητα λάθους, και γι' αυτό το λόγο αναπτύχθηκαν εργαλεία για την αυτοματοποίηση της διαδικασίας. 

Τα πρώτα συστήματα διαχείρισης εκδόσεων μπορούσαν να διαχειριστούν έναν μόνο χρήστη. Το πρώτο τέτοιο σύστημα ήταν το _SCCS (Source Code Control System)_ στις αρχές της δεκαετίας του 1970 και το _RCS (Revision Control System)_ το 1982. Σιγά σιγά όμως εξελίχθηκαν ώστε να μπορούν να διαχειρίζονται πολλά αρχεία και πολλούς χρήστες ταυτόχρονα. Τα περισσότερα συστήματα διαχείρισης εκδόσεων (revision control systems) ακολουθούν το μοντέλο διακομιστή-πελάτη, όπου υπάρχει ένας κεντρικός διακομιστής που φιλοξενεί τις διάφορες εκδόσεις. Τα πιο γνωστά συστήματα διαχείρισης εκδόσεων ακολουθούν αυτό το μοντέλο, όπως το _CVS (Concurrent Version Control)_ και ο διάδοχός του _Subversion_, το _ClearCase_, το _Perforce_, το _Merant PVCS_ κ.ά.

Την τελευταία δεκαετία έχουν αναπτυχθεί και τα λεγόμενα κατανεμημένα συστήματα διαχείρισης εκδόσεων, όπως το _Git_, παιδί του Linux που δημιουργήθηκε για την ανάπτυξη του πυρήνα του Linux από τους ανά τον κόσμο προγραμματιστές, και το _Mercurial_. Αυτά τα συστήματα δεν περιορίζονται σ' έναν διακομιστή, ο οποίος μπορεί να εξυπηρετεί μόνο μέχρι έναν ορισμένο αριθμό από χρήστες, ενώ όταν αυτός 'κρασάρει', τότε σταματούν και οι ενημερώσεις των εκδόσεων. Αντίθετα, στα κατανεμημένα συστήματα εκδόσεων, κάθε χρήστης έχει το δικό του τοπικό αποθετήριο (repository) των εκδόσεων, κι όταν χρειαστεί να συνεργαστεί με άλλους χρήστες, τότε γίνεται συγχώνευση των αποθετηρίων τους. Με άλλα λόγια, κάθε χρήστης έχει το δικό του backup και δεν απαιτείται συνεχής σύνδεση στο δίκτυο για να γίνει commit.

Οι λόγοι χρήσης συστημάτων διαχείρισης εκδόσεων είναι πολλοί:

* Διαχειρίζονται το ιστορικό και την εξέλιξη του έργου μας. Καταγράφουν ποιος έκανε την αλλαγή, τι αλλαγή έκανε, πότε την έκανε και γιατί την έκανε.
* Βοηθάνε στη συνεργασία με άλλους (απομακρυσμένους) προγραμματιστές.
* Επιτρέπουν την παράλληλη ανάπτυξη διαφορετικών εκδόσεων του ίδιου αρχείου.
* Μας βοηθάνε να επανέλθουμε από μια λάθος εξέλιξη του έργου μας πίσω στην τελευταία έκδοση που δούλευε.

Παράλληλα, τo Mercurial προσφέρει πολλά πλεονεκτήματα συγκριτικά με άλλα συστήματα διαχείρισης εκδόσεων:

* Είναι εύκολο στην εκμάθηση.
* Είναι 'ελαφρύ', δηλ. δεν απαιτεί πολλούς πόρους.
* Είναι πιο γρήγορο και αξιόπιστο απ' τους ανταγωνιστές του.
* Τροποποιείται εύκολα, ανάλογα με τις ανάγκες μας.
* Δεν μειώνεται η απόδοσή του όσο κι αν αυξηθούν οι χρήστες ή ο όγκος των αρχείων.
* Είναι ανοικτού κώδικα και φυσικά δωρεάν.

Επίσης:

* Το Mercurial υπερτερεί σε σχέση με το Subversion σε θέματα απόδοσης, αλλά και στο θέμα της συγχώνευσης, στο οποίο το Subversion υστερεί.
* Είναι πολύ πιο απλό απ' το πολύπλοκο Git και δεν χρειάζεται συντήρηση.
* Φυσικά υπερτερεί και σε σχέση με το προβληματικό CVS (όσοι το έχετε χρησιμοποιήσει καταλαβαίνετε τον χαρακτηρισμό 'προβληματικό'), τόσο σε επιδόσεις όσο και σε αξιοπιστία.

Αν λοιπόν χρειάζεστε ένα αξιόπιστο σύστημα διαχείρισης εκδόσεων, ή δεν είστε ευχαριστημένοι απ' αυτό που χρησιμοποιείτε, τότε θα πρέπει να δοκιμάσετε το Mercurial. Γι' αυτό, διαβάστε παρακάτω.

## Εγκατάσταση
Η εγκατάσταση του Mercurial στο Ubuntu ακολουθεί την πεπατημένη:
```bash
$ sudo apt-get install mercurial
```   
## Βασικές εντολές
Η εντολή είναι ```hg```, όπως ονομάζεται το χημικό στοιχείο “υδράργυρος” στον περιοδικό πίνακα. Ας δούμε τι μπορούμε να κάνουμε με το Mercurial:
```bash
$ hg version
Mercurial Distributed SCM (version 1.4.3) 

Copyright (C) 2005-2010 Matt Mackall <mpm@selenic.com> and others 
This is free software; see the source for copying conditions. There is NO 
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```
Οι παρακάτω εντολές παρέχουν λεπτομερή βοήθεια για τις εντολές του Mercurial:
```bash
$ hg help
$ hg help <εντολή>
$ hg -v help
$ man hg
$ man hgignore
$ man hgrc
```
Επίσης, μπορείτε να βρείτε διάφορα παραδείγματα για εργαλεία κλπ. στο φάκελο: ```/usr/share/doc/mercurial-common/examples/```.

To Mercurial δουλεύει με αποθετήρια (repositories). Αν γνωρίζετε ήδη κάποιο αποθετήριο Mercurial στο οποίο θέλετε να δουλέψετε (π.χ. κάποιο έργο ανοικτού κώδικα), τότε μπορείτε να δημιουργήσετε ένα αντίγραφό του στο δίσκο σας με την εντολή:
```bash
$ hg clone <URL of Mercurial repository>
```
η οποία, όπως λέει και τ' όνομά της, δημιουργεί έναν τοπικό κλώνο (αντίγραφο) του απομακρυσμένου αποθετηρίου.
Π.χ. ας κλωνοποιήσουμε το repository http://hg.serpentine.com/tutorial/hello
```bash
$ hg clone http://hg.serpentine.com/tutorial/hello
destination directory: hello
requesting all changes
adding changesets
adding manifests
adding file changes
added 5 changesets with 5 changes to 2 files
updating working directory
2 files updated, 0 files merged, 0 files removed, 0 files unresolved
```
Όπως βλέπετε, η εντολή δημιούργησε τον φάκελο ```hello``` μέσα στον φάκελο από όπου την καλέσατε. Αν π.χ. καλέσατε την εντολή ενώ βρισκόσασταν στο φάκελο ```Documents```, δημιουργήθηκε ο φάκελος ```Documents/hello``` μέσα στον οποίο εμφανίστηκαν δυο αρχεία.
```bash
$ ls hello
Makefile hello.c
```
Παρατηρήστε όμως ότι έχει δημιουργηθεί κι ένας κρυφός φάκελος, ο ```.hg```, ο οποίος είναι το αποθετήριό σας αυτό καθ' αυτό. Εκεί μέσα αποθηκεύονται όλες οι αλλαγές που συντελούνται στα αρχεία σας.
```bash
$ hg history          // ή hg log
changeset:   4:2278160e78d4 
tag:         tip 
user:        Bryan O'Sullivan <bos@serpentine.com> 
date:        Sat Aug 16 22:16:53 2008 +0200 
summary:     Trim comments. 

changeset:   3:0272e0d5a517 
user:        Bryan O'Sullivan <bos@serpentine.com> 
date:        Sat Aug 16 22:08:02 2008 +0200 
summary:     Get make to generate the final binary from a .o file. 

changeset:   2:fef857204a0c 
user:        Bryan O'Sullivan <bos@serpentine.com> 
date:        Sat Aug 16 22:05:04 2008 +0200 
summary:     Introduce a typo into hello.c. 

changeset:   1:82e55d328c8c 
user:        mpm@selenic.com 
date:        Fri Aug 26 01:21:28 2005 -0700 
summary:     Create a makefile 

changeset:   0:0a04b987be5a 
user:        mpm@selenic.com 
date:        Fri Aug 26 01:20:50 2005 -0700 
summary:     Create a standard "hello, world" program 
```
Να έχετε υπόψιν σας ότι ο ακέραιος πριν το ```:``` στο _changeset_ ή _σύνολο αλλαγών_ (λέγεται αριθμός έκδοσης - revision) δεν είναι μοναδικός, καθώς κάποιος άλλος προγραμματιστής μπορεί κι αυτός να 'χει δημιουργήσει την δικιά του έκδοση 4 που να διαφέρει απ' τη δική σας. Ο αριθμός όμως μετά το ```:``` είναι μοναδικός (λέγεται _αναγνωριστικό changeset_) σε όλα τα αποθετήρια του έργου. Έτσι, στο παραπάνω παράδειγμα το ```4``` είναι ο αριθμός έκδοσης, ενώ το ```2278160e78d4``` είναι το αναγνωριστικό του changeset κι είναι μοναδικό σε όλα τα αποθετήρια.
```bash
$ hg log -r 2:3
changeset:   3:0272e0d5a517 
user:        Bryan O'Sullivan <bos@serpentine.com> 
date:        Sat Aug 16 22:08:02 2008 +0200 
summary:     Get make to generate the final binary from a .o file. 

changeset:   2:fef857204a0c 
user:        Bryan O'Sullivan <bos@serpentine.com> 
date:        Sat Aug 16 22:05:04 2008 +0200 
summary:     Introduce a typo into hello.c. 
```
Παρατηρήστε ότι, όταν δώσατε hg log πιο πάνω, το πιο πρόσφατο changeset εμφανίστηκε με μια _ετικέτα (tag)_ με όνομα _tip_. 
```bash
$ hg tip     // ή hg head
changeset:   4:2278160e78d4 
tag:         tip 
user:        Bryan O'Sullivan <bos@serpentine.com> 
date:        Sat Aug 16 22:16:53 2008 +0200 
summary:     Trim comments. 
```
Το _head_ είναι ένας δείκτης στην πιο πρόσφατη υποβολή αλλαγών που κάνατε. Στο Mercurial μπορείτε όμως να δημιουργήσετε _κλάδους (branches)_, και καθένας από αυτούς θα 'χει το δικό του head. Το head με τον μεγαλύτερο αριθμό έκδοσης λέγεται _tip_. Στο παράδειγμά μας δεν έχουμε δημιουργήσει ακόμα κλάδους, οπότε head = tip. Και φυσικά με την εντολή:
```bash
$ hg tag release1
```
μπορείτε να δώσετε μια ετικέτα στην τελευταία αλλαγή που κάνατε.

Μπορείτε φυσικά να κρατήσετε ανέπαφο το αρχικό repository και να δουλέψετε μ' ένα αντίγραφό του.
```bash
$ hg clone hello hello-orig
```
Αν κάνατε κάποια αλλαγή, τότε:
```bash
$ hg status
M hello.c
$ hg diff
diff -r 2278160e78d4 hello.c
```
## Υποβολή των αλλαγών
Προτού όμως μπορέσουμε να υποβάλλουμε τις αλλαγές μας πίσω στο αποθετήριο, σ' ένα νέο changeset, θα πρέπει το Mercurial να γνωρίζει το email μας και ένα όνομα χρήστη. Το πιο εύκολο είναι να δημιουργήσουμε το αρχείο ```~/.hgrc``` με τα εξής περιεχόμενα:
```bash
[ui]
username = hawk <nobody@nowhere.gr>
[email]
from = hawk <nobody@nowhere.gr>
```
όπου φυσικά στη θέση του ```hawk``` δίνετε το δικό σας όνομα χρήστη και email.

Στη συνέχεια, υποβάλετε τις αλλαγές σας με την εντολή:
```bash
$ hg commit
This is where I type my commit comment.
HG: Enter commit message. Lines beginning with 'HG:' are removed.
HG: --
HG: user: hawk <nobody@nowhere.gr>
HG: branch 'default'
HG: changed hello.c
```
## Ενημέρωση αποθετηρίου
Προτού ενημερώσετε το αποθετήριό σας με τις αλλαγές που έχουν γίνει στο μεταξύ στο αρχικό αποθετήριο, από το οποίο δημιουργήσατε το αντίγραφό σας, (ή από κάποιο άλλο αποθετήριο), χρησιμοποιήστε την εντολή:
```bash
$ hg incoming <repository>
```
για να δείτε τι αλλαγές έχουν συμβεί, όπου ```<repository>``` μπορεί να είναι π.χ. http://hg.serpentine.com/tutorial/hello. 

Αν δεν βλέπετε κάποιο πρόβλημα, τότε:
```bash
$ hg pull <repository>
```
για να ενημερώσετε τον αποθετήριό σας με τις αλλαγές που έχουν γίνει στο απομακρυσμένο αποθετήριο. Το Mercurial όμως ξεχωρίζει την ενημέρωση του αποθετηρίου από την ενημέρωση του καταλόγου με τ' αρχεία σας αυτού καθ' αυτού. Αν θέλετε να ενημερώσετε τα αρχεία σας, τότε θα πρέπει να δώσετε μια ακόμα εντολή:
```bash
$ hg update
```
Για να δείτε αν όντως ενημερώθηκε ο κατάλογος με τα αρχεία σας:
```bash
$ hg parents
changeset: 5:12efb75cbece
tag: tip
user: hawk <nobody@nowhere.gr>
date: Tue June 29 06:44:49 2010 +0300
summary: Added an extra line of output
```
Ο λόγος που υπάρχει και η ```pull``` και η ```update``` είναι ότι αν για κάποιο λόγο δεν είστε ευχαριστημένοι με τις αλλαγές, μπορείτε πάντα να γυρίσετε σε μια προηγούμενη έκδοση, π.χ.:
```bash
$ hg update 3
```
Πάντως, μπορείτε να συγχωνεύσετε τα δυο αυτά βήματα με την εντολή:
```bash
$ hg pull -u
```
Αντίστοιχα με τις ```incoming``` και ```pull```, υπάρχουν και οι ```outgoing``` και ```push```, αν θέλουμε να στείλουμε τις αλλαγές μας σε κάποιο άλλο αποθετήριο.
```bash
$ hg outgoing <repository>
$ hg push <repository>
```
Άλλες χρήσιμες εντολές:
```bash
$ hg addremove // προσθέτει όλα τα νέα αρχεία και διαγράφει όλα όσα λείπουν
$ hg copy // σημειώνει τα αρχεία ως αντιγραμμένα, για το επόμενο commit
$ hg rename // σημειώνει τα αρχεία ως μετονομασθέντα, για το επόμενο commit
$ hg forget, hg remove // ξεχνά ή διαγράφει τα συγκεκριμένα αρχεία
$ hg revert   // επαναφέρει αρχεία/καταλόγους σε μια προηγούμενη κατάσταση,
              // αν δεν είχε προηγηθεί commit
$ hg backout // επαναφέρει σε προηγούμενο changeset, αν είχε γίνει commit
```

## Δημιουργία αποθετηρίου
Αν θέλετε να δημιουργήσετε ένα νέο αποθετήριο στον τρέχοντα κατάλογο:
```bash
$ hg init myproject
```
Στη συνέχεια, μπορείτε να αντιγράψετε ή να δημιουργήσετε κάποια αρχεία στο νέο αποθετήριο, και να ενημερώσετε το Mercurial για τις ενέργειές σας, δίνοντας:
```bash
$ cd myproject
$ hg add
$ hg status
A goodbye.c
A hello.c
$ hg commit -m 'Initial commit'
```

## Συγχώνευση
Μέχρις εδώ όλα καλά. Τι γίνεται όμως άμα τόσο εσείς όσο κι ένας συνάδελφος αλλάξατε το ίδιο αρχείο; Ας υποθέσουμε ότι εκτελούμε την εντολή:
```bash
$ hg pull <another-repository>
pulling from <another-repository>
searching for changes
adding changesets
adding manifests
adding file changes
added 1 changesets with 1 changes to 1 files (+1 heads)
(run 'hg heads' to see heads, 'hg merge' to merge)
```
Η τελευταία αλλαγή που κάναμε λέγεται _κεφαλή (head)_. Αν όμως κάποιος άλλος έκανε κι αυτός μια αλλαγή στο δικό του αποθετήριο, την οποία τραβήξαμε, όπως με την παραπάνω εντολή στο δικό μας, είναι κι αυτή μια άλλη κεφαλή. 
```bash
$ hg heads
changeset: 6:12efb75cbece
tag: tip
parent: 4:2278160e78d4
user: hawk <nobody@nowhere.gr>
date: Tue June 29 06:44:49 2010 +0300
summary: Added an extra line of output

changeset: 5:cbfc9ee6ea99
user: hawk <nobody@nowhere.gr>
date: Tue June 29 06:44:52 2010 +0300
summary: A new hello for a new day.
$ hg update
abort: crosses branches (use 'hg merge' or 'hg update -C')
$ hg merge
merging hello.c
0 files updated, 1 files merged, 0 files removed, 0 files unresolved
(branch merge, don't forget to commit)
$ hg parents
changeset: 5:cbfc9ee6ea99
user: hawk <nobody@nowhere.gr>
date: Tue June 29 06:44:52 2010 +0300
summary: Bug fix.

changeset: 6:12efb75cbece
tag: tip
parent: 4:2278160e78d4
user: hawk <nobody@nowhere.gr>
date: Tue June 29 06:44:49 2010 +0300
summary: Added an extra line of output
$ hg commit -m 'Merged changes'
$ hg tip
changeset: 7:41ec93b29030
tag: tip
parent: 5:cbfc9ee6ea99
parent: 6:12efb75cbece
user: hawk <nobody@nowhere.gr>
date: Tue June 29 06:44:52 2010 +0300
summary: Merged changes
```
Στο παραπάνω παράδειγμα δεν υπήρξαν συγκρούσεις (conflicts), δηλ. δεν αλλάχθηκαν ίδιες γραμμές κώδικα. Τι γίνεται όμως στην περίπτωση που δυο προγραμματιστές αλλάξουν τις ίδιες γραμμές κώδικα; Στην περίπτωση αυτή, το Mercurial σηκώνει τα χέρια ψηλά, τρέχει ένα κατάλληλο πρόγραμμα συγχώνευσης (το οποίο ορίζετε στη μεταβλητή συστήματος ```HGMERGE```), και σας ζητάει να κάνετε εσείς τη συγχώνευση. Υπάρχουν πολλά εργαλεία συγχώνευσης στο Ubuntu, όπως τα ```merge, diff, kdiff3, meld, gvimdiff, vimdiff```. 

Μόλις κάνετε τις συγχωνεύσεις, δίνετε:
```bash
$ hg resolve -m hello.c
$ hg commit -m 'Conflicts merged'
$ hg tip
changeset: 8:cef275730d6e
tag: tip
parent: 7:4a31891298cb
parent: 6:44d8436f9b83
user: hawk <nobody@nowhere.gr>
date: Tue June 29 06:44:53 2010 +0300
summary: Conflicts merged
```
Το Mercurial συγχωνεύει τις τρεις παραπάνω εντολές:
```bash
hg pull -u
hg merge
hg commit -m 'Merged remote changes'
σε μία
hg fetch
```
φτάνει να προσθέσετε στο αρχείο ```~/.hgrc``` τις παρακάτω γραμμές:
```bash
[extensions]
fetch =
```
## Εύρεση λαθών
Αργά ή γρήγορα, λάθη θα βρουν το δρόμο τους για να χαλάσουν τον κώδικά σας. Το Mercurial έχει 2 τρόπους για να ξετρυπώνει τα λάθη:
```bash
$ hg annotate hello.c
```
Εμφανίζει το 'βλαβερό' αρχείο, προσθέτοντας τον αριθμό έκδοσης μπροστά από κάθε γραμμή. Υπάρχει όμως και η ```bisect```. 
```bash
$ hg bisect -b tip       // σημείωσε το tip ως 'κακό'
$ hg bisect -g release1  // έστω ότι η release1 δούλευε σωστά
Testing changeset 7:912c42b59126 (3 changesets remaining, ~1 tests)
1 files updated, 0 files merged, 0 files removed, 0 files unresolved
$ make			   // δοκιμάστε αν χτίζεται
```
Σημειώστε το ως 'καλό' με την ```hg bisect -g```, ή ως 'κακό' με την ```hg bisect -b```. Επαναλάβετε τη διαδικασία μέχρις ότου βρείτε ποιο commit έκανε τη ζημιά. Μπορείτε επίσης να αυτοματοποιήσετε τη διαδικασία δίνοντας:
```bash
$ hg bisect -c make
Changeset 7:912c42b59126: bad
The first bad revision is:
changeset:   7:912c42b59126
user:        hawk <nobody@nowhere.gr>
date:        Sat Sep 18 19:50:50 2010 +0200
summary:     Added tag release1 for changeset 4c69a3c69d2c
```

## TortoiseHG
Αν σας ενοχλεί η γραμμή εντολών, μην ανησυχείτε. Από το Ubuntu Software Center μπορείτε να εγκαταστήσετε τα ```tortoisehg``` και ```tortoisehg-nautilus```. Όταν τα εγκαταστήσετε, επανεκινήστε το Ubuntu. Το TortoiseHG ενσωματώνεται στο μενού που εμφανίζεται με δεξί κλικ στον Nautilus και εμφανίζει πολλές από τις παραπάνω εντολές με γραφικό τρόπο. Παράλληλα, χρησιμοποιείται και από τη γραμμή εντολών:
```bash
$ hgtk
```
## Επίλογος
Συμπερασματικά, το Mercurial διακρίνεται για την αμεσότητα και την ευκολία χρήσης και υπερτερεί σε σχέση με άλλα συστήματα διαχείρισης εκδόσεων τόσο σε απόδοση όσο και σε επεκτασιμότητα. Δεν χρειάζεται συντήρηση, ούτε διαχειριστή, και δουλεύει καλά με κάθε είδους προγραμματιστές και κάθε είδους έργα. 

Ίσως σε κάποιο επόμενο τεύχος να δώσουμε κάποιες οδηγίες για το πώς μπορείτε να δημοσιεύσετε ένα repository σε κάποιον web server όπως ο ```lighttpd``` ή ο Apache, ώστε να είναι διαθέσιμο στον παγκόσμιο ιστό. Ως τότε, σας ευχόμαστε καλή διαχείριση των εκδόσεων των αρχείων σας με το Mercurial. :)

## Πηγές
1. O’Sullivan B. (2009), _Mercurial: The Definitive Guide_, O' Reilly.
2. Mercurial wiki, http://mercurial.selenic.com/wiki/