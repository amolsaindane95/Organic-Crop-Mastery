package com.organiccropmastery.utility;

public class Helper {
	
	public static String get10Words(String productDescription)
    {
    	String[] str=productDescription.split(" ");
    	if(str.length>10)
    	{
    		String res="";
    		for(int i=0;i<10;i++)
    		{
    			res=res+str[i]+" ";
    		}
    		
    		return res+"...";
    	}
    	
    	else
    	{
    		return productDescription+"...";
    	}
    }
    
    public static int getProductSellingPrice(int productPrice,int productDiscountPercent)
    {
    	Double price=Double.parseDouble(String.valueOf(productPrice));
    	Double discount=Double.parseDouble(String.valueOf(productDiscountPercent));
    	Double tenPercentValue=discount*0.01;
    	Double tenPercentOfPrice=tenPercentValue*price;
    	Double finalPrice=productPrice-tenPercentOfPrice;
    	
    	int value = (int)Math.round(finalPrice);
    	
    	return value;
    }
    
    public static String getAlphaNumericOrderId(int n)
    {
  
        // chose a Character random from this String
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                    + "0123456789"
                                    + "abcdefghijklmnopqrstuvxyz";
  
        // create StringBuffer size of AlphaNumericString
        StringBuilder sb = new StringBuilder(n);
  
        for (int i = 0; i < n; i++) {
  
            // generate a random number between
            // 0 to AlphaNumericString variable length
            int index
                = (int)(AlphaNumericString.length()
                        * Math.random());
  
            // add Character one by one in end of sb
            sb.append(AlphaNumericString
                          .charAt(index));
        }
  
        return sb.toString();
    }
    
    
}
