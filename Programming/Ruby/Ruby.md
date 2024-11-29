# Η γλώσσα προγραμματισμού Ruby {#Ruby}
© Γιάννης Κωστάρας

---

[<-](README.md)| [->](SystemRuby.md)

---

Η Ruby είναι μια ακόμα δημοφιλής γλώσσα προγραμματισμού, που έρχεται μαζί με τη δια­νομή Ubuntu. Πρόκειται για μια διερμηνευτική (interpreted) γλώσσα προγραμματισμού ανοικτού κώδικα, η οποία μπορεί να χρησιμοποιηθεί για πολλές κατηγορίες προγραμματισμού (multi-paradigm).

Δημιουργήθηκε από τον Yukihiro "Matz" Matsumoto το 1993. Η 1η έκδοση βγήκε το 1995, έχει δηλ. ηλικία όσο και η Java. Ο συγγραφέας της προσπάθησε να πάρει τα καλύτερα στοιχεία από τις πιο διαδεδομένες γλώσσες προγραμματισμού, όπως οι Perl, Python, Smalltalk, Java, C, C++ κ.ά. Είναι, όπως θα δούμε, μια απ’ τις πιο εκφραστικές και συνοπτικές γλώσσες προγραμματισμού. Συνοπτικά η Ruby είναι:

* Ανοικτού κώδικα (Open Source)
* Multi-paradigm, δηλ. μπορεί να χρησιμοποιηθεί με πολλά μοντέλα προγραμματισμού, όπως συναρτησιακά (functional/procedural)  ̶ βλέπε C, Pascal, Fortran   ̶ αντικειμενοστραφή (object oriented)   ̶ βλέπε Java, C++, C#,Smalltalk κ.ά.
* Interpreted, ή διερμηνευτική, δηλ. το πηγαίο πρόγραμμα εκτελείται ως έχει (όπως π.χ. στη Python ή στη Perl), σε αντίθεση με τις compiled ή μεταγλωτιστικές γλώσσες όπου το πηγαίο πρόγραμμα μεταγλωτίζεται πρώτα και παράγεται το αρχείο προς εκτέλεση (π.χ. Fortran, C/C++/C#, Pascal, Java).

Πολύ διαδεδομένη είναι επίσης και η γλώσσα προγραμματισμού [Ruby on Rails](http://rubyonrails.org/) για ανάπτυξη διαδι­κτυακών εφαρμογών.
Αν και ως διερμηνευτική γλώσσα, είναι πάντα πιο αργή κατά την εκτέλεσή της από τις μετα­γλωτιστικές γλώσσες προγραμματισμού, όπως η Java και η C, ο χρόνος δημιουργίας και εκτέλεσης προγραμμάτων είναι πολύ πιο άμεσος και γρήγορος, καθώς δεν υπάρχει το ενδιάμεσο βήμα παραγωγής του εκτελέσιμου αρχείου.

## Εγκατάσταση της Ruby
Εκδόσεις της Ruby διατίθενται για όλες τις πλατφόρμες των Windows, Unix, Linux και MacOS. Μπορείτε να κατεβάσετε το κατάλληλο περιβάλλον ανάπτυξης για τον λειτουργικό σας σύστημα από το http://www.ruby-lang.org/en/downloads/. Πλέον η Ruby έρχεται προεγκατεστημένη σε όλα τα Unix-οειδή περιβάλ­λοντα και φυσικά και στο Ubuntu. Για να το διαπιστώσετε, δώστε από το κέλυφος την εντολή:
```ruby
$ ruby –version
```
ή
```ruby
$ ruby -v
```
Θα πρέπει να δείτε κάτι σαν το παρακάτω:
```ruby
ruby 1.8.7 (2008-08-11 patchlevel 72) [i486-linux] 
```
Αν όχι, τότε μπορείτε να την εγκαταστήσετε δίνοντας την εντολή:
```bash
% sudo apt-get install ruby irb rdoc fxri
```
## Περιβάλλοντα ανάπτυξης
Υπάρχουν πολλά περιβάλλοντα ανάπτυξης εφαρμογών Ruby, όπως:

* [Aptana](http://www.aptana.com)
* [Jetbrains RubyMine](http://www.jetbrains.com/ruby/download/)
* [Netbeans](http://www.netbeans.org)
* [FreeRide](http://rubyforge.org/projects/freeride)
* [TextMate για MacOS](http://macromates.com/)
* [TryRuby](http://tryruby.hobix.com/) όπου μπορείτε να δοκιμάσετε τη γλώσσα χωρίς να χρειαστεί να την εγκαταστήσετε τοπικά στον Η/Υ σας. 

## Το πρώτο σας πρόγραμμα
Αν εγκαταστήσατε τη Ruby, τότε ανοίξτε ένα παράθυρο κελύφους (shell) και πληκτρολογείστε:
```ruby
$ irb
```
που σημαίνει 'interactive ruby shell'. Αν εγκαταστήσατε και το ```fxri``` που σας παρέχει και on-line βοήθεια, μπορείτε να το εκκινήσετε δίνοντας την εντολή ```fxri``` αντί για την ```irb```. Πληκτρολογήστε την παρακάτω εντολή:
```ruby
irb(main):001:0> puts "Hello world!"
```
και πατήστε ```Enter```.
```ruby
Hello world!
=> nil
```
Παρατηρήστε πόσο άμεσο ήταν το αποτέλεσμα χωρίς να περιμένουμε να μεταγλωτιστεί το πρόγραμμα. Η εντολή ```puts``` εκτυπώνει στη μονάδα εξόδου, δηλ. την οθόνη. Αντίστοιχα, υπάρχει και η εντολή ```gets``` η οποία διαβάζει από τη μονάδα εισόδου, δηλ. το πληκτρολόγιο. 
Πληκτρολογήστε ```exit``` για να βγείτε από το πε­ριβάλλον εργασίας της Ruby. Ανοίξτε τον αγα­πημένο σας επεξεργαστή κειμένου και πλη­κτρολογήστε το ακόλουθο πρόγραμμα:
```ruby
puts "Hello. What is your name?"
myname = gets()
puts "Well, hello there #{myname}"
```
Αποθηκεύστε το αρχείο με όνομα ```Hello.rb```. Στη γραμμή εντολών, μεταφερθείτε στον κατάλογο που αποθηκεύσατε το παραπάνω αρχείο και πληκτρολογήστε:
```ruby
$ ruby Hello.rb
Hello. What is your name?
John
Well, hello there John
```
Μπορείτε επίσης να εκτελέσετε το αρχείο δίνοντας απλά την εντολή 
```ruby
$ ./Hello.rb
```
αν προσθέσετε την ακόλουθη γραμμή στην αρχή του προγράμματός σας, δηλ.:
```ruby
#!/usr/bin/ruby
puts "Hello. What is your name?"
myname = gets()
puts "Well, hello there #{myname}"
```
## Σύγκριση με άλλες γλώσσες προγραμματισμού
Οι αρετές της Ruby έρχονται στην επιφάνεια όταν πρόκειται να τη συγκρίνετε με άλλες γλώσσες προγραμματισμού. Π.χ. ένα πρόγραμμα Ruby που δεν κάνει τίποτα, είναι απλά ... ένα κενό αρχείο ή ένα πρόγραμμα χωρίς καμία εντολή! Αντίθετα, π.χ. στη Java, ένα πρόγραμμα που δεν κάνει τίποτα πρέπει να ‘χει τις ακόλουθες εντολές:
```java
class Empty {
   public static void main (String args[]) { }
}
```
## Τύποι και δομές δεδομένων
Η Ruby διαθέτει ένα πλούσιο ρεπερτόριο τύπων και δομών δεδομένων. Διαθέτει τους απλούς τύπους δεδομένων ```String``` και ```Number``` (```FixNum, BigNum, Float```) καθώς και συλλογές όπως ```Range, Array``` και ```Hash```. Στη Ruby τα πάντα είναι αντικείμενα, ακόμα και οι αριθμοί. Όλα κληρονομούν από την κλάση ```Object```.
```ruby
1.class → FixNum
0.5.class → Float
```
Στη Ruby δεν δηλώνουμε τον τύπο δεδομένων μιας μεταβλητής, όπως π.χ. στη C. Οι τύποι δεδομένων στη Ruby είναι δυναμικοί, αντίθετα με τους στατικούς τύπους δεδομένων γλωσσών όπως οι C, Pascal, Java κλπ. Έτσι, π.χ. ένας ακέραιος στη Ruby ορίζεται π.χ. ως:
```ruby
myInteger = 0
```
κι ένα αλφαριθμητικό ως:
```ruby
s = 'This is a String'
```
Υπάρχουν δυο τύποι δεδομένων για την αναπα­ράσταση αριθμών στη Ruby: ```Fixnum (-2-30 – 230-1)``` και ```BigNum``` (εκτός των παραπάνω ορίων). Η μετατροπή γίνεται αυτόματα.

Ο τύπος δεδομένων _Σειρά_ ή _Διάστημα (Range)_ αποθηκεύει μια σειριακή ακολουθία τιμών, όπως π.χ. ```1``` ως ```9``` ή ```Α``` ως ```Ω```. Μια σειρά ορίζεται από την τιμή αρχής, τα ```..``` ή ```...``` και την τιμή τέλους. Π.χ.
```ruby
capital_letters = 'A'..'D' → ["A","B","C","D"]
numbers = 0..9 → [0,1,2,3,4,5,6,7,8,9]
years_of_birth = 1970...1973 → [1970,1971,1972]
```
Παρατηρήστε ότι στο τελευταίο παράδειγμα (```...```), το διάστημα είναι ανοικτό, δηλ. δεν περιλαμβάνει την τιμή τέλους. Παραδείγματα πινάκων και κατακερματισμένων πινάκων (hashtables) φαίνονται παρακάτω:
```ruby
empty_array = []
empty_array = Array.new
int_array = [1,2,3,4,5,6]
random_array = [1, 'Hi', 3.14]
two_dimensional_array = [[1,2],[2,1]]
myarray = (1..9).to_a # μετατροπή σε array
my_hash = { 'one' => 1, 'two' => 2 } 
my_hash['three'] = 3
```
## Διαδικαστικός/Συναρτησιακός προγραμματισμός
Όπως είπαμε, η Ruby μπορεί να χρησιμοποιηθεί με πολλά προγραμματιστικά στυλ, όπως ο _διαδικαστικός (procedural) / συναρτησιακός (functional)_. Μ’ αυτόν τον τρόπο, μπορεί κάλλι­στα ν’ αντικαταστήσει παραδοσιακές διαδικα­στικές γλώσσες όπως οι: Pascal, C, Fortran, Basic. 
Ένα μπλοκ εντολών στη Ruby δηλώνεται με τις εντολές ```begin ... end```.
Υπάρχει εντολή ```if ... elsif ... end```, ενώ η εντολή ```case``` συντάσσεται ως εξής (το ```ARGV``` είναι ένα array με τα ορίσματα γραμμής εντολής):
```ruby
case ARGV.length
  when 0
  puts "usage #{$0} arg1 arg2" 
   when 1
  puts "Hello #{ARGV[0]}"
   when 2
  puts "Hello #{ARGV[0]} #{ARGV[1]}"
   else
  puts "Tοo many arguments"
end
``` 
Παρατηρήστε ότι δεν απαιτείται η χρήση εντολής ```break``` στο τέλος κάθε ```when```. Η case στη Ruby είναι αρκετά ευέλικτη σε σχέση με τις Java, C, C++, C#. Κοιτάξτε κι αυτό:
```ruby
case a
   when Integer
  puts "Type: Integer "
   when String
  puts "Type: String"
   else
  puts "Type: #{a.class.to_s}"
end
```
Υπάρχει κι εδώ ο τριαδικός τελεστής ```?```
```ruby
(ARGV.length>0) ? puts "Hello " + ARGV[0] :          puts "Usage #{$0} name"
```
ενώ η εντολή ```if``` μπορεί να μπει και στο τέλος της πρότασης
```ruby
puts "Hello " + ARGV[0] if (ARGV.length>0)
```
Η Ruby διαφέρει όμως αρκετά όσον αφορά τους βρόγχους, από τις γλώσσες C, C++, C#, Java. Ακολουθεί τη σύνταξη της Smalltak κι αυτό ίσως ξενίσει μερικούς. Όπως θα δούμε όμως, έχει το πλεονέκτημα ότι δεν χρειάζεται να δηλώσετε μετρητή. 
Ας ξεκινήσουμε με το βρόγχο ```for```
```ruby
for arg in ARGV 
 print " #{arg}"
end
```
το οποίο μπορεί να γραφεί κι ως:
```ruby
print "Hello"
ARGV.each { 
 |arg| print "#{arg}"
}
```
Ο πιο πάνω κώδικας χρησιμοποιεί closures, δηλ. μπορείτε να περάσετε ένα μπλοκ κώδικα ως όρισμα σε μια μέθοδο!
Ο βρόγχος ```for``` μπορεί να γραφτεί και με τους παρακάτω τρόπους:
```ruby
# CountToTen.rb -- Count to ten
(1..10).each do 
 |i| print " #{i}"
end
puts 'All done!'
```
το οποίο μπορεί να γραφτεί και διαφορετικά ως:
```ruby
# CountToTen.rb -- Count to ten
for i in (1..10) 
 print " #{i}"
end
puts 'All done!'
```
ή ακόμα και ως:
```ruby
1.upto(10) { 
 |i| print " #{i}"
}
puts 'All done!'
```
Φυσικά υπάρχουν και οι βρόγχοι ```while``` και ```until```:
```ruby
x = 0
while (x < 10)
 print x.to_s 
 x += 1
end
```
Το αποτέλεσμα είναι: ```0123456789```. 
Ο παραπάνω βρόγχος μπορεί να γραφτεί κι ως:
```ruby
x = 0
until (x >= 10)
 print x.to_s
 x += 1
end
```
ή και ως
```ruby
x = 0
begin
 print x.to_s
 x += 1
end until (x >= 10)
```
Παρατηρήστε ότι δεν υπάρχουν οι τελεστές ```++``` και ```--```. Αντί αυτών χρησιμοποιήστε τους ```+=1``` και ```-=1```.

H Ruby διαθέτει επίσης και τις εντολές ```break``` και ```next```, που είναι αντίστοιχες με τις ```break``` και ```continue``` στις Java/C. Η πρώτη σταματάει το βρόγχο και συνεχίζει με την επόμενη εντολή που ακολουθεί το βρόγχο, ενώ η δεύτερη αγνοεί τον κώδικα που ακολουθεί μέχρι το τέλος του βρόγχου και συνεχίζει στην επόμενη επανάληψη.

## Αντικειμενοστρεφής προγραμματισμός
Όπως είπαμε, τα πάντα στη Ruby είναι κλάσεις. Όπως και σ’ άλλες αντικειμενοστρεφής γλώσσες προγραμματισμού (όπως C++, C#, Java, Python), έτσι κι η Ruby σας επιτρέπει να δημιουργήσετε αντικείμενα από κλάσεις που εσείς ορίζετε. Αντίθετα όμως με strong ή static typed γλώσσες όπως οι C#, C++ και Java, η Ruby, ως dynamic typed δεν απαιτεί να δηλώνεται ο τύπος κάθε αντικειμένου. Όπως και στη Java και τη C#, έτσι και στη Ruby, όλες οι κλάσεις κληρονομούν απ’ την κλάση Object. Τέλος, όπως και η Java και η C#, η Ruby δεν υποστηρίζει πολλαπλή κληρονομι­κότητα.
Ορίζουμε μια κλάση στη Ruby όπως φαίνεται παρακάτω:
```ruby
# car.rb – class definition
class Car
 # constructor 
 def initialize(color, speed)
   @color = color  # attribute
   @speed = speed
   self.info
 end
 # method
 def accelerate(speed)
   @speed += speed
   self.info
 end
 # another method
 def info()
   puts "Car info (color: #{@color}, speed:    #{@speed.to_s})"
 end
end
```
Οι ιδιότητες (attributes) δηλώνονται με το ```@``` και οι μέθοδοι με τη δεσμευμένη λέξη ```def```. Η μέθοδος κατασκευής (constructor) ονομάζεται ```initialize```. 
```ruby
>> car = Car.new('black', 0)
Car info (color: black, speed: 0)
>> car.accelerate(10)
Car info (color: black, speed: 10)
```
Ένα χαρακτηριστικό της Ruby, που μερικές φορές μπορεί να αποβεί κι άκρως επικίνδυνο, είναι ότι μπορούμε να επεκτείνουμε μια υπάρ­χουσα κλάση, χωρίς να χρειάζεται να παρα­θέσουμε ολόκληρο τον κώδικά της, π.χ.
```ruby
class String
 def writesize
   puts self.size
 end
end
>> size_writer = "Tell me my size!"
>> size_writer.writesize → 16
```
Στο πιο πάνω παράδειγμα είδαμε ότι επεκτείναμε την κλάση String της Ruby προσθέτοντας μια νέα μέθοδο ```writesize```.
Οι ιδιότητες της κλάσης ```Car```, που ορίσαμε πα­ραπάνω, δεν είναι προσπελάσιμες εκτός της κλάσης. Ο παρακάτω κώδικας δημιουργεί με­θόδους ```get``` και ```set``` για τις ιδιότητες της κλάσης ```Car```:
```ruby
# car.rb – class definition
class Car
 #getColour 
 def colour
   @colour
 end
 #setColour
 def colour=(colour)
   @colour=colour
end
>> car.colour='white'
>> puts car.colour
white
```
Για να διαβάσουμε μια ιδιότητα, αρκεί να ορί­σουμε μια μέθοδο με τ’ όνομά της που να περιέχει την ιδιότητα (η τιμή της τελευταίας εντολής μιας μεθόδου είναι αυτή που η μέθοδος επιστρέφει). Για να θέσετε/αλλάξετε την τιμή μιας ιδιότητας, δηλώνετε μια μέθοδο με τ’ όνομά της που ν’ ακολουθείται από το ```=``` και το όνομα ενός ή περισσοτέρων ορισμάτων.

Η Ruby διαθέτει κι έναν πιο εύκολο τρόπο να ορίσουμε αυτές τις μεθόδους, όπως φαίνεται στα παρακάτω παραδείγματα:
```ruby
# car.rb – class definition
class Car
 attr_reader :color, :speed
 attr_writer :color, :speed
end
ή
class Car
 attr_accessor :color, :speed
end
```
Η παραπάνω δήλωση, ορίζει μεθόδους ```get/set``` ή αλλιώς read/write για τις ιδιότητες της κλάσης. Βέβαια, έτσι χάνουμε την ευελιξία να προσαρμόσουμε τις μεθόδους αυτές αν χρειάζεται π.χ. να ελέγξουμε αν οι τιμές των ορισμάτων είναι έγκυρες.
Όλες οι μέθοδοι που ορίσαμε πιο πάνω είναι ```public```, δηλ. προσβάσιμες από οποιαδήποτε άλλη κλάση ή μπλοκ κώδικα. Αν θέλουμε να πε­ριορίσουμε ποιος μπορεί να προσπελάσει τις μεθόδους της κλάσης μας, χρησιμοποιούμε τις δεσμευμένες λέξεις ```private``` και ```protected```:
```ruby
# car.rb – class definition
class Car
 private
   def testDrive
   end
 protected
   attr_accessor :category
 public
   attr_accessor :color, :speed
end
```
Οι ιδιότητες και οι μέθοδοι που δηλώνονται ```private``` είναι προσβάσιμες μόνο από το μπλοκ της κλάσης, ενώ αυτές που δηλώνονται ```protected``` είναι προσβάσιμες και από τις κλάσεις παιδιά δηλ. που κληρονομούν απ’ αυτήν την κλάση, όπως π.χ. την ακόλουθη:
```ruby
# SportCar.rb – class definition
class SportCar < Car
 def initialize(seats)
   @seats = seats
 end
end
```
Η κληρονομικότητα δηλώνεται με το ```<``` και την πατρική κλάση.
Προσέξτε ότι οι λέξεις ```private``` και ```protected``` δηλώνουν με την ιδιότητά τους τις γραμμές κώδικα που ακολουθούν, μέχρι ν’ συναντήσουν κάποια άλλη δεσμευμένη λέξη, όπως π.χ. ```public```. 
Οι στατικές ιδιότητες δηλώνονται με το ```@@``` ενώ οι στατικές μέθοδοι έχουν ως πρόθεμα το όνομα της κλάσης χωρισμένο με την τελεία (```.```):
```ruby
class Car
 NUM_OF_WHEELS = 4 # constant
 @@wheels = NUM_OF_WHEELS
 def Car.static_method()
 end
end
```
## Δομές και Ενότητες
Η Ruby υποστηρίζει δομές όπως οι C, C++. Μια _δομή (structure)_ είναι ένας απλός τρόπος να ομαδοποιήσετε μεταξύ τους δεδομένα (ή ιδιότητες – attributes). Η διαφορά της από έναν πίνακα κατακερματισμού είναι ότι δεν μπορούμε να χρησιμοποιήσουμε μεταβλητές του ίδιου τύπου: κάθε φορά πρέπει να δημιουργούμε ένα νέο πίνακα κατακερματισμού.

Ορίζουμε μια δομή με τη δεσμευμένη λέξη ```Struct```. Η δομή είναι κι αυτή μια κλάση με τη διαφορά ότι δε διαθέτει μεθόδους.
```ruby
>> Complex = Struct::new( :x, :y)
>> z = Complex.new(3,2)
>> p "#{z.x}+i#{z.y}"#
```
Αργά ή γρήγορα θα αναγκαστείτε να σπάσετε τον κώδικά σας, είτε αυτός είναι σε μορφή μεθόδων είτε σε μορφή κλάσεων, σε αυτόνομα τμήματα ώστε να είναι ευκολότερα διαχειρίσιμος. Η Ruby διαθέτει για το σκοπό αυτό τα _modules (ενότητες ή αρθρώματα)_ που είναι αντίστοιχα με τα _packages_ στη Java και τα _namespaces_ στη C#. Μια ενότητα στη Ruby ορίζεται παρόμοια όπως και μια κλάση με τη διαφορά ότι δεν μπορείτε να ορίσετε ιδιότητες (attributes) καθώς δεν μπορείτε ούτε να κληρονομήσετε απ’ αυτή ούτε να την αρχικοποιήσετε (δηλ. να παράγετε αντικείμενα της ενότητας):
```ruby
module CarUtils
   NUM_OF_DOORS = 4
   def paint(car, color)
   ...
   end
   def repair(car)
   ...
   end
   class Wheel
   ...
   end
end 
>> puts Car::NUM_OF_DOORS    # result: 4
```
Παρατηρήστε ότι μια δομή (struct) διαθέτει μόνο ιδιότητες (attributes) ενώ μια ενότητα (module) διαθέτει μόνο μεθόδους και σταθερές. Η Ruby παρέχει έναν τρόπο να ενσωματώνει μεθόδους μιας ενότητας σε μια κλάση. Επιτρέπει με άλλα λόγια πολλαπλή κληρονομικότητα (multiple inheritance), η οποία δεν υποστηρίζεται απ’ τη Ruby. Έτσι, μπορείτε να δημιουργήσετε μια κλάση, να κληρονομήσετε από μια άλλη κλάση και να ενσωματώσετε όσες ενότητες χρειάζεστε. Π.χ.
```ruby
class Car
   include CarUtils
   ...
end 
>> puts Car::NUM_OF_DOORS # result: 4
```
## Συμπερασματικά
Μετά από αυτή τη σύντομη περιγραφή της γλώσσας, είδατε τα πλεονεκτήματά της. Η γλώσσα υποστηρίζει ακόμα εξαιρέσεις (exceptions), νήματα (threads) και διεργασίες (processes), διαχείριση αρχείων και όλα όσα χρειάζεστε από μια σύγχρονη γλώσσα προ­γραμματισμού. 

Αν ακόμα δεν έχετε πειστεί για τις δυνατότητες της γλώσσας, δείτε το παρακάτω πρόγραμμα το οποίο εξομοιώνει την εντολή ```cat``` του Unix:
```ruby
# Imitate the Unix cat utility
# ============================
# Loop across the arguments
ARGV.each { |arg|
 # Open the file for reading and write its contents to screen
 IO.foreach(arg) {|line| puts line}
}
```
Συγκρίνετέ το με το πόσες γραμμές κώδικα χρειάζονται για να γραφεί σε Java ή C!
Συμπερασματικά, η Ruby συλλέγει τα καλύτερα στοιχεία από πολλές διαδεδομένες γλώσσες προγραμματισμού, προσφέροντας ένα δυναμικό συντακτικό, που σας επιτρέπει να μάθετε γρήγορα προγραμματισμό χωρίς τις παραξενιές άλλων γλωσσών προγραμματισμού.

## Αναφορές
1. Carlson L., Richardson L., (2006), _Ruby Cookbook_, O’ Reilly. 
2. CollingBourne B., (2008), [The Little Book of Ruby](http://www.sapphiresteel.com), 2nd Edition.
3. Flanagan D., Matsumoto Y. (2008), _The Ruby Programming Language_, O’ Reilly.
4. Fitzgerald M. (2007), _Learning Ruby_, O’ Reilly.
5. Fitzgerald M. (2007), _Ruby Pocket Reference_, O’ Reilly.
6. Fulton H., (2006), _The Ruby Way_, Addison Wesley.
7. Griffiths D. (2009), _Head First Rails_, O’ Reilly. 
8. McAnally J. (2006), [Humble Little Ruby Book](http://www.humblelittlerubybook.com/).
9. Ruby & Ruby on Rails, Linux Magazine / France, No 33, Novembre / Decembre 2007.
 
---

[<-](README.md)| [->](SystemRuby.md)

---