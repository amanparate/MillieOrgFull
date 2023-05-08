import {LightningElement, track} from 'lwc';
//Import apex method 
import fetchContacts from '@salesforce/apex/ContactDataController.fetchContacts';

export default class DatatableWithPagination extends LightningElement {
    
    // JS Properties 
    pageSizeOptions = [15, 25, 50, 75, 100, 500, 1000, 2000,'All records']; //Page size options
    records = []; //All records available in the data table
    columns = []; //columns information available in the data table
    totalRecords = 0; //Total no.of records
    pageSize; //No.of records to be displayed per page
    totalPages; //Total no.of pages
    pageNumber = 1; //Page number    
    recordsToDisplay = []; //Records to be displayed on the page
    @track today = new Date();

    get bDisableFirst() {
        return this.pageNumber == 1;
    }

    get bDisableLast() {
        return this.pageNumber == this.totalPages;
    }

    handleClick(evt){
        // this.clickedButtonLabel = event.target.value;
        console.log('Clicked Value :'+evt.target.value);
    }
    // connectedCallback method called when the element is inserted into a document
    connectedCallback() {
        // set datatable columns info
        // {
        //     label: 'Checkbox',
        //     fieldName: 'Checkbox',
        //     type: 'boolean'
        // },
        this.columns = [
            {
                label: 'Name',
                fieldName: 'Name'
            },
            {
                label: 'Email',
                fieldName: 'Email'
            },
            {
                label: 'Phone',
                fieldName: 'Phone'
            },
            {
                label: 'Title',
                fieldName: 'Title'
            },
        ];

        // fetch contact records from apex method 
        fetchContacts()
            .then((result) => {
                if (result != null) {
                    console.log('RESULT--> ' + JSON.stringify(result));
                    this.records = result;
                    this.totalRecords = result.length; // update total records count 
                    this.pageSize = this.pageSizeOptions[0]; //set pageSize with default value as first option         
                    if(this.pageSize == ['All records']){
                        console.log('True in here');
                    }
                    this.paginationHelper(); // call helper menthod to update pagination logic 
                }
            })
            .catch((error) => {
                console.log('error while fetch contacts--> ' + JSON.stringify(error));
            });
    }
    handleChangeEvent(evt){
        var sourceType = evt.target.name;
        var sourceValue= evt.target.value;
        console.log('sourceType::'+sourceType);
        console.log('sourceValue:: '+sourceValue);

        if(sourceType=='StartDate'){
            this.StartDate=sourceValue;
        }
    }
    // past date should be disable in date field 
    renderedCallback(){
        // this.today  = this.today.getFullYear() + '-' + (this.today.getMonth() + 1) + '-' + this.today.getDate();
        var d = new Date();
        this.today  = d.getFullYear() + '-' + (d.getMonth()+1) + '-' + d.getDate();
        console.log('Today Date : '+this.today);
    }
    handleselectedrows(event){
        //console.log('EVENT DETAILS::'+JSON.stringify(event))
        //CVCY : Start : sending custom event to handle any custom actions on selected rows
        this.recordId = [];
        const currentlySelectedRows = event.detail.selectedRows;

        //console.log('currentlySelectedRow=>'+JSON.stringify(currentlySelectedRows));
        for (let i = 0; i < currentlySelectedRows.length; i++) {
            if (!this.recordId.includes(currentlySelectedRows[i].recordId)) {
                this.recordId.push(currentlySelectedRows[i].recordId);
            }

        }

        const customEvent = new CustomEvent('getcustomaction', {

            detail: this.recordId
        });
        this.dispatchEvent(customEvent);
        let selectedRowsMap = event.target.selectedRows;
//this.onRowSelect=true;
                //unselected rows store page-wise.
                let unSelectedRowsMap = this.restoreSelectedRows.filter((item) => !selectedRowsMap.includes(item));
                this.unSelectedRowsPagesMap[this.pageNo] = unSelectedRowsMap;
console.log('unSelectedRowsMap '+unSelectedRowsMap.length);
                //selected rows store page-wise.
                this.selectedRowsPagesMap[this.pageNo] = [...selectedRowsMap];
                console.log('selectedRowsMaps '+this.restoreSelectedRows.length);
               
        this.recordId = [];

        //CVCY : End : sending custom event to handle any custom actions on selected rows
    }

    handleRecordsPerPage(event) {
        this.pageSize = event.target.value;
        this.paginationHelper();
    }

    previousPage() {
        this.pageNumber = this.pageNumber - 1;
        this.paginationHelper();
    }

    nextPage() {
        this.pageNumber = this.pageNumber + 1;
        this.paginationHelper();
    }

    firstPage() {
        this.pageNumber = 1;
        this.paginationHelper();
    }

    lastPage() {
        this.pageNumber = this.totalPages;
        this.paginationHelper();
    }

    handleSelectAll(event){

        const rowNode = event.toElement.closest('tr');

        // Row index (-1 to account for header row)
        console.log(rowNode.rowIndex - 1);

        // Row Id
        console.log(rowNode.dataset.rowKeyValue);

        alert('In side handleSelectAll');
        // const datatableElement = this.template.querySelector('lightning-datatable');
        // alert('In side handleSelectAll 1');
        // let datatableRows = datatableElement.getSelectedRows();
        // alert('In side handleSelectAll 2');
        // // let dataTableRowAction = datatableRows.find(row => !row.clippedIcon );
        // alert('In side handleSelectAll 3');
        // return datatableRows ? true : false;
    }


    // JS function to handel pagination logic 
    paginationHelper() {
        this.recordsToDisplay = [];
        // calculate total pages
        this.totalPages = Math.ceil(this.totalRecords / this.pageSize);
        // set page number 
        if (this.pageNumber <= 1) {
            this.pageNumber = 1;
        } else if (this.pageNumber >= this.totalPages) {
            this.pageNumber = this.totalPages;
        }

        // set records to display on current page 
        for (let i = (this.pageNumber - 1) * this.pageSize; i < this.pageNumber * this.pageSize; i++) {
            if (i === this.totalRecords) {
                break;
            }
            this.recordsToDisplay.push(this.records[i]);
        }
    }
}