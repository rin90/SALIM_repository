package com.salim.vo;

public class SmallCategory {
//소분류
	private int smallCode;
	private String smallContent;
	private int bigCode;
	
	private BigCategory bigCategory;
	
	public SmallCategory() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SmallCategory(int smallCode, String smallContent, int bigCode) {
		super();
		this.smallCode = smallCode;
		this.smallContent = smallContent;
		this.bigCode = bigCode;
	}

	public SmallCategory(int smallCode, String smallContent, int bigCode, BigCategory bigCategory) {
		super();
		this.smallCode = smallCode;
		this.smallContent = smallContent;
		this.bigCode = bigCode;
		this.bigCategory = bigCategory;
	}

	public int getSmallCode() {
		return smallCode;
	}

	public void setSmallCode(int smallCode) {
		this.smallCode = smallCode;
	}

	public String getSmallContent() {
		return smallContent;
	}

	public void setSmallContent(String smallContent) {
		this.smallContent = smallContent;
	}

	public int getBigCode() {
		return bigCode;
	}

	public void setBigCode(int bigCode) {
		this.bigCode = bigCode;
	}

	public BigCategory getbigCategory() {
		return bigCategory;
	}

	public void setbigCategory(BigCategory bigCategory) {
		this.bigCategory = bigCategory;
	}

	@Override
	public String toString() {
		return "SmallCategory [smallCode=" + smallCode + ", smallContent=" + smallContent + ", bigCode=" + bigCode
				+ ", bigCategory=" + bigCategory + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + bigCode;
		result = prime * result + ((bigCategory == null) ? 0 : bigCategory.hashCode());
		result = prime * result + smallCode;
		result = prime * result + ((smallContent == null) ? 0 : smallContent.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SmallCategory other = (SmallCategory) obj;
		if (bigCode != other.bigCode)
			return false;
		if (bigCategory == null) {
			if (other.bigCategory != null)
				return false;
		} else if (!bigCategory.equals(other.bigCategory))
			return false;
		if (smallCode != other.smallCode)
			return false;
		if (smallContent == null) {
			if (other.smallContent != null)
				return false;
		} else if (!smallContent.equals(other.smallContent))
			return false;
		return true;
	}

	
	
	
}