using System;

namespace OutputFormatting
{
    class Program
    {
        static void Main(string[] args)
        {
            int x; // Declaration
            x = 123; // Initialization

            int y = 456; // Declaration + Initialization

            int z = x + y;

            int age = 24; // whole integer
            double height = 300.5; // decimal number
            bool alive = true;
            char symbol = '@';
            String name = "Peter";

            const double pi = 3.14;

            Console.WriteLine(pi);
            Console.WriteLine(x);
            Console.WriteLine(y);
            Console.WriteLine(z);

            Console.WriteLine("Hello " + name);
            Console.WriteLine("Your age is " + age);
            Console.WriteLine("Your height is " + height);
            Console.WriteLine("Are you alive? " + alive);
            Console.WriteLine("Your Symbol is " + symbol);

            String username = name + symbol;

            Console.WriteLine("Your username is " + username);

            Console.ReadKey();
        }
    }
}
