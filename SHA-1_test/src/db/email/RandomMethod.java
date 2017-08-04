package db.email;

import java.util.Random;

import com.sun.xml.internal.fastinfoset.sax.Properties;

public class RandomMethod {
	
	public int RandomNum(){
		Random rm = new Random();
		int random = 0;
		
		random = rm.nextInt(10000)+1000;
		return random;
	}

}