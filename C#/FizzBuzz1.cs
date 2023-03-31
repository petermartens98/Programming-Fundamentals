using System;
using System.Text;

namespace FizzBuzz
{
    class Program
    {
        static void Main(string[] args)
        {
            StringBuilder output = new StringBuilder();
            for (int i = 1; i <= 100; i++)
            {
                if (i % 15 == 0)
                {
                    output.AppendLine("FizzBuzz");
                }
                else if (i % 3 == 0)
                {
                    output.AppendLine("Fizz");
                }
                else if (i % 5 == 0)
                {
                    output.AppendLine("Buzz");
                }
                else
                {
                    output.AppendLine(i.ToString());
                }
            }
            string outputString = output.ToString();
            Console.Write(outputString);
            Console.ReadKey();
        }
    }
}
