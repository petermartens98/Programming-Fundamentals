using System;

namespace MyFirstProgram
{
    class Program
    {
        static void Main(string[] args)
        {

            // while loop = repeats some code while some condition remains true

            String name = "";

            while (name == "")
            {
                Console.Write("Enter your name: ");
                name = Console.ReadLine();
            }

            Console.WriteLine("Hello " + name);

            Console.ReadKey();
        }
    }
}
