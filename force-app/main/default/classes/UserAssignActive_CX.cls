public class UserAssignActive_CX {

    public List<User> userList{get; set;}

    public UserAssignActive_CX(ApexPages.StandardController controller) {
    
        userList = [select id, Name,ProfileId, IsActive,LastLoginDate from User where LastLoginDate = null];

    }

}