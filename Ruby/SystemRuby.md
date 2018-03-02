# Προγραμματισμός Συστήματος Unix με τη γλώσσα προγραμματισμού Ruby {#Ruby}
© Γιάννης Κωστάρας

---

[<-](Ruby.md)| [->](../RoR/README.md)

---

Στο προηγούμενο τεύχος, δώσαμε μια εισαγωγή για τη γλώσσα προγραμματισμού Ruby. Ακούστηκαν κάποια σχόλια  για το κατά πόσο ενδιαφέρει τους αναγνώστες του περιοδικού μια ακόμα γλώσσα προγραμματισμού. Αν και δεν είχα σκοπό να γράψω άλλο άρθρο για τη γλώσσα και μάλιστα στο αμέσως επόμενο τεύχος,  το παραπάνω σχόλιο μου έδωσε την αφορμή. Με τη γλώσσα Ruby λοιπόν μπορείτε να κάνετε απευθείας κλήσεις συστήματος Unix/Linux χωρίς να χρειάζεται να χρησιμοποιήσετε ενδιάμεσες βιβλιοθήκες, όπως π.χ. της C. Ας δούμε πώς. Αν δεν έχετε τη Ruby στο σύστημά σας, ανατρέξτε στο προηγούμενο τεύχος για να δείτε πώς να την εγκαταστήσετε. 

## Ολίγη ιστορία
Η φορητότητα των προγραμμάτων συστήματος μεταξύ των διαφορετικών συστημάτων Linux, Unix, FreeBSD κλπ. επιτυγχάνεται είτε με την τήρηση του προτύπου POSIX ή με τις πρότυπες βιβλιοθήκες της C. Στην πράξη, τα πράγματα δεν είναι και τόσο απλά. Αυτό το  γνωρίζετε όσοι έχετε ασχοληθεί με φορητότητα προγραμμάτων σε άλλα συστήματα ή πλατφόρμες (π.χ. Windows), αλλά και μεταξύ διαφορετικών διανομών Linux. Πολλές φορές αναγκαζόμαστε να γράψουμε προγράμματα που απέχουν πολύ από τις... πρότυπες βιβλιοθήκες. Η Sun με την Java κατάφερε να λύσει σε μεγάλο βαθμό τα προβλήματα φορητότητας, παρέχοντας με τη Java Virtual Machine έναν κοινό παρανομαστή λειτουργιών που δουλεύουν σε όλες τις πλατφόρμες. Στο άλλο άκρο, δημιουργήθηκαν δυναμικές γλώσσες όπως οι Perl, Python, Groovy και Ruby, οι οποίες δε χρειάζονται μεταγλώττιση και απλά ... τρέχουν σε όλες τις πλατφόρμες. Οι γλώσσες αυτές είναι οι πλέον κατάλληλες για να γράψετε σενάρια (scripts) συστήματος. Στη συνέχεια, θα δούμε πώς μπορούμε να κάνουμε με τη Ruby τα ίδια πράγματα που κάνουμε και με τη C.

## Παράμετροι γραμμής εντολών
Όπως ίσως γνωρίζετε, η εκτέλεση ενός προγράμματος C προκαλεί την κλήση της συνάρτησης ```main()```:
```c
int main(void);
int main(int argc, char *argv[]);
```
Εδώ η παράμετρος ```argc``` περιέχει το πλήθος των παραμέτρων της γραμμής εντολών, ενώ η ```argv``` είναι ένας πίνακας που περιέχει τις ίδιες τις παραμέτρους γραμμής εντολών. Η συνάρτηση επιστρέφει έναν ακέραιο, ```0``` (ή  ```EXIT_SUCCESS```) σε περίπτωση σωστής εκτέλεσης του προγράμματος, και μη μηδενική τιμή (ή ```EXIT_FAILURE```) σε περίπτωση λάθους.

Στη Ruby τα πράγματα είναι παρόμοια και λίγο πιο απλά. Υπάρχει ένας καθολικός πίνακας ```ARGV``` που αποθηκεύει τις παραμέτρους γραμμής εντολών. Ας δούμε δυο ισοδύναμα προγράμματα γραμμένα σε C και Ruby που διαβάζουν τις παραμέτρους γραμμής εντολών και τις εμφανίζουν στην οθόνη.
```c
// params.c -- C program that prints the command line parameters
#include <stdio.h>

int main(int argc, char *argv[]) {
  int i;
  printf("Command line parameters: ");
  for (i=1; i<argc; i++) {
    printf("%s ", argv[i]);
  }
  printf("\n");
}
```
Μεταγλωττίστε κι εκτελέστε το πρόγραμμα:
```bash
$ gcc -o params params.c 
$./params my name is John 
Command line parameters: my name is John 
```
Ακολουθεί το αντίστοιχο πρόγραμμα σε Ruby:
```ruby
#!/usr/bin/ruby
# params.rb -- Ruby program that prints the command line parameters
print "Command line parameters:"
for arg in ARGV
   print " #{arg}"
end 
puts
```
Αποθηκεύστε το αρχείο με όνομα ```params.rb```. Εκτελέστε το πρόγραμμα:
```bash
$ chmod u+x params.rb
$ ./params.rb my name is John 
Command line parameters: my name is John 
```
Παρατηρήστε τις διαφορές:
α. Το πρόγραμμα Ruby δε χρειάζεται μεταγλώττιση
β. Δεν απαιτείται η δήλωση των μεταβλητών που θα χρησιμοποιήσουμε (π.χ. της ```arg```)
γ. Δεν απαιτείται μετρητής στο βρόγχο for (δηλ. ```i```) ο οποίος μπορεί να γραφτεί και με τη βοήθεια closures ως εξής:
```ruby
ARGV.each {
  |arg| print " #{arg}"
}
```

## Διαχείριση λαθών
Όλες οι κλήσεις συστήματος παράγουν έναν κωδικό σε περίπτωση λάθους. Στη C θα πρέπει να συμπεριλάβετε το αρχείο errno.h για να εμφανίσετε την αιτία του λάθους. Το αρχείο αυτό περιλαμβάνει έναν αριθμό από χρήσιμες συναρτήσεις για εμφάνιση λαθών. Δυο από τις πιο χρήσιμες είναι οι ```void perror(const char *message)``` και ```char *strerror(int errno)```. Η πρώτη εκτυπώνει τη συμβολοσειρά ```message``` και μια περιγραφή του πιο πρόσφατου λάθους. Η δεύτερη επιστρέφει μια περιγραφή της εξωτερικής μεταβλητής ```errno``` που έχει σαν τιμή τον ακέραιο που αντιστοιχεί στο πιο πρόσφατο λάθος:
```c
fprintf(stderr, " %s: ", strerror(errno)); 
```
Ας δούμε ένα παράδειγμα:
```c
// errors_demo.c -- C program that demonstrates use of perror and errno
#include <stdio.h>  /* For fopen, printf */
#include <errno.h>  /* For errno variable */

main() {
  FILE *fd;
  fd = fopen("non_existent_file", "r");
  if (fd == NULL) {   
    printf("errno = %d\n", errno);
    fprintf(stderr, "%s\n", strerror(errno)); 
    perror("fopen");
  }
}
```
Το πρόγραμμα προσπαθεί να ανοίξει ένα μη υπαρκτό αρχείο με αποτέλεσμα να εμφανίζεται μήνυμα λάθους. Μεταγλωττίζοντας και εκτελώντας το πρόγραμμα, παίρνουμε:
```
errno = 2
No such file or directory
fopen: No such file or directory
```
Η Ruby διαθέτει ένα μηχανισμό  εξαιρέσεων, παρόμοιο με της Java:
```ruby
begin
... 
rescue
... 
ensure
... 
end
```
Η εντολή ```ensure``` εκτελείται πάντα και χρησιμοποιείται π.χ. για ελευθέρωση πόρων που χειριζόταν το πρόγραμμα. Η Ruby διαθέτει επίσης κλάση ```Errno```, όπως και η C. Ας δούμε ένα παράδειγμα:
```ruby
#!/usr/bin/ruby
# errors_demo.rb -- Ruby program that demonstrates use of exceptions and Errno
begin
  fd = File.open('non_existing_file', File::RDONLY);
  fd.write 'test'
rescue Errno::ENOENT => e
  STDERR.puts("Could not open file (" + e + ")")
  exit(1)
rescue IOError => e
  STDERR.puts("Could not write to file (" + e + ")")
  exit(2)
ensure
  fd.close if (fd != nil) 
end
```
Όπως και το πρόγραμμα C προηγούμενα, το πρόγραμμα Ruby προσπαθεί να ανοίξει ένα μη υπαρκτό αρχείο για ανάγνωση μόνο, οπότε και εμφανίζεται μια εξαίρεση τύπου ```Errno:ENOENT```. Στη συνέχεια, προσπαθεί να γράψει στο ανύπαρκτο αρχείο. Η έξοδος του προγράμματος «πετάει» μόνο την πρώτη εξαίρεση και φυσικά σταματά την εκτέλεση του προγράμματος (δηλ. η εντολή ```fd.write``` δεν εκτελείται):
```
Could not open file (No such file or directory - non_existing_file)
```
Δυστυχώς, το σύστημα on-line βοήθειας της Ruby (```rdoc```) δεν είναι ακόμα ενημερωμένο κι έτσι δε θα βρείτε περισσότερες πληροφορίες για την κλάση ```Errno```. Μπορείτε ωστόσο να βρείτε μια περιγραφή της ```Errno``` στην αναφορά [4].

## Διαχείριση I/O
Η Ruby διαθέτει ένα πλούσιο ρεπερτόριο εντολών για τη διαχείριση αρχείων και σωληνώσεων (sockets). Η κλάση ```ΙΟ``` περιλαμβάνει όλες τις απαραίτητες λειτουργίες για διαχείριση αρχείων. Σε αυτήν έχουν οριστεί οι τρεις καθολικές σταθερές ```STDIN, STDOUT, STDERR```.

Ξεκινάμε, υπολογίζοντας τον εξ ορισμού αριθμό ανοικτών περιγραφέων αρχείων. Σε C:
```c
// filedescriptors.c –- displays max num of open file descriptors
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main(void) {
  printf("Max number of open file descriptors/processes : %ld\n", sysconf(_SC_OPEN_MAX));
  printf("The same with getdtablesize() : %d\n", getdtablesize());
  return EXIT_SUCCESS;
}
```
Μεταγλωττίζοντας και εκτελώντας το πρόγραμμα, λαμβάνουμε στο Ubuntu:
```bash
$ ./filedescriptors 
Max number of open file descriptors/processes : 1024 
The same with getdtablesize() : 1024 
```
Στη Ruby, μπορείτε να καλέσετε την αντίστοιχη εντολή κελύφους από το ```irb```:
```ruby
$ irb
irb(main):001:0> %x(getconf OPEN_MAX).to_i 
=> 1024 
```
Η εντολή ```%x``` επιτρέπει την εκτέλεση εντολών κελύφους. Έτσι, η παραπάνω εντολή καλεί την εντολή κελύφους ```getconf``` που είναι ισοδύναμη με την εντολή ```sysconf``` της C.  Τέλος, η μέθοδος ```to_i``` είναι ισοδύναμη της ```atoi()``` της C.

Η κλάση ```File``` της Ruby διαθέτει πολλές χρήσιμες μεθόδους για διαχείριση αρχείων και φακέλων. Η μέθοδος ```File.umask``` εξομοιώνει την εντολή ```umask(1)``` του κελύφους:
```
File.umask       => επιστρέφει την τρέχουσα τιμή της umask
File.umask(0666) => ορίζει τη νέα τιμή της umask κι επιστρέφει την παλιά 
```
Όπως ίσως ήδη γνωρίζετε, η ```umask``` είναι ένας αριθμός μήκους 9 (8) bits που δηλώνει τα δικαιώματα του φακέλου (αρχείου). Π.χ., μια τιμή ```027 (000 010 111)``` αντιστοιχεί στα δικαιώματα ```rwxr-x---```. Αν ένα αρχείο δημιουργηθεί π.χ. με δικαιώματα ```0640``` και η μάσκα είναι ```0077```, τελικά το αρχείο θα αποκτήσει δικαιώματα:
```
0640 & (~0077) = 0640 & 0700 = 0600 
```
Αν δοκιμάσετε τις πιο πάνω εντολές, θα παρατηρήσετε κάτι περίεργο:
```bash
$ umask 
0022
$ irb 
irb(main):001:0> File.umask 
=> 18
``` 
Γιατί; Η εξήγηση είναι εύκολη: ```18(10) = 22(8)```. Δοκιμάστε:
```ruby
irb(main):002:0> File.umask.to_s(8).to_i    # μετατροπή σε οκταδικό
=> 22
```
Ας δούμε, τώρα, πώς μπορούμε να ανοίξουμε ένα αρχείο κειμένου για ανάγνωση, και να αντιγράψουμε τα περιεχόμενά του, γραμμή-γραμμή σε ένα άλλο αρχείο. Ο κώδικας σε C φαίνεται παρακάτω:
```c
// filecopy.c –- makes a copy of a text file
#include <errno.h>
#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    int fd1, fd2;
    char *inFile, *outFile;
    const int MAX_LINE_LEN = 512;
    char buf[MAX_LINE_LEN];
    int bytes;

    if (argc != 3) {
        printf("Usage: filecopy <inputFile> <outputFile>\n");
        exit(EXIT_FAILURE);
    }

    inFile = argv[1];
    outFile = argv[2];

    if ((fd1 = open(inFile, O_RDONLY)) == NULL) {
        if (errno == ENOENT) {
            fprintf(stderr, "The file doesn't exist: %s\n", strerror(errno));
        } else {
            fprintf(stderr, "The file cannot be accessed: %s\n", strerror(errno));
        }
        exit(EXIT_FAILURE);
    }

    if ((fd2 = open(outFile, O_WRONLY | O_CREAT)) == NULL) {
        if (errno == ENOENT) {
            fprintf(stderr, "The file doesn't exist: %s\n", strerror(errno));
        } else {
            fprintf(stderr, "The file cannot be accessed: %s\n", strerror(errno));
        }
        exit(EXIT_FAILURE);
    }

    /* Copy file */
    while((bytes = read(fd1, buf, sizeof(buf))) > 0)
        write(fd2, buf, bytes);

    if (close(fd1) == EOF) {
        fprintf(stderr, "Error closing source file.\n");
        exit(EXIT_FAILURE);
    }

    if (close(fd2) == EOF) {
        fprintf(stderr, "Error closing destination file.\n");
        exit(EXIT_FAILURE);
    }

    return EXIT_SUCCESS;
}
```
Το πρόγραμμα δουλεύει ως εξής: Το πρώτο αρχείο ανοίγει για ανάγνωση μόνο, το δεύτερο για εγγραφή. Στη συνέχεια, χρησιμοποιούνται οι συναρτήσεις ```read``` και ```write``` της βιβλιοθήκης ```unistd.h``` για να γίνει η αντιγραφή. Τέλος, τα αρχεία κλείνουν. 
Ας δούμε το ίδιο πρόγραμμα σε Ruby:
```ruby
#!/usr/bin/ruby
# filecopy.rb -- Ruby program that copies the contents of a text file to another
if (ARGV.length != 2)
  puts "Usage: filecopy.rb <inputFile> <outputFile>"
  exit!(1)
end
inFile = ARGV[0]
outFile = ARGV[1]
begin
   if (File.exist?(inFile)) 
  infd = File.open(inFile, File::RDONLY)
  outfd = File.open(outFile, File::CREAT | File::WRONLY)
  while (bytes = infd.sysread(10))
    outfd.syswrite(bytes)
  end
   end
   rescue EOFError    # do nothing
   rescue SystemcallError => e
  STDERR.puts(e)
  exit!(2)
   ensure
  infd.close
  outfd.close 
end
```
Ο έλεγχος εδώ γίνεται με εξαιρέσεις. Κατ' αρχάς ελέγχουμε αν το πηγαίο αρχείο υπάρχει (με χρήση της ```File.exist?```), στη συνέχεια το ανοίγουμε για ανάγνωση και το αρχείο προορισμού για εγγραφή. Tέλος, εκτελούμε την αντιγραφή με χρήση των ```sysread``` και ```syswrite```. Αν φτάσουμε στο τέλος του αρχείου, απλά δεν κάνουμε τίποτα, ενώ πριν τελειώσουμε την εξαίρεση κλείνουμε τα αρχεία. 
Εναλλακτικές της ```fd.sysread```:
```
fd.read(n)    => διαβάζει n bytes από το fd 
fd.read       => διαβάζει όλο το αρχείο
fd.gets       => διαβάζει την επόμενη γραμμή
fd.readline   => διαβάζει την επόμενη γραμμή
fd.getc       => διαβάζει τον επόμενο χαρακτήρα
fd.readchar   => διαβάζει τον επόμενο χαρακτήρα
fd.readlines  => διαβάζει όλο το αρχείο και το αποθηκεύει σ' ένα πίνακα
```

Αντίστοιχα, εναλλακτικές της ```fd.syswrite```:

```
fd.write(s)               => γράφει το αλφαριθμητικό s στο fd 
fd << s                   => γράφει το αλφαριθμητικό s στο fd
fd.puts                   => γράφει την επόμενη γραμμή
fd.print                  => γράφει την επόμενη γραμμή
fd.putc                   => γράφει τον επόμενο χαρακτήρα
fd.printf(format, object) => γράφει το αντικείμενο με το δοθέν φορμά
```

Φυσικά, στη Ruby υπάρχουν ακόμα πιο εύκολοι τρόποι να γίνει η αντιγραφή:
```ruby
#!/usr/bin/ruby
# filecopy.rb -- Ruby program that copies the contents of a text file to another
require "ftools.rb"
if (ARGV.length != 2)
  puts "Usage: filecopy.rb <inputFile> <outputFile>"
     exit!(1)
end
inFile = ARGV[0]
outFile = ARGV[1]
File.copy(inFile,outFile)
```
Παρατηρήστε ότι χρειαζόμαστε τη βιβλιοθήκη ```ftools.rb```, η οποία περιλαμβάνει την εντολή ```File.copy```.

Ας δούμε κάτι λίγο διαφορετικό. Το παρακάτω πρόγραμμα εξομοιώνει την εντολή ```cat``` του Unix:
```ruby
#!/usr/bin/ruby
# cat.rb -- Ruby program that behaves like the cat UNIX command
if (ARGV.length == 0)
  puts "Usage: cat.rb <file1> <file2> ..."
  exit!(1)
end
ARGV.each { |arg|
  IO.foreach(arg)  {|line| puts line}
}
```
ή ακόμα πιο απλά:
```ruby
#!/usr/bin/ruby
# cat.rb -- Ruby program that behaves like the cat UNIX command
if (ARGV.length == 0)
  puts "Usage: cat.rb <file1> <file2> ..."
  exit!(1)
end
ARGV.each { |arg|
  puts (IO.read(arg))
}
```
Η εντολή ```lseek(2)``` της C επιτρέπει την τοποθέτηση του δείκτη ενός αρχείου σε μια καθορισμένη θέση σε σχέση με μια θέση αναφοράς (```SEEK_SET, SEEK_END``` και ```SEEK_CUR```). Αντίστοιχα, στη Ruby υπάρχουν η μέθοδος ```fd.seek``` και οι σταθερές ```IO::SEEK_SET, IO::SEEK_END``` και ```IO::SEEK_CUR```.

Το παρακάτω πρόγραμμα δημιουργεί ένα νέο αρχείο, μεταβαίνει στο χιλιοστό byte του αρχείου, γράφει το αλφαριθμητικό ```bla\n```, και εμφανίζει το μέγεθος του αρχείου. Πόσο είναι το μέγεθος του αρχείου;
```ruby
#!/usr/bin/ruby
# fileseek.rb -- Ruby program that navigates inside a file
begin
  fd = File.open("test.txt", File::CREAT | File::WRONLY)
rescue Exception => e
  STDERR.puts(e)
  exit!(1)
end
begin
  fd.seek(1000, IO::SEEK_END)
  fd.syswrite("bla\n")
  puts("File test.txt size: #{File.size('test.txt')} bytes\n")
  retrn = 0
rescue Exception => e
  STDERR.puts(e)
  retrn = 2
ensure
  fd.close
  File.unlink("test.txt")
  exit(retrn)
end
```
Εκτελώντας το πρόγραμμα:
```bash
$ ./fileseek.rb 
File test.txt size: 1004 bytes 
```
Παρατηρήστε ότι, όπως και στη C, μπορούμε να γράψουμε πέραν του τέλους του αρχείου ```test.txt```, το οποίο στην αρχή είναι κενό.

Η C διαθέτει τις εντολές ```dup(2)``` και ```dup2(2)``` για την αντιγραφή των περιγραφέων αρχείων (file descriptors). Η ```dup(oldfd)``` βρίσκει το μικρότερο ελεύθερο περιγραφέα αρχείου και τον αντιστοιχεί στην ίδια οντότητα με αυτόν που του περνάμε ως παράμετρο. Να πως δουλεύει η ```dup``` όταν θέλουμε π.χ. να αλλάξουμε τη ροή εξόδου ```STDOUT```:

* ανοίξτε το αρχείο για δημιουργία ή εγγραφή (έστω fd ο περιγραφέας του αρχείου)
* κλείστε τον περιγραφέα 1 (```STDOUT```)
* αντιγράψτε τον fd  με την ```dup(fd)```, η οποία θα πάρει τον πρώτο ελεύθερο περιγραφέα, δηλ. το 1
* κλείστε το αρχείο για να ελευθερώσετε τον περιγραφέα του

Η ```dup2(oldfd, newfd)``` ελευθερώνει τον περιγραφέα αρχείου newfd, εφόσον είναι δεσμευμένος, και τον αντιστοιχεί στην ίδια οντότητα με τον ```oldfd```. Με την ```dup2``` τα πράγματα είναι πιο εύκολα: ```dup2(fd, 1)```.
Στη Ruby, η ```dup``` λέγεται ```sync```, οπότε:

 * ανοίξτε το αρχείο για δημιουργία ή εγγραφή (έστω ```fd``` ο περιγραφέας του αρχείου)
 * ενεργοποιήστε τη ```sync``` του αρχείου
 * επαναρχικοποιήστε το ```STDOUT``` με ένα αντίγραφο του αρχείου
 * κλείστε το αρχείο για να ελευθερώσετε τον περιγραφέα του

```ruby
$ irb 
irb(main):001:0> File.open("test.txt", "w") do |fd| 
irb(main):002:1* fd.sync = true 
irb(main):003:1> STDOUT.reopen(fd) 
irb(main):004:1> end 
```
Εκτελώντας τις παραπάνω εντολές από το ```irb```, θα παρατηρήσετε ότι πλέον η έξοδος οδηγείται στο αρχείο ```test.txt```.
Στη C μπορείτε να λάβετε περισσότερες πληροφορίες για τα αρχεία και τους καταλόγους με τις εντολές ```stat(2), lstat(2)``` και ```fstat(2)```. Ομοίως, η κλάση ```File``` της Ruby διαθέτει τις μεθόδους ```stat``` και ```lstat```. Οι μέθοδοι αυτές επιστρέφουν μια δομή του τύπου ```File::Stat```.
```ruby
$ irb 
irb(main):001:0> File.stat("test.txt") 
=> #<File::Stat dev=0x801, ino=201187, mode=0100644, nlink=1, uid=1000, gid=1000, rdev=0x0, size=236, blksize=4096, blocks=8, atime=Sun Dec 27 21:07:34 -0800 2009, mtime=Sun Dec 27 21:23:46 -0800 2009, ctime=Sun Dec 27 21:23:46 -0800 2009> 
irb(main):002:0> File.stat("test.txt").size 
=> 236 
irb(main):003:0> File.stat("test.txt").mtime 
=> Sun Dec 27 21:23:46 -0800 2009 
irb(main):004:0> File.stat("test.txt").directory? 
=> false 
irb(main):005:0> File.stat("test.txt").file? 
=> true 
irb(main):006:0> File.stat("test.txt").executable? 
=> false 
irb(main):007:0> File.stat("test.txt").symlink? 
=> false 
irb(main):008:0> File.stat("test.txt").writable? 
=> true
``` 
Δώστε ```ri File::Stat``` από τη γραμμή εντολών για να δείτε περισσότερες πληροφορίες. Εναλλακτικά, εγκαταστήστε την εφαρμογή **Ruby Browser*** από το Κέντρο Λογισμικού Ubuntu και ανοίξτε την από το μενού **Εφαρμογές --> Προγραμματισμός**.

Μπορείτε να λάβετε τις ίδιες πληροφορίες για ένα αντικείμενο της κλάσης ```File``` χρησιμοποιώντας τη μέθοδο ```Pathname```:
```ruby
$ irb 
irb(main):001:0> require 'pathname' 
=> true 
irb(main):002:0> fd = Pathname.new("test.txt") 
=> #<Pathname:test.txt> 
irb(main):003:0> fd.size 
=> 236 
```
Δώστε ```ri Pathname``` από τη γραμμή εντολών για περισσότερες πληροφορίες.

## Άλλα χρήσιμα εργαλεία
Στη C, οι εντολές ```getpw...``` (π.χ. ```getpwent(3)```) μας επιτρέπουν να λαμβάνουμε πληροφορίες από το αρχείο ```/etc/passwd```. Αντίστοιχα, οι εντολές ```getgr...``` (π.χ. ```getgrent(3)```) επιστρέφουν πληροφορίες για το αρχείο ```/etc/group``` Στη Ruby, το module ```Etc``` διαθέτει χρήσιμες μεθόδους διαχείρισης των παραπάνω αρχείων:
```ruby
$ irb 
irb(main):001:0> require 'etc' 
=> true 
irb(main):002:0> Etc.getlogin 
=> "john" 
irb(main):003:0> Etc.getpwnam('john') 
=> #<struct Struct::Passwd name="john", passwd="x", uid=1000, gid=1000, gecos="john,,,", dir="/home/john", shell="/bin/bash"> 
irb(main):004:0> puts "Hello #{Etc.getpwuid.name}" 
Hello john 
=> nil 
irb(main):005:0> p "You are using shell #{File.basename(Etc.getpwuid.shell)}" 
"You are using shell bash" 
=> nil 
irb(main):006:0> p "root's shell #{Etc.getpwnam('root').shell}" 
"root's shell /bin/bash" 
=> nil 
irb(main):007:0> username = Etc.getpwuid(1000).name 
=> "john" 
irb(main):008:0> group = Etc.getgrgid(1000).name 
=> "john" 
irb(main):009:0> Etc.getpwuid(1000).passwd 
=> "x" 
irb(main):010:0> Etc.getgrnam('john') 
=> #<struct Struct::Group name="john", passwd="x", gid=1000, mem=[]> 
```
Η διαχείριση καταλόγων στη C γίνεται με τις εντολές: ```opendir(3), closedir(3), seekdir(3)``` και ```readdir(3)```. Για τη διαχείριση των καταλόγων, η Ruby διαθέτει την κλάση ```Dir```:
```ruby
$ irb 
irb(main):001:0> Dir.mkdir("NewFolder") 
=> 0 
irb(main):002:0> Dir.open("NewFolder") 
=> #<Dir:NewFolder> 
irb(main):003:0> Dir.chdir("NewFolder") 
=> 0 
irb(main):004:0> Dir.chdir("..") 
=> 0 
irb(main):005:0> Dir.rmdir("NewFolder") 
=> 0 
```
Ας δούμε ένα πιο χρήσιμο πρόγραμμα, που εξομοιώνει την εντολή ```ls -al```:
```ruby
#!/usr/bin/ruby
# list.rb -- Ruby program that emulates ls -al
require 'getoptlong'
require 'etc'

opts = GetoptLong.new(
        ["--long", "-l", GetoptLong::NO_ARGUMENT],
        ["--all", "-a", GetoptLong::NO_ARGUMENT])

format_all = format_long = false
opts.each do |opt, arg|
  format_long = (opt == "--long") # if opt == "--long" then format_long = true
  format_all = (opt == "--all") # if opt == "--all" then format_all = true
end

begin
  raise "Usage: #{$0} [-a|-l|--all|--long] [dir]" if ARGV and ARGV.length > 1
  ARGV[0] ||= '.' # if ARGV[0] doesn't exist, set to '.'
  Dir.open(ARGV[0]) do |dir|
    if not format_all then # keep only those directories which do not start with '.'
      names = dir.find_all {|name| name !~ /^\./}
    else
      names = dir.to_a
    end

    if format_long then
      names.each do |name|
        stats = File.lstat("#{ARGV[0]}/#{name}")
        print ("#{stats.mode} #{stats.nlink} #{Etc.getpwuid(stats.uid).name}")
        print (" #{Etc.getgrgid(stats.gid).name} #{stats.size}")
        puts ("\t#{stats.ctime.strftime('%d %b %H:%M')} #{name}")
      end
    else
      puts(names)
    end
  end

rescue Exception => e
  STDERR.puts(e)
  exit(1)
end
```
Ας αναλύσουμε λίγο το πρόγραμμα. Η ```GetoptLong``` κάνει την ίδια δουλειά όπως και στη C, δηλ. επιτρέπει να ορίζουμε ορίσματα σε συντετμημένη (π.χ. ```-l```) και πλήρη (π.χ. ```--long```) μορφή. Στη συνέχεια, ορίζουμε δυο ```boolean``` μεταβλητές, ```format_all``` και ```format_long```, και τις αρχικοποιούμε ανάλογα με τα ορίσματα γραμμής εντολών που έδωσε ο χρήστης. Αν ο χρήστης έδωσε ```-a``` ή ```–-all```, τότε εμφανίζουμε και τους καταλόγους ```.``` και ```..```, διαφορετικά όχι. Αντίστοιχα, αν ο χρήστης έδωσε ```-l``` ή ```--l```, τότε φροντίζουμε να εμφανίσουμε όλες τις πληροφορίες, όπως τα δικαιώματα (```stats.mode```), τα ```userid``` και ```groupid```, την ημερομηνία τελευταίας τροποποίησης (```ctime```) κλπ.

## Σήματα
Τα σήματα είναι μηχανισμοί που μας επιτρέπουν να αντιδρούμε στα γεγονότα που συμβαίνουν κατά την εκτέλεση των διαδικασιών (processes). Αποτελούν ασύγχρονες λογικές διακοπές. Τα γεγονότα αυτά μπορούν να είναι:

* μη αναμενόμενα (π.χ. ```[Ctrl]-[C]```)
* προγραμματιστικά λάθη (π.χ. λάθη διευθυνσιοδότησης)
* παραγόμενα από το πρόγραμμα

Η διαδικασία που ενεργοποιείται από το γεγονός, εκτελεί κατάλληλο κώδικα διαχείρισης του γεγονότος/σήματος και ονομάζεται _διαδικασία διαχείρισης του σήματος_. Υπάρχουν  διαδικασίες που δεν επηρεάζονται από συγκεκριμένα γεγονότα/σήματα, δηλ. τα αγνοούν.

Η διαχείριση των σημάτων μπορεί να συνεπάγεται:

* εκτέλεση κώδικα μιας συνάρτησης
* αντιστοίχιση σε κάποιο σήμα συστήματος (π.χ. ```SIGKILL```)
* μια εξ ορισμού διαχείριση του σήματος

Για αυτό το σκοπό η C διαθέτει τη βιβλιοθήκη ```sys/signal.h```, που αντιστοιχεί σε κάθε σήμα μια συμβολική σταθερά:

| Σήμα | Επεξήγηση |
|```SIGINT (2)``` | Σήμα διακοπής, εγείρεται από κάθε διαδικασία όταν δώσουμε το συνδυασμό πλήκτρων ```[Ctrl]-[C]```. |
|```SIGQUIT (3)``` | Όπως και η SIGINT, μόνο που δημιουργεί ένα αρχείο core που μπορεί ν' αναλυθεί με έναν debugger. Με break είτε με ```[Ctrl]-[X]```.|
|```SIGKILL (9)``` | Καταστρέφει τη διαδικασία. Η διαδικασία τερματίζει αμέσως. |
|```SIGSTOP (17)``` | Σταματάει μια διαδικασία. |
|```SIGTSTP (18)``` | Σταματάει μια διαδικασία από το πληκτρολόγιο (```^Z```). |
|```SIGCONT (19)``` | Συνεχίζει την εκτέλεση μιας σταματημένης διαδικασίας. |
|```SIGBUS (10)```| Εμφανίζεται αν έχει γίνει λανθασμένη αρχικοποίηση δεικτών. |
|```SIGALARM (14)``` | Εμφανίζεται όταν έχει λήξει μια προθεσμία.|
|```SIGCHLD (20)``` | Συνεχίζει την πατρική διαδικασία όταν τερματίζεται η διαδικασία παιδί.|
|```SIGUSR1 (30)``` &  ```SIGUSR2 (31)``` | Δεν είναι προκαθορισμένα. Ο προγραμματιστής μπορεί να τα χρησιμοποιεί κατά βούληση, για συγχρονισμό των διαδικασιών του. |

Το παρακάτω πρόγραμμα εμφανίζει μια λίστα με όλα τα διαθέσιμα σήματα. Η ```strsignal()``` επιστρέφει τη συμβολική σταθερά του σήματος, δοθέντος του αριθμού του, ενώ η NSIG, που ορίζεται στη ```signal.h```, περιέχει το σύνολο των διαθέσιμων σημάτων στο σύστημα.
```c
// signals.c - displays all available signals
 
#include <stdio.h>
#include <signal.h>
#include <unistd.h>

int main(void) {
  int i;
  
  for (i = 0; i < NSIG; i++)
    printf("%d : %s\n", i, strsignal(i));
  
  return 0;
}
```
Η Ruby διαθέτει επίσης μια κλάση ```Signal```, με μια μέθοδο ```list```. Αυτή επιστρέφει έναν κατακερματισμένο πίνακα, τα κλειδιά του οποίου είναι τα συμβολικά ονόματα, ενώ οι τιμές του είναι οι αριθμοί των σημάτων. Το παρακάτω πρόγραμμα επιστρέφει ότι και το πιο πάνω της C. Αντιστρέφουμε τις θέσεις  κλειδιών και τιμών και ταξινομούμε τον πίνακα για να πετύχουμε το παραπάνω αποτέλεσμα:
```ruby
#!/usr/bin/ruby
# signals.rb -- Ruby program that displays all available system signals
Signal.list.invert.sort.each do |pair|
    p (pair.join(" : "))
end
```
Στη C, μια διαδικασία στέλνει ένα σήμα ```SIG``` σε μια άλλη διαδικασία PID με χρήση της ```kill(PID, SIG)```. Αν ```PID=0```, το σήμα στέλνεται σ' όλες τις διαδικασίες. Αν ```PID=-1```, το σήμα στέλνεται σ' όλες τις διαδικασίες πλην των διαδικασιών συστήματος, της διαδικασίας με ```PID=1 (init)``` και της διαδικασίας που  απέστειλε το σήμα. Μόνο ο superuser μπορεί να στείλει ένα τέτοιο σήμα. Αν ```PID=-n```, το σήμα στέλνεται σ' όλες τις διαδικασίες που ανήκουν στην ομάδα ```n```. Αν ```PID=n``` το σήμα στέλνεται στη διαδικασία ```n```. Αν ```SIG=0```, δεν στέλνεται κανένα σήμα (απλά χρησιμοποιείται για να ελέγξουμε την ύπαρξη του PID).

Όταν μια διαδικασία λαμβάνει ένα σήμα, σταματά την εκτέλεσή της και εκτελεί την αντίστοιχη συνάρτηση διαχείρισης του σήματος. Στη συνέχεια, η εκτέλεση της διαδικασίας συνεχίζεται κανονικά, εκτός από την περίπτωση του ```SIGKILL (9)```, που προκαλεί τον τερματισμό της.

Αντίστοιχα, η Ruby διαθέτει την κλάση ```Process```, η οποία διαθέτει τη μέθοδο ```kill(SIG, PID)```. Π.χ.: 
```ruby
#!/usr/bin/ruby
# process_exists.rb -- Ruby program that checks if a process is alive
begin
  Process.kill(0, 12345)
  p "Process 12345 exists"
rescue Errno::ESRCH
  p "Process 12345 doesn't exist"
end
```
Τέλος, στη C η διαχείριση των σημάτων γίνεται όπως στο παράδειγμα που ακολουθεί (βλ. ```sigaction(2)```):
```c
// signal_handler.c - handles SIGINT
#include <stdio.h>
#include <signal.h>

void handle_sig(int sig) {
  static char counter = 1;
  if (counter++ == 5) exit(0);
}

int main(void) {
  struct sigaction sa_new;
  
  sa_new.sa_handler = handle_sig;
  sigemptyset(&sa_new.sa_mask);
  sa_new.sa_flags=0;
  
  if (sigaction(SIGINT, &sa_new, NULL)) {
    perror("Error with sigaction()");
    exit(1);
  }
  
  for ( ;; );
  
  exit(0);
}
```
Αντίστοιχα, η Ruby διαθέτει τη μέθοδο ```trap```, η οποία συντάσσεται είτε ως ```Signal.trap(sig, proc)``` είτε ως ```Signal.trap(sig) {block}```:
```ruby
#!/usr/bin/ruby
# signal_handler.rb -- Handles a signal
counter = 0
Signal.trap("SIGINT") do
  counter += 1
  exit(0) if counter == 5
end

loop do; end
```
Δώστε πέντε φορές ```[Ctrl]-[C]``` για να τερματίσετε και τα δυο παραπάνω προγράμματα.

## Επίλογος
Συμπερασματικά, η Ruby είναι μια σύγχρονη γλώσσα, που όπως και οι Perl, Python κλπ. μπορεί να αποτελέσει ένα πολύ χρήσιμο εργαλείο για τους διαχειριστές και προγραμματιστές συστημάτων και να κάνει τη ζωή τους πιο εύκολη και αποτελεσματική.

## Πηγές:
1. Jaconobi, E. (2006), “Dévelopment Ruby: Programmation système sous Unix: préliminaires”, _GNU Linux Magazine_, No 85, Juillet-Août, pp. 58-74. 
2. Flanagan D., Matsumoto Y. (2008), _The Ruby Programming Language_, O’ Reilly.
3. Fitzgerald M. (2007), _Learning Ruby_, O’ Reilly.
4. Matsumoto Y. (2001), _Ruby in a Nutshell_, O’ Reilly.
5. Ruby & Ruby on Rails, Linux Magazine / France, No 33, Novembre / Decembre 2007.

---

[<-](Ruby.md)| [->](../RoR/README.md)

---