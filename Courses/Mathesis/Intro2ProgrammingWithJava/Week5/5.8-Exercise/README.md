# 5.8 Άσκηση Αντικειμενοστραφούς Προγραμματισμού (συνέχεια)
© Γιάννης Κωστάρας

---

[🏠](https://jkost.github.io) | [⬆️](../../README.md) | [◀️](../5.7-OtherCollections/README.md)

---

[![](../../../assets/jupyter_logo.svg)](5.8-Exercise.ipynb)

Πλέον μπορούμε να εφαρμόσουμε όσα μάθαμε στα μαθήματα αυτής της εβδομάδας ώστε να απλοποιήσουμε την υλοποίηση του έργου _School_.

## Υλοποίηση με το NetBeans
1. Ανοίξτε το έργο _School_ που δημιουργήσαμε στην προηγούμενη άσκηση από το μενού **File -> Open Project**  ή **File -> Open Recent Project** αν δεν το έχετε ήδη ανοικτό.

Επαναλαμβάνουμε εδώ τον κώδικα των κλάσεών μας.

```Java
package school.validation;
/**
 * An Utility Validation class.
 */
public final class Validation {
    /** Max size for names. */
    private static final int MAX_SIZE = 20;
    /** Classroom name length. */
    private static final int CLASSROOM_NAME_LENGTH = 2;
    /** Classroom min size. */
    private static final int CLASSROOM_MIN_SIZE = 10;
    /** Classroom default/max size. */
    public static final int CLASSROOM_MAX_SIZE = 30;
    /** Identity length. */
    private static final int ID_LENGTH = 8;

    /**
     * No instance of this class are allowed.
     */
    private Validation() {
    }

    /**
     * A {@code name} is valid if it is neither {@code null} nor empty and 
     * not more than {@code MAX_SIZE}.
     * @param name a name
     * @return {@code true} if {@code name} is valid
     * @see MAX_SIZE
     */
    public static boolean isNameValid(String name) {
        return name != null && !name.isBlank() && name.length() <= MAX_SIZE;
    }
    
    /**
     * A valid age is between 15 and 18 years old. 
     * 
     * @param inAge an age
     * @return {@code true} if {@code inAge} is between the limits
     */
    public static boolean isAgeValid(int inAge) {
        return inAge >= 15 && inAge <= 18;
    }

    /**
     * A valid classroom size is between 10 and 30 pupils.
     * 
     * @param inSize classroom size
     * @return {@code true} if {@code inSize} is between the limits
     * @see CLASSROOM_MIN_SIZE
     * @see CLASSROOM_MAX_SIZE
     */
    public static boolean isSizeValid(int inSize) {
        return inSize >= CLASSROOM_MIN_SIZE && inSize <= CLASSROOM_MAX_SIZE;
    }

    /**
     * A valid classroom name should start with one of the letters {@code Α, Β, Γ}
     * and end with a number. E.g. {@code Γ1}.
     * @param classRoom a classroom name
     * @return {@code true} if {@code classRoom} is valid
     * @see CLASSROOM_NAME_LENGTH
     */
    public static boolean isClassRoomNameValid(String classRoom) {
        return classRoom != null && !classRoom.isBlank()
                && classRoom.length() == CLASSROOM_NAME_LENGTH
                && (classRoom.startsWith("Α")
                || classRoom.startsWith("Β")
                || classRoom.startsWith("Γ"))
                && classRoom.charAt(1) >= '1'
                && classRoom.charAt(1) <= '9';
    }
    
    /**
     * A valid Hellenic ID consists of two letters and six numbers. E.g. {@code XY123456}.
     * @param id a Hellenic ID number (ΑΔΤ)
     * @return {@code true} if the {@code id} is valid
     * @see ID_LENGTH
     */
    public static boolean isIdValid(String id) {
        return id != null && !id.isBlank() && id.length() == ID_LENGTH
                && isCapitalLetter(id.charAt(0))
                && isCapitalLetter(id.charAt(1))
                && isNumber(id.charAt(2))
                && isNumber(id.charAt(3))
                && isNumber(id.charAt(4))
                && isNumber(id.charAt(5))
                && isNumber(id.charAt(6))
                && isNumber(id.charAt(7));
    }

    /**
     * Check if {@code c} is a capital letter.
     * @param c character to check
     * @return {@code true} if {@code c} is capital letter.
     */
    public static boolean isCapitalLetter(char c) {
        return c >= 'A' && c <= 'Ω';
    }
    
    /**
     * Check if {@code c} is a number.
     * @param c character to check
     * @return {@code true} if {@code c} is a number.
     */
    public static boolean isNumber(char c) {
        return c >= '0' && c <= '9';
    }
}
```


```Java
package school;

import school.validation.Validation;

/**
 * Parent class of any person.
 */
public abstract class Person {
    /** The empty string used in case no name has been given. */
    static final String NONE = "<Κενό>";
    /** Person's first name. */
    protected String firstName = NONE;
    /** Person's last name. */
    protected String lastName = NONE;

    /**
     * Creates a new person. Is only called by subclasses.
     * 
     * @param firstName first name
     * @param lastName last name
     * @see school.validation.Validation#isNameValid
     */
    Person(String firstName, String lastName) {
        if (Validation.isNameValid(firstName)) {
            this.firstName = firstName.trim();
        }
        if (Validation.isNameValid(lastName)) {
            this.lastName = lastName.trim();
        }
    }

    /**
     * @return person's first name 
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * Set person's first name. 
     * 
     * @param firstName a new first name
     * @see school.validation.Validation#isNameValid
     */
    public void setFirstName(String firstName) {
        this.firstName = Validation.isNameValid(firstName) ? firstName.trim() : NONE;
    }

    /**
     * @return person's last name 
     */
    public String getLastName() {
        return lastName;
    }
    
    /**
     * Set person's last name. 
     * 
     * @param lastName a new last name
     * @see school.validation.Validation#isNameValid
     */
    public void setLastName(String lastName) {
        this.lastName = Validation.isNameValid(lastName) ? lastName.trim() : NONE;
    }

    @Override
    public String toString() {
        return ", firstName=" + firstName + ", lastName=" + lastName;
    }
}
```


```Java
package school;

import school.validation.Validation;

/**
 * A student of the school.
 */
public class Student extends Person {
    /** Automatic counter to set AM. */
    private static int amCounter = 0;
    /** Student's registration number (AM).*/
    private final int am;
    /** Student's age. -1 means age has not been set. */
    private int age = -1;  // 15-18
    /** Student's classroom. */
    private ClassRoom classRoom;

    /**
     * Constructor.
     * 
     * @param firstName student's first name
     * @param lastName student's last name
     * @param age student's age must be between 15 and 18 years old
     * @see school.validation.Validation#isAgeValid(int) 
     */
    public Student(String firstName, String lastName, int age) {
        super(firstName, lastName);
        am = ++amCounter;
        if (Validation.isAgeValid(age)) {
            this.age = age;
        }
    }

    /**
     * Student's AM is calculated automatically.
     * @return student's AM
     */
    public int getAm() {
        return am;
    }
    
    /**
     * @return student's age 
     */
    public int getAge() {
        return age;
    }

    /**
     * Set student's age. It increases every year.
     * @param age student's age.
     * @see school.validation.Validation#isAgeValid(int) 
     */
    public void setAge(int age) {
        this.age = Validation.isAgeValid(age) ? age : -1;
    }

    /**
     * @return the classroom the student is in.
     */
    public ClassRoom getClassRoom() {
        return classRoom;
    }

    /**
     * Set student's classroom.
     * @param classRoom new classroom for student.
     */
    void setClassRoom(ClassRoom classRoom) {
        this.classRoom = classRoom;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 41 * hash + this.am;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Student other = (Student) obj;
        return this.am == other.am;
    }
    
    @Override
    public String toString() {
        return "Student{" + "am=" + am + super.toString() + ", age=" + age + ", classRoom=" + classRoom + '}';
    }
}
```

```Java
package school;

import java.util.Arrays;
import java.util.Objects;
import school.validation.Validation;

/**
 * A school teacher.
 */
public class Teacher extends Person {
    /** Max number of lessons a teacher can teach in the school. */
    private static final int MAX_LESSONS = 3;
    /** No ID number. */
    private String id = NONE;  // ΑΔΤ
    /** Lessons the teacher can teach. */
    private String[] lessons;
    /** How many lessons the teacher teaches. */
    private int index = 0;

    /**
     * Constructor.
     * 
     * @param id teacher's ID number
     * @param firstName teacher's first name
     * @param lastName teacher's last name
     * @param lessons a teacher can teach up to 3 lessons
     * @see MAX_LESSONS
     * @see school.validation.Validation#isIdValid(java.lang.String) 
     */
    public Teacher(String id, String firstName, String lastName, String... lessons) {
        super(firstName, lastName);
        if (Validation.isIdValid(id)) {
            this.id = id;
        }
        if (lessons != null && lessons.length > 0) { // αντιγράφουμε μόνο τα 3 πρώτα μαθήματα
            int length = lessons.length > MAX_LESSONS ? MAX_LESSONS : lessons.length;
            this.lessons = Arrays.copyOfRange(lessons, 0, length);
        } else {
            this.lessons = new String[MAX_LESSONS];
        }
    }

    /**
     * @return the teacher's ID number
     */
    public String getId() {
        return id;
    }

    /**
     * Set the teacher's id.
     * 
     * @param id the new ID number. It shouldn't be null.
     * @see school.validation.Validation#isIdValid(java.lang.String)
     */
    public void setId(String id) {
        this.id = Validation.isIdValid(id) ? id : NONE;
    }

    /**
     * Add a new lesson that this teacher teaches. If the number of lessons
     * that a teacher can teach is reached, the lesson is ignored.
     * @param lesson lesson to add
     */
    public void addLesson(String lesson) {
        if (lesson != null && index < MAX_LESSONS) {
            lessons[index++] = lesson;
        }
    }
    /**
     * Remove the lesson from the lessons that this teacher teaches. If the 
     * lesson is not teached by this teacher, it is ignored.
     * @param lesson lesson to remove
     */
    public void removeLesson(String lesson) {
        if (lesson != null) {
            remove(contains(lessons, lesson));
        }
    }
    
    /**
     * Checks if the teacher teaches this lesson.
     * @param les lesson to search for
     * @return {@code true} if the teacher teaches this lesson.
     */
    public boolean contains(String les) {
        return les == null ? false : contains(this.lessons, les) >= 0;
    }
    
    /**
     * @return the lessons that this teacher teaches. 
     */
    public String[] getLessons() {
        return Arrays.copyOf(lessons, index);
    }    

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 59 * hash + Objects.hashCode(this.id);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Teacher other = (Teacher) obj;
        return Objects.equals(this.id, other.id);
    }

    @Override
    public String toString() {
        return "Teacher{" + "id=" + id + super.toString() + ", lessons=" + Arrays.toString(lessons) + '}';
    }    
    
    /**
     * Checks to see if {@code les} exists in the list of lessons
     * @param lessons array of lessons
     * @param les lesson to search for
     * @return {@code true} if {@code les} is found in {@code lessons}
     */
    private int contains(String[] lessons, String les) {
        for (int i = 0; i < index; i++) {
            String lesson = lessons[i];
            if (lesson != null && lesson.equalsIgnoreCase(les)) {
                return i;
            }
        }
        return -1;
    }

    /**
     * Remove index {@code indx} from {@code lessons}
     * @param indx index
     * @return {@code true} if the lesson was successfully removed.
     */
    private boolean remove(int indx) {
        if (indx < 0 || indx >= this.lessons.length) {
            return false;
        }
        String[] newLessons = new String[this.lessons.length - 1];
        // αντιγραφή από το 0 μέχρι το lessons[index-1]
        System.arraycopy(this.lessons, 0, newLessons, 0, indx);
        // αντιγραφή από lessons[index+1] μέχρι lessons[lessons.length-1]
        System.arraycopy(this.lessons, indx + 1, newLessons, indx, this.lessons.length - indx - 1);
        this.lessons = newLessons;
        index--;
        return true;
    }
}
```

```Java
package school;
import java.util.Arrays;
import java.util.Objects;
import school.validation.Validation;

/**
 * A classroom has a name, a size and contains students.
 */
public class ClassRoom {
    /** Empty classroom name. */
    private static final String NO_CLASSROOM = "--";
    /** Classroom's name. */ 
    private final String name;
    /** Classroom's size. */ 
    private final int size;
    /** Classrooms' students. */ 
    private Student[] students;
    /** Classroom's number of students. */ 
    private int index = 0;

    /**
     * Constructor.
     * 
     * @param name classroom's name
     * @param size classroom's size
     * @see school.validation.Validation#isClassRoomNameValid(java.lang.String) 
     * @see school.validation.Validation#isSizeValid(int)
     * @see school.validation.Validation#CLASSROOM_MAX_SIZE
     * @see NO_CLASSROOM
     */
    public ClassRoom(String name, int size) {
        this.name = Validation.isClassRoomNameValid(name) ? name : NO_CLASSROOM;
        this.size = Validation.isSizeValid(size) ? size : Validation.CLASSROOM_MAX_SIZE;
        this.students = new Student[size];
    }

    /**
     * Constructor. Default size.
     * 
     * @param name classroom's name. 
     * @see school.validation.Validation#CLASSROOM_MAX_SIZE
     */
    public ClassRoom(String name) {
        this(name, Validation.CLASSROOM_MAX_SIZE);
    }

    /**
     * @return classroom's name
     */
    public String getName() {
        return name;
    }

    /**
     * @return classroom's size
     */
    public int getSize() {
        return size;
    }

    /**
     * Add {@code student} to the class. 
     * @param student to add
     */
    public void addStudent(Student student) {
        if (student != null && index < size) {
            students[index++] = student;
            student.setClassRoom(this);
        }
    }

    /**
     * Remove student with {@code am} from this class.
     * @param am student's reg. number.
     */
    public void removeStudent(int am) {
        int indx = contains(students, am);
        if (indx != -1) {
            Student student = students[indx];
            if (remove(indx)) {
                student.setClassRoom(null);
            }
        }
    }

    /**
     * Remove {@code student} from this class.
     * 
     * @param student student to remove from this class
     */
    public void removeStudent(Student student) {
        if (student != null) {
            removeStudent(student.getAm());
            student.setClassRoom(null);
        }
    }

    /**
     * Empty this class.
     */
    public void removeAllStudents() {
        for (int i = 0; i < index; i++) {
            students[i].setClassRoom(null);
        }
        Arrays.fill(students, null);
        index = 0;
    }
    
    /**
     * Checks if the student is in this class.
     * @param am am of student to search for
     * @return {@code true} if the student with the given {@code am} exists in this class.
     */
    public boolean contains(int am) {
        return contains(this.students, am) >= 0;
    }
    
    /**
     * @return the students of this class. 
     */
    public Student[] getStudents() {
        return Arrays.copyOf(students, index);
    }       

    /**
     * Checks to see if {@code am} exists in the list of students
     * @param students array of students
     * @param am am to search for
     * @return {@code true} if {@code am} is found in {@code students}
     */
    private int contains(Student[] students, int am) {
        for (int i = 0; i < index; i++) {
            Student student = students[i];
            if (student != null && student.getAm() == am) {
                return i;
            }
        }
        return -1;
    }

    /**
     * Remove index {@code indx} from {@code students}
     * @param indx index
     * @return {@code true} if the student was successfully removed.
     */
    private boolean remove(int indx) {
        if (indx < 0 || indx > this.index) return false;
        Student[] newStudents = new Student[this.students.length - 1];
        // αντιγραφή από το 0 μέχρι το students[index-1]
        System.arraycopy(this.students, 0, newStudents, 0, indx);
        // αντιγραφή από students[index+1] μέχρι students[students.length-1]
        System.arraycopy(this.students, indx + 1, newStudents, indx, this.students.length - indx - 1);
        this.students = newStudents;
        index--;
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + Objects.hashCode(this.name);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
    
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final ClassRoom other = (ClassRoom) obj;
        return Objects.equals(this.name, other.name);
    }

    @Override
    public String toString() {
        return "ClassRoom{" + "name=" + name + ", size=" + size + ", numOfStudents=" + index + '}';
    }
}
```

Θα τροποποιήσουμε τις κλάσεις ```ClassRoom``` και ```Teacher```. Τι δομή θα χρησιμοποιούσατε για να αποθηκεύσετε τους μαθητές στην κλάση ```ClassRoom```; Επειδή δεν μας ενδιαφέρει η σειρά των μαθητών και δε θα θέλαμε να καταχωρήσουμε κατά λάθος τον ίδιο μαθητή δυο φορές στην ίδια τάξη, θα χρησιμοποιήσουμε τη δομή ```Set```. Θα κάνουμε και άλλες αλλαγές όπως φαίνεται παρακάτω:


```Java
package school;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;
import school.validation.Validation;

/**
 * A classroom has a name, a size and contains students.
 */
public class ClassRoom {
    /** Empty classroom name. */
    private static final String NO_CLASSROOM = "--";
    /** Classroom's name. */ 
    private final String name;
    /** Classroom's size. */ 
    private final int size;
    /** Classrooms' students. */ 
    private final Set<Student> students;

    /**
     * Constructor.
     * 
     * @param name classroom's name
     * @param size classroom's size
     * @see school.validation.Validation#isClassRoomNameValid(java.lang.String) 
     * @see school.validation.Validation#isSizeValid(int)
     * @see school.validation.Validation#CLASSROOM_MAX_SIZE
     * @see NO_CLASSROOM
     */
    public ClassRoom(String name, int size) {
        this.name = Validation.isClassRoomNameValid(name) ? name : NO_CLASSROOM;
        this.size = Validation.isSizeValid(size) ? size : Validation.CLASSROOM_MAX_SIZE;
        this.students = new HashSet<>(size);
    }

    /**
     * Constructor. Default size.
     * 
     * @param name classroom's name. 
     * @see school.validation.Validation#CLASSROOM_MAX_SIZE
     */
    public ClassRoom(String name) {
        this(name, Validation.CLASSROOM_MAX_SIZE);
    }

    /**
     * @return classroom's name
     */
    public String getName() {
        return name;
    }

    /**
     * @return classroom's size
     */
    public int getSize() {
        return size;
    }

    /**
     * Add {@code student} to the class. 
     * @param student to add
     */
    public void addStudent(Student student) {
        if (student != null && students.size() < size) {
            students.add(student);
            student.setClassRoom(this);
        }
    }

    /**
     * Remove student with {@code am} from this class.
     * @param am student's reg. number.
     * @return the removed student
     */
    public Student removeStudent(int am) {
        Student student = contains(am);
        if (removeStudent(student)) {
           student.setClassRoom(null);
        }
        return student;
    }

    /**
     * Remove {@code student} from this class.
     * 
     * @param student student to remove from this class
     * @return {@code true} if student was removed successfully
     */
    public boolean removeStudent(Student student) {
        boolean removed = false;
        if (student != null) {
            removed = students.remove(student);
            if (removed) {
                student.setClassRoom(null);
            }
        }
        return removed;
    }

    /**
     * Empty this class.
     */
    public void removeAllStudents() {
        for (Student student : students) {
            student.setClassRoom(null);
        }
        students.clear();
    }
    
    /**
     * Checks if the student is in this class.
     * @param am am of student to search for
     * @return {@code true} if the student with the given {@code am} exists in this class.
     */
    public Student contains(int am) {
        for (Student student : students) {
            if (student.getAm() == am) {
                return student;
            }
        }
        return null;
    }
    
    /**
     * @return the students of this class. 
     */
    public Collection<Student> getStudents() {
        return Collections.unmodifiableCollection(students);
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + Objects.hashCode(this.name);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
    
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final ClassRoom other = (ClassRoom) obj;
        return Objects.equals(this.name, other.name);
    }

    @Override
    public String toString() {
        return "ClassRoom{" + "name=" + name + ", size=" + size + ", numOfStudents=" + students.size() + '}';
    }
}
```

Ξεφορτωθήκαμε την ```index```, τις ```private contains(), remove()``` και απλοποιήσαμε άλλες μεθόδους. 

Παρόμοια και στην ```Teacher```:


```Java
package school;

import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;
import school.validation.Validation;

/**
 * A school teacher.
 */
public class Teacher extends Person {
    /** Max number of lessons a teacher can teach in the school. */
    private static final int MAX_LESSONS = 3;
    /** No ID number. */
    private String id = NONE;  // ΑΔΤ
    /** Lessons the teacher can teach. */
    private final Set<String> lessons;

    /**
     * Constructor.
     * 
     * @param id teacher's ID number
     * @param firstName teacher's first name
     * @param lastName teacher's last name
     * @param lessons a teacher can teach up to 3 lessons
     * @see MAX_LESSONS
     * @see school.validation.Validation#isIdValid(java.lang.String) 
     */
    public Teacher(String id, String firstName, String lastName, String... lessons) {
        super(firstName, lastName);
        if (Validation.isIdValid(id)) {
            this.id = id;
        }
        if (lessons != null && lessons.length > 0) { // αντιγράφουμε μόνο τα 3 πρώτα μαθήματα
            int length = lessons.length > MAX_LESSONS ? MAX_LESSONS : lessons.length;
            this.lessons = new HashSet<>(Arrays.asList(Arrays.copyOfRange(lessons, 0, length)));
        } else {
            this.lessons = new HashSet<>(MAX_LESSONS);
        }
    }

    /**
     * @return the teacher's ID number
     */
    public String getId() {
        return id;
    }

    /**
     * Set the teacher's id.
     * 
     * @param id the new ID number. It shouldn't be null.
     * @see school.validation.Validation#isIdValid(java.lang.String)
     */
    public void setId(String id) {
        this.id = Validation.isIdValid(id) ? id : NONE;
    }

    /**
     * Add a new lesson that this teacher teaches. If the number of lessons
     * that a teacher can teach is reached, the lesson is ignored.
     * @param lesson lesson to add
     */
    public void addLesson(String lesson) {
        if (lesson != null && lessons.size() < MAX_LESSONS) {
            lessons.add(lesson);
        }
    }
    /**
     * Remove the lesson from the lessons that this teacher teaches. If the 
     * lesson is not teached by this teacher, it is ignored.
     * @param lesson lesson to remove
     */
    public void removeLesson(String lesson) {
        if (lesson != null) {
            this.lessons.remove(lesson);
        }
    }
    
    /**
     * Checks if the teacher teaches this lesson.
     * @param les lesson to search for
     * @return {@code true} if the teacher teaches this lesson.
     */
    public boolean contains(String les) {
        return les == null ? false : this.lessons.contains(les);
    }
    
    /**
     * @return the lessons that this teacher teaches. 
     */
    public Collection<String> getLessons() {
        return Collections.unmodifiableCollection(this.lessons);
    }    

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 59 * hash + Objects.hashCode(this.id);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Teacher other = (Teacher) obj;
        return Objects.equals(this.id, other.id);
    }

    @Override
    public String toString() {
        return "Teacher{" + "id=" + id + super.toString() + ", lessons=" + lessons + '}';
    }    

}
```
Μπορείτε να πειραματιστείτε περαιτέρω εδώ <a href="sandbox/exercise.html" target="_blank"><img src="../../../assets/javaalmanac.svg" alt="javaalmanac.io" style="width:5%; height:5%;"></a>.

---

[🏠](https://jkost.github.io) | [⬆️](../../README.md) | [◀️](../5.7-OtherCollections/README.md)

---
