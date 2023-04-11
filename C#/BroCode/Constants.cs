using System;

namespace MyFirstProgram
{
    class Program
    {
        static void Main(string[] args)
        {
            // constants  = immutable values which are known at compile time
            //                        and do not change for the life of the program

            const double pi = 3.14;

            //pi = 420; //can't change this constant

            Console.WriteLine(pi);

            Console.ReadKey();
        }
    }
}
