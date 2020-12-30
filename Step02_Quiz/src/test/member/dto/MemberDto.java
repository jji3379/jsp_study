package test.member.dto;

public class MemberDto {
	//필드
	private int num;
	private String name;
	private String addr;
	
	//보여줄 페이지의 시작 ROWNUM
	private int startRowNum;
	//보여줄 페이지의 끝 ROWNUM
	private int endRowNum;
	
	//디폴트 생성자
	public MemberDto() {}

	public MemberDto(int num, String name, String addr, int startRowNum, int endRowNum) {
		super();
		this.num = num;
		this.name = name;
		this.addr = addr;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}
	
}