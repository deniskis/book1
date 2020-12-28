import java.awt.*;
import java.util.*;
import java.io.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.DecimalFormat;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.InputStream;
import java.io.InputStreamReader;

public class slova {
	public static void main(String[] args) throws Exception {

		String[] slova = new String[1000];
		File file = new File("lorem.txt");
		FileReader fr = new FileReader(file);
		BufferedReader br = new BufferedReader(fr);
		String str;
		String[] vse_slova = new String[1000];
		int n_slov = 0;
		int kolichestvo_povtornix_slov = 0;

		while ((str = br.readLine()) != null) {
			System.out.println(str);
			if (!str.isEmpty()) { // proverka na pustuju stroku;
				str = str.replaceAll("[^a-zA-Z]+", " "); // ubrat vse iz teksta krome slov
				str = str.replaceAll("\\b\\w{1}\\b\\s", ""); // ubrat vse slova iz teksta s 1 bukvoj;
				slova = str.split(" ");
				for (int i = 0; i < slova.length; i++) {
					vse_slova[n_slov] = slova[i]; // slozhit vse massivi v odin;
					n_slov++;
				}
			}
		}
		System.out.println("Kolichestvo slov v tekste: " + n_slov);

		for (int i = 0; i < n_slov; i++) {
			kolichestvo_povtornix_slov = 1;
			for (int j = i + 1; j < n_slov; j++) {
				// System.out.println(i + " " + j + " " + vse_slova.length);
				if (vse_slova[i].equals(vse_slova[j])) {
					vse_slova[j] = "";
					kolichestvo_povtornix_slov++;
				}
			}
			if (vse_slova[i] != "") {

				System.out.println(vse_slova[i] + " " + kolichestvo_povtornix_slov);
			}
		}
		br.close();
	}
}
