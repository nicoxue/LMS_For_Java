/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package config;

import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author JIAJUN XUE <nicoxue0324@gmail.com>
 */
public class PropertyManager {
        static Properties props = new Properties();

	static {
		try {
			props.load(PropertyManager.class.getClassLoader().getResourceAsStream("config/default.properties"));  
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	private PropertyManager() {

        };
	
	public static String getProperty(String key) {
		return props.getProperty(key);
	}    
}
