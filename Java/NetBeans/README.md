# Netbeans – Ένα σύγχρονο IDE {#NetBeans}
© Γιάννης Κωστάρας

---
Όσοι ασχολείστε με τη Java, σίγουρα το γνωρίζετε. Αλλά και οι προγραμματιστές άλλων γλωσσών, όπως C/C++, Perl/PHP, Ruby/RoR, Python, Groovy/Grails, Scala κ.ά. μπορεί να έχετε ακούσει γι' αυτό. Πρόκειται για το Ολοκληρωμένο Περιβάλλον Εργασίας (ΟΠΑ) ή Integrated Development Environment (IDE) της SUN Microsystems (πλέον Oracle και ακόμα πιο πρόσφατα παρέχεται από το Apache Foundation), το οποίο με τη βοήθεια πρόσθετων (plugins) μπορεί να καλύψει ένα μεγάλο εύρος γλωσσών προγραμματισμού. Το Netbeans δεν έχει τίποτα να ζηλέψει από το αντίπαλο δέος, το Visual Studio .NET της Microsoft, διαθέτοντας όλα όσα θα ζητούσε ένας σύγχρονος προγραμματιστής. Υποστηρίζει πολλές γλώσσες προγραμματισμού και διαθέτει χρήσιμα χαρακτηριστικά που θα επιταχύνουν το χρόνο ανάπτυξης των εφαρμογών σας, σε όποια γλώσσα κι αν γράφετε.

Φυσικά, το Netbeans έχει πολλούς άξιους ανταγωνιστές, όπως το βετεράνο [Eclipse](http://www.eclipse.org/), το ανοικτού κώδικα παιδί της IBM, που διαθέτει και τους περισσότερους θαυμαστές, το [IDEA](http://www.jetbrains.com/idea/index.html) της Jetbrains, το οποίο πλέον διατίθεται και σε έκδοση ανοικτού κώδικα, ή το [JDeveloper](http://www.oracle.com/technology/products/jdev/index.html) της Oracle, με πολλούς Wizard για επικοινωνία με το backend (δηλ. την Oracle DBMS),  για να αναφέρουμε τα πιο γνωστά.

## Εγκατάσταση 
Το Netbeans μπορείτε να το βρείτε στο Κέντρο λογισμικού Ubuntu στην κατηγορία **Εργαλεία Προγραμματισμού > Περιβάλλοντα Ανάπτυξης Εφαρμογών**. Η τελευταία έκδοση 10.04 του Ubuntu υποστηρίζει την τρέχουσα έκδοση 6.8 του Netbeans, παρόλο που η έκδοση 6.9 βρίσκεται ήδη προ των πυλών. Όσοι δεν έχετε αναβαθμιστεί ακόμα στην έκδοση 10.04 του Ubuntu, θα βρείτε την προηγούμενη έκδοση 6.7 του Netbeans.
Βέβαια, μπορείτε να εγκαταστήσετε το Netbeans και κατευθείαν από το [site της Oracle](http://netbeans.org/downloads/index.html) ή την πιο τελευταία έκδοση από το αντίστοιχο [site του Apache](https://netbeans.apache.org/) (βλ. Εικόνα 1).

![](assets/Fig1.png)

**Εικόνα 1** _Η ιστοσελίδα με τις εκδόσεις του Netbeans_

Μπορείτε π.χ. να κατεβάσετε μόνο την έκδοση για C/C++, αν προγραμματίζετε μόνο σε αυτή τη γλώσσα. Μια έκδοση που ίσως θα σας ενδιέφερε είναι η 6.5, η οποία είχε ένα πολύ καλό visual εργαλείο για BPEL, καθώς και τις βιβλιοθήκες Woodstock για ανάπτυξη εφαρμογών ιστού σε Java Server Faces. Δυστυχώς, οι νεότερες εκδόσεις δεν υποστηρίζουν πλέον αυτές τις βιβλιοθήκες, ενώ το εργαλείο BPEL δεν είναι τόσο καλό πλέον. Μη με ρωτάτε γιατί.
Αν εγκαταστήσατε το πρόγραμμα από το Κέντρο λογισμικού Ubuntu, τότε μπορείτε να εκκινήσετε το Netbeans από το μενού **Εφαρμογές > Προγραμματισμός > Netbeans IDE 6.8**. 

![](assets/Fig2.png)

**Εικόνα 2** _Το αρχικό περιβάλλον του Netbeans_

Το πρώτο πράγμα που ίσως σας κάνει εντύπωση είναι η απλότητα του περιβάλλοντος, με λίγα κουμπιά και μόνο τα απολύτως απαραίτητα εργαλεία. Από την αρχική σελίδα μπορείτε να επιλέξετε να παρακολουθήσετε διάφορα tutorials, για να μάθετε περισσότερα για το περιβάλλον.
Το Netbeans υποστηρίζει, όπως είπαμε, πολλές γλώσσες προγραμματισμού. Μπορείτε να προσθέσετε όποια γλώσσα θέλετε, αρκεί να κατεβάσετε το κατάλληλο πρόσθετο. Υποστηρίζει επίσης πολλά συστήματα version control (CVS, Subversion, Mercurial κλπ.), και φυσικά τα πάντα γύρω από τη Java (Java SE, Swing, Java EE, JavaFX, Java Web Services κλπ). Εμφανίστε τη λίστα με τα πρόσθετα από το μενού **Tools > Plugins**.

![](assets/Fig3.png)

**Εικόνα 3** _Το παράθυρο των προσθέτων του Netbeans_

## Το πρώτο μας έργο 
Ας δημιουργήσουμε ένα νέο έργο (project) κάνοντας κλικ στο δεύτερο κουμπί της γραμμής εργαλείων (**New Project**), ή από το μενού **File > New Project**. Επιλέξτε την κατηγορία **C/C++** και το έργο **C/C++ Qt Application**, για να συγκρίνουμε το Netbeans με το Qt Creator.

![](assets/Fig4.png)

**Εικόνα 4** _Δημιουργία ενός νέου έργου Qt_

Πατήστε το **Next**, δώστε ```HelloQtWorld``` ως όνομα του έργου (Εικόνα 5) και στη συνέχεια πατήστε **Finish**.

![](assets/Fig5.png)

**Εικόνα 5** _Δημιουργία της εφαρμογής HelloQtWorld_ 

Θα παρατηρήσετε ότι, στα αριστερά, στην καρτέλα **Projects**, το Netbeans δημιούργησε μια σειρά από φακέλους (βλ. Εικόνα 6) με τα απαραίτητα αρχεία.

![](assets/Fig6.png)

**Εικόνα 6** _Το άδειο έργο HelloQtWorld_

Κάνοντας διπλό κλικ στο αρχείο ```main.cpp```, παρατηρούμε ότι υπάρχουν λάθη τα οποία εμφανίζονται με ένα κόκκινο θαυμαστικό. Αν περάσετε από πάνω τους το δρομέα του ποντικιού, μπορείτε να λάβετε περισσότερες πληροφορίες. Στη συγκεκριμένη περίπτωση, το Netbeans παραπονιέται ότι δεν μπορεί να βρει το Qt. Πατήστε το κουμπί **Run Main Project** (το κουμπί με το πράσινο βελάκι) για να προσπαθήσετε να τρέξετε το πρόγραμμα. Εμφανίζεται το παράθυρο διαλόγου της Εικόνας 7.

![](assets/Fig3.png)

**Εικόνα 7** _Resolve Missing Native Build Tools_

Απ' ότι φαίνεται, το ```qmake``` λείπει από το σύστημά μου. Αν αντιμετωπίζετε κι εσείς το ίδιο πρόβλημα, τότε σε ένα παράθυρο γραμμής εντολών δώστε την εντολή:

```bash
john@ubuntu:~$ qmake 
The program 'qmake' can be found in the following packages: 
 * qt3-dev-tools 
 * qt4-qmake 
Try: sudo apt-get install <selected package> 
john@ubuntu:~$ sudo apt-get install qt4-dev-tools
```

Στη συνέχεια, προσθέστε την εντολή ```/usr/bin/qmake``` στο πεδίο _Qmake Command_ του παραθύρου της Εικόνας 7. Επαναλάβετε για τη ```/usr/bin/cmake```:

```bash
john@ubuntu:~$ cmake 
The program 'cmake' is currently not installed.  You can install it by typing: 
sudo apt-get install cmake 
john@ubuntu:~$ sudo apt-get install cmake 
```

Επανεκκινήστε το Netbeans αν χρειάζεται. Πλέον τα λάθη θα πρέπει να έχουν εξαφανιστεί. Πατήστε πάλι το κουμπί **Run Main Project** για να εκτελέσετε το έτοιμο πρόγραμμα που δημιούργησε το Netbeans στη ```main.cpp```. Συγχαρητήρια!

Ας χρησιμοποιήσουμε το ίδιο πρόγραμμα του τεύχους 5 του [Ubuntistas](http://www.ubuntu-gr.org/ubuntistas/). Αφού αντιγράψετε κι επικολλήσετε τον κώδικα της σελ. 21 του τεύχους στη ```main.cpp```, κάντε δεξί κλικ και Format για να μορφοποιήσετε τον κώδικά σας. O πανίσχυρος επεξεργαστής του Netbeans διαθέτει πολλά καλούδια. Π.χ., μπορείτε να βρείτε πού χρησιμοποιείται μια μεταβλητή ή μια μέθοδος κάνοντας δεξί κλικ πάνω της και επιλέγοντας **Find Usages**. Ή, μπορείτε να κάνετε κλικ πάνω σε μια μεταβλητή, μέθοδο ή όνομα βιβλιοθήκης, πατώντας ταυτόχρονα και το ```Ctrl```, για να μεταβείτε στον ορισμό της (ή δεξί κλικ και επιλέγοντας **Navigate > Goto Declaration**). Ακόμη, διαθέτει έναν αριθμό από χρήσιμα Refactorings, όπως **Rename**, **Encapsulate Fields** κλπ.

![](assets/Fig8.png)

**Εικόνα 8** _Το πρώτο σας πρόγραμμα σε Qt_ 

Το αποτέλεσμα εκτέλεσης του προγράμματος φαίνεται στην Εικόνα 9.

![](assets/Fig9.png)

**Εικόνα 9** _Το αποτέλεσμα της εκτέλεσης του πρώτου προγράμματός σας σε Qt_ 

Όπως όμως και με το Qt Designer, έτσι και με το Netbeans μπορούμε να σχεδιάσουμε και το γραφικό κομμάτι της εφαρμογής μας. Όπως και στο Β' μέρος του άρθρου στο τεύχος 6 του [Ubuntistas](http://www.ubuntu-gr.org/ubuntistas/), κάντε δεξί κλικ στο έργο ```HelloQtWorld``` στην καρτέλα _Projects_ και επιλέξτε **New > New Qt Form**. Επιλέξτε **Dialog without buttons** ως _Form Type_ και το κουμπί επιλογής **Create C++ wrapper class**. Πατώντας το κουμπί **Finish** δημιουργούνται τρία αρχεία και το Netbeans ανοίγει αυτόματα το Qt Designer για να επεξεργαστείτε τη φόρμα σας. Από εδώ και πλέον τα βήματα είναι τα ίδια όπως περιγράφονται στο τεύχος 6.

![](assets/Fig10.png)

**Εικόνα 10** _Παράθυρο δημιουργίας νέας φόρμας Qt_ 

Παρατηρήστε ότι εμφανίζονται ορισμένα λάθη μεταγλώτισης. Π.χ. το Netbeans δεν αναγνωρίζει το αρχείο κεφαλίδας ```ui_Dialog.h``` και παραπονιέται για τη μέθοδο ```setupUi```. Αυτά τα λάθη προκύπτουν κατά τη διάρκεια της πρώτης μεταγλώτισης. Πατήστε το κουμπί **Clean and Build Main Project** για να διορθωθούν. Παρατηρήστε, επίσης, πως οι διάφορες μεταβλητές που αναφέρονται στα widgets του Qt εμφανίζονται με πράσινο χρώμα στον επεξεργαστή κειμένου του Netbeans (βλ. ```Dialog.cpp```). Πατήστε το κουμπί **Run Main Project** για να τρέξετε το πρόγραμμα και να επιβεβαιώσετε ότι δουλεύει όπως και στο τεύχος 6.

![](assets/Fig11.png)

**Εικόνα 11** _Εκτέλεση του προγράμματος του τεύχους 6 στο NetBeans_

## Το πρώτο μας έργο σε Java
Ας ξαναγράψουμε το παραπάνω πρόγραμμα σε Java/Swing για να συγκρίνουμε τις δυο γλώσσες και τις βιβλιοθήκες γραφικών που διαθέτουν, αλλά και για να γνωρίσουμε τον πανίσχυρο επεξεργαστή κειμένου Java του Netbeans. Δημιουργήστε ένα νέο έργο τύπου _Java Application_, όπως φαίνεται στην παρακάτω εικόνα.

![](assets/Fig12.png)

**Εικόνα 12** _Δημιουργία ενός έργου Java Application_

Πατήστε **Next** και δώστε ```HelloSwingApplication``` ως το όνομα του έργου (βλ. Εικόνα 13):

![](assets/Fig13.png)

**Εικόνα 13** _Δημιουργία του έργου HelloSwingApplication_

Τέλος, πατήστε **Finish**. Το Netbeans δημιουργεί το έργο και ανοίγει την κλάση ```Main```.

Πάμε να δημιουργήσουμε τη φόρμα μας, όπως και στο έργο Qt. Κάντε δεξί κλικ πάνω στο έργο ```HelloSwingApplication``` και επιλέξτε **New > Other > Swing GUI Forms > JFrame Form**. Δώστε της το όνομα κλάσης ```Dialog``` και τοποθετήστε τη στο ```package helloswingapplication```, που είναι και η ```Main```. Το Netbeans άνοιξε τη φόρμα σε προβολή σχεδίασης (βλ. Εικόνα 14). 

Στο κάτω αριστερό μέρος θα βρείτε επιλεγμένη την καρτέλα _Component Inspector_, όπου εμφανίζεται ένα δέντρο των components της φόρμας σας. Κάντε δεξί κλικ στο ```JFrame``` και επιλέξτε **Set Layout > BorderLayout**. Επιλέξτε μια ετικέτα (Label) από τα Swing Controls που εμφανίζονται δεξιά, και σύρετέ τη στο κέντρο της φόρμας. Κάντε δεξί κλικ στο ```jLabel1``` στον Component Inspector, επιλέξτε **Edit Text** και ορίστε σαν κείμενο της ετικέτας ```Place for Image```. Πάλι δεξί κλικ στην ετικέτα στον Component Inspector, **Change variable name...** και δώστε ```lblImage```. Αυτό θα είναι το όνομα της μεταβλητής που θα χρησιμοποιήσουμε στο πρόγραμμα για να προσπελάσουμε την ετικέτα.

Επιλέξτε ένα Panel από τα Swing Containers και σύρτε το στο κάτω μέρος της φόρμας, κάτω από την ετικέτα. Αλλάξτε το όνομα της μεταβλητής από ```jPanel1``` σε ```buttonPanel```, όπως είδαμε προηγούμενα. Αλλάξτε το layout σε FlowLayout. Σύρτε δυο buttons στο ```buttonPanel``` και αλλάξτε τους τα στοιχεία, όπως παρακάτω:

| Text:     | Open  |  Exit |
| Variable name: | ```btnOpen``` | ```btnExit``` |
| Mnemonic:  | ```O``` |  ```X``` |

![](assets/Fig14.png)

**Εικόνα 14** _Το έργο HelloSwingApplication στο Netbeans_

Ας δούμε τι έχουμε κάνει μέχρι στιγμής. Ανοίξτε την κλάση ```Main``` και πληκτρολογήστε τον παρακάτω κώδικα στη μέθοδο ```main()``` για να φορτώσετε την φόρμα σας:
```java
new Dialog().setVisible(true);
```
Παρατηρήστε ότι, όσο πληκτρολογείτε, εμφανίζεται το σύστημα βοήθειας του Netbeans, παρέχοντάς σας λεπτομερείς πληροφορίες για κάθε μέθοδο που χρειάζεστε. Μπορείτε να πατήσετε οποιαδήποτε στιγμή ```Ctrl + Space``` για να εμφανίσετε αυτό το μενού. Το Netbeans παρέχει επίσης πολλές συντομεύσεις, π.χ. μπορείτε να πληκτρολογήσετε ```sout``` κάτω από την παραπάνω γραμμή και να πατήσετε ```Tab```. 
Τρέξτε το πρόγραμμά σας. Αν όλα πήγαν καλά, τότε θα πρέπει να δείτε ένα μικρό παράθυρο με την ίδια εμφάνιση όπως και η φόρμα σας, αλλά όχι λειτουργικό ακόμα. Κλείστε το παράθυρο και επιστρέψτε στην κλάση ```Dialog```. Κάντε δεξί κλικ στο κουμπί **Exit** και επιλέξτε **Events > Actions > actionPerformed**. Θα μεταβείτε στον κώδικα της φόρμας. Προσθέστε τις ακόλουθες γραμμές κώδικα:
```java
    this.setVisible(false);
    this.dispose();
``` 
Πατήστε το κουμπί Design και επαναλάβετε τη διαδικασία για το κουμπί Open:
```java
    final JFileChooser fc = new JFileChooser();
    fc.setAcceptAllFileFilterUsed(false);
    fc.addChoosableFileFilter(new ImgFilter());

    int returnVal = fc.showOpenDialog(this);
    if (returnVal == JFileChooser.APPROVE_OPTION) {
        File file = fc.getSelectedFile();
        try {
            BufferedImage image = ImageIO.read(file);
            lblImage.setIcon(new ImageIcon(image));
            lblImage.setText("");
        } catch (IOException ex) {
            Logger.getLogger(Dialog.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
```      
Θα εμφανιστούν πολλά λάθη που οφείλονται στο ότι το Netbeans δεν αναγνωρίζει κάποιες κλάσεις. Αυτό διορθώνεται πολύ εύκολα κάνοντας δεξί κλικ στην περιοχή του επεξεργαστή κειμένου του Netbeans και επιλέγοντας **Fix imports**. Παραπονιέται ακόμα για την ```ImgFilter```. Επιλέξτε το λαμπάκι και την μοναδική συμβουλή που σας δίνει, _Create class ImgFilter in package helloswingapplication_. Αντιγράψτε τον κώδικα από [εδώ](http://java.sun.com/docs/books/tutorial/uiswing/examples/components/FileChooserDemo2Project/src/components/ImageFilter.java), προσέχοντας να διατηρήσετε το όνομα της κλάσης ως ```ImgFilter``` και όχι ```ImageFilter``` (που ήδη υπάρχει στη Java), αλλά και το ```package helloswingapplication```. Δημιουργήστε την κλάση ```Utils```, όπως περιγράψαμε προηγουμένως, και επικολλήστε τον κώδικα από [εδώ](http://java.sun.com/docs/books/tutorial/uiswing/examples/components/FileChooserDemo2Project/src/components/Utils.java). Τα λάθη θα πρέπει να έχουν εξαφανιστεί. 

Το Netbeans διαθέτει μια μεγάλη γκάμα από Refactorings. Π.χ., αν δεν σας αρέσει το όνομα ```ImgFilter``` και προτιμάτε το ```ImageFilter```, αρκεί να κάνετε δεξί κλικ πάνω στο ```ImgFilter``` στον επεξεργαστή κειμένου και να επιλέξετε **Refactor > Rename**. Παρατηρήστε ότι το Netbeans αλλάζει όλες τις αναφορές του ονόματος της κλάσης από ```ImgFilter``` σε ```ImageFilter```!

Τρέξτε το πλήρως λειτουργικό πλέον πρόγραμμα. Το μόνο κακό είναι ότι το αρχικό παράθυρο είναι πολύ μικρό. Προσθέστε τις παρακάτω γραμμές κάτω από την ```initComponents()```, στη μέθοδο κατασκευής (constructor) της ```Dialog```:
```java
this.setSize(500, 350);
this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
```
Το πρόγραμμα Java έχει ομολογουμένως περισσότερες γραμμές κώδικα από το αντίστοιχο  Qt, όμως αυτό οφείλεται στη δημιουργία του φίλτρου για την εμφάνιση μόνο των εικόνων. Δοκιμάστε να ξαναγράψετε την εφαρμογή ξεκινώντας από ένα έργο τύπου Java Desktop Application για να δείτε έναν πιο γρήγορο τρόπο δημιουργίας μιας desktop εφαρμογής. Για τον ίδιο σκοπό το Netbeans προσφέρει και το Rich Client Platform, μια αρχιτεκτονική από έτοιμα components για την ανάπτυξη desktop εφαρμογών.

## Επίλογος
Αν και δεν καλύψαμε παρά ένα μικρό μέρος από τα χαρακτηριστικά του Netbeans, ελπίζω ότι σας άνοιξε η όρεξη να εξερευνήσετε τις δυνατότητες του φοβερού αυτού εργαλείου. Και κλείνουμε με τα λόγια του πατέρα της Java, του James Gosling, στο [Javapolis](http://www.javapolis.com/confluence/download/attachments/28974/Parleys_04_ebook.pdf?version=1) το 2007: «I’m very excited about NetBeans 6.0. Are you still using Emacs? Then go shoot yourself. Emacs was a good idea – about thirty years ago.» 

## Πηγές
1. [Netbeans home page] (http://www.netbeans.org).
2. [Netbeans tutorials](http://netbeans.org/kb/).
3. Vladykin Α. (2010), [Working with Qt Applications](http://netbeans.org/kb/docs/cnd/qt-applications.html) 
4. [FileChooser tutorial](http://java.sun.com/docs/books/tutorial/uiswing/components/filechooser.html)
5. Keegan P. et. al. (2006), _NetBeans™ IDE Field Guide: Developing Desktop, Web, Enterprise, and Mobile Applications_, 2nd Edition, Prentice Hall. 
6. Myatt A. (2008), _Pro Netbeans IDE 6 Rich Client Platform Edition_, Apress.
7. Wielenga G. & Keegan P. (2009), [Netbeans Java Editor](http://refcardz.dzone.com/refcardz/netbeans-java-editor-68).
8. Fowler M. et. al. (1999), _Refactoring: Improving the Design of Existing Code_, Addison Wesley.

---