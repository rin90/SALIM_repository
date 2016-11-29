package com.salim.vo;

import java.io.Serializable;
import java.util.Date;

public class Budget implements Serializable{
	
	private int num;
	private String memberId;
	private Date budgetDate;
	private int budget;
	private int foodExpenses;
	private int dwellingCommunication;
	private int householdgoods;
	private int clothBeauty;
	private int healthCulture;
	private int educationParenting;
	private int trafficVehicle;
	private int holidayDues;
	private int taxInterest;
	private int pinmoneyEtc;
	private int savingInsurance;
	private int creditCard;
	private int unclassified;
	
	public Budget() {
		super();
	}

	public Budget(int num, String memberId, Date budgetDate, int budget, int foodExpenses, int dwellingCommunication,
			int householdgoods, int clothBeauty, int healthCulture, int educationParenting, int trafficVehicle,
			int holidayDues, int taxInterest, int pinmoneyEtc, int savingInsurance, int creditCard, int unclassified) {
		super();
		this.num = num;
		this.memberId = memberId;
		this.budgetDate = budgetDate;
		this.budget = budget;
		this.foodExpenses = foodExpenses;
		this.dwellingCommunication = dwellingCommunication;
		this.householdgoods = householdgoods;
		this.clothBeauty = clothBeauty;
		this.healthCulture = healthCulture;
		this.educationParenting = educationParenting;
		this.trafficVehicle = trafficVehicle;
		this.holidayDues = holidayDues;
		this.taxInterest = taxInterest;
		this.pinmoneyEtc = pinmoneyEtc;
		this.savingInsurance = savingInsurance;
		this.creditCard = creditCard;
		this.unclassified = unclassified;
	}

	@Override
	public String toString() {
		return "Budget [num=" + num + ", memberId=" + memberId + ", budgetDate=" + budgetDate + ", budget=" + budget
				+ ", foodExpenses=" + foodExpenses + ", dwellingCommunication=" + dwellingCommunication
				+ ", householdgoods=" + householdgoods + ", clothBeauty=" + clothBeauty + ", healthCulture="
				+ healthCulture + ", educationParenting=" + educationParenting + ", trafficVehicle=" + trafficVehicle
				+ ", holidayDues=" + holidayDues + ", taxInterest=" + taxInterest + ", pinmoneyEtc=" + pinmoneyEtc
				+ ", savingInsurance=" + savingInsurance + ", creditCard=" + creditCard + ", unclassified="
				+ unclassified + "]";
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public Date getBudgetDate() {
		return budgetDate;
	}

	public void setBudgetDate(Date budgetDate) {
		this.budgetDate = budgetDate;
	}

	public int getBudget() {
		return budget;
	}

	public void setBudget(int budget) {
		this.budget = budget;
	}

	public int getFoodExpenses() {
		return foodExpenses;
	}

	public void setFoodExpenses(int foodExpenses) {
		this.foodExpenses = foodExpenses;
	}

	public int getDwellingCommunication() {
		return dwellingCommunication;
	}

	public void setDwellingCommunication(int dwellingCommunication) {
		this.dwellingCommunication = dwellingCommunication;
	}

	public int getHouseholdgoods() {
		return householdgoods;
	}

	public void setHouseholdgoods(int householdgoods) {
		this.householdgoods = householdgoods;
	}

	public int getClothBeauty() {
		return clothBeauty;
	}

	public void setClothBeauty(int clothBeauty) {
		this.clothBeauty = clothBeauty;
	}

	public int getHealthCulture() {
		return healthCulture;
	}

	public void setHealthCulture(int healthCulture) {
		this.healthCulture = healthCulture;
	}

	public int getEducationParenting() {
		return educationParenting;
	}

	public void setEducationParenting(int educationParenting) {
		this.educationParenting = educationParenting;
	}

	public int getTrafficVehicle() {
		return trafficVehicle;
	}

	public void setTrafficVehicle(int trafficVehicle) {
		this.trafficVehicle = trafficVehicle;
	}

	public int getHolidayDues() {
		return holidayDues;
	}

	public void setHolidayDues(int holidayDues) {
		this.holidayDues = holidayDues;
	}

	public int getTaxInterest() {
		return taxInterest;
	}

	public void setTaxInterest(int taxInterest) {
		this.taxInterest = taxInterest;
	}

	public int getPinmoneyEtc() {
		return pinmoneyEtc;
	}

	public void setPinmoneyEtc(int pinmoneyEtc) {
		this.pinmoneyEtc = pinmoneyEtc;
	}

	public int getSavingInsurance() {
		return savingInsurance;
	}

	public void setSavingInsurance(int savingInsurance) {
		this.savingInsurance = savingInsurance;
	}

	public int getCreditCard() {
		return creditCard;
	}

	public void setCreditCard(int creditCard) {
		this.creditCard = creditCard;
	}

	public int getUnclassified() {
		return unclassified;
	}

	public void setUnclassified(int unclassified) {
		this.unclassified = unclassified;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + budget;
		result = prime * result + ((budgetDate == null) ? 0 : budgetDate.hashCode());
		result = prime * result + clothBeauty;
		result = prime * result + creditCard;
		result = prime * result + dwellingCommunication;
		result = prime * result + educationParenting;
		result = prime * result + foodExpenses;
		result = prime * result + healthCulture;
		result = prime * result + holidayDues;
		result = prime * result + householdgoods;
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + num;
		result = prime * result + pinmoneyEtc;
		result = prime * result + savingInsurance;
		result = prime * result + taxInterest;
		result = prime * result + trafficVehicle;
		result = prime * result + unclassified;
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
		Budget other = (Budget) obj;
		if (budget != other.budget)
			return false;
		if (budgetDate == null) {
			if (other.budgetDate != null)
				return false;
		} else if (!budgetDate.equals(other.budgetDate))
			return false;
		if (clothBeauty != other.clothBeauty)
			return false;
		if (creditCard != other.creditCard)
			return false;
		if (dwellingCommunication != other.dwellingCommunication)
			return false;
		if (educationParenting != other.educationParenting)
			return false;
		if (foodExpenses != other.foodExpenses)
			return false;
		if (healthCulture != other.healthCulture)
			return false;
		if (holidayDues != other.holidayDues)
			return false;
		if (householdgoods != other.householdgoods)
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		if (num != other.num)
			return false;
		if (pinmoneyEtc != other.pinmoneyEtc)
			return false;
		if (savingInsurance != other.savingInsurance)
			return false;
		if (taxInterest != other.taxInterest)
			return false;
		if (trafficVehicle != other.trafficVehicle)
			return false;
		if (unclassified != other.unclassified)
			return false;
		return true;
	}
	
}
