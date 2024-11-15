public class UpdateParentAccount implements Queueable {
    // Variables of class 
    
    private List<Account>accList;
    private Id parentAccId;
    
    // Constructor 
    public UpdateParentAccount(List<Account>accRecords, Id accId){
        this.accList = accRecords;
        this.ParentAccId = accId;
    }
    // Method
    public void execute (QueueableContext context){
        for(Account acc: accList){
            acc.ParentId = ParentAccId;            
        }
        update accList;
    }
}