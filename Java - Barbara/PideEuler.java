
package pideeuler;

/**
 *
 * @author Barbara
 */
import java.util.*;



public class PideEuler {
    
	
	public static Scanner scanner = new Scanner(System.in);
	
	public static int sentinel = 0;

	// Lê e retorna um int positivo, lidando com os casos
	// de não positivos e inteiros.	
	public static int lePositivoInt() {
		while (true) {
			System.out.print("Digite o inteiro positivo: ");
			
			while (!scanner.hasNextInt()) {
				scanner.next();
				System.out.print("Este não é um inteiro. Digite novamente: ");  ;;
			}
			
			int input = scanner.nextInt();
			if (input > 0)
				return input;
			else
				System.out.println("Valor negativo. Digite novamente");
		}
	}
	
	// Esse metodo retorna o valor aproximado de pi computacional
	// os primeiros k desta sequencia são:
	//     pi^2 = 6 (1/1^2 + 1/2^2 + 1/3^2 + 1/4^2 + 1/5^2 + ... )
	// Então multiplicando por 6 e somando a raiz quadrada
	public static double aproximadoPi(int k) {
		double quadradoinverso = 0;
		for (int counter=1; counter<=k; counter++)
			quadradoinverso += (1.0/(counter*counter));
		return Math.sqrt(6 * quadradoinverso);
	}
	
	public static void main(String[] args) {

		int k = lePositivoInt();
		double pi = aproximadoPi(k);

		System.out.printf("Os primeiros %d termos encontrados por pi é igual a %f.\n",k,pi);
		System.out.printf("Este é %f%% o valor atual.\n",100*pi/Math.PI);
	}  
        
}