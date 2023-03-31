public class arrays {
	public static void main(String[] args) {
		String[][] cars = {
				{"Ford", "Chevy", "GM"},
				{"Tesla", "Honda", "Audi"},
				{"Beamer", "Benz", "Bentley"}
		};
		
		for(int i=0; i<cars.length; i++) {
			System.out.println();
			for(int j=0; j<cars[i].length; j++) {
				System.out.print(cars[i][j]+" ");
			}
		}
	}
}
