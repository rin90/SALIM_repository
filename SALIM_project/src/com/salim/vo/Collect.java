package com.salim.vo;

public class Collect{

	private String collectionId;
	private String collectionName;
	private String collectionIntro;
	
	public Collect(){}

	public Collect(String collectionId, String collectionName, String collectionIntro) {
		super();
		this.collectionId = collectionId;
		this.collectionName = collectionName;
		this.collectionIntro = collectionIntro;
	}

	public String getCollectionId() {
		return collectionId;
	}

	public void setCollectionId(String collectionId) {
		this.collectionId = collectionId;
	}

	public String getCollectionName() {
		return collectionName;
	}

	public void setCollectionName(String collectionName) {
		this.collectionName = collectionName;
	}

	public String getCollectionIntro() {
		return collectionIntro;
	}

	public void setCollectionIntro(String collectionIntro) {
		this.collectionIntro = collectionIntro;
	}

	@Override
	public String toString() {
		return "Collection [collectionId=" + collectionId + ", collectionName=" + collectionName + ", collectionIntro="
				+ collectionIntro + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((collectionId == null) ? 0 : collectionId.hashCode());
		result = prime * result + ((collectionIntro == null) ? 0 : collectionIntro.hashCode());
		result = prime * result + ((collectionName == null) ? 0 : collectionName.hashCode());
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
		Collect other = (Collect) obj;
		if (collectionId == null) {
			if (other.collectionId != null)
				return false;
		} else if (!collectionId.equals(other.collectionId))
			return false;
		if (collectionIntro == null) {
			if (other.collectionIntro != null)
				return false;
		} else if (!collectionIntro.equals(other.collectionIntro))
			return false;
		if (collectionName == null) {
			if (other.collectionName != null)
				return false;
		} else if (!collectionName.equals(other.collectionName))
			return false;
		return true;
	}
	
	
}
