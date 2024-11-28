# Αποδοτική Java - Μέρος 3ο: Εργαλεία κατατομής {#JavaPerformance}
© Γιάννης Κωστάρας

---

[<-](../JavaPerformance2/README.md)

---

Στο πρώτο κεφάλαιο μιλήσαμε για το μοντέλο μνήμης της εικονικής μηχανής Java. Στο δεύτερο κεφάλαιο είδαμε διάφορα εργαλεία που μας βοηθούν να επιβλέψουμε (monitoring) την απόδοση μιας εφαρμογής Java, δηλαδή τη συλλογή δεδομένων, χωρίς επίδραση στην εφαρμογή. Με αυτά τα εργαλεία μπορούμε να ανιχνεύσουμε διαρροές μνήμης (memory leaks), υπερβολική χρήση της Κ.Μ.Ε., προβλήματα που αφορούν επικοινωνία με συσκευές εισόδου/εξόδου κλπ. Αφού καταλήξουμε ότι όντως υπάρχει κάποιο πρόβλημα στην εφαρμογή μας, το επόμενο βήμα είναι να βρούμε ποια(-ες) κλάση(-εις) είναι ο(οι) φταίχτης(-ες). Αυτό το πετυχαίνουμε με τη διαδικασία της κατατομής (profiling). 
 
Σε αυτό το κεφάλαιο θα δούμε εργαλεία profiling με τα οποία μπορούμε να εντοπίσουμε που οφείλονται τα διάφορα προβλήματα της απόδοσης της εφαρμογής μας. Τα εργαλεία κατατομής (profiling) επεμβαίνουν σημαντικά και επηρεάζουν την απόδοση της εφαρμογής ώστε να βρουν τον φταίχτη.

Πολλά από τα εργαλεία του προηγούμενου κεφαλαίου διαθέτουν και δυνατότητες profiling όπως θα δούμε στη συνέχεια.

## Εργαλεία κατατομής (profilers)


### ```JMap```

Σύνταξη:
```
$ jmap -<option> <vmid> 
$ jmap -options
-heap
-histo[:live]
-permstat
-finalizerinfo
-dump:<dump-options>
-F
-J<flag>
```
Από τις παραπάνω παραμέτρους θα δείξουμε μόνο εκείνη που χρησιμοποιείται για την επίβλεψη του σωρού. Λόγω ενός προβλήματος στο Ubuntu, προτού εκτελέσετε την ```jmap```, θα πρέπει να εκτελέσετε την παρακάτω εντολή:
```
$ echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
[sudo] password for john:
$ jps -l -m
9953 benchmarks.jar 10792 sun.tools.jps.Jps -l -m 10777 org.openjdk.jmh.runner.ForkedMain 127.0.0.1 
$ jmap -heap 9953
Attaching to process ID 9953, please wait... 
Debugger attached successfully. 
Server compiler detected. 
JVM version is 24.65-b04 

using thread-local object allocation. 
Mark Sweep Compact GC 

Heap Configuration:
   MinHeapFreeRatio = 40
   MaxHeapFreeRatio = 70
   MaxHeapSize      = 520093696 (496.0MB)
   NewSize          = 1310720 (1.25MB)
   MaxNewSize       = 17592186044415 MB
   OldSize          = 5439488 (5.1875MB)
   NewRatio         = 2
   SurvivorRatio    = 8
   PermSize         = 21757952 (20.75MB)
   MaxPermSize      = 174063616 (166.0MB)
   G1HeapRegionSize = 0 (0.0MB) 
...
```
Η παράμετρος ```heap``` εμφανίζει μια εποπτική εικόνα της μνήμης σωρού:

* New Generation (Eden + 1 Survivor Space)
* Eden Space
* From Space
* To Space
* Tenured generation
* Perm Generation

και για καθέναν από αυτούς εμφανίζει τη χωρητικότητα (```capacity```), πόσος χώρος χρησιμοποιείται (```used```) και πόσος απομένει (```free```).

## Γραφικά εργαλεία κατατομής (GUI)

### VisualVM ή JVisualVM
Όπως είδαμε στο προηγούμενο κεφάλαιο, πρόκειται για ένα εργαλείο “για όλες τις δουλειές”. Είναι:

* CPU performance profiler
* Memory profiler
* Ανιχνευτής διαρροής μνήμης

Όπως βλέπουμε στην παρακάτω εικόνα, διαθέτει και μια καρτέλα **Profiler** η οποία, όπως σωστά μαντέψατε, είναι αυτή που χρειαζόμαστε.

![](assets/JVisualVM1.png)

**Εικόνα 14** _VisualVM – καρτέλα Profiler_

Όπως βλέπουμε στην παραπάνω εικόνα, μπορούμε να επιλέξουε ανάμεσα σε profiling για προβλήματα απόδοσης της Κ.Μ.Ε. ή της μνήμης.

![](assets/JVisualVM2.png)

**Εικόνα 15** _VisualVM – καρτέλα Monitor_

![](assets/JVisualVM3.png)

**Εικόνα 16** _VisualVM – καρτέλα Threads_

Η καρτέλα **Threads** μας δείχνει την κατάσταση των νημάτων. Ένα νήμα μπορεί να είναι σε μια από τις ακόλουθες καταστάσεις:

* **RUN**
  * Runnable: είναι έτοιμο να εκτελεστεί, αλλά δεν έχει ξεκινήσει την εκτέλεση.
  * Running: το νήμα εκτελείται από κάποιον επεξεργαστή.
* **WAIT**
  * Waiting: το νήμα είναι μπλοκαρισμένο περιμένοντας κάποια εξωτερική επεξεργασία να τελειώσει.
* **SLEEP**
  * Sleeping: το βάλανε για ύπνο.
* **BLOCK**
  * Blocked on I/O: περιμένει να ολοκληρωθεί μια λειτουργία  I/O.
  * Blocked on Synchronization: περιμένει να λάβει ένα κλείδωμα (lock).
* Dead: τελείωσε η εκτέλεσή του.

Το παράθυρο αυτό χρησιμεύει να δείτε ποια νήματα είναι μπλοκαρισμένα, τι συμβαίνει σε περίπτωση deadlock, συνωστισμού κλειδωμάτων (lock contention) κλπ. Μπορείτε επίσης να δημιουργήσετε ένα thread dump ώστε να δείτε πιο αναλυτικά την κατάσταση των νημάτων σας σε μια δεδομένη στιγμή.
Η καρτέλα [Visual GC](http://www.oracle.com/technetwork/java/visualgc-136680.html) μας δίνει μια ωραία εποπτική εικόνα του σκουπιδιάρη (βλ. εικόνα που ακολουθεί) και πώς αυτός δουλεύει καθώς εκτελείται η εφαρμογή! 

![](assets/JVisualVM4.png)

**Εικόνα 17** _VisualVM – καρτέλα Visual GC_

Στ' αριστερά βλέπετε τη _Μόνιμη γενιά (Perm)_ που χρησιμοποιεί η εικονική μηχανή για ν' αποθηκεύσει τα δικά της αντικείμενα, κλάσεις ή στατικά πεδία. (Η Μόνιμη Γενιά αντικαταστάθηκε από το metaspace στην Java 8, και δεν περιλαμβάνεται στο μέγεθος της μνήμης σωρού). Δεξιότερα είναι η Παλαιά γενιά (Old) στην οποία αποθηκεύονται τα θητεύοντα αντικείμενα. Δεξιότερα είναι η Νέα γενιά που χωρίζεται στις Eden, S0 και S1. Καθώς η εφαρμογή εκτελείται θα παρατηρήσετε την Eden να γεμίζει και στη συνέχεια να εκτελείται ο σκουπιδιάρης της νέας γενιάς που μεταφέρει όσα αντικείμενα είναι ακόμα “ζωντανά” σε κάποιον από τους χώρους επιβίωσης S0 ή S1 και μετά πάλι πίσω στον Eden κ.ο.κ. Όσα αντικείμενα επιβιώνουν μετά από κάποιον αριθμό σαρώσεων (tenuring threshold), μεταφέρονται στην παλαιά γενιά.

Το πρόσθετο [Memory Pools](https://java.net/projects/memorypoolview/) (βλ. παρακάτω εικόνα) εμφανίζει τη χρήση των διαφόρων χώρων μνήμης (Eden, Survivor, Perm, Tenured, Code Cache - χρησιμοποιείται από τον μεταγλωττιστή JIT για την αποθήκευση μεταγλωττισμένου κώδικα JIT. Χρήσιμο είναι το εργαλείο [JITWatch](https://github.com/AdoptOpenJDK/jitwatch/)) σε συνάρτηση με το χρόνο. 

![](assets/JVisualVM5.png)

Εικόνα 18 – VisualVM – καρτέλα Memory Pools

Με το VisualVM μπορείτε να δημιουργήσετε στιγμιότυπα της εφαρμογής (application snapshots), heap dumps ακόμα και thread dumps. Αλλά γι' αυτά θα μιλήσουμε στο επόμενο κεφάλαιο. Παρατηρήστε ότι το VisualVM _δεν_ μπορεί ν' ανοίξει ```.vgc``` αρχείο, αλλά μας επιτρέπει να επιβλέπουμε την εφαρμογή μας ενώ αυτή τρέχει.

### Java Mission Control
Έρχεται μαζί με την ΕΜ Java της Oracle από την έκδοση 7 update 40 (JDK 7u40) και μετά αλλά όχι με το OpenJDK. Προέρχεται από την ΕΜ JRockit, την ΕΜ της Oracle. Όταν η Oracle εξαγόρασε τη Sun Microsystems, απέκτησε στη διάθεσή της και την ΕΜ Hotspot της Sun. Το αποτέλεσμα ήταν η Oracle να συγχωνεύσει τα καλύτερα χαρακτηριστικά της JRockit στην ΕΜ της Sun. Ένα από αυτά είναι και το Java Mission Control. Για να το εκκινήσετε (από το Oracle JDK κι όχι από το OpenJDK υποθέτοντας ότι το έχετε εγκαταστήσει π.χ. στο παρακάτω φάκελο):
```
$ /opt/java/jdk1.7.0_71/bin/jmc & 
```
Απλά επιλέξτε το VMID του προγράμματος που θέλετε να επιβλέψετε από τ' αριστερό πάνελ, δεξί κλικ και **Start JMX Console**. 

![](assets/JavaMissionControl1.png)

**Εικόνα 19** _Κονσόλα Java Mission Control – καρτέλα Overview_

Πέραν της καρτέλας **Overview**, ενδιαφέρον έχει για το σκοπό αυτού του άρθρου και η καρτέλα **Memory**.

![](assets/JavaMissionControl2.png)

**Εικόνα 20** _Κονσόλα Java Mission Control – καρτέλα Memory_

Για να επιβλέψετε κάποιο πρόγραμμα που εκτελείται σε άλλον Η/Υ από αυτόν που εκτελείτε το JMC, θα πρέπει να εκκινήσετε την εφαρμογή σας με τις ακόλουθες παραμέτρους, να ενεργοποιήσετε δηλαδή το Java Descovery Protocol (JDP) ώστε να μπορέσει να ανιχνευθεί από το JMC (φυσικά θα πρέπει να αφήσετε τη θύρα ```7091``` ανοιχτή από τυχόν τείχος προστασίας (firewall)):
```
-Dcom.sun.management.jmxremote.port=true
-Dcom.sun.management.jmxremote.port=7091 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false
-Dcom.sun.management.jmxremote.autodiscovery=true
```
(βλ. [http://hirt.se/blog/?p=388](http://hirt.se/blog/?p=388))

Οι παραπάνω 4 παράμετροι είναι οι ίδιες που απαιτούνται και από το VisualVM για να συνδεθεί με μια απομακρυσμένη εφαρμογή.
Αν η απομακρυσμένη ΕΜ δεν διαθέτει JDP, ενεργοποιήσετε τον πράκτορα jmxrmi όπως θα κάνατε για να συνδεθείτε με πελάτες JMX (όπως π.χ. το Jconsole). 
Σημειώστε, ότι η συχνότητα συλλογής δεδομένων είναι πολύ μικρή ώστε η επίδραση της επίβλεψης του JMC στην εφαρμογή να είναι αμελητέα.

#### JConsole
Πρόκειται για ένα (συμβατό με JMX) εργαλείο, που περιλαμβάνεται στο JDK, το οποίο έχει τις εξής δυνατότητες:

* Επίβλεψης: μνήμης, νημάτων, φόρτωσης κλάσεων κλπ.
* Διαχείρισης: αλλαγή των παραμέτρων της γραμμής εντολών
* αλληλεπίδρασης με συγκεκριμένα MBeans της εφαρμογής

Στην Java 5 πρέπει να περάσετε την εξής παράμετρο για να ενεργοποιήσετε το JConsole:
```
-Dcom.sun.management.jmxremote
```
Από τη Java 6 και μετά είναι ενεργοποιημένη εξ' ορισμού. 
```
$ jconsole &
```
Η αρχική οθόνη ζητά να ορίσετε μια νέα σύνδεση με μια υπάρχουσα εφαρμογή της οποίας πρέπει να γνωρίζετε το PID (Process ID) αν εκτελείται τοπικά, ή το όνομα του Η/Υ και τη θύρα αν η εφαρμογή εκτελείται απομακρυσμένα. Επειδή το jconsole απαιτεί πολλούς πόρους για να εκτελεστεί, όταν θέλουμε να μετρήσουμε την απόδοση μιας εφαρμογής που τρέχει στο σύστημα παραγωγής, καλό είναι να συνδεόμαστε σ' αυτό από άλλον Η/Υ για να παράγουμε τις μετρήσεις για να μην επηρεάσουμε την απόδοση της εφαρμογής.

![](assets/JConsole1.png)

**Εικόνα 24** _Αρχική οθόνη του  JConsole_

Η αρχική οθόνη αποτελείται από έξι καρτέλες:

* Σύνοψης: εμφανίζει συνοπτικές πληροφορίες για την εικονική μηχανή και τις επιβλέπουσες τιμές.
* Μνήμης: πληροφορίες για τη χρήση μνήμη (σωρού και στοίβας).
* Διεργασιών: πληροφορίες για το αριθμό διεργασιών (νημάτων).
* Κλάσεων: πληροφορίες για τον αρ. των κλάσεων που φορτώθηκαν
* Mbeans: πληροφορίες για τα Mbeans
* VM: πληροφορίες της εικονικής μηχανής

Η πρώτη καρτέλα εμφανίζει μια σύνοψη της εφαρμογής, πιο συγκεκριμένα τη χρήση της μνήμης σωρού, τον αριθμό των νημάτων, τον αριθμό των κλάσεων που φορτώθηκαν και τη χρήση της Κ.Μ.Ε.

![](assets/JConsole2.png)

**Εικόνα 25** _JConsole: καρτέλα σύνοψης_

Στην καρτέλα μνήμης μπορείτε να επιλέξετε από την πτυσσόμενη λίστα πάνω αριστερά ποιο γράφημα θέλετε ν' απεικονίσετε: μνήμη σωρού, μνήμη στοίβας, παλαιά γενιά, Εδέμ, χώρο επιβίωσης, θητεύοντα αντικείμενα κλπ. Επιβλέποντας αυτά τα γραφήματα μπορεί ν' ανακαλύψετε μια διαρροή μνήμης. Μια σύνοψη της χρήσης μνήμης καθώς και των συλλεκτών σκουπιδιών που χρησιμοποιήθηκαν εμφανίζεται στο κάτω μέρος της καρτέλας.

![](assets/JConsole3.png)

**Εικόνα 26** _JConsole: καρτέλα μνήμης_

Στην καρτέλα διεργασιών βλέπουμε τον αριθμό των διεργασιών (νημάτων) που εκτελούνται καθώς και το μέγιστο αριθμό τους. Στο κάτω μέρος της καρτέλας βλέπουμε αναλυτικά όλες τις διεργασίες, ενώ επιλέγοντας μια βλέπουμε την κατάστασή της. Μας δίνεται ακόμα η δυνατότητα ν' ανιχνεύσουμε deadlocks (που ξεφεύγει από το σκοπό τούτου του άρθρου). 

![](assets/JConsole4.png)

**Εικόνα 27** _JConsole: καρτέλα διεργασιών_

Η επόμενη καρτέλα απεικονίζει τον αρ. των κλάσεων που έχουν φορτωθεί.

![](assets/JConsole5.png)

**Εικόνα 28** _JConsole: καρτέλα κλάσεων_
 
Η επόμενη καρτέλα απεικονίζει πληροφορίες της εικονικής μηχανής. Το **Total compile time** εμφανίζει το χρόνο που ξοδεύτηκε για μεταγλώττιση just-in-time (JIT). Η υλοποίηση της JVM καθορίζει πότε θα συμβεί μεταγλώττιση JIT. Η Hotspot VM χρησιμοποιεί προσαρμοστική μεταγλώττιση, κατά την οποία η εικονική μηχανή φορτώνει την εφαρμογή χρησιμοποιώντας έναν απλό διερμηνευτή, αλλά στη συνέχεια αναλύει τον κώδικα καθώς αυτός εκτελείται για ν' ανιχνεύσει προβλήματα απόδοσης ή "hot spots".

![](assets/JConsole6.png)

**Εικόνα 29** _JConsole: καρτέλα JVM_

Η τελευταία καρτέλα εμφανίζει ένα δέντρο με τα διάφορα MBeans που παρέχονται από τον διακομιστή MBeans της πλατφόρμας. Επιλέγοντας ένα MBean από το δέντρο εμφανίζονται οι ιδιότητές του, ενώ όσες τιμές εμφανίζονται με μπλε μπορείτε να τις αλλάξετε.

![](assets/JConsole7.png)

**Εικόνα 30** _JConsole: καρτέλα MBeans_


## Επίλογος
Στο 3ο και τελευταίο μέρος είδαμε διάφορα εργαλεία κατατομής (profiling) που σας επιτρέπουν να βρείτε τι φταίει με την απόδοση μιας εφαρμογής Java. Σας βοηθούν να ανιχνεύσετε που οφείλονται (βλ. ποιες κλάσεις είναι υπεύθυνες για) διαρροές μνήμης, εκτεταμένη χρήση της Κ.Μ.Ε. (CPU) και άλλα προβλήματα που σας βοηθούν να συντονίσετε την ΕΜ σας για μέγιστη απόδοση. Είδαμε πως μπορούμε να χρησιμοποιήσουμε τα εργαλεία αυτά για να βρούμε σε ποιο σημείο του κώδικά μας υπάρχει π.χ. διαρροή μνήμης, ή συνωστισμός κλειδωμάτων κλπ. ώστε να μπορέσουμε να τα διορθώσουμε. 

## Πηγές:
1. Hunt C. & Binu J. (2012), _Java Performance_, Addison-Wesley.
2. Evans, B. & Verburg M. (2012), _The Well Grounded Java Developer_, Manning.
3. Pepperdine, K. (2010), [“Performance Tuning with Cheap Drinks and Poor Tools”](https://www.youtube.com/watch?v=VGQAL9aUKfs).
4. Tene G. (2011) [“Understanding Java Garbage Collection and What You Can Do about It”](https://www.infoq.com/presentations/Understanding-Java-Garbage-Collection).
5. RR’s Random Ramblings (2012), [“Java Tuning in a Nutshell – Part 1”](http://randomlyrr.blogspot.be/2012/03/java-tuning-in-nutshell-part-1.html).
6. Thompson, M. (2013), [“Java Garbage Collection Distilled”](https://www.infoq.com/articles/Java_Garbage_Collection_Distilled), InfoQ.
7. Shirazi J. (2012), [“Garbage Collectors available in JDK 1.7.0_04”](http://www.fasterj.com/articles/oraclecollectors1.shtml).
8. Lee, S. (2012), [“Understanding Java Garbage Collection”](https://www.cubrid.org/blog/understanding-java-garbage-collection).
9. Lee, S. (2012), [“How to monitor Java Garbage Collection”](https://www.cubrid.org/blog/how-to-monitor-java-garbage-collection).
10. Lee, S. (2012), [“How to tune Java Garbage Collection”](https://www.cubrid.org/blog/textyle/428187).
11. Warburton, R. (2013), [“Garbage Collection in Java (1)”](https://www.javacodegeeks.com/2013/06/garbage-collection-in-java-1.html).
12. Warburton, R. (2013), [“Garbage Collection in Java (2)”](https://www.javacodegeeks.com/2013/06/garbage-collection-in-java-2.html).
13. Warburton, R. (2013), [“Garbage Collection in Java (3)”](https://www.javacodegeeks.com/2013/06/garbage-collection-in-java-3.html).
14. Warburton, R. (2013), [“Garbage Collection in Java (4)”](https://www.javacodegeeks.com/2013/07/garbage-collection-in-java-4.html).
15. Steingarten N. (2013), [“JVM Performance Magic Tricks”](https://www.javacodegeeks.com/2013/06/jvm-performance-magic-tricks.html).
16. [Java HotSpot VM Options](http://www.oracle.com/technetwork/java/javase/tech/vmoptions-jsp-140102.html).
17. [Java Platform, Standard Edition Troubleshooting Guide](https://docs.oracle.com/javase/8/docs/technotes/guides/troubleshoot/toc.html).
18. Perera I. (2016), [Using Java Flight Recorder](https://medium.com/@chrishantha/using-java-flight-recorder-2367c01deacf).
19. Vorontsov M. (2015), [Oracle Java Mission Control: The Ultimate Guide] (https://blog.takipi.com/oracle-java-mission-control-the-ultimate-guide/).
22. [Analyzing Memory Leak in Java Applications using VisualVM](http://blog.rejeev.com/2009/04/analyzing-memory-leak-in-java.html)

---

[<-](../JavaPerformance2…/README.md)

---