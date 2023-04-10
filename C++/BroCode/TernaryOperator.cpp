#include <iostream>

int main() 
{
   // ternary operator ?: = replacement to an if/else statement
   // condition ? expression1 : expression2;

    int grade = 50;
    grade >= 60 ? std::cout << "You pass!" : std::cout << "You fail!";

    int number = 9;
    number % 2 ? std::cout << "ODD" : std::cout << "EVEN";

    bool hungry = true;
    hungry ? std::cout << "You are hungry" : std::cout << "You are full";

   return 0;
}
