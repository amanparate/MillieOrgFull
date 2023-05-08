@isTest
public class CalculationsTest {

    @isTest
    public static void Method1(){
        Calculations objCal = new Calculations();
        Integer addition = objCal.addition(100,200); //expected = 330
        Integer multiplication= objCal.multiplication(10,30); //expected=300
        
        System.assertEquals(330, addition);
        System.assertEquals(300, multiplication);
    }

}