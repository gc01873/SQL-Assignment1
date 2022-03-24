using System;
using System.Collections;
using System.Text;

namespace Assignment2
{
    class Program
    {
        static void Main(string[] args)
        {
            //Problem 1: Copying an Array
            //copyingAnArray();

            //Problem 2: itemList
            //itemList();
        }


        private static void copyingAnArray()
        {
            int[] deci = { 1, 4, 5, 7, 6, 42, 64, 9, 3, 10 };

            int[] deci2 = new int[deci.Length];
            for (int i = 0; i < deci.Length; i++)
            {
                deci2[i] = deci[i];
            }

            Console.Write("deci:  ");
            for (int i = 0; i < deci.Length; i++)
            {
                Console.Write(deci[i] + " ");
            }

            Console.Write("\n");
            Console.Write("deci2: ");
            for (int i = 0; i < deci.Length; i++)
            {
                Console.Write(deci2[i] + " ");
            }
        }


        private static void itemList()
        {
            ArrayList AL = new ArrayList();
            StringBuilder sb = new StringBuilder();
            while (true)
            {
                Console.WriteLine("What action do you want to perform? \n + item \n - item \n clear list");
                String input = Console.ReadLine();
                if (input[0] == '+')
                {
                    sb.Append(input);
                    sb[0] = ' ';
                    AL.Add(sb.ToString());
                    sb.Clear();
                    Console.Write("\n");
                    foreach (String item in AL)
                    {
                        Console.Write(" " + item + " ");
                    }
                    Console.Write("\n");
                }
                else if (input[0]=='c'||input[0] == 'C')
                {
                    AL.Clear();
                    Console.Write("\n");
                }

                else if (input[0]=='-')
                {
                    sb.Append(input);
                    sb[0] = ' ';
                    AL.Remove(sb.ToString());
                    sb.Clear();
                    Console.Write("\n");
                    foreach (String item in AL)
                    {
                        Console.Write(" " + item + " ");
                    }
                    Console.Write("\n");
                }

                else
                {
                    Console.WriteLine("Write it in the accepted format");
                }

            }
        }

       /* static int[] FindPrimesInRange(int startNum, int endNum) {
            
        }*/
    }
}