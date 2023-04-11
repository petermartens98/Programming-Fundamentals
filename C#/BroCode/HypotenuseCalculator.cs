using System;

namespace HypotenuseCalculator
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter Side A: ");
            double a = Convert.ToDouble(Console.ReadLine());

            Console.WriteLine("Enter Side B: ");
            double b = Convert.ToDouble(Console.ReadLine());

            double c = Math.Sqrt((a*a)+(b*b));

            Console.WriteLine("The Hypotenuse is: " + c);

            Console.ReadKey();
        }
    }
}
