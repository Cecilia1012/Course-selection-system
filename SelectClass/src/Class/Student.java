package Class;

public class Student {
	private String StuID;    //’À∫≈(—ß∫≈)
	private String Password;         //√‹¬Î
	private String StuName;
	private String DeptID;
	private String ClassID;
	private String Sex;
	
	public String getStuID()
	{
		return StuID;
	}
	public void setStuID(String StuID)
	{
		this.StuID = StuID;
	}
	
	public String getPassword()
	{
		return Password;
	}
	public void setPassword(String Password)
	{
		this.Password = Password;
	}
	
	public String getDeptID() {
		return DeptID;
	}
	public void setDeptID(String deptID) {
		this.DeptID = deptID;
	}
	
	public String getStuName() 
	{
		return StuName;
	}
	public void setStuName(String stuName) 
	{
		this.StuName = stuName;
	}
	
	public String getClassID()
{
		return ClassID;
	}
	public void setClassID(String classID)
	{
		this.ClassID = classID;
	}
	
	public String getSex() 
	{
		return Sex;
	}
	public void setSex(String sex)
	{
		this.Sex = sex;
	}
}
