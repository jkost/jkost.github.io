# C++ for Java Programmers {#Java}{#C++} 
© Ioannis Kostaras

---
The Java and C++ programming languages share many things in common. Actually, Java was designed to be a simplified version of C++. In this book we will compare the two languages, or if you, learn two languages in parallel.

## 1. C++/Java and classes 
C++ and Java support OOP and define classes in a similar way following similar rules. However, there are some differences. 

While Java defines scope per defined attribute/method, C++ uses sections for ```private, public, protected``` access: 

```java
// Java
class Car {
  private int speed;
  private Color color;
  public Car(int speed, Color color) { this.speed = speed; this.color = color; }
  public int getSpeed() { return speed; }
  public void setSpeed(int spd) { if (spd >= 0) this.speed = spd; }
  public Color getColor() { return color; }
  public void setColor(Color c) { this.color = c; }
  public void accelerate() { this.speed++; }
}
```
```cpp
// C++
class Car {
  private:  
     unsigned int speed;
     string color;
  public:
     Car (int speed, string color);
     ~Car();
     int getSpeed() const { return speed; }
     void setSpeed(int spd) { if (spd >= 0) this.speed = spd; }
     string getColor() const { return color; }
     void setColor(string c) { this.color = c; }
     void accelerate() { this.speed++; }
}
Car::Car(int speed, string color) {
   this.speed = speed;
   this.color = color;
}
Car::~Car() { }
```

If you define a constructor, it’s a good practice to define a destructor in C++ (i.e. ```~Car()```) even if your destructor does nothing. This helps you remember to make use of the destructor when you need to take explicit steps to free memory. 

Like in Java, if you declare no constructors in C++, the compiler creates a default constructor. The default constructor that the compiler provides takes no action; it is as if you declared a constructor with no parameters whose body was empty. 

There are two important points to note: 

* The default constructor is any constructor that takes no parameters. You can define it yourself or be provided one as a default from the compiler. 
* If you define any constructor (with or without parameters), the compiler does not provide a default constructor for you. In that case, if you want a default constructor, you must define it yourself. 

If you fail to define a destructor, the compiler also provides one of those, which also has an empty body and does nothing. 

C++ does not define default or ```package``` scopes; these exist only in Java. 

In C++, if you declare a member function to be constant with the ```const``` keyword, it indicates that the function won’t change the value of any members of the class. To declare a function as constant, put the keyword ```const``` after the parentheses (see e.g. ```getSpeed()```). Accessors used to retrieve a variable’s value, which are also called getter methods, often are constant functions. 

If you declare a function to be ```const``` and the implementation of that function changes the object by changing the value of any of its members, the compiler will flag it as an error. It is good programming practice to declare as many functions to be ```const``` as possible. When you do, this enables the compiler to catch unintended changes to member variables, instead of letting these errors show up when your program is running. 

As mentioned in 8., it is a good practice to define the interface of a class in a header (```.h``` or ```.hpp```) file and the implementation in a ```.cpp``` file (using ```<class_name>::<method_name>```).
 
Methods can be defined as ```inline```, as answered in 17.. If the implementation of a member function is defined in the declaration of the class, this automatically makes that function inline and you don't need to specify the ```inline``` keyword. 

Regarding inheritance, here is an example to compare Java and C++: 
```java
// Java
// Base class
class Shape {
   protected int width;
   protected int height;
   public void setWidth(int w) { width = w; }
   public void setHeight(int h) { height = h; }    
};

// Derived class
class Rectangle extends Shape {
   public int getArea() { 
         return (width * height); 
   }
};
```
```cpp
// C++
// Base class
class Shape {
   public:
      void setWidth(int w) {
         width = w;
      }
      void setHeight(int h) {
         height = h;
      }
      
   protected:
      int width;
      int height;
};

// Derived class
class Rectangle : public Shape {
   public:
      int getArea() { 
         return (width * height); 
      }
};
```
```:``` in C++ plays the role of ```extends``` in Java. 
```cpp
class derived-class: access-specifier base-class
```

```access-specifier``` is one of ```public, protected```, or ```private``` (default).
 
A derived class can access all the non-private members of its base class. Thus base-class members that should not be accessible to the member functions of derived classes should be declared ```private``` in the base class.
 
| Access | public |	protected |	private |
| Same class | yes | yes |	yes    |
| Derived classes |	yes |	yes |	no  |
| Outside classes |	yes |	no |	no  |

A _derived_ class inherits all base class methods with the following exceptions: 

* Constructors, destructors and copy constructors of the base class. 
* Overloaded operators of the base class. 
* The friend functions of the base class. 

When deriving a class from a base class, the base class may be inherited through ```public, protected``` or ```private``` inheritance. The type of inheritance is specified by the access-specifier as explained above.
 
*	_Public Inheritance_: When deriving a class from a ```public``` base class, ```public``` members of the base class become ```public``` members of the derived class and ```protected``` members of the base class become ```protected``` members of the derived class. A base class's ```private``` members are never accessible directly from a derived class, but can be accessed through calls to the public and protected members of the base class. This is the same as inheritance in Java. 
*	_Protected Inheritance_: When deriving from a ```protected``` base class, ```public``` and ```protected``` members of the base class become ```protected``` members of the derived class. 
*	_Private Inheritance_: When deriving from a ```private``` base class, ```public``` and ```protected``` members of the base class become ```private``` members of the derived class. 

Protected and private inheritance are hardly used in C++. 

C++ supports _multiple inheritance_, i.e. a derived class can inherit from many base classes; Java supports multiple inheritance only by implementing many interfaces, but a derived class in Java cannot inherit from more than one base class. 

## 2. What does the ```virtual``` keyword mean? 
A _virtual function_ or _virtual method_ is a function or method whose behavior can be overridden within an inheriting class by a function with the same signature. In Java it would be declared as ```abstract void aMethod();```. The ```virtual``` keyword gives C++ its' ability to support polymorphism. 


## 3. What does ```virtual void AMethod() = 0;``` mean? 
This is a _pure virtual function_. A pure virtual function or pure virtual method is a virtual function that is required to be implemented by a derived class that is not abstract. This means, that subclasses have to implement this function, otherwise they are abstract, meaning you cannot create objects of that class. In Java it would be declared as ```abstract void aMethod();```. In Java abstract methods of interfaces (apart from default ones) are pure virtual methods. 
E.g. 
```java
class AnInterface {
public:
    virtual void AMethod( ) = 0;
}

class AnInterfaceImpl : public AnInterface {
public:
    virtual void AMethod( ) {
       // implementation
    }
}
```

## 4. Why my static variables cannot be initialised? 
```cpp
MetricDistance.h 
 #include <string>

class MetricDistance 
{    

private:
    static std::string M;
    static std::string NM;
    static std::string KM;
    static std::string SM;
    static std::string FT;

//    sgcST::Value* toValue(const std::string& sValue, MetricFormat* metricFormat);

protected:
    MetricDistance();
};
```
```cpp
MetricDistance.cpp 
 #include "MetricDistance.h"
using namespace std;

MetricDistance::MetricDistance() {
  std::string MetricDistance::M = "m";
  std::string MetricDistance::NM = "nm";
  std::string MetricDistance::KM = "km";
  std::string MetricDistance::SM = "sm";
  std::string MetricDistance::FT = "ft";
}
```

Static variables are initialised outside the constructor: 
```cpp
MetricDistance.cpp 
 #include "MetricDistance.h"
using namespace std;

std::string MetricDistance::M = "m";
std::string MetricDistance::NM = "nm";
std::string MetricDistance::KM = "km";
std::string MetricDistance::SM = "sm";
std::string MetricDistance::FT = "ft";

MetricDistance::MetricDistance() {
}
```

## 5. What does ```const``` mean after the declaration of a method? E.g. ```void displayMessage() const;```
This means that the function does not, and should not modify the object on which it's called. This can help to locate errors if you accidentally insert code in the method that would modify the object. 

## 6. How many ways exist to initialise variables in constructors? 
In Java one can use one or more constructors to initialise variables: 

```java
public class Person {
   private String pname;
   public Person(String name) {
      this.pname = name;
   }
   // ...
}
```

In C++, apart from a way similar to the above, you might come across other ways, e.g. the constructor uses a member-initializer list to initialize the ```pname``` data member with the value of the constructor’s parameter name: 

```cpp
class Person {
   private:
     string pname;
   public:
     explicit Person(string name) : pname(name) {
       // ...
   }
   // ...
};
```

Member initializers appear between a constructor’s parameter list and the left brace that begins the constructor’s body. The member initializer list is separated from the parameter list with a colon (```:```). A member initializer consists of a data member’s variable name followed by parentheses containing the member’s initial value. In this example, ```pname``` is initialized with the value of the parameter name. If a class contains more than one data member, each data member’s initializer is separated from the next by a comma. The member initializer list executes before the body of the constructor executes. You can perform initialization in the constructor’s body, but it's more efficient to do it with member initializers, and some types of data members must be initialized this way. (See next question for an explanation of the explicit keyword). 

Constructor parameters may also have default values in C++: 
```cpp
class Person {
   private:
     string pname;
   public:
     explicit Person(string name = "NONAME") : pname(name) {
       // ...
   }
   // ...
};
```

## 7. What is the purpose of the ```explicit``` keyword? 
By default, a single argument constructor will act as an implicit conversion operation, applied automatically. The constructor’s argument is converted to an object of the class in which the constructor is defined. The conversion is automatic and you need not use a cast operator. In some situations, implicit conversions are undesirable or error-prone. E.g.
 
```cpp
class MyArray {
  private:
    int size;
  public:
    MyArray(int s) : size(s) {...}     
    ...
};
...
MyArray a(10);
...
a = 20;  // 20 is automatically converted to a new MyArray and is assigned to a
// explicit keyword can be used in every constructor that can be called with one argument only, to prevent the implicit conversion. 
class MyArray {
  private:
    int size;
  public:
    explicit MyArray(int s) : size(s) {...}     
    ...
};
...
MyArray a(10);
...
a = 20;  // [Error] no match for 'operator=' (operand types are 'MyArray' and 'int')
```

## 8. C++ headers vs Java Interfaces? 
When building an object-oriented C++ program, it’s customary to define reusable source code (such as a class) in a file that by convention has a ```.h``` or ```.hpp``` filename extension—known as a _header_. Programs use ```#include``` preprocessing directives to include headers. C++ headers contain public methods. Headers should never contain ```using``` directives or ```using``` declarations (e.g. ```using namespace std;```). Headers enable the compiler to determine the amount of memory that it must reserve for each object and ensure that a program calls member functions correctly. 

It is a good practice to not expose implementation of methods (i.e. only function prototypes) in header files. A function prototype is a declaration of a function that tells the compiler the function’s name, its return type and the types of its parameters. The header can still specify the class’s private attributes. 

If the implementation is exposed, then the programmer might write client code based on the class’s implementation details. Ideally, if that implementation changes, the class’s clients should not have to change. Hiding the class’s implementation details makes it easier to change the class’s implementation while minimizing, and hopefully eliminating, changes to client code. In other words, it is a good practice to use C++ interfaces like Java interfaces. Method implementation goes in the respective ```.cpp``` file. E.g. 
```cpp
// MyClass.h
#include <string>
class MyClass
{
 public:
    explicit MyClass (std::string);
    void setName(std::string);
    std::string getName() const;
    void display() const;
 private:
   std::string name; 
};

// MyClass.cpp
#include <MyClass>
#include <string>
using namespace std;
explicit MyClass::MyClass (string aName) : name(aName){
}
void MyClass::setName(string aName) {
  name = aName
}
string MyClass::getName() const {
  return name;
}
void MyClass::display() const {
  cout << name << endl;
}
```
Remember that user defined interfaces can be included using double quotes (```""```) while library ones can be included using (```<>```). E.g. client program: 
```cpp
 #include "MyClass"
 #include <string>
//...
```
Each member-function name is preceded by the class name and the scope resolution operator (```::```). This “ties” each member function to the class definition, which declares the class’s member functions and data members. Without ```MyClass::``` preceding each function name, these functions would not be recognized by the compiler as member functions of the class; the compiler would consider them “free” or “loose” functions, like ```main()```. These are also called _global functions_. Such functions cannot access ```MyClass```’s private data or call the class’s member functions, without specifying an object. So, the compiler would not be able to compile these functions. 

Java interfaces contain public method signatures without implementation. Attributes (except from constant values) are not allowed in Java interfaces, in other words, Java interfaces have no state. As an exception, Java 8 allows implementation code in methods using the ```default``` keyword. This was added to allow for extensibility of the language. E.g. 
```java
// a Java 8 interface
public interface MyClass {
    void setName(String);
    String getName();
    default void display() {
        // default implementation 
    }
}
```
The following table summarizes the above: 

| |	C++ header 	| Java Interface	| Java 8 Interface 
| Method signatures 	|Yes |	Yes |	Yes 
| Method implementations |	Yes (bad practice) | No 	| Yes (default) 
| Attributes |	Yes |	No (only constants)    | No (only constants) 

## 9. How is casting done in C++? 
In Java casting is easy, just prepend your variable with the data type to cast to inside parentheses, e.g. ```(int)my_var```. In C++, the syntax is more complex, e.g. ```static_cast<int>(my_var)```. The old C-type cast operation is deprecated in C++ as there was very little correctness checking. 

Replaced by 4 types of casts in C++: 

*	_Dynamic casts_: ```dynamic_cast<type>(expression)``` converts ```expression``` to ```type```, where ```type``` must be the same class or a subclass as the ```expression```, in other words it is downcasting. ```expression``` and ```type``` must be pointers or references. E.g.
```cpp 
Shape* s;
Square* sq = dynamic_cast<Square*>(s);
```
* _Static casts_: ```static_cast<type>(expression)``` converts ```expression``` from its type to ```type```, if such a conversion is possible (there is no runtime checking). E.g.
```cpp 
float x = 3.14;
int y = static_cast<int>(x);
```
* _Const casts_: ```const_cast<type>(expression)``` removes ```const``` attribute from ```expression``` so as ```expression``` can be modified (i.e. make it mutable) (```type``` and ```expression``` must be of same type). E.g.
```cpp 
const string s = "Hello world!";
string ss = const_cast<string>(s);   // ss not const anymore
```
*	_Reinterpret casts_: ```reinterpret_cast<type>(expression)``` this is similar to the old C-like cast operation, as it performs no checking of any sort. E.g.
```cpp 
unsigned long mem_address;
Square* s = reinterpret_cast<Square*>(mem_address);
```

## 10. ```enum```s between C++ and Java? 
Since Java 5, ```enum```s where introduced in the language.

```java 
enum Status { CONTINUE, WON, LOST };
Status status = Status.CONTINUE;
```

The concept was received from C++ where the above syntax compiles without errors, too. 

Enums in Java are reference types like class or interface and you can define constructor, methods and variables inside java ```Enum``` which makes it more powerful than Enum in C and C++:

```java 
public enum Status {
   CONTINUE("Continue"), WON("Won"), LOST("Lost");
   private String text;
   private Status(String s) { this.text = s; }
   public getText() { return text; }
}
```

The constructor of ```enum``` in java must be ```private```; any other access modifier will result in compilation error. Java enums can implement Java interfaces, can define abstract methods, use inheritance etc. 

In C++, the values of the enumeration constants start at ```0```, unless specified otherwise, and increment by ```1``` (e.g. ```CONTINUE``` has the value ```0```, ```WON``` the value ```1``` etc.). The identifiers in an ```enum``` must be unique, but separate enumeration constants can have the same integer value.

```cpp 
enum Status { CONTINUE = 1, WON, LOST };
int s = WON;   // not scoped and imlpicit conversion to int
```

explicitly sets the enumeration constants to start at ```1``` instead of ```0```.
 
One problem with pre C++11 enums (also called _unscoped enums_) is that multiple enums may contain the same identifiers. Using such enums in the same program can lead to naming collisions and logic errors. To eliminate these problems, C++11 introduces so-called _scoped enums_, which are declared with the keywords ```enum class``` (or the synonym ```enum struct```): 

```cpp
enum class Status { CONTINUE, WON, LOST };
Status status = Status::CONTINUE;
int s = static_cast<int>(Status::WON);  // scoped and explicit conversion to int
```

To reference a scoped enum constant, you must qualify the constant with the scoped enum’s type name (```Status```) and the scope-resolution operator (```::```), as in ```Status::CONTINUE```. This explicitly identifies ```CONTINUE``` as a constant in the scope of ```enum class Status```. Thus, if another scoped enum contains the same identifier for one of its constants, it’s always clear which version of the constant is being used. 

By default, a scoped enum’s underlying integral type is ```int```. C++11 allows you to specify an enum’s underlying integral type by following the enum’s type name with a colon (```:```) and the integral type:
```cpp 
enum class Status : unsigned int { CONTINUE, WON, LOST };
```

## 11.	Constants in C++ 
In modern C++ you can declare a constant with the ```const``` keyword, which is similar to Java's ```final``` keyword: 
```cpp
const type-name constant-name = value;
```
Don't use the deprecated ```#define``` preprocessor macro (e.g. ```#define pi 3.14286```).
 
In C++ you are able to define constant expressions, e.g.: 
```cpp
constexpr double GetPi() {return 22.0 / 7;}
```
which allows for optimization possibilities from the compiler’s and application’s point of view. C++14 allows ```constexpr``` to contain decision-making constructs such as ```if``` and ```switch``` statements. The usage of ```constexpr``` will not guarantee compile-time optimization. 

Finally, enumerations defined with the ```enum``` keyword (see previous question) are also constants. 

## 12. How does C++ deal with random numbers? 
Before C++11, the way to generate random numbers was: 
```cpp
#include <cstdlib> // contains function prototype for rand and srand
#include <ctime> // contains prototype for function time
...
srand(static_cast<unsigned int>(time(0)));   // seed random number generator
unsigned int face = 1 + rand() % 6;          // random number from 1 to 6 (number = shiftingValue + rand() % scalingFactor)
```
According to CERT, function ```rand()``` does not have “good statistical properties” and can be predictable, which makes programs that use rand less secure (CERT guideline MSC30- CPP). 
C++11 provides a new, more secure library of random-number capabilities that can produce nondeterministic random numbers for simulations and security scenarios where predictability is undesirable. These new capabilities are located in the C++ Standard Library’s ```<random>``` header. 

Random-number generation is a mathematically sophisticated topic for which mathematicians have developed many random-number generation algorithms with different statistical properties. For flexibility based on how random numbers are used in programs, C++11 provides many classes that represent various random-number generation engines and distributions. An engine implements a random-number generation algorithm that produces pseudorandom numbers. A distribution controls the range of values produced by an engine, the types of those values (e.g., ```int, double```, etc.) and the statistical properties of the values. The following example uses the default random-number generation engine ```default_random_engine``` and a ```uniform_int_distribution```, which evenly distributes pseudorandom integers over a specified range of values. The default range is from ```0``` to the maximum value of an int on your platform. 
```cpp
#include <random> // contains C++11 random number generation features
#include <ctime> // contains prototype for function time
...
// use the default random-number generation engine to
// produce uniformly distributed pseudorandom int values from 1 to 6
default_random_engine engine(static_cast<unsigned int>(time(0)));
uniform_int_distribution<unsigned int> randomInt(1,6);
unsigned int face = randomInt(engine);
```
In Java things are simpler: 

```java
import java.util.Random;
...
Random random = new Random();         // one object is enough
int face = random.nextInt(6) + 1;     // random number from 1 to 6
```

To generate a series of random numbers as a unit, you need to use a single ```Random``` object; do not create a new ```Random``` object for each new random number. Do not use ```Math.random()``` (it produces doubles, not integers). 

Of course ```Random``` provides other useful methods, too, like ```nextDouble()``` or ```nextGaussian()``` or can return ```IntStreams``` in Java 8. 

Other alternatives are: 

* ```SecureRandom```, a cryptographically strong subclass of ```Random```
* ```ThreadLocalRandom```, intended for multi-threaded cases 

## 13. How are arrays differ between C++ and Java? 
Arrays are declared the same way in both Java and C++:
```java
ElementType ArrayName [constant_number of elements] = {optional initial values};
```
There are some small differences though. The following are not allowed in Java: 
```java
int numbers [5] = {0};       // initializes all 5 integers to 0
int numbers [5] = {};        // initializes all integers to 0
int numbers [5] = {34, 56};  // initialize first two elements to 34 and 56 and the rest to 0
```
as Java requires all the values during initialisation, i.e.
```java
int numbers [] = {2016, 2052, -525}; // array of 3 elements
int numbers [5] = {34, 56, -21, 5002, 365};
```
```Bytes consumed by an array = sizeof(element-type) * Number of Elements```.

When you access elements of an array, the C++ compiler does not check if the index is within the actual defined bounds of the array or not. The onus of ensuring that the array is not accessed beyond its bounds lies solely on the programmer. Java, on the other hand, throws an ```IndexOutOfBoundsException``` in that case. 

## 14. What is the auto keyword in C++? 
C++ provides automatic variable type deduction feature via keyword ```auto```, e.g.: 
```cpp
auto bFlag = true;
```
Using ```auto``` requires you to initialize the variable for the compiler that uses this initial value in deciding what the variable type can be. If you don’t initialize a variable of type ```auto```, you get a compile error. 

Java provide a similar feature since version 10 with the ```var``` keyword. The ```auto``` keyword can be combined with the range-based ```for``` loop that will work for an array of elements of any type: 
```cpp
for (auto element : elements) // range based for
     cout << "Array element: " << element << endl;
```
This works with arrays of every type (```double[], int[], char[]``` etc.) even ```strings``: 
```cpp
std::string sayHello{"Hello World!"};
for (auto c : sayHello)
    cout << c << ' ';  // output: H e l l o W o r l d !
auto can be used to deduct the return type of a function: 
auto Area(double radius) {
   return Pi * radius * radius;
}
```
Functions that rely on automatic return type deduction need to be defined (i.e., implemented) before they 're invoked. This is because the compiler needs to know a function's return type at the point where it is used. If such a function has multiple return statements, they need to all deduce to the same type.

Recursive calls need to follow at least one return statement. 

## 15. By reference, by value 
C++ allows you to pass parameter values _by value_ or _by reference_, e.g. 
```cpp
// output parameter result by reference
void Area(double radius, double& result) {
   result = Pi * radius * radius;
}
```
```&varName``` gives the address in memory where its value is placed, so ```&result``` gives the memory address where the variable ```result``` is located. This allows the method to directly modify the contents of this memory address if it wishes. If a parameter is passed by value, then a copy of the initial variable is created and the initial variable is not modified. 

In Java, all primitive values are passed by value and all object values by reference, the developer cannot change this:
```java
// data parameter is passed by reference as it is of type Object
double getArea(double radius, AreaData data) {
   return Math.PI * radius * radius * data.getHeight();
}
```

## 16. What are pointers in C++? 
A pointer is a variable one that stores an address in memory. The memory address that a pointer is pointing to can be interpreted only if we know its type. A pointer is declared as: 
```cpp
Type* PointerVariableName;
```
E.g. ```int* intPonter = NULL``` is a pointer that points to an integer, i.e. the memory address that it points to contains an integer value. You can also specify a pointer to a block of memory (also called a ```void``` pointer).

To access the actual value pointed by a pointer, you use the _dereference operator(*)_, e.g. 
```cpp
int* pInt = &age;
cout << *pInt << endl;
```
The size of a pointer is the size that it needs to store the memory address, not the size of the value it points to, e.g. ```sizeof(char) = 1``` while ```sizeof(*char) = 4``` (using a 32-bit compiler) i.e. an ```int```. Since pointers are ```int```s or ```long```s (in 64-bit compilers), the operators ```++```, ```--``` can be applied to them and they are interpreted by the compiler as the need to point to the next (previous) value in the block of memory, assuming it to be of the same type. Or more clearly: 
```cpp
Type* pType = Address;
++pType;    // means pType points to Address + sizeof(Type)

for(int i = 0; i < numEntries; ++i)
   cout << *(pointsToNums++) << " ";
```
Operators ```new``` and ```delete``` can be used to allocate and release memory dynamically (to avoid memory leaks), e.g.
```cpp
Type* Pointer = new Type;              // request memory for one element
Type* Pointer = new Type[numElements]; // request memory for numElements
int* pointToAnInt = new int;           // get a pointer to an integer
int* pointToNums = new int[10];        // pointer to a block of 10 integers;
                                       // points to the first element of the array
                                       // *(pointToNums+1) == pointToNums[1]
//...
delete pointToAnInt;                   // release allocated memory  
delete[] pointToNums;                  // release allocated memory
```
Operator ```delete``` cannot be invoked on any address contained in a pointer, rather only those that have been returned by ```new``` and only those that have not already been released by a ```delete```.

Note that one can assign an array to a pointer, but one cannot assign a pointer to an array. 

```const``` operator can be used in one of three ways with pointers: 
```cpp
// The address contained in the pointer is constant and cannot be changed, 
// yet the data at that address can be changed
int* const pInt = &intValue;  

// Data pointed to is constant and cannot be changed, 
// yet the address contained in the pointer can be changed—that is, 
// the pointer can also point elsewhere
const int* pInt = &intValue;

// Both the address contained in the pointer and the value being pointed to are
// constant and cannot be changed 
const int* const pInt = &intValue;
```

## 17. What is the ```inline``` keyword in C++? 
A regular function call is translated into a ```CALL``` instruction, which results in stack operations and microprocessor execution shift to the function and so on. The overhead of performing an actual function call on this might be quite high for the amount of time spent actually executing a simple function like the following: 
```cpp
double Area(double radius) {
   return Pi * radius * radius;
}
```
C++ compilers enable the programmer to declare such functions as ```inline```. Compilers typically see this keyword as a request to place the contents of the function directly where the function has been invoked which increases the execution speed of the code. Inlining a function doesn't mean that the compiler will choose to do so, though. 

Java doesn't have the inline keyword but the Java compiler is clever enough to inline small methods for performance.

## 18. How does C++ support lambdas? 
Lambda functions were introduced in C++11 and help in the usage of STL algorithms to sort or process data. The syntax of a lambda function is the following: 
```cpp
[optional parameters](parameter list){ statements; } 
```
E.g.
```cpp
[](int Element) {cout << Element << " ";}
[](int Num1, int Num2) {return (Num2 < Num1); }   // predicate; returns boolean
```
Java provided support for lambdas since version 8. Syntax: 
```java
 (parameters) -> expression
```
or
```java
 (parameters) -> { statements; }
```
E.g.
```java
(int x, int y) -> x + y
(x, y) -> x % y
() -> Math.pi
(String s) -> s.toUpperCase()  or
String::toUpperCase		// Method Reference
x -> 2 * x
c -> { int n = c.size(); c.clear(); return n ; }
```
## 19.C++/Java and threads 
C++11 contains a full standard library dedicated to threads, ```<thread>```. 
```cpp
#include <iostream>
#include <thread>
void myThread()
{
   std::cout<<"Hello Concurrent World\n";
}
int main()
{
   std::thread aThread(myThread);
   aThread.join();   // join with the caller thread
}
```
A thread is created by ```std::thread aThread(task);``` where ```task``` is a function that is going to be executed in the new thread. Every C++ program has at least one thread, the one where ```main()``` method is executed. The ```main()``` method can start many other threads. If we want for the calling thread (main) to wait for the new thread ```aThread``` to terminate, we call the ```join()``` method.

To avoid compiler misinterprations, because ```std::thread aThread(myThread);``` could also mean the definition of a method ```aThread()``` that takes one parameter ```hello``` and returns an object of type ```std::thread```, it is recommended to use one of the following syntaxes: 
```cpp
std::thread my_thread((background_task()));
std::thread my_thread{background_task()};
```
In Java, declaring a thread is similar and is done in one of two ways:
```java
public class MyThread extends Thread {

    public void run(){
       System.out.println("Hello Concurrent World");
    }

    public static void main(String[] args) {
       MyThread myThread = new MyThread();
       myTread.start();
       try {
         t.join();      // join with the caller thread
       } catch(InterruptedException e) { }
    }
}
```
or 
```java
Runnable myRunnable = new Runnable(){

     public void run(){
        System.out.println("Hello Concurrent World");
     }
}

Thread thread = new Thread(myRunnable);
thread.start();
try {
   t.join();  // join with the caller thread
} catch(InterruptedException e) { }
```
In C++, one can pass callable objects or lambda expressions to a thread:
```cpp
class background_task {
   public:
     void operator()() const {
        do_something();        
     }
};
background_task t;
std::thread my_thread(t);
```
or 
```cpp
std::thread my_thread([](
   do_something();
});
```
Similarly, in Java 8, ```Runnable``` is the lambda expression ```() -> {}``` :
```java
Thread t = new Thread(() -> System.out.println("Hello Concurrent World"));
t.start();
```

## 20. Generics vs Templates

Οι _γενικευμένοι τύποι (generics)_ της Java μοιάζουν με τα _πρότυπα (templates)_ της C++. Αν και η σύνταξη είναι η ίδια, η σημασιολογία είναι διαφορετική. Υπάρχει μόνο μια μικρή διαφορά στη σύνταξη ότι ενώ στη Java η σύνταξη ```List<List<String>>``` είναι έγκυρη, στη C++ μπορεί να γραφτεί μόνο ως ```List<List<string> >``` καθώς ο μεταγλωττιστής μπερδεύεται με τον τελεστή ```>>```.

Σημασιολογικά όμως, οι γενικευμένοι τύποι στη Java ορίζονται ώστε να 'διαγραφεί' ο τύπος τους κατά την εκτέλεση (by erasure). Στη C++ τα templates ορίζονται με στόχο την _επέκταση (by expansion)_. Κάθε στιγμιότυπο ενός νέου πρότυπου τύπου μεταγλωττίζεται ως ένας διαφορετικός τύπος δεδομένων. Π.χ. αν έχουμε ορίσει στο πρόγραμμά μας μια λίστα ακεραίων, μια λίστα πραγματικών και μια λίστα συμβολοσειρών, θα έχετε τρεις τύπους δεδομένων κατά τη μεταγλώττιση. Αυτό από τη μία έχει το μειονέκτημα ότι μπορούν να δημιουργηθούν πάρα πολλά αντικείμενα κατά την εκτέλεση του προγράμματός σας (code bloat) από την άλλη παρέχει τη δυνατότητα για βελτιστοποιημένη εκτέλεση του κώδικα. Επίσης, στη C++ επιτρέπεται να αρχικοποιήσετε ένα template με μια σταθερά (αντί για κάποιο τύπο δεδομένων) οπότε μπορείτε να δημιουργήσετε μακροεντολές π.χ. για κάποιους πολύπλοκους υπολογισμούς που εκτελούνται κατά τη φάση της μεταγλώττισης. Κάτι τέτοιο δεν επιτρέπεται στη Java.

## 21. ```printf()```
Και η Java από την έκδοση 5 και μετά διαθέτει μέθοδο ```printf()``` η οποία δουλεύει παρόμοια μ' αυτή της C/C++ με τη διαφορά ότι αντί για ```\n``` η Java χρησιμοποιεί ```%n``` όπου τυπώνει το σωστό χαρακτήρα αλλαγής γραμμής για όλες τις πλατφόρμες.
 

## Πηγές

1. Deitel P. & Deitel H. (2014), _C++ How to Program_, 9th Edition, Deitel.
1. Cadenhead R., Liberty J. (2017), _SAMS Teach Yourself C++ in 24 Hours_, 6th Ed., Sams Teach Yourself.
1. Naftalin M., Wadler P. (2006), _Java Generics and Collections_, O'Reilly. 
1. Pohl I. (2002), _C++ by Dissection_, Addison-Wesley. 
1. Rao S. (2017), _SAMS Teach Yourself C++ in One Hour a Day_, 8th Ed., Sams Teach Yourself. 
1. [Generate random numbers](http://www.javapractices.com/topic/TopicAction.do?Id=62) 
---