# 4.5 Αρχεία Καταγραφής (Logging) {#Java} 
© Γιάννης Κωστάρας

---

[<-](../4.4-Internationalisation/README.md) | [Δ](../../README.md) | [->](../4.6-UnitTesting/README.md)   
---

Τα προγράμματα έχουν γίνει πλέον τόσο πολύπλοκα που ένα σωρό πράγματα μπορούν να συμβούν. Προβλήματα μπορούν να συμβούν ακόμα και όταν το πρόγραμμα βγει στην παραγωγή στις εγκαταστάσεις του πελάτη. Θα θέλουμε να έχουμε κάποιον τρόπο, επομένως, για να μπορούμε να βρούμε τι μπορεί να πήγε λάθος. Αυτό το πετυχαίνουμε με τα _αρχεία καταγραφής (logs)_. Δημιουργώντας λεπτομερή αρχεία καταγραφής μας βοηθάει στο να εντοπίσουμε τα λάθη και να τα διορθώσουμε. 

Παρόλ' αυτά, τ' αρχεία καταγραφής έχουν επίπτωση στην απόδοση της εφαρμογής μας και χρησιμοποιούν πόρους (π.χ. μεγάλο χώρο στο δίσκο) γι' αυτό χρειαζόμαστε διαφορετικά επίπεδα (levels) καταγραφής. Κάθε σύστημα καταγραφής θα πρέπει να ικανοποιεί τουλάχιστο τα παρακάτω κριτήρια:

* πολλαπλά επίπεδα καταγραφής
* δυναμική προσαρμογή των επιπέδων καταγραφής καθώς τρέχει η εφαρμογή
* δυνατότητα καταγραφής σε διαφορετικά μέσα (π.χ. κονσόλα, ΒΔ κλπ.)

Επιπλέον, θα επιθυμούσαμε να είχαμε στατιστικά, μετρήσεις απόδοσης, ασύγχρονη καταγραφή κλπ.

Υπάρχουν διάφορες βιβλιοθήκες καταγραφής:

* ```java.util.logging``` περιέχεται στην ίδια τη γλώσσα Java από την έκδοση 1.4
* [Apache Log4J](https://logging.apache.org/log4j/2.x/)
* [Jakarta Commons Logging](http://commons.apache.org/logging/)
* [SLF4J](http://www.slf4j.org)

## ```java.util.logging```

```java
import java.util.logging.Level;
import java.util.logging.Logger;

public class MyClass {
	private static final Logger LOG = Logger.getLogger(MyClass.class.getName());
	public void myMethod() {
		Logger.getGlobal().info("Opening file " + filename);  // default logger
		LOG.info("An info log message");
		LOG.log(Level.INFO, "Another info log message");
		LOG.fine("A fine message");
		try {
			// code might throw an exception
		} catch (SomeException ex) {
			LOG.log(Level.WARNING, "Something went wrong", ex);
		}
	}
}
```

Για εξαιρέσεις παρέχονται οι εξής μέθοδοι:

```java
void log(Level l, String message, Throwable t)
void throwing(String className, String methodName, Throwable t)
```

Υποστηρίζει 7 επίπεδα (σε φθήνουσα σειρά):

* ```OFF```
* ```SEVERE```
* ```WARNING```
* ```INFO``` (εξ' αρισμού)
* ```CONFIG```
* ```FINE```
* ```FINER```
* ```FINEST```
* ```ALL```

```java
LOG.severe("SEVERE");
LOG.warning("WARNING");
LOG.info("INFO");
LOG.config("CONFIG");
LOG.fine("FINE");
LOG.finer("FINER");
LOG.finest("FINEST");
// ή χρησιμοποιήστε αυτή τη μορφή
LOG.log(Level.FINEST, "FINEST");
```

Για να βελτιώσετε την απόδοση του προγράμματος, καλό είναι να κάνετε έλεγχο πριν από κάθε καταγραφή, π.χ.

```java
if (LOG.isLoggable(Level.FINE)) {
	LOG.log(Level.FINEST, "FINEST");
}
```

Το βασικό αρχείο διαμόρφωσης βρίσκεται στην τοποθεσία ```jre/lib/logging.properties``` για εκδόσεις πριν την 9 και ```conf``` για εκδόσεις μετά. Το κλειδί ```java.util.logging.config.file``` αποθηκεύει τη θέση του εξ' ορισμού αρχείου καταγραφής. Μπορείτε ν' αλλάξετε το ```.level= INFO``` σε κάποιο άλλο επίπεδο.

Με τη βοήθεια των ```Handlers``` μπορεί να καταγράφει σε διαφορετικές τοποθεσίες ταυτόχρονα. Π.χ. ο ```ConsoleHandler``` καταγράφει στην κονσόλα ενώ μπορείτε να ορίσετε και διαφορετικά επίπεδα για τους διάφορους handlers. Άλλοι handlers μπορεί να είναι: ```FileHandler, SocketHandler``` κ.ά. Καλό είναι να ορίσετε μια ακολουθία περιστροφής (rotation sequence) π.χ. ```myapp.log.0, myapp.log.1, myapp.log.2``` όταν ξεπεραστεί το μέγεθος του αρχείου καταγραφής ορισμένου στο ```java.util.logging.FileHandler.limit``` ορίζοντας το κλειδί ```java.util.logging.FileHandler.count``` με κάποιον αριθμό >1. 

Τέλος, μπορείτε να μορφοποιήσετε τις καταγραφές με το κλειδί ```java.util.logging.SimpleFormatter.format```.

## Apache Log4j 2.x

Αφού το κατεβάσετε από την τοποθεσία, θα χρειαστείτε τα εξής δυο αρχεία:

* ```log4j-api-2.xx.jar```
* ```log4j-core-2.xx.jar```

Αποτελείται από 3 μέρη:
* Loggers
* Appenders (για καταγραφή σε διάφορους προορισμούς)
* Layouts (για μορφοποίηση των καταγραφών)

```java
import org.apache.logging.log4j.Logger;
public class MyClass {
	private static final Logger LOG = LogManager.getLogger(MyClass.class);

	public void myMethod() {
		if (LOG.isInfoEnabled()) {
			LOG.info("Param value: " + parameter);
			LOG.log(LEVEL.WARN, "Exception: " + exception)
		}
		if (LOG.isDebugEnabled()) {
			LOG.debug("...");
		}
	}
}
```

Υποστηρίζει 6 επίπεδα (σε φθήνουσα σειρά):

* ```OFF```
* ```FATAL```
* ```ERROR```
* ```WARN``` 
* ```INFO``` (εξ' αρισμού)
* ```DEBUG```
* ```TRACE```
* ```ALL```


Αν π.χ. ορίσουμε το επίπεδο σε ```WARN``` (```LOG.setLevel(LEVEL.WARN)```) τότε θα καταγράφονται και τα ```ERROR``` και τα ```FATAL```.

Παρέχει τη δυνατότητα καταγραφής σε διάφορους προορισμούς, π.χ. τόσο στην κονσόλα όσο και σε αρχείο ταυτόχρονα. Δημιουργήστε το αρχείο ```log4j.properties``` με την ακόλουθη διαμόρφωση:
```
# Root logger option
log4j.rootLogger=DEBUG, stdout, file
# Redirect log messages to console
log4j.appender.stdout=org.apache.log4j.ConsoleAppender
log4j.appender.stdout.Target=System.out
log4j.appender.stdout.layout=org.apache.log4j.PatternLayout
log4j.appender.stdout.layout.ConversionPattern=%d{yyyy-MM-dd HH:mm:ss} %-5p %c{1}:%L - %m%n
# Redirect log messages to a log file, support file rolling.
log4j.appender.file=org.apache.log4j.RollingFileAppender
log4j.appender.file.File=C:\\log4j-application.log
log4j.appender.file.MaxFileSize=5MB
log4j.appender.file.MaxBackupIndex=10
log4j.appender.file.layout=org.apache.log4j.PatternLayout
log4j.appender.file.layout.ConversionPattern=%d{yyyy-MM-dd HH:mm:ss} %-5p %c{1}:%L - %m%n
```
Άλλος τρόπος είναι διαμορφώνοντας το αρχείο ```log4j.xml```:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<Configuration>
	<Appenders>
		<Console name="STDOUT" target="SYSTEM_OUT">
			<PatternLayout pattern="%d %-5p [%t] %C{2} %m%n"/>
		</Console>
	</Appenders>
	<Loggers>
		<Root level="debug">
			<AppenderRef ref="STDOUT"/>
		</Root>
	</Loggers>
</Configuration>
```

Προορισμοί:
* Κονσόλα
* Αρχεία
* Βάσεις δεδομένων (JDBC)
* Sockets
* SMTP (email)
* Java Message System
* Swing GUI
* Γεγονότα Windows NT και Unix Syslog
* Telnet

Η καταγραφή μπορεί να μορφοποιηθεί με τους διαμορφωτές (layouts):

* SimpleLayout
* TTCCLayout (Time, Thread, Category and diagnostic context info)
* PatternLayout
* HTMLLayout
* XMLLayout

Π.χ.
```java
Layout layout = new TTCCLayout("yyyy-MM-dd HH:mm:ss");
ConsoleAppender appender = new ConsoleAppender(layout);
LOG.addAppender(appender);
```

Ένας ```AsyncAppender``` επιτρέπει ασύγχρονη καταγραφή, δηλ. ένα άλλο νήμα (thread) αναλαμβάνει την καταγραφή. 

Μπορείτε να δημιουργήσετε ιεραρχίες καταγραφέων, με έναν ριζικό (root): ```Logger.getRootLogger()```. 

## Περίληψη
Είδαμε τη χρήση δυο βιβλιοθηκών αρχείων καταγραφής, της ```java.util.Logging``` και της _Apache Log4j_. Οι καταγραφές έχουν επίπεδα ενώ παρέχουν δυνατότητες καταγραφής σε διαφορετικούς προορισμούς καθώς και μορφοποίησης των καταγραφών. 

Όλες οι εξαιρέσεις θα πρέπει να καταγράφονται:

* ```RuntimeException```s που φανερώνουν προγραμματιστικά λάθη που πρέπει να διορθώσουμε
* ```Error```s λάθη που δεν διορθώνονται (ως ```fatal()```)
* _Ελεγχόμενες εξαιρέσεις (Checked Exception)_ ως ```error()``` ή ```fatal()``` αν δεν μπορούν να αντιμετωπιστούν

Μην καταγράφετε ευαίσθητες πληροφορίες της εφαρμογής όπως π.χ. διευθύνσεις ΙΡ, ονόματα χρηστών και κωδικούς, διευθύνσεις Η/Τ, αριθμούς πιστωτικών καρτών, ΑΜΚΑ κλπ. για λόγους ασφαλείας αλλά και συμμόρφωσης στην υπάρχουσα νομοθεσία. Επίσης τα αρχεία καταγραφής καλό είναι να αποθηκεύονται σε τοποθεσίες που μόνο διαχειριστές μπορούν να έχουν πρόσβαση. 

## Πηγές:
1. ["The Java Tutorial"](https://docs.oracle.com/javase/tutorial/)
1. Eckel B. (2006), _Thinking in Java_, 4th Ed., Prentice-Hall.
1. Horstmann C. S. (2016), _Core Java, Volume 1 Fundamentals_, 10th Ed., Prentice-Hall.
1. Horstmann C. S. (2018), _Core Java SE 9 for the impatient_, 2nd Ed., Addison-Wesley. 
1. Long F. et al. (2012), _The CERT® Oracle® Secure Coding Standard for Java™_, Addison-Wesley.
1. [Java Notes for Professionals](https://books.goalkicker.com/JavaBook/JavaNotesForProfessionals.pdf)

---

[<-](../4.4-Internationalisation/README.md) | [Δ](../../README.md) | [->](../4.6-UnitTesting/README.md)  

---