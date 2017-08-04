package spring.test2;

import java.util.ArrayList;

public class Student {
	ArrayList<String> list;
	int kor, eng, mat;
	
	
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Student(ArrayList<String> list, int kor, int eng, int mat) {
		super();
		this.list = list;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}
	public ArrayList<String> getList() {
		return list;
	}
	public void setList(ArrayList<String> list) {
		this.list = list;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMat() {
		return mat;
	}
	public void setMat(int mat) {
		this.mat = mat;
	}
	
	
	
}