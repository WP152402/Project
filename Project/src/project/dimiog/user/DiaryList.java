package project.dimiog.user;

public class DiaryList {
	private String title;
	private String text;
	private String date;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public DiaryList(String title, String text, String date) {
		super();
		this.title = title;
		this.text = text;
		this.date = date;
	}
	public DiaryList() {
		
	}
}
