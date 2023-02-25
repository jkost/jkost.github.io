# 1.4 Εγκατάσταση της γλώσσας  Java {#Java} 
© Γιάννης Κωστάρας

---

[<-](../1.3-JavaHistory/README.md) | [∆](../../README.md) | [->](../1.5-JavaBasics/README.md)

---
[![](../../../assets/Jupyter_logo.svg)](1.4-Installation.ipynb)

### Μαθησιακοί στόχοι
Σε αυτήν την ενότητα θα μάθουμε:

* τα online περιβάλλοντα ανάπτυξης για Java
* τα διάφορα JDKs (Java Development Kits) που υπάρχουν
* πώς να εγκαταστήσουμε το JDK στα Windows, MacOSX και Linux
* πώς να εγκαταστήσουμε τα Ολοκληρωμένα Περιβάλλοντα Εργασίας (Integrated Development Environments) Apache NetBeans, MS Visual Studio Code και BlueJ
* το JShell το οποίο θα χρησιμοποιήσουμε στα μαθήματα αυτής και της επόμενης εβδομάδας

## Εισαγωγή

Είναι πολύ σημαντικό να πληκτρολογήσετε οι ίδιοι τα προγράμματα που θα δείξουμε σε αυτό το μάθημα κι όχι απλά να τα διαβάζετε. Πληκτρολογώντας οι ίδιοι μαθαίνετε, κάνετε λάθη τα οποία πρέπει να επιλύσετε, κι αυτή είναι άλλωστε όλη η διαδικασία προγραμματισμού, η επίλυση λαθών. 

Για να παρακολουθήσετε αυτό το μάθημα καλό είναι να εγκαταστήσετε το περιβάλλον ανάπτυξης της Java στον Η/Υ σας. Αν παρόλ' αυτά δεν θέλετε ή δεν μπορείτε, επειδή π.χ. ο Η/Υ είναι παλιός είτε προσπαθήσατε αλλά δεν μπορέσατε να εγκαταστήσετε τα προγράμματα που περιγράφονται παρακάτω, τότε μπορείτε να χρησιμοποιήσετε αντίστοιχα προγράμματα online που μπορείτε να τα προσπελάσετε με τον πλοηγό σας (browser). 

Όπως είδαμε, η Java αποτελείται από μια Εικονική Μηχανή που επιτρέπει την εκτέλεση των εφαρμογών Java σε οποιαδήποτε πλατφόρμα (Windows, Mac, Linux, Unix). Για να εκτελέσετε μια εφαρμογή Java χρειάζεστε το _Java Runtime Environment (JRE)_. Για να αναπτύξετε όμως μια εφαρμογή Java χρειάζεστε το _Java Development Kit (JDK)_ το οποίο περιλαμβάνει το JRE.

Τούτη και την επόμενη εβδομάδα θα χρησιμοποιήσουμε ένα υποπρόγραμμα του προγράμματος ανάπτυξης Java (JDK) που ονομάζεται **JShell**. Αυτό μπορείτε να το βρείτε online σε έναν από τους παρακάτω ιστοτόπους:

* [OneCompiler JShell](https://onecompiler.com/jshell)
* [TryJShell](https://tryjshell.org/)

ενώ οδηγίες χρήσης μπορείτε να βρείτε [εδώ](https://dev.java/learn/jshell-tool/) αλλά και παρακάτω σε αυτήν την ενότητα.

Ενώ με το JShell μπορείτε να μάθετε τα βασικά της γλώσσας Java ή να δοκιμάσετε εύκολα και γρήγορα εντολές, δεν μπορείτε να γράψετε χρήσιμα προγράμματα που να μπορούν να τα χρησιμοποιήσουν άλλοι. Αν και μπορείτε να γράψετε ολόκληρες εφαρμογές Java με τη χρήση ενός απλού επεξεργαστή κειμένου όπως το Notepad ή το vi, τα Ολοκληρωμένα Περιβάλλοντα Εργασίας (ΟΠΕ) σας παρέχουν πολλά καλούδια που σας βοηθούν στην ανάπτυξη των εφαρμογών σας γρηγορότερα, όπως αυτόματη συμπλήρωση κώδικα, online βοήθεια κλπ. Από την τρίτη εβδομάδα και μετά θα χρειαστεί να χρησιμοποιήσετε κάποιο ΟΠΕ.

Αν δεν επιθυμείτε να εγκαταστήσετε κάποιο πρόγραμμα στον Η/Υ σας, μπορείτε να χρησιμοποιήσετε κάποιο από τα παρακάτω online:
* [Browxy                    ](http://www.browxy.com/)
* [Codecademy                ](https://www.codecademy.com/learn/learn-java)
* [CodeChef                  ](https://www.codechef.com/ide)
* [CodePad                   ](https://codepad.remoteinterview.io/)
* [Codiva                    ](https://www.codiva.io/)
* [CompileJava               ](https://www.compilejava.net/)
* [Guru99                    ](https://www.guru99.com/try-java-editor.html)
* [Ideone                    ](https://ideone.com/)
* [JDoodle                   ](https://www.jdoodle.com/online-java-compiler)
* [Learn Java Online         ](http://www.learnjavaonline.org/)
* [Paiza.io                  ](https://paiza.io/en/projects/new?language=java)
* [Repl.it                   ](https://repl.it/languages/java10)
* [Rextester                 ](http://rextester.com/l/java_online_compiler)
* [Online Java Debugger      ](https://www.onlinegdb.com/online_java_debugger)
* [Trinket                   ](https://trinket.io/java)
* [Tutorialspoint            ](https://www.tutorialspoint.com/compile_java_online.php)
* [Visualizer                ](http://www.pythontutor.com/visualize.html#mode=edit)

Δοκιμάστε τα και διαλέξτε όποιο σας αρέσει. Για εκσφαλμάτωση προγραμμάτων θα χρειαστείτε κάποια στιγμή τον [Online Java Debugger](https://www.onlinegdb.com/online_java_debugger) ενώ πολύ χρήσιμος θα φανεί και ο [Visualizer](http://www.pythontutor.com/visualize.html#mode=edit) (διαλέξτε ```Java 8``` από το πτυσσόμενο μενού).

Αν αποφασίσετε να εγκαταστήσετε το περιβάλλον ανάπτυξης JDK τότε ακολουθήστε τις οδηγίες που ακολουθούν.

## Εγκατάσταση της Java

Θα χρειαστεί να εγκαταστήσετε την έκδοση 17 ή νεώτερη της Java SE ή Standard Edition για το Λ.Σ. σας (Windows, Linux, MacOSX). Από την έκδοση 11 και μετά, έχει αλλάξει η άδεια χρήσης. Για επαγγελματική χρήση ενδέχεται να υπάρχουν χρεώσεις για το Oracle JDK (διαβάστε προσεκτικά την άδεια χρήσης) η οποία όμως άλλαξε ξανά στην έκδοση 17 και δεν υπάρχουν πλέον χρεώσεις. Υπάρχει και η δωρεάν ανοικτού κώδικα έκδοση OpenJDK (άδεια χρήσης: GNU General Public License v2 with Classpath Exception (GPLv2+CPE)). Τέλος, η Azul διαθέτει προγράμματα εγκατάστασης του OpenJDK για τις διάφορες πλατφορμες. Όλες οι εγκαταστάσεις δουλεύουν ακριβώς το ίδιο εκτός από ελάχιστες διαφορές. 

### Εγκατάσταση του Microsoft OpenJDK
Ειδικά για Windows, η Microsoft έχει πακετάρει το OpenJDK της Oracle ειδικά για Windows. Μπορείτε να το κατεβάσετε από [εδώ](https://docs.microsoft.com/en-us/java/openjdk/download). Ακολουθήστε τα βήματα που περιγράφονται [εδώ](https://kassapoglou.github.io/java/java-unit1-jdk-installation.html) για να το εγκαταστήσετε. Είναι ο πιο εύκολος τρόπος εγκατάστασης του JDK για Windows και δεν χρειάζεται να σετάρετε το ```PATH``` καθώς το πρόγραμμα εγκατάστασης το κάνει για σας.

### Εγκατάσταση του OpenJDK
Αν δεν θέλετε να εγκαταστήσετε το MS OpenJDK, πλοηγηθείτε στο [jdk.java.net](http://jdk.java.net/) και κατεβάστε την τελευταία έκδοση για την πλατφόρμα σας. Αποσυμπιέστε το και ακολουθείστε τα βήματα που περιγράφονται παρακάτω για να το εισάγετε στο ```PATH```. Καλό είναι να το εγκαταστήσετε σε μια διαδρομή (path) χωρίς κενά, π.χ. ```C:\Programs``` ή ```C:\java```. 

### Εγκατάσταση του Oracle JDK στα Windows
1. Πλοηγηθείτε στον ιστοχώρο της [Oracle](http://www.oracle.com/technetwork/java/javase/downloads/index.html) και κατεβάστε την έκδοση 17 του JDK (ή νεώτερη). Αποδεχθείτε την άδεια χρήσης (License Agreement) και κατεβάστε το για την πλατφόρμα σας (```jdk-XX.X.X_windows-x64_bin.exe```. **Σημείωση.** _Η έκδοση της Java που κατεβάσατε είναι 64 bit και 'τρέχει' σε 64-bit Windows. Αν τρέχετε παλιά έκδοση των Windows η οποία μπορεί να εκτελέσει μόνο 32 bit προγράμματα, τότε θα πρέπει να κατεβάσετε την τελευταία έκδοση x86 του JDK 8 (```jdk-8uXXX-windows-i586.exe```). Κάποια από τα προγράμματα που θα μάθουμε σε αυτά τα μαθήματα δεν θα τρέχουν με το JDK 8._ 
1. Κάντε διπλό κλικ πάνω στο αρχείο αυτό και ακολουθήστε τα βήματα του οδηγού. Καλό είναι να το εγκαταστήσετε σε μια διαδρομή (path) χωρίς κενά, π.χ. ```C:\Programs\Java``` αντί για την προτεινόμενη διαδρομή ```C:\Program Files\Java```. Ο οδηγός θα σας ζητήσει στη συνέχεια να εγκαταστήσετε και το JRE. Επιλέξτε ```C:\Programs\Java\jdkXX.X.X\jre```.
1. Προσθέστε την εγκατάσταση στη μεταβλητή περιβάλλοντος ```PATH``` ως εξής:

_Για Windows πριν τα 10_:

   1. Δεξί κλικ στο εικονίδιο Computer ⇒ Properties
   2. **System Properties**
   3. Καρτέλα "Advanced" ⇒  Environment Variables
   4. "System Variables", 
   5. Επιλέξτε **New** και εισάγετε τη νέα μεταβλητή περιβάλλοντος ```JAVA_HOME``` δίνοντάς της την τιμή ```C:\Programs\Java\jdkXX.X.X```, όπου ```XX.X.X``` η έκδοση που κατεβάσατε π.χ. ```17.0.2```
   6. Επιλέξτε **"PATH" ⇒  Edit** και προσθέστε ```%JAVA_HOME%\bin;``` μπροστά από οποιαδήποτε άλλη τιμή της μεταβλητής αυτής
   7. Πατήστε **ΟΚ** σε όλα τ' ανοικτά παράθυρα

![](assets/Fig1.png)

**Εικόνα 1.4.1** _Ορισμός μεταβλητών περιβάλλοντος στα Windows πριν τα 10_

_Για Windows 10 και μετά_:

1. Ανοίξτε το παράθυρο **View advanced system settings** του Control Panel (βλ. Εικόνα 1.4.2)
2. Επιλέξτε την καρτέλα **Advanced** και κλικ στο κουμπί **Environment Variables**
3. Επιλέξτε **New** και εισάγετε τη νέα μεταβλητή περιβάλλοντος ```JAVA_HOME``` δίνοντάς της την τιμή ```C:\Programs\Java\jdkXX.X.X```, όπου ```XX.X.X``` η έκδοση που κατεβάσατε π.χ. ```17.0.2```
4. Επιλέξτε **"PATH" ⇒  Edit** και προσθέστε ```%JAVA_HOME%\bin;``` μπροστά από οποιαδήποτε άλλη τιμή της μεταβλητής αυτής
5. Πατήστε **ΟΚ** σε όλα τ' ανοικτά παράθυρα

![](assets/Fig2-1.jpg)
![](assets/Fig2-2.jpg)
![](assets/Fig2-3.png)
**Εικόνα 1.4.2** _Ορισμός μεταβλητών περιβάλλοντος στα Windows 10 και μετά_

### Εγκατάσταση του Oracle JDK στο MacOS
1. Πλοηγηθείτε στον ιστοχώρο της [Oracle](http://www.oracle.com/technetwork/java/javase/downloads/index.html) και κατεβάστε την έκδοση 17 του JDK (ή νεώτερη). Αποδεχθείτε την άδεια χρήσης (License Agreement) και κατεβάστε το για την πλατφόρμα σας (```jdk-XX.X.X_osx-x64_bin.dmg```), όπου ```XX.X.X``` η έκδοση που κατεβάσατε π.χ. ```17.0.2```.
1. Εγκαταστήστε το αρχείο κατά τα γνωστά.
1. Ορίστε τις ακόλουθες μεταβλητές περιβάλλοντος στο αρχείο ```.bash_profile```: ```JAVA_HOME=$HOME/Programs/Java/jdkXX.X.X``` και ```PATH=$JAVA_HOME/bin:$PATH```

Αν έχετε και άλλες εγκατεστημένες εκδόσεις της Java, τότε για να ορίσετε π.χ. την έκδοση που κατεβάσατε ως την εξ' ορισμού έκδοση στο σύστημά σας ακολουθήστε τα παρακάτω βήματα (σε ένα κέλυφος) (οι εκδόσεις στο σύστημά σας θα διαφέρουν από αυτές του παρακάτω παραδείγματος):

```bash
$ /usr/libexec/java_home -V
Matching Java Virtual Machines (8):
	17.0.2, x86_64:	"Java SE 17.0.2"	/Library/Java/JavaVirtualMachines/jdk-17.0.2.jdk/Contents/Home
    9.0.4, x86_64:	"Java SE 9.0.4"	/Library/Java/JavaVirtualMachines/jdk-9.0.4.jdk/Contents/Home
    1.8.0_181, x86_64:	"Java SE 8"	/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home
    1.7.0_80, x86_64:	"Java SE 7"	/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home
    1.6.0_65-b14-462, x86_64:	"Java SE 6"	/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
    1.6.0_65-b14-462, i386:	"Java SE 6"	/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home

/Library/Java/JavaVirtualMachines/jdk-17.0.2.jdk/Contents/Home
```
Στη συνέχεια μπορείτε να ορίσετε τη μεταβλητή περιβάλλοντος ```JAVA_HOME``` στο ```.bash_profile``` όπως είδαμε παραπάνω δίνοντάς της την τιμή ```export JAVA_HOME=`/usr/libexec/java_home -v 17.0.2` ```.

_Πηγή:_ [StackOverflow](https://stackoverflow.com/questions/21964709/how-to-set-or-change-the-default-java-jdk-version-on-os-x#24657630)

### Εγκατάσταση του Oracle JDK στο Linux
1. Πλοηγηθείτε στον ιστοχώρο της [Oracle](http://www.oracle.com/technetwork/java/javase/downloads/index.html) και κατεβάστε την έκδοση 17 του JDK (ή νεώτερη). Αποδεχθείτε την άδεια χρήσης (License Agreement) και κατεβάστε το για την πλατφόρμα σας (προτιμήστε το αρχείο ```jdk-XX.X.X_linux-x64_bin.tar.gz```), όπου ```XX.X.X``` η έκδοση που κατεβάσατε π.χ. ```17.0.2```.
1. Αποσυμπιέστε το (π.χ. από τον εξερευνητή αρχείων κάντε δεξί κλικ και επιλέξτε **Extract here**). Μετακινήστε το φάκελο ```jdkXX.X.X``` σε μια διαδρομή (path) χωρίς κενά, π.χ. ```$HOME/Programs/Java```. Συνίσταται να την εγκαταστήσετε στη διαδρομή ```/usr/lib/jvm``` δίνοντας τις εντολές: ```sudo mkdir -p /usr/lib/jvm/jdk-XX.X.X``` και ```sudo mv $HOME/Downloads/jdkXX.X.X/* /usr/lib/jvm/jdk-XX.X.X/```.
1. Ορίστε τις ακόλουθες μεταβλητές περιβάλλοντος στο αρχείο ```.bashrc```: ```JAVA_HOME=$HOME/Programs/Java/jdkXX.X.X``` ή ```JAVA_HOME=/usr/lib/jvm/jdkXX.X.X``` και ```PATH=$JAVA_HOME/bin:$PATH```

Αν έχετε και άλλες εγκατεστημένες εκδόσεις της Java, τότε για να ορίσετε την έκδοση που κατεβάσατε ως την εξ' ορισμού έκδοση στο σύστημά σας:

```bash
$ sudo update-alternatives –-config java
```
και επιλέξτε τη από το μενού που εμφανίζεται.

Εναλλακτικά μπορείτε να την εγκαταστήσετε ως την εξ' ορισμού με την εντολή (π.χ. XX.X.X εδώ είναι 17.0.2):

```bash
$ sudo update-alternatives –-install "/usr/bin/java" "java" "/usr/lib/jvm/jdk-17.0.2/bin/java" 1010
$ sudo update-alternatives –-install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk-17.0.2/bin/javac" 1010
```

### Εγκατάσταση του Azul OpenJDK
Πλοηγηθείτε στον ιστότοπο της [Azul](https://www.azul.com/downloads/?package=jdk#download-openjdk) και κατεβάστε τα προγράμματα εγκατάστασης για την πλατφόρμα σας. Εγκαταστήστε τα όπως δείξαμε και παραπάνω για το Oracle JDK. 

### Επαλήθευση εγκατάστασης
Αν όλα πήγαν καλά, τότε μπορείτε ν' ανοίξετε μια προτροπή DOS (command prompt) ή ένα κέλυφος (shell) και να δώσετε τις εντολές (η έκδοση που κατεβάσατε θα διαφέρει από τα παρακάτω παραδείγματα):

```bash 
$ java –version
java version "17" 2021-09-14 LTS
Java(TM) SE Runtime Environment (build 17+35-LTS-2724)
Java HotSpot(TM) 64-Bit Server VM (build 17+35-LTS-2724, mixed mode, sharing)
```
για το Oracle JDK, ενώ για το OpenJDK:
```bash
$ ./java -version
openjdk version "18.0.1.1" 2022-04-22
OpenJDK Runtime Environment (build 18.0.1.1+2-6)
OpenJDK 64-Bit Server VM (build 18.0.1.1+2-6, mixed mode, sharing)
```

```bash
$ jshell
|  Welcome to JShell -- Version 17
|  For an introduction type: /help intro

jshell> 2+2
$1 ==> 4

jshell> (Ctrl+D)
```

Η έκδοσή σας μπορεί να διαφέρει από την παραπάνω. 

Το ```jshell```, όπως θα δούμε, είναι ένα νέο κέλυφος Java που έρχεται μαζί με την έκδοση 9 της Java (ή νεώτερη) και μας επιτρέπει να δοκιμάζουμε εντολές κλπ. εύκολα και γρήγορα.

## Ολοκληρωμένα Περιβάλλοντα Εργασίας (Integrated Development Environments - IDEs)
Αν και μπορείτε να γράψετε ολόκληρες εφαρμογές Java με τη χρήση ενός απλού επεξεργαστή κειμένου όπως το Notepad ή το vi, τα Ολοκληρωμένα Περιβάλλοντα Εργασίας (ΟΠΕ) σας παρέχουν πολλά καλούδια που σας βοηθούν στην ανάπτυξη των εφαρμογών σας γρηγορότερα, όπως αυτόματη συμπλήρωση κώδικα, online βοήθεια κλπ.

Τα πιο δημοφιλή ΟΠΕ για Java είναι:
* [BlueJ](https://www.bluej.org/)
* [DrJava](http://www.drjava.org/)
* [Eclipse](http://www.eclipse.org/)
* [IDEA](https://www.jetbrains.com/idea/)
* [JDeveloper](http://www.oracle.com/technetwork/developer-tools/jdev/overview/index.html)
* [NetBeans](https://netbeans.apache.org/) ή [OpenBeans](https://www.openbeans.org/)
* [Visual Studio Code](https://code.visualstudio.com/download) (δείτε την αναφορά [7])

Σ' αυτή τη σειρά μαθημάτων θα χρησιμοποιήσουμε το NetBeans και το BlueJ, αλλά μπορείτε κάλλιστα να χρησιμοποιήσετε όποιο ΟΠΕ ή επεξεργαστή κειμένου προτιμάτε.

## Εγκατάσταση του Apache NetBeans

1. Από τον ιστοχώρο της [Apache](https://netbeans.apache.org/download/index.html) κατεβάστε την τελευταία έκδοση του Apache NetBeans για την πλατφόρμα σας.
1. Μπορείτε να κατεβάσετε και να αποσυμπιέστε το αρχείο ```netbeans-xx.0-bin.zip``` σε ένα φάκελο (π.χ. ```$HOME/Programs```) ή τον κατάλληλο οδηγό εγκατάστασης για την πλατφόρμα σας (Windows/MacOSX/Linux). 
1. Ελέξτε ότι το αρχείο ```<netbeans>/etc/netbeans.conf``` περιέχει γραμμή παρόμοια με την παρακάτω ανάλογα με την έκδοση JDK που εγκαταστήσατε προηγουμένως:
```bash
netbeans_jdkhome="/<path>/jdk-XX.X.X.jdk/Contents/Home/" 
```
αν χρησιμοποιείτε Mac ή
```bash
netbeans_jdkhome="/<path>/jdkXX.X.X/" 
```
αν χρησιμοποιείτε Windows/Linux/Unix.

Διαφορετικά προσθέστε την.

### Επαλήθευση εγκατάστασης
1. Ξεκινήστε το NetBeans. Ανάλογα με την πλατφόρμα σας (Windows: κάντε διπλό κλικ στο αρχείο ```netbeans.exe``` ή ```netbeans64.exe```)(Linux/MacOSX: από ένα κέλυφος πληκτρολογήστε ```./netbeans &```) από το φάκελο ```bin```.
1. Επιλέξτε το μενού **Tools --> Open Java Platform Shell**
```bash
|  System Information:
|      Java version:    17.0.2
|      Virtual Machine: Java HotSpot(TM) 64-Bit Server VM  17.0.2
|      Classpath:
|  	/<path>/netbeans/java/modules/ext/nb-mod-jshell-probe.jar
|  
[1]-> System.out.println("Καλημέρα κόσμε")
Καλημέρα κόσμε
```

Μπορείτε να προσθέσετε κι άλλες εκδόσεις JDK από το μενού ```Tools --> Java Platforms```. Πατώντας το κουμπί ```Add Platform``` μπορείτε να πλοηγηθείτε στο φάκελο που έχετε εγκαταστήσει ένα JDK.

![](assets/Fig2.png)

**Εικόνα 1.4.2** _Ορισμός πλατφορμών JDK_

## Εγκατάσταση του MS Visual Studio Code
Το NetBeans αλλά και τα άλλα ΟΠΕ για Java, όπως τα Intellij Idea και Eclipse, ενδέχεται να είναι κάπως 'βαριά' για το σύστημά σας και να τρέχουν αργά ή να μην ξεκινούν καν. Η Java γενικά και τα προγράμματα γραμμένα σ' αυτήν, απαιτεί πολύ μνήμη RAM. 

Το Microsoft Visual Studio Code είναι ένα 'ελαφρύ' ΟΠΕ που διαθέτει πρόσθετα (plugins) για πολλές γλώσσες προγραμματισμού. Επίσης είναι διαθέσιμο για όλες τις πλατφόρμες (Windodws, MacOSX, Linux). 

Η πηγή [7] περιγράφει λεπτομερώς πώς να εγκαταστήσετε το MS OpenJDK και το [Visual Studio Code](https://code.visualstudio.com/download) για Windows (αλλά με παρόμοιο τρόπο μπορείτε να το εγκαταστήσετε και για τις άλλες πλατφόρμες) καθώς και το πρόσθετο (plugin) "Extension Pack for Java".

Άλλο ένα ενδιαφέρον πρόσθετο για το Code είναι το _Denigma_ το οποίο εξηγεί τον κώδικα που του δίνεται στα αγγλικά με τη βοήθεια τεχνητής νοημοσύνης. Μόλις το εγκαταστήσετε πατήστε το κουμπί **Explain (Denigma)** στην γραμμή κατάστασης στο κάτω μέρος του VS Code.

## Εγκατάσταση του BlueJ
Το BlueJ είναι ένα ΟΠΕ για αρχάριους προγραμματιστές που δημιουργήθηκε από το πανεπιστήμιου του Kent. Θα το χρησιμοποιήσουμε στα μαθήματα της 3ης εβδομάδας.

1. Κατεβάστε το BlueJ για την πλατφόρμα σας από [εδώ](https://www.bluej.org/) και εγκαταστήστε το για την πλατφόρμα σας ακολουθώντας τον οδηγό εγκατάστασης.

## JShell

Το κέλυφος Java (JShell) εισήχθηκε στη Java από την έκδοση 9 και μετά. Πιο πάνω είδαμε πώς να το εκκινήσουμε τόσο από τη γραμμή εντολών του Λ.Σ. όσο και από το NetBeans. Στη βιβλιογραφία αναφέρεται ως _Read-Evaluate-Print-Loop_. Όπως είδαμε, η Java είναι μια μεταγλωττισμένη γλώσσα, δηλ. για να εκτελεστεί κάποιο πρόγραμμα γραμμένο σε Java, θα πρέπει πρώτα να το μεταγλωττίσουμε και μετά να το εκτελέσουμε. Για μικρά προγράμματα ή για να δοκιμάσουμε διάφορα χαρακτηριστικά της γλώσσας, αυτό τρώει πολύ χρόνο. Το JShell δημιουργήθηκε γι' αυτόν ακριβώς το σκοπό. Μπορούμε μ' αυτό να εκτελέσουμε εντολές Java χωρίς να χρειάζεται πρώτα να περάσουμε από τη φάση της μεταγλώττισης.

Σ' αυτή την ενότητα θα δούμε πώς μπορούμε να το χρησιμοποιήσουμε. 

Το JShell αποτελείται από:
* Snippets, π.χ. ```2+2```
* Εντολές, π.χ. ```/help```
* Scripts π.χ.
```bash
$ jshell --startup PRINTING
```

**Σημαντική Σημείωση** _Για να μπορέσετε να δείτε ελληνικά στο JShell στα Windows, θα πρέπει να δώσετε τις εξής εντολές σε ένα παράθυρο DOS_

```
C:\ chcp 737

C:\ jshell
|  Welcome to JShell -- Version 17
|  For an introduction type: /help intro

jshell> System.setOut(new PrintStream(System.out, true, "cp737"));

jshell> System.out.println("Γειά")
Γειά
```

_Για να μπορέσετε να δείτε ελληνικά στο jshell του NetBeans στα Windows, θα πρέπει να ορίσετε την μεταβλητή περιβάλλοντος ```JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8```, όπως περιγράψαμε στην αρχή αυτών των σημειώσεων. Εναλλακτικά, ανοίξτε το αρχείο ```etc/netbeans.conf``` και προσθέστε στο τέλος του κλειδιού ```netbeans_default_options```, δηλ. μετά το ```-J-XX:+IgnoreUnrecognizedVMOptions``` το ```-J-Dfile.encoding=UTF8```. Επανεκκινήστε το NetBeans, και θα πρέπει να βλέπετε πλέον ελληνικά στο JShell._

### Εντολές JShell
```bash
jshell> /help
/list [<name or id>|-all|-start]                                         -- list the source you have typed
/edit <name or id>                                                       -- edit a source entry referenced by name or id
/save [-all|-history|-start] <file>                                      -- save snippet source to a file
/open <file>                                                             -- open a file as source input
/vars [<name or id>|-all|-start]                                         -- list the declared variables and their values
/types [<name or id>|-all|-start]                                        -- list the type declarations
/methods [<name or id>|-all|-start]                                      -- list the declared methods and their signatures
/imports                                                                 -- list the imported items
/exit                                                                    -- exit jshell
/env [-class-path <path>] [-module-path <path>] [-add-modules <modules>] -- view or change the evaluation context
/reset                                                                   -- reset jshell
/reload [-restore] [-quiet] [-class-path <path>] [-module-path <path>]   -- reset and replay relevant history -- current or previous (-restore)
/history                                                                 -- history of what you have typed
/help [<command>|<subject>]                                              -- get information about jshell
/set editor|start|feedback|mode|prompt|truncation|format                 -- set configuration information
/? [<command>|<subject>]                                                 -- get information about using the jshell tool
/!                                                                       -- rerun last snippet -- see /help rerun
/<id>                                                                    -- rerun snippets by ID or ID range -- see /help rerun
/-<n>                                                                    -- rerun n-th previous snippet -- see /help rerun	
```

### Χρήσιμα πλήκτρα στο JShell
**Πίνακας 1.4.1** _Πλοήγηση_ 

| Πλήκτρο(-α) | Αποτέλεσμα
| ```ENTER``` | Εισαγωγή νέας γραμμής
| ```<-``` | Πίσω ένας χαρακτήρας
| ```->``` | Μπροστά ένας χαρακτήρας
| ```^``` | Πάνω μια γραμμή, πίσω στο ιστορικό
| ```v``` | Κάτω μια γραμμή, μπροστά στο ιστορικό
| ```Ctrl+A``` | Μετακίνηση στην αρχή της γραμμής
| ```Ctrl+E``` | Μετακίνηση στο τέλος της γραμμής
| ```Alt+B``` | Μετακίνηση πίσω μια λέξη
| ```Alt+F``` | Μετακίνηση μπροστά μια λέξη
| ```Ctrl+R (Ctrl+S)``` | Αναζήτηση πίσω (μπροστά) στο ιστορικό

**Πίνακας 1.4.2** _Τροποποίηση κειμένου_

| Πλήκτρο(-α) | Αποτέλεσμα
| ```Tab``` | Αυτόματη συμπλήρωση (auto-completion)
| ```Delete``` | Διαγραφή του χαρακτήρα μετά τον δρομέα
| ```Backspace``` | Διαγραφή του χαρακτήρα πριν δρομέα
| ```Ctrl+K``` | Διαγραφή του κειμένου από το δρομέα μέχρι το τέλος της γραμμής
| ```Alt+D``` | Διαγραφή του κειμένου από το δρομέα μέχρι το τέλος της λέξης
| ```Ctrl+Y``` | Επικόλληση του πιο πρόσφατα διαγραμμένου κειμένου 
| ```Alt+Y``` | Μετακίνηση στο διαγραμμένο κείμενο

```Ctrl+L```: καθαρισμός οθόνης

Στις επόμενες διαλέξεις αυτής της εβδομάδας θα μάθουμε τις βασικές εντολές της γλώσσας χρησιμοποιώντας το JShell.

## Jupyter
Το [Jupyter](https://jupyter.org/) είναι ένα πολύ ενδιαφέρον πρόγραμμα που μας επιτρέπει να ενσωματώνουμε κείμενο και κώδικα μαζί. Με το Jupyter Lab μπορείτε να ανοίξετε τα αρχεία ```.ipynb``` που εμφανίζονται σε κάθε μάθημα. Μπορείτε να το δοκιμάσετε online [εδώ](https://jupyter.org/try).

Για να το εγκαταστήσετε χρειάζεστε (ανάλογα με την πλατφόρμα σας):
* να εγκαταστήσετε την [python3](https://www.codecademy.com/article/install-python3) αν δεν είναι ήδη εγκατεστημένη στο σύστημά σας
* να εγκαταστήσετε το Jupyter Lab ακολουθώντας τις [οδηγίες](https://jupyter.org/install)
* να εγκαταστήσετε την [IJava](https://github.com/SpencerPark/IJava) στο Jupyter ώστε να μπορείτε να τρέχετε προγράμματα Java. Απαιτείται να έχετε εγκατεστημένη έκδοση JDK 9 ή μεγαλύτερη που περιέχει το JShell (βλ. παρακάτω). 
   * Ο πιο εύκολος τρόπος εγκατάστασης είναι να κατεβάσετε το αρχείο [ijava-X.X.X.zip](https://github.com/SpencerPark/IJava/releases), να το αποσυμπιέσετε σε κάποιον φάκελο και να εκτελέσετε την εντολή ```python3 install.py --sys-prefix```.
   
Για να εκτελέσετε το Jupyter Lab, μεταβείτε στο φάκελο που έχετε κατεβάσει τα ```.ipynb``` αρχεία και δώστε σε μια γραμμή εντολών κελύφους ή DOS την εντολή ```jupyter lab```. Θα φορτώσει μια ιστοσελίδα στον πλοηγό σας που θα είναι το περιβάλλον του Jupyter Lab από το οποίο μπορείτε να ανοίξετε τα αρχεία ```.ipynb``` αλλά και να τα τροποποιήσετε.

Αν δεν μπορείτε ή δεν θέλετε να εγκαταστήσετε το Jupyter Lab, τότε μπορείτε να τα ανοίξετε τα αρχεία ```.ipynb``` στο [Colab](https://colab.research.google.com/), επιλέγοντας **Upload**. Δυστυχώς δεν θα μπορέσετε να τρέξετε τα παραδείγματα Java καθώς υποστηρίζεται μόνο η γλώσσα Python.

## Πηγές
1. [JDK 17 Documentation](https://docs.oracle.com/en/java/javase/17/?overview-summary.html)
1. [Java Platform, Standard Edition Java Shell User’s Guide](https://docs.oracle.com/en/java/javase/17/jshell/introduction-jshell.html)
1. [JShell Tutorial](https://jshelltutorial.com/)
1. [JShell Tutorial](http://cr.openjdk.java.net/~rfield/tutorial/JShellTutorial.html)
1. [Apache NetBeans](https://netbeans.apache.org/help/index.html)
1. Hillar G.C. (2017), _Java 9 with JShell_, Packt.
1. Κασάπογλου Μ., [Εγκατάσταση MICROSOFT OpenJDK 17 και VS CODE](https://kassapoglou.github.io/java/java-unit1-jdk-installation.html)

---

[<-](../1.3-JavaHistory/README.md) | [∆](../../README.md) | [->](../1.5-JavaBasics/README.md)

---