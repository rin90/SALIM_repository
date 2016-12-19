package com.salim.vo;

import java.io.Serializable;

public class Collect implements Serializable{

	private String collectionId;
	private String collectionName;
	private String collectionIntro;
	private String grantId;
	public Collect(){}
	public Collect(String collectionId, String collectionName, String collectionIntro, String grantId) {
		super();
		this.collectionId = collectionId;
		this.collectionName = collectionName;
		this.collectionIntro = collectionIntro;
		this.grantId = grantId;
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
	public String getGrantId() {
		return grantId;
	}
	public void setGrantId(String grantId) {
		this.grantId = grantId;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((collectionId == null) ? 0 : collectionId.hashCode());
		result = prime * result + ((collectionIntro == null) ? 0 : collectionIntro.hashCode());
		result = prime * result + ((collectionName == null) ? 0 : collectionName.hashCode());
		result = prime * result + ((grantId == null) ? 0 : grantId.hashCode());
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
		if (grantId == null) {
			if (other.grantId != null)
				return false;
		} else if (!grantId.equals(other.grantId))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Collect [collectionId=" + collectionId + ", collectionName=" + collectionName + ", collectionIntro="
				+ collectionIntro + ", grantId=" + grantId + "]";
	}

	
}
