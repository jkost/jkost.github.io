# 5.3 NIO.2 {#Java} 
© Γιάννης Κωστάρας

---

[<-](../5.2-Files/README.md)  | [Δ](../../README.md) | [->](../5.4-JDBC/README.md) 

---

Στο προηγούμενο μάθημα μάθαμε τις βασικές κλάσεις για επικοινωνία με τις μονάδες μόνιμης αποθήκευσης. Στην έκδοση 1.4 η γλώσσα εισήγαγε το NIO (New I/O) ενώ στην έκδοση 7 το NIO.2, δηλ. έναν νέο πλούσιο ΑΡΙ για το σκοπό αυτό.

| I/O | NIO.2
| ```java.io``` | ```java.nio.file```
| ```File``` | ```Path```
| ```File``` | ```Paths```
| - | ```FileSystems```
| ```-``` | ```FileSystem```
| ```-``` | ```FileStore```    
 
Ας δούμε πώς "μεταφράζονται" τα παραδείγματα του προηγούμενου μαθήματος στο ΝΙΟ.2.

### ```java.nio.file.Path``` & ```java.nio.file.Paths```

Η κλάση ```Path``` είναι αντίστοιχη της ```File``` (αν και δεν την αντικαθιστά πλήρως).
```java
jshell> import java.nio.file.*

jshell> Path path = Paths.get("test.txt");
path ==> test.txt

jshell> Path path = Paths.get("C:/temp/test.txt");    // absolute path
path ==> C:/temp/test.txt

jshell> Path path = Paths.get("temp/test.txt");    // relative path
path ==> temp/test.txt

jshell> Path path = Paths.get("C:","temp","test.txt");    
path ==> C:/temp/test.txt

jshell> Path path = Paths.get("C:/temp/../temp/test.txt").normalize();    
path ==> C:/temp/test.txt

jshell> Path path = Paths.get(URI.create("file:///home/user/test.txt"));
path ==> /home/user/test.txt

jshell> Path path = FileSystems.getDefault().getPath("C:\\temp\\test.txt");
path ==> C:\temp\test.txt

jshell> Path path = Paths.get(System.getProperty("user.home"), "downloads", "test.txt");
path ==> /Users/MyMacBook/downloads/test.txt

jshell> Path path1 = Paths.get("C:");    
path1 ==> C:

jshell> Path path2 = Paths.get("temp/test.txt");    
path2 ==> temp/test.txt

jshell> path1.resolve(path2)	// συνένωση
$1 ==> C:/temp/test.txt

jshell> path1.relativize(path2)
$2 ==> ../temp/test.txt

jshell> path
path ==> C:/temp/test.txt

jshell> path.endsWith("test.txt")
$3 ==> true

jshell> path.resolveSibling("file.txt")	// συνένωση
$4 ==> C:/temp/file.txt

jshell> path.getFileName()
$5 ==> test.txt

jshell> path.getNameCount()
$6 ==> 3

jshell> path.getName(1)
$7 ==> temp

jshell> path.getParent()
$8 ==> C:/temp

jshell> path.getRoot()
$9 ==> null

jshell> Paths.get("/Users/").getRoot()
$10 ==> /

jshell> path.subpath(1,2)
$11 ==> temp

jshell> path.toString()
$12 ==> "C:/temp/test.txt"

jshell> path.toUri()
$13 ==> file:///C:/temp/test.txt

jshell> path.toAbsolutePath()
$14 ==> /C:/temp/test.txt

jshell> Path path = Paths.get("/","tmp","test.txt");    
path ==> /tmp/test.txt

jshell> path.toRealPath()
$15 ==> /private/tmp/test.txt

jshell> File f = path.toFile()	// Path ==> File
f ==> /tmp/test.txt
```

* ```.``` ο τρέχων κατάλογος
* ```..``` ο πατρικός κατάλογος

### ```java.nio.file.Files```

```java
jshell> Files.exists(path)
$16 ==> true

jshell> Files.notExists(path)    // !Files.exists() != Files.notExists(), π.χ. λόγω δικαιωμάτων πρόσβασης
$17 ==> false

jshell> Files.isDirectory(path)
$18 ==> false 

jshell> Files.isRegularFile(path)
$19 ==> true

jshell> Files.isReadable(path)
$20 ==> true

jshell> Files.isWritable(path)
$21 ==> true

jshell> Files.isExecutable(path)
$22 ==> false

jshell> Files.isHidden(path)
$23 ==> false

jshell> Files.isSymbolicLink(path)
$22 ==> false

jshell> Files.probeContentType(path)
$23 ==> "text/plain"

jshell> Files.size(path)
$24 ==> 0
```

* ```text/plain``` δηλώνει αρχείο κειμένου
* ```text/html ```δηλώνει σελίδα HTML
* ```application/pdf``` δηλώνει αρχείο PDF
* ```image/png ``` δηλώνει αρχείο εικόνας PNG

```java
jshell> import java.nio.file.attribute.*;

jshell> BasicFileAttributes attr = Files.readAttributes(path, BasicFileAttributes.class);
attr ==> null

jshell> attr.size()
$4 ==> 0

jshell> attr.creationTime()
$5 ==> 2019-02-19T19:52:50Z

jshell> attr.lastAccessTime()
$6 ==> 2019-02-19T19:52:50Z

jshell> attr.lastModifiedTime()
$7 ==> 2019-02-19T19:52:50Z

jshell> attr.isDirectory()
$8 ==> false

jshell> attr.isRegularFile()
$9 ==> true

jshell> attr.isSymbolicLink()
$10 ==> false

jshell> attr.isOther()
$11 ==> false

jshell> FileTime fileTime = FileTime.fromMillis(System.currentTimeMillis());
fileTime ==> 2019-02-19T21:10:44.927Z

jshell> Files.setLastModifiedTime(path, fileTime);

jshell> Files.getLastModifiedTime(path)
$12 ==> 2019-02-19T21:10:44Z
```

* ```BasicFileAttributes```
* ```DosFileAttributes```
* ```PosixFileAttributes```
* ```FileOwnerFileAttributes```
* ```AclFileAttributes```
* ```UserDefinedFileAttributes```

#### ```DosFileAttributes```

* ```isReadOnly()```
* ```isHidden()```
* ```isArchive()```
* ```isSystem()```

#### ```PosixFileAttributes```

```java
jshell> PosixFileAttributes attr = Files.readAttributes(path, PosixFileAttributes.class);

jshell> attr.owner().getName()
$13 ==> "john"

jshell> attr.group().getName()
$14 ==> "staff"

jshell> attr.permissions().toString()
$15 ==> "[OWNER_WRITE, GROUP_READ, OTHERS_READ, OWNER_READ]"

jshell> Set<PosixFilePermission> permissions = PosixFilePermissions.fromString("rw-r--r--");
permissions ==> [OWNER_READ, OWNER_WRITE, GROUP_READ, OTHERS_READ]

jshell> Files.setPosixFilePermissions(path, permissions);

jshell> FileSystem fs = FileSystems.getDefault();
fs ==> sun.nio.fs.MacOSXFileSystem@50d0686

jshell> for (FileStore store : fs.getFileStores()) {
   ...> try {
   ...> long totalSpace = store.getTotalSpace() / 1024;
   ...> long usedSpace = (store.getTotalSpace() - store.getUnallocatedSpace()) / 1024;
   ...> long availableSpace = store.getUsableSpace() / 1024;
   ...> boolean isReadOnly = store.isReadOnly();
   ...> System.out.println("--- " + store.name() + " --- " + store.type());
   ...> System.out.println("Total space: " + totalSpace);
   ...> System.out.println("Used space: " + usedSpace);
   ...> System.out.println("Available space: " + availableSpace);
   ...> System.out.println("Is read only? " + isReadOnly);
   ...> } catch (IOException e) {
   ...> System.err.println(e);
   ...> }
   ...> }
--- /dev/disk0s2 --- hfs
Total space: 233591456
Used space: 226233780
Available space: 7101676
Is read only? false
--- devfs --- devfs
Total space: 228
Used space: 228
Available space: 0
Is read only? false
--- map -hosts --- autofs
Total space: 0
Used space: 0
Available space: 0
Is read only? false
--- map auto_home --- autofs
Total space: 0
Used space: 0
Available space: 0
Is read only? false
--- /dev/disk1s0 --- cd9660
Total space: 575606
Used space: 575606
Available space: 0
Is read only? true
```

## Δημιουργία

Δημιουργία καταλόγου:

```java
jshell> Path newdir = Paths.get("/tmp/newdir");
newdir ==> /tmp/newdir

jshell> Files.createDirectory(newdir);    //  throws exception if directory exists

jshell> Files.exists(newdir)
$1 ==> true

jshell> Path newdir2 = Paths.get("/tmp/newdir2");
newdir2 ==> /tmp/newdir2

jshell> Set<PosixFilePermission> perms = PosixFilePermissions.fromString("rwxr-x---");
perms ==> [OWNER_READ, OWNER_WRITE, OWNER_EXECUTE, GROUP_READ, GROUP_EXECUTE]

jshell> FileAttribute<Set<PosixFilePermission>> attr = PosixFilePermissions.asFileAttribute(perms);
attr ==> java.nio.file.attribute.PosixFilePermissions$1@72d818d1

jshell> import java.nio.file.attribute.*;

jshell> Set<PosixFilePermission> perms = PosixFilePermissions.fromString("rwxr-x---");
perms ==> [OWNER_READ, OWNER_WRITE, OWNER_EXECUTE, GROUP_READ, GROUP_EXECUTE]

jshell> FileAttribute<Set<PosixFilePermission>> attr = PosixFilePermissions.asFileAttribute(perms);
attr ==> java.nio.file.attribute.PosixFilePermissions$1@72d818d1

jshell> Files.createDirectory(newdir2, attr);

jshell> Files.exists(newdir2)
$2 ==> true

jshell> Path newdir3 = FileSystems.getDefault().getPath("/tmp/", "test", "newdir3");
newdir3 ==> /tmp/test/newdir3

jshell> Files.createDirectories(newdir3);

jshell> Files.exists(newdir3)
$3 ==> true
```

Δημιουργία αρχείου:

```java
jshell> Path newfile = Paths.get("/tmp/", "newfile");
newfile ==> /tmp/newfile

jshell> Files.createFile(newfile);
```

## Διαγραφή

```java
jshell> Files.deleteIfExists(path)
$1 ==> true
```

## Εμφάνιση καταλόγου

```java
jshell> Path directoryPath = Paths.get("C:/temp");
directoryPath ==> C:\temp

jshell> try (DirectoryStream<Path> ds = Files.newDirectoryStream(directoryPath)) {
   ...> for (Path file : ds) {
   ...> System.out.println(file.getFileName());
   ...> }
   ...> }catch(IOException e) {
   ...> System.err.println(e);
   ...> }
test.txt
```

Μπορούμε να χρησιμοποιήσουμε και χαρακτήρες μπαλαντέρ (globbing):

* ```*``` οποιοσδήποτε αριθμός χαρακτήρων
* ```**``` όπως και το ```*``` αλλά ψάχνει σε όλους τους υποφακέλους
* ```?``` οποιοσδήποτε ένας μόνο χαρακτήρας
* ```{}``` μόνο χαρακτήρες που περιέχονται στα άγκιστρα, π.χ. ```{α, ά, ε, έ}```
* ```[]``` σύνολο χαρακτήρων, π.χ. ```[Α-Ω, Ά, Έ, Ή, Ί, Ό, Ώ]```. Οι χαρακτήρες ```*, ?, \``` δεν είναι χαρακτήρες μπαλαντέρ μέσα στις αγκύλες
* ```\*, \?, \\``` αν θέλουμε να ταιριάζουμε κάποιον από τους χαρακτήρες ```*, ?, \```

Π.χ.
```java
try (DirectoryStream<Path> ds = Files.newDirectoryStream(path, "*.{png,jpg,bmp}")) {
...
``` 
Μπορούμε να φιλτράρουμε τ' αποτελέσματα (π.χ. μόνο αρχεία):
```java
jshell> DirectoryStream.Filter<Path> fileFilter = new DirectoryStream.Filter<Path>() {
   ...> @Override
   ...> public boolean accept(Path path) throws IOException { 
   ...> return (Files.isRegularFile(path));
   ...> }
   ...> };
fileFilter ==> 1@617faa95

jshell> try (DirectoryStream<Path> ds = Files.newDirectoryStream(path, fileFilter)) {
...
```
Για αναδρομική προσπέλαση καταλόγων, το ΝΙΟ.2 προσφέρει τη διεπαφή ```FileVisitor``` και την υλοποίησή της ```SimpleFileVisitor```. Ένα παράδειγμα χρήσης φαίνεται παρακάτω:

```java
jshell> Files.walkFileTree(directoryPath, new SimpleFileVisitor<Path>() {
   ...> @Override
   ...> public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws 
   ...> IOException {
   ...> System.out.println("d " + dir.toAbsolutePath());
   ...> return FileVisitResult.CONTINUE;
   ...> }
   ...> @Override
   ...> public FileVisitResult visitFile(Path dir, BasicFileAttributes attrs) throws
   ...> IOException {
   ...> System.out.println("f " + dir.toAbsolutePath());
   ...> return FileVisitResult.CONTINUE;
   ...> }
   ...> });
d C:\temp
f C:\temp\test.txt
$3 ==> C:\temp
```
Άλλο ένα παράδειγμα, εύρεση μόνο των φακέλων:
```java
jshell> Files.walkFileTree(directoryPath, new SimpleFileVisitor<Path>() {  
   ...>  @Override
   ...>  public FileVisitResult postVisitDirectory(Path dir, IOException e) throws
   ...>  IOException {
   ...>  System.out.println("d " + dir.toAbsolutePath());
   ...>  return FileVisitResult.CONTINUE;
   ...>  }
   ...>  });
d C:\temp
$4 ==> C:\temp
```
Η διεπαφή διαθέτει τις εξής μεθόδους:

```java
public interface FileVisitor {
   FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs);
   FileVisitResult visitFile(Path dir, BasicFileAttributes attrs);
   FileVisitResult postVisitDirectory(Path dir, IOException e);
   FileVisitResult visitFileFailed(Path dir, IOException e);
}
```

* ```FileVisitResult.CONTINUE```: να συνεχιστεί η προσπέλαση
* ```FileVisitResult.SKIP_SIBLINGS```: να συνεχιστεί η προσπέλαση αλλά χωρίς να επισκεφτούν τα υπόλοιπα αρχεία/φακέλους σ' αυτόν τον φάκελο
* ```FileVisitResult.SKIP_SUBTREE```: να συνεχιστεί η προσπέλαση αλλά χωρίς να επισκεφτούν τα υπόλοιπα αρχεία/φακέλους σ' αυτόν τον φάκελο και τους υποφακέλους
* ```FileVisitResult.TERMINATE```: να σταματήσει η προσπέλαση

Ας δούμε ένα ακόμα παράδειγμα, εύρεση ενός αρχείου:

```java
jshell>  Path searchedFile = Paths.get("test.txt");
searchedFile ==> test.txt

jshell> Files.walkFileTree(directoryPath, new SimpleFileVisitor<Path>() {
   ...>  @Override
   ...>  public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws
   ...>  IOException {
   ...>  return FileVisitResult.CONTINUE;
   ...>  }
   ...>  @Override
   ...> public FileVisitResult postVisitDirectory(Path dir, IOException exc) {
   ...> return FileVisitResult.CONTINUE;
   ...> }
   ...>
   ...> @Override
   ...> public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws
   ...> IOException {
   ...>     Path name = file.getFileName();
   ...>     if (name != null && name.equals(searchedFile)) {
   ...>         System.out.println("Searched file was found: " + searchedFile +
   ...>         " in " + file.toRealPath().toString());
   ...>         return FileVisitResult.TERMINATE;
   ...>     } else {
   ...>         return FileVisitResult.CONTINUE;
   ...>     }
   ...> }
   ...> @Override
   ...> public FileVisitResult visitFileFailed(Path file, IOException exc)
   ...> throws IOException {
   ...> //report an error if necessary
   ...> return FileVisitResult.CONTINUE;
   ...> }
   ...> });
Searched file was found: test.txt in C:\temp\test.txt
$5 ==> C:\temp
```

## Ανάγνωση αρχείου

```java
jshell> import java.nio.charset.*;

jshell> List<String> linesOfContent = Files.readAllLines(path, StandardCharsets.UTF_8);
linesOfContent ==> []

jshell> byte[] content = Files.readAllBytes(path)
content ==> byte[87] { -50, -93, -50, -75, 32, -50, -77, -50, ... -75, -49, -127, -50, -82 }

jshell> String s = new String(content, "UTF-8");
s ==> "Σε γνωρίζω από την κόψη, του σπαθιού την τρομερή"

jshell> try (BufferedReader reader = Files.newBufferedReader(path, Charset.forName("UTF-8"))) {
   ...> String line = null;
   ...> while ((line = reader.readLine()) != null) {
   ...> System.out.println(line);
   ...> }
   ...> } catch (IOException e) {
   ...> System.err.println(e);
   ...> }
Σε γνωρίζω από την κόψη, του σπαθιού την τρομερή
```

## Εγγραφή αρχείου

```java
jshell> List<String> lines = Arrays.asList(
   ...> new String[]{"Σε γνωρίζω από την κόψη", "του σπαθιού την τρομερή"});
lines ==> [Σε γνωρίζω από την κόψη, του σπαθιού την τρομερή]

jshell> Files.write(path, lines, Charset.forName("UTF-8"), StandardOpenOption.APPEND)
$1 ==> /tmp/test.txt

jshell> List<String> linesOfContent = Files.readAllLines(path, StandardCharsets.UTF_8);
linesOfContent ==> [Σε γνωρίζω από την κόψη, του σπαθιού την τρομερή]

jshell> try (OutputStream outputStream = Files.newOutputStream(path, StandardOpenOption.CREATE_NEW)) {
   ...> for (String line : lines) {
   ...> outputStream.write((line + System.lineSeparator()).getBytes(StandardCharsets.UTF_8));
   ...> }
   ...> }
   
jshell> String s = "Σε γνωρίζω από την κόψη, του σπαθιού την τρομερή"
s ==> "Σε γνωρίζω από την κόψη, του σπαθιού την τρομερή"

jshell> byte[] bytes = s.getBytes("UTF-8")
bytes ==> byte[87] { -50, -93, -50, -75, 32, -50, -77, -50, ... -75, -49, -127, -50, -82 }

jshell> Files.write(newfile, bytes)
$2 ==> /tmp/newfile  

jshell> try (BufferedWriter writer = Files.newBufferedWriter(path, Charset.forName("UTF-8"), StandardOpenOption.APPEND)) {
   ...> writer.write(text);
   ...> } catch (IOException e) {
   ...> System.err.println(e);
   ...> }
```
Υπάρχουν οι εξής επιλογές:

```StandardOperation.```:

* ```READ``` 
* ```WRITE``` 
* ```CREATE```
* ```CREATE_NEW``` 
* ```APPPEND``` 
* ```DELETE_ON_CLOSE``` 
* ```TRUNCATE_EXISTING``` 

## Αντιγραφή αρχείου
Στο μάθημα με τις εξαιρέσεις είδαμε έναν τρόπο αντιγραφής ενός αρχείου. Ένας γρήγορος τρόπος αντιγραφής αρχείων είναι ο παρακάτω:

```java
jshell> File sourceFile = path.toFile()
sourceFile ==> /tmp/test.txt

jshell> File destFile = Paths.get("/tmp/backup.txt").toFile()
destFile ==> /tmp/backup.txt

jshell> Files.createFile(destFile.toPath());  // καλό είναι να υπάρχει τ' αρχείο προορισμού
$1 ==> /tmp/backup.txt

jshell> import java.nio.channels.*

jshell> if (sourceFile.exists() && destFile.exists()) {
   ...> try (FileChannel srcChannel = new FileInputStream(sourceFile).getChannel();
   ...> FileChannel sinkChannel = new FileOutputStream(destFile).getChannel()) {
   ...> srcChannel.transferTo(0, srcChannel.size(), sinkChannel);
   ...> } catch (IOException e) {
   ...> e.printStackTrace();
   ...> }
   ...> }
```

## Συντομεύσεις (Symbolic links)
Στα συστήματα Unix, υπάρχει η δυνατότητα δημιουργίας συνδέσμων (links) και μάλιστα hard links και soft ή symbolic links. Στα Windows είναι οι αντίστοιχες συντομεύσεις (shortcuts). Το hard link είναι στην ουσία ένα αντίγραφο ενός αρχείου (δεν υπάρχουν hard links για φακέλους). Το soft link είναι απλά ένας δείκτης σ' ένα αρχείο ή φάκελο. Θα πρέπει να υπάρχει το αρχείο για να δημιουργηθεί ένα soft link γι' αυτό. Αντιθέτως, ο "στόχος" που δείχνει ένα soft link μπορεί και να μην υπάρχει με αποτέλεσμα το soft link να είναι "τζούφιο, άδειο", να μη δείχνει πουθενά (π.χ. επειδή το αρχείο ή ο φάκελος στο οποίο έδειχνε διαγράφηκε). Αντιθέτως, αν διαγράψετε το αρχείο που δείχνει το hard link, τότε το hard link συνεχίζει να υπάρχει ως αντίγραφο του αρχικού αρχείου. 

Στο Unix/Linux δημιουργούμε ένα hard link με την εντολή ```mklink``` ενώ ένα soft link με την εντολή ```ln -s``` (παρέχοντας πρώτα το αρχείο/φάκελο προορισμού και μετά το soft link).

Η κλάση ```java.nio.file.Files``` παρέχει τις ακόλουθες μεθόδους:

```java
* createLink() 
* createSymbolicLink()
* isSymbolicLink()
* readSymbolicLink()
```

Ας δούμε μερικά παραδείγματα:
```java
jshell> Path slink = Paths.get("C:/temp/slink.txt")
slink ==> C:\temp\slink.txt

jshell> Files.createSymbolicLink(slink, path)

jshell> Files.isSymbolicLink(slink)
$1 ==> true

jshell> Files.readSymbolicLink(slink);
$2 ==>


```
Επίσης, αξίζει να σημειώσει ότι πολλές μέθοδοι δέχονται ως παράμετρο αν θα πρέπει ν' ακολουθήσουν τους συνδέσμους ή όχι (```LinkOption.NOFOLLOW_LINKS```).

Επίσης, θα πρέπει να σημειώσουμε ότι στα Unix συστήματα, αντιγράφοντας ή μετακινώντας (```cp, mv```) έναν σύνδεσμο αντιγράφει/μετακινεί τον ίδιο το σύνδεσμο κι όχι το αρχείο/φάκελο στον οποίο δείχνει. 

## Περίληψη
Σ' αυτό το μάθημα είδαμε κάποιες από τις δυνατότητες του NIO.2. Ασχοληθήκαμε μόνο με αρχεία κειμένου (παραλείψαμε τα δυαδικά αρχεία η εγγραφή/ανάγνωση των οποίων γίνεται με την ```ByteBuffer```) ενώ δεν αναφερθήκαμε στις δυνατότητες που παρέχει το NIO.2 API να ανιχνεύουμε αλλαγές στο σύστημα αρχείων (```java.nio.file.WatchService```).

## Πηγές
1. ["The Java Tutorial"](https://docs.oracle.com/javase/tutorial/)
1. Darwin I. F. (2014), _Java Cookbook_, 3rd Ed., O’ Reilly.
1. Deitel P., Deitel H. (2018), _Java How to Program_, 11th Ed., Safari.
1. Leonard A. (2011), _Pro Java 7 NIO.2_, Apress.
1. Horstmann C. S. (2016), _Core Java, Volume 1 Fundamentals_, 10th Ed., Prentice-Hall.
1. Horstmann C. S. (2018), _Core Java SE 9 for the impatient_, 2nd Ed., Addison-Wesley. 
1. [Java Notes for Professionals](https://books.goalkicker.com/JavaBook/JavaNotesForProfessionals.pdf)

---

[<-](../5.2-Files/README.md)  | [Δ](../../README.md) | [->](../5.4-JDBC/README.md) 

---