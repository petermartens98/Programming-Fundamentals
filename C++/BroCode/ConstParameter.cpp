#include <iostream>
void printInfo(const std::string &name, const int &age);
int main()
{
    // const parameter = parameter that is effectively read-only
    //                                  conveys intent & code is more secure
    //                                  useful for pointers and references
 
    std::string name = "Peter";
    int age = 24;
 
    printInfo(name, age);
 
    return 0;
}
void printInfo(const std::string &name, const int &age){
    //name = "";
    //age = 0;
    std::cout << name << '\n';
    std::cout << age << '\n';
}
