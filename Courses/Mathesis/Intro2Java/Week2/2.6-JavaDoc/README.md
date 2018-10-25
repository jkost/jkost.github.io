# 2.7 Τεκμηρίωση κώδικα {#Java} 
© Γιάννης Κωστάρας

---

[<-](../2.6-Boxing/README.md) | [Δ](../../README.md) | [->](../2.8-BestPractices/README.md)

---

Η τεκμηρίωση του κώδικα είναι το ίδιο σημαντική όπως και ο ίδιος ο κώδικας. Η Java παρέχει τα σχόλια JavaDoc (/** */) για το σκοπό αυτό.

```java
/**
  * Αυτή η κλάση περιγράφει έναν παίκτη του παιχνιδιού.
  */
public class Player {
  /** Ηλικία του παίκτη. Μπορεί να είναι (9-99). */
  private int age;
  
  /** 
    * Επιστρέφει το σκορ του παίκτη.
	* @param wins νίκες
	* @param fails αποτυχίες
	* @return το σκορ του παίκτη 
	*/
  public int score(int wins, int fails) {
	  int score;
	  //...
  	  return score;
  }

}
```

Βλέπουμε ότι μπορούμε να εισάγουμε σχόλια javadoc στο επίπεδο κλάσης, γνωρίσματος και μεθόδου. 


## Πηγές:
1. ["The Java Tutorial"](https://docs.oracle.com/javase/tutorial/)
1. Bloch J. (2018), _Effective Java_, 3rd Edition, Addison-Wesley.
1. Deitel P., Deitel H. (2018), _Java How to Program_, 11th Ed., Safari.
1. Downey A. B., Mayfield C. (2016), _Think Java_, O' Reilly. 
1. Eckel B. (2006), _Thinking in Java_, 4th Ed., Prentice-Hall.
1. Hillar G.C. (2017), _Java 9 with JShell_, Packt.
1. Horstmann C. S. (2016), _Core Java, Volume 1 Fundamentals_, 10th Ed., Prentice-Hall.
1. Horstmann C. S. (2018), _Core Java SE 9 for the impatient_, 2nd Ed., Addison-Wesley. 
1. Sharan K. (2017), _Java 9 Revealed: For Early Adoption and Migration_, Apress.
1. Sierra K. & Bates B. (2005), _Head First Java_, 2nd Ed. for Java 5.0, O’Reilly.

---

[<-](../2.6-Boxing/README.md) | [Δ](../../README.md) | [->](../2.8-BestPractices/README.md)

---