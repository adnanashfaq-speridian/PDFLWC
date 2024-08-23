public class PDFVfpController {
    public Date fromDate { get; set; }
    public Date toDate { get; set; }
    public List<Contact> contactRecords { get; set; }

    public PDFVfpController () {
        // Fetch URL parameters
        fromDate = Date.valueOf(ApexPages.currentPage().getParameters().get('fromDate'));
        toDate = Date.valueOf(ApexPages.currentPage().getParameters().get('toDate'));
        contactRecords = new List<Contact>();
        
        // Fetch records if dates are provided
        if (fromDate != null && toDate != null) {
            fetchRecords();
        }
    }

    public void fetchRecords() {
        contactRecords = [SELECT Id, Name, CreatedDate FROM Contact WHERE CreatedDate >= :fromDate AND CreatedDate <= :toDate];
    }
}
