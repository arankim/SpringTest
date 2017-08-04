package db;

public class MovieDto {
	private int no;
	private String movie;
	private String seat;
	
	public MovieDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MovieDto(int no, String movie, String seat) {
		super();
		this.no = no;
		this.movie = movie;
		this.seat = seat;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getMovie() {
		return movie;
	}
	public void setMovie(String movie) {
		this.movie = movie;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	
	

}
