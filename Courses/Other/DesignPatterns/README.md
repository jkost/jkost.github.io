# Design Patterns
© Ioannis Kostaras

---

#### Objectives

To be able to:
* Understand what Design Patterns are
* Learn to apply design patterns to the design process
* find the right patterns
* understand (un)applicability
* see when and how to bend a pattern
* evaluate design trade-os effectively
* Learn by (counter) example

---

## Introduction

A *Design Pattern (DP)* is a software engineering problem-solving discipline that emerged from the object-oriented community. Put simply, it is a solution to a common problem, a proven concept that describes deeper system structures and mechanisms.

A Design Pattern
* abstracts a recurring design structure
* comprises of class and/or object
  * dependencies
  * structures
  * interactions
  * conventions
* names & specifies the design structure explicitly
* distills design experience

Design patterns are language- and implementation-independent, a "micro-architecture", adjunct to existing methodologies (e.g. UML)

A Design Pattern has 4 basic parts:
* Name
* Problem
* Solution
* Consequences and trade-offs of application

### Goals of Design Patterns
* Codify good design
    * Distill and disseminate experience
    * Aid to novices and experts alike
    * Abstract how to think about design
* Give design structures explicit names
    * Common vocabulary
    * Reduced complexity
    * Greater expressiveness
* Capture and preserve design information
    * Articulate design decisions succinctly
    * Improve documentation
* Facilitate restructuring/refactoring
  * Patterns are interrelated
  * Additional exibility

### Benefits of Design Patterns

* design reuse
* uniform design vocabulary
* enhance understanding, restructuring
* basis for automation

### GoF Design Patterns

The term "Design Pattern" was introduced in the GoF (Gang of Four) book: "Design Patterns - Elements of Reusable, Object Oriented Software". The book describes 23 design patterns which are grouped into *Scope* and *Purpose*. *Scope* defines the domain over which a pattern applies. *Purpose* reflects what a pattern does. 

* *Scope*: Object (deals with objects) or Class (deals with relationships between classes)
* *Purpose*: Behavioural (deals with object interaction), Creational (concerned with object creation), or Structural (deals with object or class composition)

| Purpose | |Creational | Structural | Behavioural |
|---|--|---------|-------|-----------------|
||**Class**| Factory Method  | Adapter (Class) | Interpreter, Template Method |
|**Scope**|-| - | - | - |
||**Object**| Abstract Factory, Builder, Prototype, [Singleton](GoF/Creational/Singleton/README.md) | Adapter (Object), Bridge, Composite, Decorator, Flyweight, Facade, Proxy | Chain of Responsibility, Command, Iterator, Mediator, Memento, [Observer](GoF/Behavioural/Observer/README.md), State, Strategy, Visitor

But apart from those 23 GoF design patterns, we will present many more. These will include, Concurrent, Enterprise, Integration and Security design patterns.

### Design Patterns Template

| Name | Description |
| -------- | --------- |
| **Name** | The name of the design pattern |
| **Scope** | Object or Class |
| **Purpose** | Behavioural, Creational, or Structural |
| **Intent** | short description of the design pattern and its purpose |
| **Also Known As** | other names that people have given to the design pattern |
| **Motivation** | motivating scenario demonstrating the design pattern's use |
| **Applicability** | circumstances in which the design pattern applies |
| **Structure** | graphical representation of the design pattern using UML notation |
| **Participants** | participating classes and/or objects and their responsibilities; I will use [jpatterns](https://www.jpatterns.org/) annotations | 
| **Collaborations** | how participants cooperate to carry out their responsibilities (I will use [jpatterns](https://www.jpatterns.org/) annotations) |
| **Pros and Conss** | the results of application, benefits, liabilities |
| **Implementation** | implementation pitfalls, hints, or techniques, plus any language-dependent issues; sample implementations in Java, C#, C++ and Rust |
| **Known Uses** | where the design pattern is used in Java, C#, C++ and Rust |
| **Related Patterns** | other patterns that relate to this one |

### Conclusion

Design patterns promote:
* design reuse
* uniform design vocabulary
* understanding, restructuring
* automation
* a new way of thinking about design



## Bibliography and further reading
* Gamma, et al. (1995), *Design Patterns - Elements of Reusable Object-Oriented Software*, Addison-Wesley
* Alexander (1979), *The Timeless Way of Building*, Oxford.
* Alexander (1977), *A Pattern Language*, Oxford, 1977
* Brown, et al. (1998), *AntiPatterns*, Wiley
* Buschmann, et al. (1996), *Pattern-Oriented Software Architecture*, Wiley,
* Fowler (1996), *Analysis Patterns*, Addison-Wesley
* Freeman & Robson (2021), *Head First Design Patterns*, 2nd Ed., O'Reilly
* Knot (2018), *Concurrent Patterns and Best Practices*, Packt.
* Larman (1997), *Applying UML and Patterns*, Prentice Hall
* Lea (1997), *Concurrent Programming in Java*, Addison-Wesley
* *Pattern Languages of Program Design* (Addison-Wesley)
  * Coplien, et al. (1995), eds., Vol. 1
  * Vlissides, et al. (1996), eds., Vol. 2
  * Martin, et al. (1998), eds., Vol. 3
  * Harrison, et al. (2000), eds., Vol. 4
* Shalloway A. & Trott J.R. (2004), *Design Patterns Explained*, 2nd Ed., Addison-Wesley
* Vlissides (1998), *Pattern Hatching: Design Patterns Applied*, Addison-Wesley

* [A Learning Guide To Design Patterns](http://www.industriallogic.com/papers/learning.html)  
* [J2EE Patterns Catalogue](https://www.oracle.com/java/technologies/design-patterns-catalog.html)
* [Exception Patterns](http://c2.com/cgi/wiki?ExceptionPatterns)



