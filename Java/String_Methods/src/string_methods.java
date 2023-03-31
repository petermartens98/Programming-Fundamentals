
public class string_methods {

	public static void main(String[] args) {
		// String = a reference data type that can store one or more characters
		//			reference data types have access to useful methods
		
		String name = "Peter";
		
		/*
		boolean result1 = name.equals("peter");
		System.out.println(result1);
		
		boolean result2 = name.equalsIgnoreCase("peter");
		System.out.println(result2);
		*/
		//System.out.println(name.length());
		//System.out.println(name.charAt(0));
		//System.out.println(name.indexOf("P"));
		//System.out.println(name.isEmpty());
		//System.out.println(name.toUpperCase());
		//System.out.println(name.toLowerCase());
		//System.out.println(name.trim());
		
		String result = name.replace("P", "J");
		System.out.println(result);
	}

}
