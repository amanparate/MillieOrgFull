import { LightningElement, wire } from 'lwc';
import getResult from "@salesforce/apex/pocWebCall.getResult";

const columns = [
    { label: 'Id', fieldName: 'id' , type : 'string'},
    { label: 'Name', fieldName: 'name' },
    { label: 'Brewery Type', fieldName: 'brewery_type' },
    { label: 'City', fieldName: 'city', type: 'text' },
    { label: 'Address 1', fieldName: 'address_1', type: 'text' },
    { label: 'Longitude', fieldName: 'longitude', type: 'text' },
    { label: 'Latitude', fieldName: 'latitude', type: 'text' }
];

export default class PocLWCComponent extends LightningElement {

    data = [];
    columns = columns;

    connectedCallback() {
        this.callingApexClass();
    }
    
    callingApexClass(){
        getResult()
            .then(response => {
                console.log('Response : ',response);
                let opList =[];
                response.forEach((row) => {
                    console.log(row);
                    let dataline = {};
                    dataline.id = row.id;
                    dataline.name = row.name;
                    dataline.brewery_type = row.brewery_type;
                    dataline.city = row.city;
                    dataline.address_1 = row.address_1;
                    dataline.longitude = row.longitude;
                    dataline.latitude = row.latitude;

                    console.log('Dataline: ',dataline);
                    opList.push(dataline);
                });
                this.data=opList;
            })
            .catch(error =>{
                console.log(error);
            })
        
    }
}