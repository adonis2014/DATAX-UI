package net.iharding.modules.meta.model;

import java.util.ArrayList;
import java.util.List;

public class TreeNode {
	
	private Long id;
	
	private List<TreeNode> childNode=new ArrayList<TreeNode>();
	
	private String name;
	
	private String code;
	
	private String type;
	
	private Integer grade;
	
	

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<TreeNode> getChildNode() {
		return childNode;
	}

	public void setChildNode(List<TreeNode> childNode) {
		this.childNode = childNode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}
