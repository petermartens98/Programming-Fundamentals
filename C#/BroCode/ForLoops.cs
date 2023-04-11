using System;

namespace MyFirstProgram
{
    class Program
    {
        static void Main(string[] args)
        {

            // for loop = repeats some code a FINITE amount of times

            // Count up to 10
            for (int i = 1; i <= 10; i++)
            {
                Console.WriteLine(i);
            }

            // Count down from 10
            for (int i = 10; i > 0; i--)
            {
                Console.WriteLine(i);
            }
            Console.WriteLine("HAPPY NEW YEAR!");

            Console.ReadKey();
        }
    }
}
