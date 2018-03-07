function validateAddress () {
  console.log('hello')
  const f = document.getElementById('js-form-address');
  f.querySelector('.form-submit').addEventListener('click', (e) => {
    e.preventDefault();
    const i = f.querySelector('#real_estate_property_address').value;
    googleGeocoder(i)
  })
}

function googleGeocoder (address) {
  var geocoder = new google.maps.Geocoder()
  geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == 'OK') {
      console.log(results)
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}

export { validateAddress }
