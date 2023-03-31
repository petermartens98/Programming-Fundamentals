import java.util.Stack;
public class Stacks_Main {

	public static void main(String[] args) {
		// stack = LIFO data structure. Last-in First-out
		//         "Vertical Tower" object storage
		//		   push() to add to the top
		//		   pop() to remove from the top
		//
		// uses: undo/redo features
		//       navigating browser history
		//       backtracking algorithms
		//       calling functions (call stack)
		
		Stack<String> stack = new Stack<String>();
		
		//System.out.println(stack.empty());
		
		stack.push("Minecraft");
		stack.push("Doom");
		stack.push("GOFTG");
		stack.push("MW2");
		stack.push("Quake");
		
		//System.out.println(stack.empty());
		
		System.out.println(stack);
		String favGame = stack.pop();
		System.out.println(stack);
		System.out.println(stack.peek());
		System.out.println("Favorite Game: "+favGame);
		System.out.println(stack.search("Minecraft"));
		

	}
}
