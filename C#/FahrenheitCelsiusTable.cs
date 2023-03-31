using System;

class Program
{
    static void Main(string[] args)
    {
        // Print table header
        Console.WriteLine("Fahrenheit\tCelsius");

        // Loop from 0 to 100 in increments of 10
        for (int f = 0; f <= 100; f += 10)
        {
            // Convert Fahrenheit to Celsius
            double c = (f - 32) * 5 / 9;

            // Print conversion in table format
            Console.WriteLine("{0}\t\t{1:F1}", f, c);
        }

        // Wait for user input to exit
        Console.WriteLine("Press any key to exit...");
        Console.ReadKey();
    }
}
