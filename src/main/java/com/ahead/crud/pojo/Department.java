package com.ahead.crud.pojo;

public class Department {
    private Integer deptId;

    private String deptName;

    public Department() {}
    
    public Department(Integer deptId, String deptName) {
		super();
		this.deptId = deptId;
		this.deptName = deptName;
	}

	public Integer getDeptId() {
        return deptId;
    }
	

    @Override
	public String toString() {
		return "Department [deptId=" + deptId + ", deptName=" + deptName + "]";
	}

	public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }
    
}