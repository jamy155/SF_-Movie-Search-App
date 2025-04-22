import { LightningElement } from 'lwc';

export default class MoiveList extends LightningElement {

    enteredText='';
    searchText='';
    showText= 'Please enter Valid Movie Name';

    handleChange(event){
        this.enteredText = event.target.value;
    }

    handleClick(event){
        this.searchText = this.enteredText;
    }
}