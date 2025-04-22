public with sharing class IMDBController {

    @AuraEnabled(cacheable=true)
    public static string getMovies(String movieName){
        
		// Create HTTP request to send.
		Http http = new Http();
		HttpRequest request = new HttpRequest();

		// Set the endpoint URL. Use direct URL or for best practices use Named Credential.
		request.setEndpoint('https://api.collectapi.com/imdb/imdbSearchByName?query=' + movieName);

		// Set the HTTP method to GET.
		request.setMethod('GET');

        request.setHeader('Authorization', 'apikey 3nenkS9NZrewdYUmyNRYo3:45LhY6lU3ltdk2VKOo0Zuw');

        try {   

        // Send the HTTP request and get the response.
		HttpResponse response = http.send(request);

		// If the HTTP response code is successful, parse the JSON response and update the contact.
		if (response.getStatusCode() == 200) {
			// Deserialize the JSON string into collections of primitive data types.
			String jsonResponse = response.getBody();
            return jsonResponse;

		}else {
            // If the status code is not 200, something went wrong with the request
            String errorMessage = 'HTTP request failed. Status code: ' + response.getStatusCode();
            System.debug('Response body: ' + response.getBody());
            return errorMessage;

        }
        
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}