// Reverse words - http://code.google.com/codejam/contest/dashboard?c=351101#s=p1

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

/**
 * @author Yogesh Pandit
 * @date April 10, 2011
 *
 */
public class ReverseWords {

    static int N = 0;
    static File input = null;

    public static void main(String[] args) {

        ReverseWords rw = new ReverseWords();
        rw.run();
    }

    public void run() {
        input = new File("../../data/gcj/RW-large.in");
        try {
            BufferedReader br = new BufferedReader(new FileReader(input));
            N = (int) Integer.valueOf(br.readLine());
            System.out.println(N);
            int r = 1;
            while (r <= N) {
                String line = br.readLine();
                //System.out.println(line);
                String reverse = "Case #" + r + ": " + reverseWordsInLine(line);
                System.out.println(reverse);
                r++;
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     *
     * @param s
     * @return
     */
    public static String reverseWordsInLine(String s) {
        String[] W = s.trim().split("\\s");
        StringBuffer sb = new StringBuffer();
        for (int i = W.length - 1; i >= 0; i--) {
            sb.append(W[i]).append(" ");
        }
        return sb.toString();
    }
}
