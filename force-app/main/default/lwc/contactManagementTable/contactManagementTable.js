import { LightningElement, wire, track } from 'lwc';
import getContacts from '@salesforce/apex/ContactPaginationController.getContacts';

export default class ContactManagementTable extends LightningElement {
    @track contacts = [];
    @track pageNumber = 1;
    @track pageSize = 10;
    @track totalRecords = 0;
    @track loading = false;
    @track error;
    @track selectedRows = [];

    // Columns configuration for the data table
    columns = [
        { label: 'First Name', fieldName: 'FirstName' },
        { label: 'Last Name', fieldName: 'LastName' },
        { label: 'Email', fieldName: 'Email' },
    ];

    // Fetch data using @wire for pagination
    @wire(getContacts, { pageNumber: '$pageNumber', pageSize: '$pageSize' })
    wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data.records;
            this.totalRecords = data.totalRecords;
            this.loading = false;
        } else if (error) {
            this.error = error;
            this.loading = false;
        }
    }

    // Handle Next Page button click
    handleNextPage() {
        this.pageNumber += 1;
        this.loading = true;
    }

    // Handle Previous Page button click
    handlePreviousPage() {
        if (this.pageNumber > 1) {
            this.pageNumber -= 1;
            this.loading = true;
        }
    }

    // Disable Next button if there are no more records
    get isNextDisabled() {
        return this.contacts.length < this.pageSize;
    }

    // Disable Previous button if on the first page
    get isPreviousDisabled() {
        return this.pageNumber <= 1;
    }

    // Handle row selection in the data table
    handleRowSelection(event) {
        this.selectedRows = event.detail.selectedRows;
        console.log('Selected Rows:', this.selectedRows);
    }
}
