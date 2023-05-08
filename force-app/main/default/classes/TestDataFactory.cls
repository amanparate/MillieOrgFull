public with sharing class TestDataFactory {

    /**
     * @name ConstructCollaborationGroup
     * @description
    **/
    public static CollaborationGroup ConstructCollaborationGroup(){
        //ToDo: Ensure this method returns a single Chatter CollaborationGroup
        //    whose Name starts with 'TEST' followed by the INVENTORY_ANNOUNCEMENTS constant
        //    and configured so anyone can join, see and post updates.
            CollaborationGroup chatterGroup = new CollaborationGroup(
            Name = 'TEST'+Constants.INVENTORY_ANNOUNCEMENTS,  
            CollaborationType = 'Public'
        );
        return chatterGroup;
    }

    /**
     * @name CreateProducts
     * @description Constructs a list of Product2 records for unit tests
    **/
    public static List<Product2> ConstructProducts(Integer cnt){
        List<Product2> products=new List<Product2>();
        //ToDo: Ensure this method returns a list, of size cnt, of uniquely named Product2 records
        //  with all the required fields populated
        //  and IsActive = true
        //  an Initial Inventory set to 10
        //  and iterating through the product family picklist values throughout the list.
        for(Integer i=0;i<cnt;i++){
            Product2 eachProduct=new Product2();
            eachProduct.Name='testProduct '+i;
            eachProduct.IsActive=true;
            eachProduct.Initial_Inventory__c=10;
            eachProduct.Family=Constants.PRODUCT_FAMILY.get(math.mod(i,4)).getValue();
            products.add(eachProduct);
        }
        return products;
    }

    /**
     * @name CreatePricebookEntries
     * @description Constructs a list of PricebookEntry records for unit tests
    **/
    public static List<PriceBookEntry> ConstructPricebookEntries(List<Product2> prods){
        List<PriceBookEntry> pbeList = new List<PriceBookEntry>();
        //ToDo: Ensure this method returns a corresponding list of PricebookEntries records
        //  related to the provided Products
        //  with all the required fields populated
        //  and IsActive = true
        //  and belonging to the standard Pricebook
        for(Product2 p:prods){
            PriceBookEntry pbe = new PriceBookEntry();
            pbe.Product2Id = p.Id;
            pbe.IsActive = true;
            pbe.Pricebook2Id=Constants.STANDARD_PRICEBOOK_ID;
            pbe.UnitPrice = 100;
            pbeList.add(pbe);
        }       
        return pbeList;
    }

    /**
     * @name CreateAccounts
     * @description Constructs a list of Account records for unit tests
    **/
    public static List<Account> ConstructAccounts(Integer cnt){
        //ToDo: Ensure this method returns a list of size cnt of uniquely named Account records
        //  with all of the required fields populated.
        List<Account> accounts = new List<Account>();
        for(Integer i = 0 ; i<cnt; i++) {
            Account acc = new Account(name='Account' + i);
            accounts.add(acc);
        }
        System.debug('account size' + accounts.size());
        return accounts;
    }

    /**
     * @name CreateContacts
     * @description Constructs a list of Contact records for unit tests
    **/
    public static List<Contact> ConstructContacts(Integer cnt, List<Account> accts){
        //ToDo: Ensure this method returns a list, of size cnt, of uniquely named Contact records
        //  related to the provided Accounts
        //  with all of the required fields populated.
        List<Contact> contacts = new List<Contact>();
        for(Integer i=0;i<cnt;i++){
            Contact con = new Contact();
            con.LastName = 'TestContact'+i;
            Integer index = Math.mod(i, accts.size());
            con.AccountId = accts.get(index).Id;
            contacts.add(con);            
        }
        System.debug('contacts size' + contacts.size());
        System.debug('accts size' + accts.size());
        return contacts;
    }

    /**
     * @name CreateOrders
     * @description Constructs a list of Order records for unit tests
    **/
    public static List<Order> ConstructOrders(Integer cnt, List<Account> accts){
        //ToDo: Ensure this method returns a list of size cnt of uniquely named Order records
        //  related to the provided Accounts
        //  with all of the required fields populated.
        List<Order> orders = new List<Order>();
        for(Integer i=0;i<cnt;i++){
            Order ord = new Order();
            ord.Pricebook2Id = Constants.STANDARD_PRICEBOOK_ID;
            ord.Status='Draft';
            ord.EffectiveDate = System.today();
            ord.AccountId = accts.get(Math.mod(i, accts.size())).Id;           
            orders.add(ord);
        }                
        return orders;        
    }

    /**
     * @name CreateOrderItems
     * @description Constructs a list of OrderItem records for unit tests
    **/
    public static List<OrderItem> ConstructOrderItems(integer cnt, list<pricebookentry> pbes, list<order> ords){
        //ToDo: Ensure this method returns a list of size cnt of OrderItem records
        //  related to the provided Pricebook Entries
        //  and related to the provided Orders
        //  with all of the required fields populated.
        //  Hint: Use the DEFAULT_ROWS constant for Quantity as it will be used in the next challenge
        List<OrderItem> items = new List<OrderItem>();
        for(Integer i=0;i<cnt;i++){
            OrderItem ord = new OrderItem();
            ord.Quantity = Constants.DEFAULT_ROWS;
            ord.UnitPrice = 250;
            ord.OrderId =ords.get(Math.mod(i, ords.size())).Id;
            ord.PricebookEntryId = pbes.get(math.mod(i, pbes.size())).Id;
            items.add(ord);
        }
        
        return items;
    }

    /**
     * @name SetupTestData
     * @description Inserts accounts, contacts, Products, PricebookEntries, Orders, and OrderItems.
    **/
                        
    public static void InsertTestData(Integer cnt){
        //InsertTestData
        //ToDo: Ensure this method calls each of the construct methods
        //  and inserts the results for use as test data.
                
        CollaborationGroup groups = TestDataFactory.ConstructCollaborationGroup();
        insert groups;
        
        List<Product2>  products= TestDataFactory.ConstructProducts(cnt);
        insert products;
        
        List<PriceBookEntry> entries = TestDataFactory.ConstructPricebookEntries(products);
        insert entries;
        
        List<Account> accts = TestDataFactory.ConstructAccounts(cnt);
        insert accts;
        
        List<Contact> contacts = TestDataFactory.ConstructContacts(cnt,accts);
        insert contacts;
        
        List<Order> orders = TestDataFactory.ConstructOrders( cnt,  accts);
        insert orders;
        
        List<OrderItem> items = TestDataFactory.ConstructOrderItems(cnt, entries, orders);
        insert items;
    }
        
        public static void VerifyQuantityOrdered(Product2 originalProduct, Product2 updatedProduct, Integer qtyOrdered) {
        System.assertEquals((updatedProduct.Quantity_Ordered__c - originalProduct.Quantity_Ordered__c), qtyOrdered);
    }

}