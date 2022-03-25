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

            //problem 3: primeRange
            /*int[] p = FindPrimesInRange(500, 1000);
            for(int q = 0; q < p.Length; q++)
            {
                Console.WriteLine(p[q]);
            }*/

            //problem 4: rotation
            //rotateFunc();

            //problem 5: longst sequence of equal numbers




            //Practice Strings

            //Problem 1. 
            //reverseString();

            //problem 2.
            //sentenceReverse();

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
                    AL.Add(sb.ToString().ToLower());
                    sb.Clear();
                    Console.Write("\n");
                    foreach (String item in AL)
                    {
                        Console.Write(" " + item + " ");
                    }
                    Console.Write("\n");
                }
                else if (input[0] == 'c' || input[0] == 'C')
                {
                    AL.Clear();
                    Console.Write("\n");
                }

                else if (input[0] == '-')
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

        static int[] FindPrimesInRange(int startNum, int endNum)
        {
            ArrayList prePrimesinRange = new ArrayList();

            for (int x = startNum; x <= endNum; x++)
            {
                if (isPrime(x))
                {
                    prePrimesinRange.Add(x);
                }

            }
            return (int[])prePrimesinRange.ToArray(typeof(int));

        }

        public static Boolean isPrime(int x)

        {

            for (int i = 2; i < (x / 2); i++)
            {
                if (x % i == 0)
                {
                    return false;

                }

            }
            return true;
        }

        public static void rotateFunc()
        {
            Console.WriteLine("Give us numbers...");
            String toBeArray = Console.ReadLine();
            string[] nums = toBeArray.Split(' ');
            //char[] c = toBeArray.ToCharArray();
            ArrayList AL = new ArrayList();
            for(int o = 0; o < nums.Length; o++)
            {
               
               
                    try
                    {
                    int t = Convert.ToInt32(nums[o]);
                        Console.Write(" " + t + " ");


                        AL.Add(t);
                    }
                    catch
                    {
                        continue;
                    }

                
            }
            Console.WriteLine("\n");
            int[] x = (int[])AL.ToArray(typeof(int));
            Console.WriteLine("Select THE Number of rotations");
            

            int r = Convert.ToInt32(Console.ReadLine());
          
          


            //(l+r%n)
            ArrayList rotate = doTheThing(r, x.Length, x);
           
            int[] sum = new int[x.Length];
            
            foreach(int[] item in rotate)
            {
                
                for(int q = 0; q < item.Length; q++)
                {
                    sum[q] = sum[q] + item[q];
                }
            }
             Console.Write(" Sum: ");
            for (int i = 0; i < sum.Length; i++)
            {
                Console.Write(" " + sum[i] + " ");
            }


        }

        public static ArrayList doTheThing(int r, int n, int[] x)
        {
            ArrayList t = new ArrayList();

            for(int i = 1; i <= r; i++)
            {
                int[] temp = new int[x.Length];
                for(int j = 0; j < x.Length; j++)
                {
                    temp[(j + i) % n] = x[j];
                }
                Console.Write("Rotation: " + i + "| ");
                for (int y = 0; y < temp.Length; y++)
                {
                    Console.Write(" " + temp[y] + " ");
                }
                Console.WriteLine("\n");
                t.Add(temp);



            }

            return t;

        }


        public static void reverseString()
        {
            Console.WriteLine("Insert a string...");
            String input = Console.ReadLine();

            char[] c = input.ToCharArray();
             Array.Reverse(c);
            StringBuilder sb = new StringBuilder();
            for(int i = 0; i < c.Length; i++)
            {
                sb.Append(c[i]);
            }

            

            Console.WriteLine("Reverese of Input: " + sb.ToString());


        }

        public static void sentenceReverse()
        {
            ArrayList cAR = new ArrayList();
            Console.WriteLine("Insert a sentence...");
            String input = Console.ReadLine();

            char[] c = input.ToCharArray();
            int x = 0;
            StringBuilder sb = new StringBuilder();


            for (int i =0; i < c.Length; i++)
            {
                if (c[i] == '.' || c[i] == ',' || c[i] == ' ' || c[i] == ':' || c[i] == '?' || c[i] == '!' || c[i] == ';' || c[i] == '=' || c[i] == '/'
                    || c[i] == '&' || c[i] == ']' || c[i] == '[' || c[i] == ')' || c[i] == '(')
                {
                    continue;
                }
                else
                {
                    cAR.Add(c[i]);
                }

            }

            char[] rev = (char[])cAR.ToArray(typeof(char));
            Array.Reverse(rev);
            
            for (int i = 0; i < c.Length; i++)
            {
                if (c[i] == '.' || c[i] == ',' || c[i] == ' ' || c[i] == ':' || c[i] == '?' || c[i] == '!' || c[i] == ';' || c[i] == '=' || c[i] == '/'
                    || c[i] == '&' || c[i] == ']' || c[i] == '[' || c[i] == ')' || c[i] == '(')
                {
                    continue;
                }
                else
                {
                    c[i] = rev[x];
                    x++;
                }

            }

            for(int y =0; y < c.Length; y++)
            {
                sb.Append(c[y]);
            }


            Console.WriteLine("Reverse Sentence: "+ sb.ToString());






        }

    }
}
