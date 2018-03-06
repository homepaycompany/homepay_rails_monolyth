import waypoints from 'waypoints/lib/noframework.waypoints.js';

// Javascript to add animation effects from animate.css library
function fadeInUp(item) {
  item.classList.remove('hidden');
  item.classList.add('animated', 'fadeInUp');
}

// Javascript to launch animation effects when scrolling to identified sections
function waypoint() {
  if (document.querySelector('#js-value-prop-sale')) {
    const realEstateWaypoint = new Waypoint({
      element: document.querySelector('#js-value-prop-sale'),
      handler: function() {
        const valuePropSale = document.querySelector('#js-value-prop-sale');
        const valuePropMove = document.querySelector('#js-value-prop-move');
        const valuePropCertainty = document.querySelector('#js-value-prop-certainty');
        fadeInUp(valuePropSale);
        fadeInUp(valuePropMove);
        fadeInUp(valuePropCertainty);
      },
      offset: 0
    })

  }
}

export { waypoint };
