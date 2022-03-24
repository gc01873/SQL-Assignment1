using System;

namespace Chapter03
{
    class Program
    {
        static void Main(string[] args)
        {
            //Problem 1:

            //int max = 500; for (byte i = 0; i < max; i++) { Console.WriteLine(i); }

            //Make the fizbuzz program


            /*int max = 500;

            for(int x =0; x < max; x++)
            {
                fizzBuzz(x);
            }
            */
            //problem 2: guess the random Number

            // guessTheRandomNum();

            //Problem 3: print a pyramid


            //printAPyramid();


            //problem 4:

            Calculate_dates();

        }



        static void fizzBuzz(int x)
        {
            if(x%3==0 && x%5 == 0)
            {
                Console.WriteLine("FizzBuzz");
            }
            else if (x % 3 == 0)
            {
                Console.WriteLine("Fizz");
            }

            else if(x % 5 == 0)
            {
                Console.WriteLine("Buzz");
            }
            else
            {
                Console.WriteLine(x);
            }
        }

        static void guessTheRandomNum()
        {
            int correctNumber = new Random().Next(3) + 1;
            Console.WriteLine("Guess What Number I'm Thinking of?");
            String num = Console.ReadLine();
            int num1 = Convert.ToInt32(num);
            if (correctNumber.Equals(num1))
            {
                Console.WriteLine("YES! You've guessed IT! CONGRATS");
            }

            else if (correctNumber > num1)
            {
                Console.WriteLine("Your guess was lesser than the correct number.");
                if(num1 < 1)
                {
                    Console.WriteLine("Your guess was outside of the range of the correct answer.");
                }
            }

            else if (correctNumber < num1)
            {
                Console.WriteLine("Your guess was greater than the correct number.");

                if(num1> 3)
                {
                    Console.WriteLine("Your guess was greater than the range of valid answers");
                }
            }
        }


        static void printAPyramid()
        {
            Console.WriteLine("Input a number to create a pyramid with");
            string star = Console.ReadLine();

            int num = Convert.ToInt32(star);
            bool isEven = false;
            if (num % 2 == 0)
            {
                isEven = true;
            }

            for(int i = 0; i <= num; i++)
            {  
                for (int j = num; j > i/2; j--)
                {
                    Console.Write(" ");
                }
                for(int x = 0; x < i; x++)
                {
                    if (isEven && i % 2 == 0)
                    {
                        Console.Write("*");
                    }
                    else if(!isEven && i % 2 != 0)
                    {
                        Console.Write("*");
                    }
                }
                Console.WriteLine(" ");
            }

           
        }

        static void Calculate_dates()

        {
            DateTime thisDate1 = new DateTime(2011, 6, 10);
            DateTime today = DateTime.Now;

            var age = today - thisDate1;
            Console.WriteLine("Your age is: " + (double)(age.Days/365) + " years old.");
        }
    }
}
