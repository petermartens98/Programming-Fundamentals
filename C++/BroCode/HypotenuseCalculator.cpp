#include <iostream>
#include <cmath>

int main() 
{
   double a;
   double b;
   double c;

   std::cout << "Enter side A: ";
   std::cin >> a;

   std::cout << "Enter size B: ";
   std::cin >> b;

   c = sqrt(pow(a, 2) + pow(b, 2));

   std::cout << "side C: " << c;

   return 0;
}
