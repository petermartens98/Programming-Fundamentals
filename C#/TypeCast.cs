using System;

namespace OutputFormatting
{
    class Program
    {
        static void Main(string[] args)
        {
            double a = 3.14;
            int b = Convert.ToInt32(a);

            int c = 123;
            double d = Convert.ToDouble(c) + 0.1;

            int e = 321;
            String f = Convert.ToString(e);

            String g = "$";
            char h = Convert.ToChar(g);

            String i = "true";
            bool j = Convert.ToBoolean(i);


            Console.WriteLine(a);
            Console.WriteLine(a.GetType());

            Console.WriteLine(b);
            Console.WriteLine(b.GetType());

            Console.WriteLine(c);
            Console.WriteLine(c.GetType());

            Console.WriteLine(d);
            Console.WriteLine(d.GetType());

            Console.WriteLine(e);
            Console.WriteLine(e.GetType());

            Console.WriteLine(f);
            Console.WriteLine(f.GetType());

            Console.WriteLine(g);
            Console.WriteLine(g.GetType());

            Console.WriteLine(h);
            Console.WriteLine(h.GetType());

            Console.WriteLine(f);
            Console.WriteLine(f.GetType());

            Console.WriteLine(i);
            Console.WriteLine(i.GetType());

            Console.WriteLine(j);
            Console.WriteLine(j.GetType());

            Console.ReadKey();
        }
    }
}
