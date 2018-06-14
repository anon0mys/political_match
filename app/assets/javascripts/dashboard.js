$(document).ready(() => {
  if(document.getElementsByClassName('summary')) {
    fetchPoliticalMatches();
    fetchProfileData();
    draw_gauge_charts();
  }
});

const fetchPoliticalMatches = () => {
  fetch('api/v1/matches', {credentials: 'same-origin'})
    .then((response) => response.json())
    .then(data => {
      data.forEach(function(element) {
        $('#dashboard-matches').append(`
          <ul class="best-matches-card">
            <a href="/politicians/${element.model.id}">${element.model.title} ${element.model.first_name} ${element.model.last_name}</a>
            <li class="type">Political Type: ${element.profile.political_type}</li>
            <li class="preferred_party">Preferred Party: ${element.profile.preferred_party}</li>
          </ul>`);
      })
    });
}

const draw_gauge_charts = () => {
  auth_attrs = {
    data: parseFloat($('#authority').text()),
    location: '#auth-chart',
    title: 'Authority Affinity'
  }
  soc_attrs = {
    data: parseFloat($('#social').text()),
    location: '#soc-chart',
    title: 'Social Affinity'
  }
  gauge_chart(auth_attrs);
  gauge_chart(soc_attrs);
}
