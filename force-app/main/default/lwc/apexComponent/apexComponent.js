import { LightningElement,wire,track } from 'lwc';
import getContacts from '@salesforce/apex/LightningController.getContacts';
import updateContacts from '@salesforce/apex/LightningController.updateContacts';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

const COLS = [
    {label:'First Name',fieldName:'FirstName',editable:true},
    {label:'Last Name',fieldName:'LastName',editable:true},
    {label:'Phone',fieldName:'Phone',type:'phone'},
    {label:'Email',fieldName:'Email',type:'email'}
];

export default class ApexComponent extends LightningElement {
    columns = COLS;
    draftValues = [];
    error;
    @track data = [];
    @track selectedRows = new Set();
    @track currentPage = 1;
    @track pageSize = 5;
    @track totalRecords = 0;

    @wire(getContacts) contact;
     //to be used to save the records
     handleSave(event){
        // const updatedFields = event.detail.draftValues;
        // //Calling Apex method
        // updateContacts({data:updatedFields})
        // .then((result)=>{
        //         this.dispatchEvent(new ShowToastEvent(
        //             {
        //                 title:'Success',
        //                 message:'Records updated',
        //                 variant:'success'
        //             }
        //         ));
        // })
        // .catch((error)=> {
        //     this.error = error;
        // });

        if (data) {
            this.data = data;
            this.totalRecords = data.length;
        } else if (error) {
            console.error(error);
        }

    }

    get paginatedData() {
        const start = (this.currentPage - 1) * this.pageSize;
        return this.data.slice(start, start + this.pageSize);
    }

    handleRowSelection(event) {
        const selectedRowIds = new Set(event.detail.selectedRows.map(row => row.Id));
        this.selectedRows = new Set([...this.selectedRows, ...selectedRowIds]);
    }

    get selectedRowKeys() {
        return Array.from(this.selectedRows);
    }

    handlePrevious() {
        if (this.currentPage > 1) {
            this.currentPage--;
        }
    }

    handleNext() {
        if (this.currentPage < Math.ceil(this.totalRecords / this.pageSize)) {
            this.currentPage++;
        }
    }

    get isNextDisabled() {
        return this.currentPage >= Math.ceil(this.totalRecords / this.pageSize);
    }

    get isPreviousDisabled() {
        return this.currentPage <= 1;
    }

}





// import { LightningElement, track, wire } from 'lwc';
// import getAccounts from '@salesforce/apex/AccountController.getAccounts';

// export default class LwcDatatableWithPagination extends LightningElement {
//     @track data = [];
//     @track columns = [
//         { label: 'Name', fieldName: 'Name', type: 'text' },
//         { label: 'Industry', fieldName: 'Industry', type: 'text' }
//     ];
//     @track selectedRows = new Set();
//     @track currentPage = 1;
//     @track pageSize = 5;
//     @track totalRecords = 0;

//     @wire(getAccounts)
//     wiredAccounts({ error, data }) {
//         if (data) {
//             this.data = data;
//             this.totalRecords = data.length;
//         } else if (error) {
//             console.error(error);
//         }
//     }

//     get paginatedData() {
//         const start = (this.currentPage - 1) * this.pageSize;
//         return this.data.slice(start, start + this.pageSize);
//     }

//     handleRowSelection(event) {
//         const selectedRowIds = new Set(event.detail.selectedRows.map(row => row.Id));
//         this.selectedRows = new Set([...this.selectedRows, ...selectedRowIds]);
//     }

//     get selectedRowKeys() {
//         return Array.from(this.selectedRows);
//     }

//     handlePrevious() {
//         if (this.currentPage > 1) {
//             this.currentPage--;
//         }
//     }

//     handleNext() {
//         if (this.currentPage < Math.ceil(this.totalRecords / this.pageSize)) {
//             this.currentPage++;
//         }
//     }

//     get isNextDisabled() {
//         return this.currentPage >= Math.ceil(this.totalRecords / this.pageSize);
//     }

//     get isPreviousDisabled() {
//         return this.currentPage <= 1;
//     }
// }