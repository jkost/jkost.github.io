# 5.1 Ημερομηνία & Ώρα {#Java} 
© Γιάννης Κωστάρας

---

[Δ](../../README.md) | [->](../5.2-Files/README.md) 
 
---

## Εισαγωγή
Για πολλά χρόνια η γλώσσα διέθετε ένα όχι και τόσο ικανοποιητικό ΑΡΙ για την αναπαράσταση της ημερομηνίας και της ώρας. Η έκδοση 1.0 εισήγαγε την κλάση ```java.util.Date``` (μην την μπερδέψετε με την ```java.sql.Date```) η οποία αντικαταστάθηκε (deprecated) στην έκδοση 1.1 από την ```Calendar```. Η έκδοση 8, επιτέλους, εισήγαγε μια πολύ καλή υλοποίηση όπως θα δούμε στη συνέχεια.

## Date/Time API (JSR-310)
Πρόκειται για τον αντικαταστάτη των ```java.util.Date``` και ```java.util.Calendar```. Βασίζεται στη βιβλιοθήκη [Joda Time](http://www.joda.org/joda-time). Βρίσκεται στη βιβλιοθήκη (package) ```java.time``` και οι κλάσεις της είναι αμετάβλητες (immutable) πράγμα που σημαίνει ότι δεν χρειάζονται συγχρονισμό σε πολυ-νηματικά περιβάλλοντα. Ακολουθεί το χρονολογικό πρότυπο [ISO 8601](http://en.wikipedia.org/wiki/ISO_8601) αλλά υποστηρίζει τη χρήση κι άλλων χρονολογιών (π.χ. ιαπωνικό, ισλαμικό κλπ.) - (βλ. κλάση ```Chronology```). Αποτελείται από τις εξής υπο-βιβλιοθήκες:

* ```java.time```
* ```java.time.chrono```
* ```java.time.format```
* ```java.time.temporal```
* ```java.time.zone```

Το ΑΡΙ ακολουθεί κάποιες συμβάσεις οι οποίες κάνουν τη ζωή μας πιο εύκολη. Έτσι, για τη δημιουργία αντικειμένων υπάρχουν στατικές μέθοδοι κατασκευής (factory methods) ```of()```, για τη μετατροπή από έναν τύπο σε άλλο οι μέθοδοι καλούνται ```from()```, για τη μετατροπή από αλφαριθμητικά καλούνται ```parse()```, ```with()``` για ν' αλλάξετε τις τιμές των αντικειμένων κλπ.

Ας δούμε μερικά παραδείγματα. Για να δημιουργήσουμε μια νέα ημερομηνία χρησιμοποιούμε την κλάση ```LocalDate``` ενώ για μια νέα ώρα την κλάση ```LocalTime```:
```java
jshell> import java.time.*

jshell> LocalDate today = LocalDate.now();
today ==> 2018-12-10

jshell> LocalDate xmas = LocalDate.of(2018, 12, 25);
xmas ==> 2018-12-25

jshell> int year = xmas.getYear();
year ==> 2018

jshell> Month month = xmas.getMonth();
month ==> DECEMBER

jshell> int day = xmas.getDayOfMonth();
day ==> 25

jshell> DayOfWeek dow = xmas.getDayOfWeek(); 
dow ==> TUESDAY

jshell> dow.getValue();    // DayOfWeek.MONDAY ==> 1, DayOfWeek.SUNDAY ==> 7
$1 ==> 2

jshell> int len = xmas.lengthOfMonth();
len ==> 31

jshell> boolean leap = xmas.isLeapYear();
leap ==> false

jshell> today.isBefore(xmas)
$2 ==> true
  
jshell> import java.time.temporal.*

jshell> year = xmas.get(ChronoField.YEAR); 
year ==> 2018

jshell> int month_ = xmas.get(ChronoField.MONTH_OF_YEAR);
month_ ==> 12

jshell> day = xmas.get(ChronoField.DAY_OF_MONTH);
day ==> 25

jshell> LocalTime now = LocalTime.now();
now ==> 16:12:32.759312

jshell> LocalTime time = LocalTime.of(19, 45, 25);
time ==> 19:45:25

jshell> int hour = time.getHour();    
hour ==> 19

jshell> int minute = time.getMinute();  
minute ==> 45

jshell> int second = time.getSecond();  
second ==> 25

jshell> time.plusHours(5)
$3 ==> 00:45:25
   
jshell> xmas = LocalDate.parse("2018-12-25")
xmas ==> 2018-12-25
  
jshell> LocalDateTime dt1 = LocalDateTime.of(2018, Month.DECEMBER, 25, 19, 45, 23);
dt1 ==> 2018-12-25T19:45:23

jshell> LocalDateTime dt2 = LocalDateTime.of(xmas, time);
dt2 ==> 2018-12-25T19:45:25

jshell> LocalDateTime dt3 = xmas.atTime(19, 45, 23);
dt3 ==> 2018-12-25T19:45:23

jshell> LocalDateTime dt4 = xmas.atTime(time);
dt4 ==> 2018-12-25T19:45:25

jshell> LocalDateTime dt5 = time.atDate(xmas);
dt5 ==> 2018-12-25T19:45:25
  
jshell> LocalDate date1 = dt1.toLocalDate();  
date1 ==> 2018-12-25

jshell> LocalTime time1 = dt1.toLocalTime();  
time1 ==> 19:45:23

jshell> LocalTime truncatedTime = time1.truncatedTo(ChronoUnit.MINUTES);
truncatedTime ==> 19:45
  
jshell> LocalDate date2 = date1.withYear(2015); 
date2 ==> 2015-12-25

jshell> LocalDate date3 = date2.withDayOfMonth(25);
date3 ==> 2015-12-25

jshell> LocalDate date4 = date3.with(ChronoField.MONTH_OF_YEAR, 10);
date4 ==> 2015-10-25
  
jshell> LocalDate date11 = date1.plusWeeks(1);  
date11 ==> 2019-01-01

jshell> LocalDate date22 = date2.minusYears(3); 
date22 ==> 2012-12-25

jshell> LocalDate date33 = date3.plus(6, ChronoUnit.MONTHS);
date33 ==> 2016-06-25
  
jshell> LocalDate.now().until(LocalDate.of(2018, Month.DECEMBER, 25), ChronoUnit.DAYS);
$4 ==> 15
  
jshell> import java.time.format.*

jshell> DateTimeFormatter.
BASIC_ISO_DATE         ISO_DATE               ISO_DATE_TIME          ISO_INSTANT            ISO_LOCAL_DATE         
ISO_LOCAL_DATE_TIME    ISO_LOCAL_TIME         ISO_OFFSET_DATE        ISO_OFFSET_DATE_TIME   ISO_OFFSET_TIME        
ISO_ORDINAL_DATE       ISO_TIME               ISO_WEEK_DATE          ISO_ZONED_DATE_TIME    RFC_1123_DATE_TIME     
class                  ofLocalizedDate(       ofLocalizedDateTime(   ofLocalizedTime(       ofPattern(             
parsedExcessDays()     parsedLeapSecond() 

jshell> String s1 = xmas.format(DateTimeFormatter.BASIC_ISO_DATE);
s3 ==> "20181225"
  
jshell> String s2 = xmas.format(DateTimeFormatter.ISO_LOCAL_DATE);
s4 ==> "2018-12-25"
  
jshell> LocalDate.parse("20181225", DateTimeFormatter.BASIC_ISO_DATE);
$5 ==> 2018-12-25

jshell> xmas.format(DateTimeFormatter.ofLocalizedDate(FormatStyle.SHORT))
$6 ==> "25/12/2018"

jshell> xmas.format(DateTimeFormatter.ofLocalizedDate(FormatStyle.FULL))
$7 ==> "Tuesday, 25 December 2018"
  
jshell> xmas.format(DateTimeFormatter.ofLocalizedDate(FormatStyle.FULL).withLocale(Locale.forLanguageTag("el-GR")))
$8 ==> "Τρίτη, 25 Δεκεμβρίου 2018"  
  
jshell> DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
formatter ==> Value(DayOfMonth,2)'/'Value(MonthOfYear,2)'/'Value(YearOfEra,4,19,EXCEEDS_PAD)

jshell> String formattedDate = xmas.format(formatter);
formattedDate ==> "25/12/2018"

jshell> LocalDate.parse(formattedDate, formatter);
$9 ==> 2018-12-25

jshell>   DateTimeFormatter hellenicFormatter = 
   ...>            DateTimeFormatter.ofPattern("dd MMMM yyyy", Locale.forLanguageTag("el-GR"));
hellenicFormatter ==> Value(DayOfMonth,2)' 'Text(MonthOfYear)' 'Value(YearOfEra,4,19,EXCEEDS_PAD)

jshell> String formattedDate = xmas.format(hellenicFormatter); 
formattedDate ==> "25 Δεκεμβρίου 2018"

jshell> LocalDate.parse(formattedDate, hellenicFormatter)
$10 ==> 2018-12-25

jshell> DayOfWeek.SUNDAY.getDisplayName(TextStyle.SHORT,Locale.forLanguageTag("el-GR"))
$11 ==> "Κυρ"

jshell> time = LocalTime.parse("13:45:20");
time ==> 13:45:20
```

Παρατηρήστε ότι η κλάση ```DateTimeFormatter``` δε χρειάζεται συγχρονισμό όπως η ```DateFormatter``` που δεν ήταν thread safe. 

Για να βρούμε την τελευταία ημέρα του μήνα:
```java
jshell> import static java.time.temporal.TemporalAdjusters.*;

jshell> xmas.with(lastDayOfMonth())
$8 ==> 2018-12-31

jshell> YearMonth month = YearMonth.from(xmas);
month ==> 2018-12

jshell> month.atEndOfMonth();
$9 ==> 2018-12-31

jshell> TemporalAdjusters.
class                   dayOfWeekInMonth(       firstDayOfMonth()       firstDayOfNextMonth()   firstDayOfNextYear()    
firstDayOfYear()        firstInMonth(           lastDayOfMonth()        lastDayOfYear()         lastInMonth(            
next(                   nextOrSame(             ofDateAdjuster(         previous(               previousOrSame( 

jshell> // 1η Τρίτη του μήνα

jshell> LocalDate firstTuesday = LocalDate.of(2018, 12, 1).with(TemporalAdjusters.dayOfWeekInMonth(1, DayOfWeek.TUESDAY))
firstTuesday ==> 2018-12-04
```  

Υποστηρίζονται χρονικές ζώνες (time zones) (```ZoneId, ZoneOffset```). Αν οι υπολογισμοί σας ξεπερνούν τα όρια μας χρονικής ζώνης, τότε χρησιμοποιήστε την ```ZonedDateTime```.
```java
jshell> ZoneId.systemDefault()
$1 ==> Europe/Athens

jshell> ZoneId.getAvailableZoneIds()   // see www.iana.org/timezones
$2 ==> [Asia/Aden, America/Cuiaba, Etc/GMT+9, Etc/GMT+8, Africa/Nairobi, America/Marigot, Asia/Aqtau, Pacific/Kwajalein, 
America/El_Salvador, Asia/Pontianak, Africa/Cairo, Pacific/Pago_Pago, Africa/Mbabane, Asia/Kuching, Pacific/Honolulu, 
Pacific/Rarotonga, America/Guatemala, Australia/Hobart, Europe/London, America/Belize, America/Panama, Asia/Chungking, 
America/Managua, America/Indiana/Petersburg, Asia/Yerevan, Europe/Brussels, GMT, Europe/Warsaw, America/Chicago, 
Asia/Kashgar, Chile/Continental, Pacific/Yap, CET, Etc/GMT-1, Etc/GMT-0, Europe/Jersey, America/Tegucigalpa, Etc/GMT-5, 
Europe/Istanbul, America/Eirunepe, Etc/GMT-4, America/Miquelon, Etc/GMT-3, Eur ... Asia/Irkutsk, America/Shiprock, 
America/Winnipeg, Europe/Vatican, Asia/Amman, Etc/UTC, SystemV/AST4ADT, Asia/Tokyo, America/Toronto, Asia/Singapore, 
Australia/Lindeman, America/Los_Angeles, SystemV/EST5EDT, Pacific/Majuro, America/Argentina/Buenos_Aires, Europe/Nicosia, 
Pacific/Guadalcanal, Europe/Athens, US/Pacific, Europe/Monaco]

jshell> ZoneId athens = ZoneId.of("Europe/Athens");
athens ==> Europe/Athens

jshell> import java.time.format.*

jshell> athens.getDisplayName(TextStyle.FULL,Locale.forLanguageTag("el-GR"))
$2 ==> "Ώρα Ανατολικής Ευρώπης"

jshell> ZonedDateTime nowInAthens = ZonedDateTime.now(athens)
nowInAthens ==> 2018-12-11T20:58:27.802612+02:00[Europe/Athens]

jshell> nowInAthens.toInstant()
$3 ==> 2018-12-11T18:58:27.802612Z

jshell> ZoneId zoneId = TimeZone.getDefault().toZoneId();
zoneId ==> Europe/Athens

jshell> ZoneId brxId = ZoneId.of("Europe/Brussels");
brxId ==> Europe/Brussels
```

Αν προσπαθήσετε να δημιουργήσετε μια ώρα που πέφτει μέσα στην αλλαγή της ώρας (χειμερινή/θερινή), τότε υπολογίζεται η σωστή ώρα. Π.χ. στις 25 Μαρτίου 2018, η ώρα άλλαξε από χειμερινή σε θερινή ενώ στις 28 Οκτωβρίου από θερινή σε χειμερινή: 

```java
jshell> ZonedDateTime skipped = ZonedDateTime.of(LocalDate.of(2018, 03, 25), LocalTime.of(2, 30), athens)
skipped ==> 2018-03-25T02:30+02:00[Europe/Athens]

jshell> ZonedDateTime skipped = ZonedDateTime.of(LocalDate.of(2018, 03, 25), LocalTime.of(3, 30), athens)
skipped ==> 2018-03-25T04:30+03:00[Europe/Athens]

jshell> ZonedDateTime anHourLater = ZonedDateTime.of(LocalDate.of(2018, 10, 28), LocalTime.of(3, 00), athens)
skipped ==> 2018-10-28T03:00+03:00[Europe/Athens]

jshell> anHourLater.plusHours(1)
$1 ==> 2018-10-28T03:00+02:00[Europe/Athens]
```

Μια περίοδος (```Period```) αναφέρεται σε μια μεγάλη χρονική διάρκεια (ημερών, μηνών κλπ.) ενώ μια χρονική διάρκεια (```Duration```) αναφέρεται σε ώρες, λεπτά, δευτ/πτα. Η πρώτη χρησιμοποιείται στις ```LocalDate```s ενώ η δεύτερη στα ```Instant```s.

```java
jshell> LocalTime now = LocalTime.now();
now ==> 20:02:05.524716

jshell> LocalTime time = LocalTime.of(21, 00, 00);
time ==> 21:00

jshell> Duration.between(now, time);
$1 ==> PT57M54.475284S

jshell> Period sevenDays = Period.between(date1, date11);
sevenDays ==> P7D

jshell> Duration threeMinutes = Duration.ofMinutes(3);
threeMinutes ==> PT3M

jshell> threeMinutes = Duration.of(3, ChronoUnit.MINUTES)
threeMinutes ==> PT3M

jshell> sevenDays = Period.ofDays(7);
sevenDays ==> P7D

jshell> Period threeWeeks = Period.ofWeeks(3)
threeWeeks ==> P21D

jshell> Period twoYearsSixMonthsOneDay = Period.of(2, 6, 1);
twoYearsSixMonthsOneDay ==> P2Y6M1D
```

Τέλος, η κλάση ```Instant``` μετράει το χρόνο από την εποχή του Unix, δηλ. από την 1η Ιανουαρίου 1970 UTC.

```java  
jshell> Instant instant = Instant.now();
instant ==> 2018-11-10T20:43:21.757754Z

jshell> instant.atZone(ZoneId.of("UTC"))
$47 ==> 2018-12-11T19:00:27.904993Z[UTC]

jshell> Instant.ofEpochSecond(3);
$1 ==> 1970-01-01T00:00:03Z
```

_Το **UTC** σημαίνει "Coordinated Universal Time" και το ακρωνύμιο είναι ένας συμβιβασμός ανάμεσα στον αντίστοιχο αγγλικό  "Coordinated Universal Time" και τον γαλλικό όρο "Temps Universel Coordiné" όντας λάθος και στις δυο γλώσσες. Το UTC είναι η ώρα στο Greenwich Royal Observatory χωρίς την αλλαγή θερινής/χειμερινής ώρας._

Π.χ. μπορούμε να μετρήσουμε πόσο διήρκησε η εκτέλεση κάποιας μεθόδου:

```java
Instant start = Instant.now();
myMethod();
Instant end = Instant.now();
Duration timeElapsed = Duration.between(start, end);
long millis = timeElapsed.toMillis();
```

Αν θέλουμε να οπτικοποιήσουμε τι αναπαριστά καθεμιά από τις παραπάνω κλάσεις:

```
                25 Dec 2018 09:00 AM GMT
ZonedDateTime   25 Dec 2018 09:00 AM GMT
LocalDateTime   25 Dec 2018 09:00 AM
LocalDate       25 Dec 2018
LocalTime       09:00 AM
ZoneId          GMT
```

## Ασκήσεις
1. (3ος Πανελλήνιος Διαγωνισμός Πληροφορικής 1991) Να γραφεί πρόγραμμα που να υλοποιεί τα παρακάτω: (α) να εισάγονται από το πληκτρολόγιο 2 ημερομηνίες μεταξύ 1/1/1980 και 21/12/1999 (β) να εμφανίζεται στην οθόνη η διαφορά των ημερομηνιών αυτών στη μορφή: μέρες/μήνες/έτη. Να λαμβάνεται υπ' όψη ο αριθμός των ημερών κάθε μήνα καθώς και ο αριθμός των ημερών δίσεκτου έτους. Δίσεκτο έτος είναι εκείνο που διαιρείται ακριβώς με το 4 αλλά όχι με το 100, εκτός κι αν είναι του 400. _(Ο αλγόριθμος αυτός εφαρμόζεται για όλα τα προηγούμενα έτη αν και αυτό είναι ιστορικά ανακριβές. Τα δίσεκτα έτη ανακαλύφθηκαν το 46 π.Χ. και οι κανόνες διαιρετότητας με το 100 και το 400 εισήχθηκαν με τη μεταρρύθμιση του Γρηγοριανού ημερολογίου του 1582. Πήρε στη μεταρρύθμιση αυτή πάνω από 300 χρόνια για να καθιερωθεί.)_
2. Υλοποιήστε την παρακάτω κλάση:
```java
public class BirthdayDiary {
   private Map<String, LocalDate> birthdays;
   
   public BirthdayDiary() {
     birthdays = new HashMap<>();
   }
   
   public LocalDate addBirthday(String name, int day, int month, int year) {
	   // TODO
   }
   
   public LocalDate getBirthdayFor(String name) {
	   // TODO
   }
   
   public int getAgeInYear(String name, int year) {
	   // TODO
   }
   
   public int getDaysUntilBirthday(String name) {
	   // TODO
   }
   
   public Map<String, LocalDate> getBirthdaysIn(Month month) {
   	   // TODO
   }
   
   public Map<String, LocalDate> getBirthdaysIn(Month month) {
	   // TODO
   }
public static void main(String[] args) {
   BirthdayDiary diary = new BirthdayDiary();
   diary.addBirthday("Γιάννης", 10, 3, 1973);
   diary.addBirthday("Κατερίνα", 24, 5, 1980);

   LocalDate johnBirthday = diary.getBirthdayFor("Γιάννης");
   System.out.println(johnBirthday);

   Map<String, LocalDate> birthdaysInMarch = diary.getBirthdaysIn(Month.MARCH);
   for (Map.Entry<String, LocalDate> e : birthdaysInMarch.entrySet()) {
       System.out.println(e.getKey() + "'s birthday is on " + e.getValue());
   }

   Map<String, LocalDate> birthdays = diary.getNextClosestBirthdays();
   for (Map.Entry<String, LocalDate> e : birthdays.entrySet()) {
       System.out.println(e.getKey() + "'s birthday is on " + e.getValue());
   }
}
```

## Πηγές
1. Darwin I. F. (2014), _Java Cookbook_, 3rd Ed., O’ Reilly.
2. Evans B., Warburton R. (2014), “Java SE 8 Date and Time”, Java Magazine, [Issue 16](http://www.oraclejavamagazine-digital.com/javamagazine_open/20140304?pg=57#pg57), January-February, pp. 56-58.
3. Evans B. J., Flanagan D. (2019), _Java in a Nutshell_, 7th Ed., O’ Reilly. 
4. Horstmann C. S. (2018), _Core Java Volume II - Advanced Features_, 11th Ed., Pearson.
5. Redko A. (2014), [“Java 8 Features – The ULTIMATE Guide”](http://www.javacodegeeks.com/2014/05/java-8-features-tutorial.html).
6. Urma R-G., Fusco M., Mycroft Al. (2014), _Java 8 in Action: Lambdas, Streams, and functional-style programming_, Manning.

---

[Δ](../../README.md) | [->](../5.2-Files/README.md)

---