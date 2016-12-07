package com.salim.vo;

public class BigCategory {
//대분류
	private int bigCode;
	private String bigContent;
	private int highCode;
	
	public BigCategory() {
		super();
	}

	public BigCategory(int bigCode, String bigContent, int highCode) {
		super();
		this.bigCode = bigCode;
		this.bigContent = bigContent;
		this.highCode = highCode;
	}

	@Override
	public String toString() {
		return "BigCategory [bigCode=" + bigCode + ", bigContent=" + bigContent + ", highCode=" + highCode + "]";
	}

	public int getBigCode() {
		return bigCode;
	}

	public void setBigCode(int bigCode) {
		this.bigCode = bigCode;
	}

	public String getBigContent() {
		return bigContent;
	}

	public void setBigContent(String bigContent) {
		this.bigContent = bigContent;
	}

	public int getHighCode() {
		return highCode;
	}

	public void setHighCode(int highCode) {
		this.highCode = highCode;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + bigCode;
		result = prime * result + ((bigContent == null) ? 0 : bigContent.hashCode());
		result = prime * result + highCode;
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
		BigCategory other = (BigCategory) obj;
		if (bigCode != other.bigCode)
			return false;
		if (bigContent == null) {
			if (other.bigContent != null)
				return false;
		} else if (!bigContent.equals(other.bigContent))
			return false;
		if (highCode != other.highCode)
			return false;
		return true;
	}
	
	
}
