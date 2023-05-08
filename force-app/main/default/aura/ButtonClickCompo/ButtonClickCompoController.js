({
		buttonClick : function(cmp, event, helper) {
        var clickedBtn = event.getSource().getLocalId();
        alert(clickedBtn);
        cmp.set("v.clickedButton", clickedBtn);
    }	
})