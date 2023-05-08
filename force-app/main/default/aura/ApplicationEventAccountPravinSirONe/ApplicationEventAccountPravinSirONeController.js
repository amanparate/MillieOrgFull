({
	Component_A_Handler : function(component, event, helper) 
 	{
        console.log('In JS Controller Comp A');
         console.log(component.find('selectType').get('v.value'));
         //assing select list value & slider value to variable
         var sendAccType = component.find('selectType').get('v.value');
         var sendSlidervalue = component.get('v.sliderValue');
         console.log('Selected Slider Value in Js Handler Compo A '+sendSlidervalue); 
         console.log('Selected Acc Type in JS Var '+sendAccType);
         //Register Event 
         var eventCompo1 = $A.get("e.c:ApplicationEventAccountPravinSirEvent");
         
        //Set Parameters for Event & Selected Value of select List & Slider store in Variables of Event
         eventCompo1.setParams({"acctypeEvent":sendAccType, "sliderValueAtEvent":sendSlidervalue});
         
        //Fire Event
         eventCompo1.fire();
	}
})