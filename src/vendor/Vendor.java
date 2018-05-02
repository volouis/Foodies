package vendor;

import java.util.ArrayList;

public class Vendor {

	//fields of each vendor
	private int ID;
	private String VName;
	private String Address;
	private String PostalCode;
	private String Email;
	private String Website_URL;
	private double Rating;
	private String Tag1;
	private String Tag2;
	private String Tag3;
	private String Tag4;
	private String Tag5;
	private String Neighbourhood;
	private String Genre1;
	private String Genre2;
	private String timeOfDay1;
	private String timeOfDay2;
	private double numberOfVotes;
	private String Image_URL;
	
	private ArrayList<String> searchComparisonValues;
	private int numberOfMatches;
	
	public Vendor(int ID, String VName, String Address, String PostalCode, String Email,
			String Website_URL, double Rating, String Tag1, String Tag2, String Tag3, String Tag4,
			String Tag5, String Neighbourhood, String Genre1, String Genre2,
			String timeOfDay1, String timeOfDay2, double numberOfVotes, String Image_URL){
		
		this.ID = ID;
		this.VName = VName;
		this.Address = Address;
		this.PostalCode = PostalCode;
		this.Email = Email;
		this.Website_URL = Website_URL;
		this.Rating = Rating;
		this.Tag1 = Tag1;
		this.Tag2 = Tag2;
		this.Tag3 = Tag3;
		this.Tag4 = Tag4;
		this.Tag5 = Tag5;
		this.Neighbourhood = Neighbourhood;
		this.Genre1 = Genre1;
		this.Genre2 = Genre2;
		this.timeOfDay1 = timeOfDay1;
		this.timeOfDay2 = timeOfDay2;
		this.numberOfVotes = numberOfVotes;
		this.Image_URL = Image_URL;
		
		this.searchComparisonValues = new ArrayList<String>();
		this.numberOfMatches = 0;
	}
	
	public int setNumberOfMatches(String[] searchString){
		//create massive array of Strings of all relevent matching key words based on vendor attributes
		String combinedMatch = this.VName + "," + this.Address + "," + this.PostalCode + "," + this.Tag1
				 + "," + this.Tag2 + "," + this.Tag3 + "," + this.Tag4 + "," + this.Tag5 + "," + this.Neighbourhood
				 + "," + this.Genre1 + "," + this.Genre2 + "," + this.timeOfDay1 + "," + this.timeOfDay2;
		
		String[] combinedMatchArray = combinedMatch.split("[^\\w]+");
		
		//display based on number of matches
		for(String searchFragment : searchString){
			for(String combinedFragment : combinedMatchArray){
				if(searchFragment.equalsIgnoreCase(combinedFragment)){
					this.numberOfMatches++;
				}
			}
		}

		return this.numberOfMatches;
	}

	public int getNumberOfMatches() {return this.numberOfMatches;}
	public int getID() {return this.ID;}
	public String getVName(){return this.VName;}
	public String getAddress(){return this.Address;}
	public String getPostalCode(){return this.PostalCode;}
	public String getEmail(){return this.Email;}
	public String getWebsite_URL(){return this.Website_URL;}
	public double getRating(){return this.Rating;}
	public String getTag1(){return this.Tag1;}
	public String getTag2(){return this.Tag2;}
	public String getTag3(){return this.Tag3;}
	public String getTag4(){return this.Tag4;}
	public String getTag5(){return this.Tag5;}
	public String getNeighbourhood(){return this.Neighbourhood;}
	public String getGenre1(){return this.Genre1;}
	public String getGenre2(){return this.Genre2;}
	public String gettimeOfDay1(){return this.timeOfDay1;}
	public String gettimeOfDay2(){return this.timeOfDay2;}
	public double getnumberOfVotes(){return this.numberOfVotes;}
	public String getImage_URL(){return this.Image_URL;}
	
	
}
