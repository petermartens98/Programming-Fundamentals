using System;

namespace RandomNumbers
{
    class Program
    {
        static void Main(string[] args)
        {
            Random random = new Random();

            int num = random.Next(1,7);
            Console.WriteLine(num);

            double dec = random.NextDouble();
            Console.WriteLine(dec);

            Console.ReadKey();
        }
    }
}
