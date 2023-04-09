#include <iostream>

int main() {
    const double PI = 3.14159;
    //PI = 420.69; This will cause an error
    double radius = 10;
    double circumference = 2 * PI * radius;

    std::cout << circumference << "cm";

    return 0;
}
