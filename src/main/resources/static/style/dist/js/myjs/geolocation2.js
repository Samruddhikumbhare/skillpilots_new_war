var placeSearch, autocomplete,cityName,stateName;
      var componentForm = {
    	street_number: 'short_name',
    	route: 'long_name',
        locality: 'long_name',
        administrative_area_level_1: 'long_name',
        country: 'long_name',
        postal_code: 'short_name'
      };

      function initAutocomplete() {
        autocomplete = new google.maps.places.Autocomplete(
            /** @type {!HTMLInputElement} */(document.getElementById('address-autocomplete')),
            {types: ['(cities)'],componentRestrictions: {country: "IN"}});

        autocomplete.addListener('place_changed', fillInAddress);
        
        
        autocomplete2 = new google.maps.places.Autocomplete(
                /** @type {!HTMLInputElement} */(document.getElementById('address-autocomplete2')),
                {types: ['(cities)'],componentRestrictions: {country: "IN"}});

            autocomplete2.addListener('place_changed', fillInAddress2);
      }

       function fillInAddress() {
        var place = autocomplete.getPlace();
        
        for (var i = 0; i < place.address_components.length; i++) {
          var addressType = place.address_components[i].types[0];
          if(addressType=='locality'){
        	  cityName=place.address_components[i][componentForm[addressType]];
          }else if(addressType=='administrative_area_level_1'){
        	  stateName=place.address_components[i][componentForm[addressType]];
          }
        }
        $("#address-autocomplete").val(cityName+","+stateName);
        $('#homeCityCheck').change();
        cityName="";
        stateName="";
      } 
       
       function fillInAddress2() {
           var place = autocomplete2.getPlace();
           for (var i = 0; i < place.address_components.length; i++) {
             var addressType = place.address_components[i].types[0];
             if(addressType=='locality'){
           	  cityName=place.address_components[i][componentForm[addressType]];
             }else if(addressType=='administrative_area_level_1'){
           	  stateName=place.address_components[i][componentForm[addressType]];
             }
           }
           $("#address-autocomplete2").val(cityName+","+stateName);
           cityName="";
           stateName="";
      } 

      // Bias the autocomplete object to the user's geographical location,
      // as supplied by the browser's 'navigator.geolocation' object.
      function geolocate() {
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var geolocation = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
            var circle = new google.maps.Circle({
              center: geolocation,
              radius: position.coords.accuracy
            });
            autocomplete.setBounds(circle.getBounds());
          });
        }
      }
      