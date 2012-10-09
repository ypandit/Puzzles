
import java.util.Random;

/**
 * @author Yogesh Pandit
 * @date Sept 22, 2011; 3:10 PM
 * 
 */
public class MonteCarlo_Pi {

	public static void main(String[] args) {

		int count = 0;
		double rad = 1.0;
		int N = 1000000;
		double pi = 0.0;
		Random rand = new Random(2308);

		for (int i = 0; i < N; ++i) {
			double x = rand.nextDouble();
			double y = rand.nextDouble();
			double dist = Math.sqrt(Math.pow((x - 0), 2) + Math.pow((y - 0), 2));
			if (dist <= rad) {
				count++;
			}
		}

		pi = 4.0 * ((double) count / N);
		System.out.println("Original Pi = " + Math.PI);
		System.out.println("Approx. Pi = " + pi);
	}
}
