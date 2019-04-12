package com.ahead.crud.pojo;

import javax.validation.constraints.Pattern;

public class Employee {
    private Integer empId;
    
    @Pattern(regexp="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})",
    		 message="姓名为6-16位的英文字母数字组合或者2-5位的中文")
    private String empName;

    private String empGender;
    
    @Pattern(regexp="^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",
   		 message="邮箱格式不正确")
    private String empEmail;

    private Integer empDeptId;

    private Department dept;
    
    public Employee() {}
    public Employee(Integer empId, String empName, String empGender, String empEmail, Integer empDeptId) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.empGender = empGender;
		this.empEmail = empEmail;
		this.empDeptId = empDeptId;
	}

	public Department getDept() {
		return dept;
	}
	

	@Override
	public String toString() {
		return "Employee [empId=" + empId + ", empName=" + empName + ", empGender=" + empGender + ", empEmail="
				+ empEmail + ", empDeptId=" + empDeptId + ", dept=" + dept + "]";
	}
	public void setDept(Department dept) {
		this.dept = dept;
	}

	public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getEmpGender() {
        return empGender;
    }

    public void setEmpGender(String empGender) {
        this.empGender = empGender == null ? null : empGender.trim();
    }

    public String getEmpEmail() {
        return empEmail;
    }

    public void setEmpEmail(String empEmail) {
        this.empEmail = empEmail == null ? null : empEmail.trim();
    }

    public Integer getEmpDeptId() {
        return empDeptId;
    }

    public void setEmpDeptId(Integer empDeptId) {
        this.empDeptId = empDeptId;
    }
}