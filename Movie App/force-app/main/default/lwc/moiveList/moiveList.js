import { LightningElement, wire } from 'lwc';
import  getMovies  from '@salesforce/apex/IMDBController.getMovies';

export default class MoiveList extends LightningElement {

    enteredText='';
    searchText='';
    showText= 'Please enter Valid Movie Name';
    movies=[];

    handleChange(event){
        this.enteredText = event.target.value;
    }

    handleClick(event){
        this.searchText = this.enteredText;
    }

    @wire(getMovies, { movieName: '$searchText' })
    fetchMovies(result){

        if(result.data){
            let data=JSON.parse(result.data);  

            if(data.success){
                this.movies = data.result
                this.showText = '';
            }
            else{
                this.showText = 'Please enter Valid Movie Name';
                this.movies = [];
            }
        } else if(result.error){
                console.log('Error occurred while searching for movies'+result.error);
                this.showText='Error occurred while searching for movies' + result.error;
            }
    }
}