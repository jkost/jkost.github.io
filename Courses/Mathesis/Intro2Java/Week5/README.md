# 5.1 Ημερομηνία & Ώρα {#Java} 
© Γιάννης Κωστάρας

---

[->](../5.2-Time/README.md) 
 
---

## Εισαγωγή
Για πολλά χρόνια η γλώσσα διέθετε ένα όχι και τόσο ικανοποιητικό ΑΡΙ για την αναπαράσταση της ημερομηνίας και της ώρας.

## Date/Time API (JSR-310)
Για να δημιουργήσουμε μια νέα ώρα χρησιμοποιούμε την κλάση ```LocalTime```:
```java
  LocalTime now = LocalTime.now();
  LocalTime time = LocalTime.of(19, 45, 25);
  int hour = time.getHour();    // 19
  int minute = time.getMinute();  // 45
  int second = time.getSecond();  // 25
```
Το ΑΡΙ διαθέτει και μια χρήσιμη μέθοδο ```parse()```:
```java
  time = LocalTime.parse("13:45:20");
```
Μπορούμε να δημιουργήσουμε και συνδυασμό ημερομηνίας και ώρας με την κλάση ```LocalDateTime```:
```java
  // 2014-11-18T19:45:23
  LocalDateTime dt1 = LocalDateTime.of(2014, Month.NOVEMBER, 18, 19, 45, 23);
  LocalDateTime dt2 = LocalDateTime.of(date, time);
  LocalDateTime dt3 = date.atTime(19, 45, 23);
  LocalDateTime dt4 = date.atTime(time);
  LocalDateTime dt5 = time.atDate(date);
  
  LocalDate date1 = dt1.toLocalDate();  // 2014-11-18
  LocalTime time1 = dt1.toLocalTime();  // 19:45:23
  LocalTime truncatedTime = time1.truncatedTo(ChronoUnit.SECONDS);
  
  LocalDate date2 = date1.withYear(2015); // 2015-11-18
  //2015-11-25
  LocalDate date3 = date2.withDayOfMonth(25);
  //2015-09-25
  LocalDate date4 = date3.with(ChronoField.MONTH_OF_YEAR, 10);
  
  LocalDate date11 = date1.plusWeeks(1);  // 2014-11-25
  LocalDate date22 = date2.minusYears(3); // 2012-11-18
  //2016-03-25
  LocalDate date33 = date3.plus(6, ChronoUnit.MONTHS);
  // adjuster
  date3 = date2.with(lastDayOfMonth()); // 2015-11-31
  
  // 20141118
  String s1 = date.format(DateTimeFormatter.BASIC_ISO_DATE);
  // 2014-11-18
  String s2 = date.format(DateTimeFormatter.ISO_LOCAL_DATE);
  
  date1 = LocalDate.parse("20141118", DateTimeFormatter.BASIC_ISO_DATE);
  date2 = LocalDate.parse("2014-11-18", DateTimeFormatter.ISO_LOCAL_DATE);
  
  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
  // 18/11/2014
  String formattedDate = date.format(formatter);
  // 2014-11-18
  date1 = LocalDate.parse(formattedDate, formatter);
  DateTimeFormatter hellenicFormatter = 
           DateTimeFormatter.ofPattern("dd MMMM yyyy", Locale.forLanguageTag("el-GR"));
  // 18 Νοεμβρίου 2014
  formattedDate = date.format(hellenicFormatter); 
  date2 = LocalDate.parse(formattedDate, hellenicFormatter);
  
  Duration d1 = Duration.between(now, time);
  Period sevenDays = Period.between(date1, date11);//P7D
  Duration threeMinutes = Duration.ofMinutes(3);//PT3M
  threeMinutes = Duration.of(3, ChronoUnit.MINUTES);
  sevenDays = Period.ofDays(7); //P7D
  Period threeWeeks = Period.ofWeeks(3); //P21D
  // P2Y6M1D
  Period twoYearsSixMonthsOneDay = Period.of(2, 6, 1);
  
  ZoneId zoneId = TimeZone.getDefault().toZoneId();
  ZoneId brxId = ZoneId.of("Europe/Brussels");
  LocalTime brxTime = now.atZone(brxId);
  ZonedDateTime.parse("2013-12-03T10:15:30+01:00[Europe/Paris]");
  
  Instant instant = Instant.now();
  instant = Instant.ofEpochSecond(3);
```
Παρατηρήστε ότι η κλάση ```DateTimeFormatter``` δε χρειάζεται συγχρονισμό όπως η ```DateFormatter``` που δεν ήταν thread safe. 

Υποστηρίζονται χρονικές ζώνες (time zones) (```ZoneId, ZoneOffset```).  Μια περίοδος (```Period```) αναφέρεται σε μια μεγάλη χρονική διάρκεια (ημερών, μηνών κλπ.) ενώ μια χρονική διάρκεια (```Duration```) αναφέρεται σε ώρες, λεπτά, δευτ/πτα. Τέλος, η κλάση ```Instant``` μετράει το χρόνο από την εποχή του Unix, δηλ. τα από την 1 Ιανουαρίου 1970 UTC. 

## Πηγές
2. Darwin I. F. (2014), _Java Cookbook_, 3rd Ed., O’ Reilly.
3. Naftalin M. (2014), _Mastering Lambdas: Java Programming in a Multicore World_, Oracle Press.
4. Redko A. (2014), [“Java 8 Features – The ULTIMATE Guide”](http://www.javacodegeeks.com/2014/05/java-8-features-tutorial.html).
5. Subramaniam V. (2014), _Functional Programming in Java: Harnessing the Power of Java 8 Lambda Expressions_, Pragmatic.
6. Urma R-G., Fusco M., Mycroft Al. (2014), _Java 8 in Action: Lambdas, Streams, and functional-style programming_, Manning.
7. Warburton R. (2014), _Java 8 Lambdas: Pragmatic Functional Programming_, O' Reilly.
8. Nurkiewicz T. (2014), [“Optional in Java 8 cheat sheet”](http://www.javacodegeeks.com/2013/08/optional-in-java-8-cheat-sheet.html?utm_content=buffer2a9ed&utm_medium=social&utm_source=facebook.com&utm_campaign=buffer). 
9. (2013), [Everything about Java 8](http://www.techempower.com/blog/2013/03/26/everything-about-java-8/).
10. Neward T. (2013), “Java 8: Lambdas – Part 1”, Java Magazine, [Issue 13](http://www.oraclejavamagazine-digital.com/javamagazine_open/20130708#pg35), July-August, pp. 34-40.
11. Neward T. (2013), “Java 8: Lambdas – Part 2”, Java Magazine, [Issue 14](http://www.oraclejavamagazine-digital.com/javamagazine_open/20130910#pg29), September-October, pp. 28-34.
12. Urma R-G. (2014), “Processing Data with Java SE 8 Streams – Part 1”, Java Magazine, [Issue 17](http://www.oraclejavamagazine-digital.com/javamagazine_open/20140304#pg51), March-April, pp. 50-55.
13. Urma R-G. (2014), “Processing Data with Java SE 8 Streams – Part 2”, Java Magazine, [Issue 18](http://www.oraclejavamagazine-digital.com/javamagazine_open/20140506#pg50), May-June, pp. 49-53.
14. Wielenga G., Franklin L., Gydri A. (2014), “Quick and Easy Conversion to Java SE 8 with NetBeans IDE 8”, Java Magazine, [Issue 18](http://www.oraclejavamagazine-digital.com/javamagazine_open/20140506#pg43), May-June, pp. 42-45.
15. Juneau J. (2014), “JSR 308 Explained: Java Type Annotations”, Java Magazine, [Issue 17](http://www.oraclejavamagazine-digital.com/javamagazine_open/20140304?pg=57#pg57), March-April, pp. 56-61.
16. Evans B., Warburton R. (2014), “Java SE 8 Date and Time”, Java Magazine, [Issue 16](http://www.oraclejavamagazine-digital.com/javamagazine_open/20140304?pg=57#pg57), January-February, pp. 56-58.
17. Maiorano N. (2014), “Is Java 8 a Functional Language? Three ways it is – Three ways it isn’t”, [Java Magazine](http://javamag.org/download/java-magazine-8/), Vol. 1, No. 3, Issue 03, pp. 25-31.
18. Charbonneau P.-H. (2014), “Java 8: Removal of PermGen”, [Java Magazine](http://javamag.org/download/java-magazine-8/), Vol. 1, No. 3, Issue 03, pp. 82-89.

---