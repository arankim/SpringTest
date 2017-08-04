package spring.test2;

public class StudentInto {
	Student stu;
	
	public void setStu(Student stu){
		this.stu = stu;
	}
	
	public int getTotal(){
		return stu.getKor() + stu.getEng() + stu.getMat();
	}
	
	public double getAvg(){
		return getTotal() / 3.0;
	}
	
	

}
