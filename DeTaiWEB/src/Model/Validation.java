package Model;

public class Validation {
String data;
String data2;
String errorMessage;
public Validation(String data, String errorMessage) {
	
	this.data = data;
	this.errorMessage = errorMessage;
}
public Validation(String data, String data2,String errorMessage) {
	
	this.data = data;
	this.data2=data2;
	this.errorMessage = errorMessage;
}
public boolean isError(){
	if(this.data==null||this.data.equals("")){
		return true;
	}
	return false;
}
public boolean isPasswordNotMatch(){
	if(!data.equals(data2)){
		return true;
	}
	return false;
}
public String getMessage(){
	return this.errorMessage;
}
}
