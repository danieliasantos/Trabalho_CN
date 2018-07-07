using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;
//using static System.Console;

namespace Fibonacci
{
	class Program
	{
		public static int Fibonatchi(int position)
		{
			if (position == 0)
			{
				return 1;
			}
			if (position == 1)
			{
				return 1;
			}
			else
			{
				return Fibonatchi(position - 2) + Fibonatchi(position - 1);
			}
		}
		//----------------------------------------------
		public static int ParseInt(string value)
		{
			try
			{
				return int.Parse(value);
			}
			catch
			{
				return -1;
			}
		}
		//----------------------------------------------
		static public void QuickSort_Recursive(int[] vetor, int primeiro, int ultimo)
		{

			int baixo, alto, meio, pivo, repositorio;
			baixo = primeiro;
			alto = ultimo;
			meio = (int)((baixo + alto) / 2);

			pivo = vetor[meio];

			while (baixo <= alto)
			{
				while (vetor[baixo] < pivo)
					baixo++;
				while (vetor[alto] > pivo)
					alto--;
				if (baixo < alto)
				{
					repositorio = vetor[baixo];
					vetor[baixo++] = vetor[alto];
					vetor[alto--] = repositorio;
				}
				else
				{
					if (baixo == alto)
					{
						baixo++;
						alto--;
					}
				}
			}

			if (alto > primeiro)
				QuickSort_Recursive(vetor, primeiro, alto);
			if (baixo < ultimo)
				QuickSort_Recursive(vetor, baixo, ultimo);
		}
		//----------------------------------------------
		public static double Euler()
		{
			double pi = 0, sum = 0;

			for (int n = 1; n < 1000000; n++) {
				sum += 1/Math.Pow(n,2);
				
			}			
			pi = (double)sum * 6;
			pi = Math.Sqrt(pi);			
			
			return pi;
		}
		//----------------------------------------------

		static void Main(string[] args)
		{
			int value = 20;
			int[] numeros = { 5, 8, 9, 6, 3, 2, 1, 5, 4 };
			string valueStr = "20";			
			var stopwatch = new Stopwatch();


			//Fibonacci
			Console.WriteLine("Fibonacci Recursivo");
			stopwatch.Start();

			Fibonatchi(value);

			stopwatch.Stop();
			Console.WriteLine($"Tempo passado: {stopwatch.Elapsed}");
			Console.WriteLine("\n");


			// Parse Int
			Console.WriteLine("Parse Int");
			stopwatch.Restart();

			ParseInt(valueStr);

			stopwatch.Stop();
			Console.WriteLine($"Tempo passado: {stopwatch.Elapsed}");
			Console.WriteLine("\n");


			// QuickSort Recursivo
			Console.Write("QuickSort Recursivo \nVetor Desordenado - ");
			for (int i = 0; i < 9; i++)
				Console.Write(numeros[i] + " ");
			Console.WriteLine();
			stopwatch.Restart();

			QuickSort_Recursive(numeros, 0, numeros.Length - 1);

			stopwatch.Stop();
			Console.Write($"Tempo passado: {stopwatch.Elapsed}");
			Console.Write("\nVetor Ordenado - ");
			for (int i = 0; i < 9; i++)
				Console.Write(numeros[i]+" ");
			Console.WriteLine("\n");


			// Geração do Pi pela formula de Euler			
			Console.WriteLine("Geração do Pi pela formula de Euler");
			stopwatch.Restart();

			Euler();

			stopwatch.Stop();
			Console.Write($"Tempo passado: {stopwatch.Elapsed}");
			Console.WriteLine("\n");


			// Keep the console window open in debug mode.
			Console.WriteLine("Press any key to exit.");
			Console.ReadKey();			
		}
	}
}
