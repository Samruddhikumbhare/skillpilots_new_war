var placeSearch, autocomplete;
      var componentForm = {
    	street_number: 'short_name',
    	route: 'long_name',
        locality: 'long_name',
        administrative_area_level_1: 'long_name',
        country: 'long_name',
        postal_code: 'short_name'
      };

      function initAutocomplete() {
        // Create the autocomplete object, restricting the search to geographical
        // location types.
        autocomplete = new google.maps.places.Autocomplete(
            /** @type {!HTMLInputElement} */(document.getElementById('address-autocomplete')),
            {types: ['(cities)'],componentRestrictions: {country: "IN"}});

        // When the user selects an address from the dropdown, populate the address
        // fields in the form.
        autocomplete.addListener('place_changed', fillInAddress);
      }

       function fillInAddress() {
        // Get the place details from the autocomplete object.
        var place = autocomplete.getPlace();

        document.getElementById("street_number").value = '';
        document.getElementById("route").value = '';
        document.getElementById("postal_code").value = '';
        document.getElementById("locality").value = '';
        document.getElementById("street_number").disabled = false;
        document.getElementById("street_number").title='';
        document.getElementById("route").disabled = false;
        document.getElementById("route").title='';
        document.getElementById("postal_code").disabled = false;
        document.getElementById("postal_code").title='';
        document.getElementById("locality").disabled = false;
        document.getElementById("locality").title='';
        /*document.getElementById("locality").title='To change this field, change the city selected above';
        document.getElementById("administrative_area_level_1").title='To change this field, change the city selected above';
        document.getElementById("country").title='To change this field, change the city selected above';*/

        // Get each component of the address from the place details
        // and fill the corresponding field on the form.
        
        for (var i = 0; i < place.address_components.length; i++) {
          var addressType = place.address_components[i].types[0];
          if (componentForm[addressType]) {
            var val = place.address_components[i][componentForm[addressType]];
            document.getElementById(addressType).value = val;
          }
        }
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