public class ActiveUsersAssignment_CX {

    public List<User> userList{get; set;}

    public ActiveUsersAssignment_CX(ApexPages.StandardSetController controller) {

        userList = [select LastLoginDate from User where LastLoginDate = null ];
    }

}