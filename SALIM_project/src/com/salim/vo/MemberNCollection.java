package com.salim.vo;

import java.io.Serializable;

public class MemberNCollection implements Serializable{
	
	private String memberId;
	private String collectionId;
	private String invite;

	public MemberNCollection(){}

	public MemberNCollection(String memberId, String collectionId, String invite) {
		super();
		this.memberId = memberId;
		this.collectionId = collectionId;
		this.invite = invite;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getCollectionId() {
		return collectionId;
	}

	public void setCollectionId(String collectionId) {
		this.collectionId = collectionId;
	}

	public String getInvite() {
		return invite;
	}

	public void setInvite(String invite) {
		this.invite = invite;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((collectionId == null) ? 0 : collectionId.hashCode());
		result = prime * result + ((invite == null) ? 0 : invite.hashCode());
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
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
		MemberNCollection other = (MemberNCollection) obj;
		if (collectionId == null) {
			if (other.collectionId != null)
				return false;
		} else if (!collectionId.equals(other.collectionId))
			return false;
		if (invite == null) {
			if (other.invite != null)
				return false;
		} else if (!invite.equals(other.invite))
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "MemberNCollection [memberId=" + memberId + ", collectionId=" + collectionId + ", invite=" + invite
				+ "]";
	}
	
}
