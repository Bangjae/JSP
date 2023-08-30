package Controller;

public class MemberDTO
{
	private String id;
	private String pass;
	private String name;
	private String birth;
	private String zipcode;
	private String address;
	private String detailaddress;
	
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getPass()
	{
		return pass;
	}
	public void setPass(String pass)
	{
		this.pass = pass;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getBirth()
	{
		return birth;
	}
	public void setBirth(String birth)
	{
		this.birth = birth;
	}
	public String getZipcode()
	{
		return zipcode;
	}
	public void setZipcode(String zipcode)
	{
		this.zipcode = zipcode;
	}
	public String getAddress()
	{
		return address;
	}
	public void setAddress(String address)
	{
		this.address = address;
	}
	public String getDetailaddress()
	{
		return detailaddress;
	}
	public void setDetailaddress(String detailaddress)
	{
		this.detailaddress = detailaddress;
	}
	public String getChamgo()
	{
		return chamgo;
	}
	public void setChamgo(String chamgo)
	{
		this.chamgo = chamgo;
	}
	private String chamgo;

	@Override
	//확인용코드
	public String toString()
	{
		return "MemberDTO [id=" + id + ", pass=" + pass + ", name=" + name + ", birth=" + birth + ", zipcode=" + zipcode
				+ ", address=" + address + ", detailaddress=" + detailaddress + ", chamgo=" + chamgo + "]";
	}
}
