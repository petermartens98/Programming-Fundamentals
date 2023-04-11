#include <iostream>

class Animal{
    public:
        bool alive = true;
        
    void eat(){
        std::cout << "This animal is eating\n";
    }
};
class Dog : public Animal{
    public:

    void bark(){
        std::cout << "The dog goes woof!\n";
    }
};
class Cat : public Animal{
    public:

    void meow(){
        std::cout << "The cat goes meow!\n";
    }
};

int main() {

    Dog dog;
    Cat cat;

    std::cout << dog.alive << '\n';
    dog.eat();
    dog.bark();

    return 0;
}
