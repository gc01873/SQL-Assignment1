/*Practice number sizes and ranges
 * 1.Create a console application project
named /02UnderstandingTypes/ that outputs the 
number of bytes in memory that each of the following number types uses,
and the minimum and maximum values they can have: sbyte, byte, short, ushort, int, uint, long, ulong, float, double, and decimal.*/

using System;

namespace _02UnderstandingTypes
{
    class Program
    {
        static void Main(string[] args)


        {
          
            
            Console.WriteLine("Problem 1 \n\n");
            prob1();
            Console.WriteLine("Problem 2 \n\n");
            generations();
        }

       


        public static void prob1()
        {

            Console.WriteLine("Bytes in sbyt: " + sizeof(sbyte) + " sbyte: Max Value " + sbyte.MaxValue + " sbyte: Min Value " + sbyte.MinValue);
            Console.WriteLine("Bytes in byte:" + sizeof(byte) + " byte: Max Value " + byte.MaxValue + " byte: Min Value " + byte.MinValue);
            Console.WriteLine("Bytes in short: " + sizeof(short) + " short: Max Value " + short.MaxValue + " short: Min Value " + short.MinValue);
            Console.WriteLine("Bytes in ushort: " + sizeof(ushort) + " ushort: Max Value " + ushort.MaxValue + "ushort: Min Value " + ushort.MinValue);
            Console.WriteLine("Bytes in int: " + sizeof(int) + " int: Max Value " + int.MaxValue + " int: Min Value " + int.MinValue);
            Console.WriteLine("Bytes in uint: " + sizeof(uint) + " uint: Max Value " + uint.MaxValue + " uint: Min Value " + uint.MinValue);
            Console.WriteLine("Bytes in long: " + sizeof(long) + " long: Max Value " + long.MaxValue + " long: Min Value " + long.MinValue);
            Console.WriteLine("Bytes in ulong: " + sizeof(ulong) + " ulong: Max Value " + ulong.MaxValue + " ulong: Min Value " + ulong.MinValue);
            Console.WriteLine("Bytes in float: " + sizeof(float) + " float: Max Value " + float.MaxValue + " float: Min Value " + float.MinValue);
            Console.WriteLine("Bytes in double: " + sizeof(double) + " double: Max Value " + double.MaxValue + " double: Min Value " + double.MinValue);
            Console.WriteLine("Bytes in decimal: " + sizeof(decimal) + " decimal: Max Value " + decimal.MaxValue + " decimal: Min Value " + decimal.MinValue);
        }


        public static void generations()


        {
            Console.WriteLine("Give me a number.");
            var ask = Console.ReadLine();
            var asked = Convert.ToInt32(ask);



            double leap = 0.25;
            long cen = 100;
            long years = 1;
            long days = 365;
            long hours = 8760;
            long minutes = 525600;
            double seconds = (double)(3.154 * Math.Pow(10, 7));
            double milliseconds = (double)(3.154 * Math.Pow(10, 10));
            double microseconds = (double)(3.154 * Math.Pow(10, 13));
            decimal nanoseconds = (decimal)(3.154 * Math.Pow(10, 16));
            Console.WriteLine(asked + " centuries, " + (long)(asked * cen) + " years, " + (long)(asked * cen * days) + " centuries, " + (long)(asked * cen * hours) + " hours, " +
                (long)(asked * cen * minutes) + " minutes, " + (long)(asked * cen * seconds) + " seconds, " + (long)(asked * cen * milliseconds) + " milliseconds, " +
                (long)(asked * cen * microseconds) + " microseconds, " + (decimal)(asked * cen * nanoseconds) + " nanoseconds");





        }

    }
}
