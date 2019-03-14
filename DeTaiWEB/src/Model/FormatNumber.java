package Model;

import java.util.Stack;

public class FormatNumber {
public String addDotToTheNumber(double price){
	int prices=(int)price;
	String number=prices+"";
	Stack<String> stack=new Stack<>();
	String result="";
	int count=0;
	for (int i = number.length()-1; i >=0; i--) {
		count++;
		stack.add(number.charAt(i)+"");
		if(count%3==0){
			stack.add(".");
		}
		
	}
int size=stack.size();
	for (int i = 0; i < size; i++) {
		result+=stack.pop();
		
	}
	String lastResult="";
if(result.charAt(0)=='.'){
	for (int i = 1; i < result.length(); i++) {
		lastResult+=result.charAt(i);
	}
	return lastResult;
}else{
	return result;
}
}

}
