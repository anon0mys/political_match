$(document).ready(() => {
  if(document.getElementById('dashboard-matches')) {
    fetchPoliticalMatches();
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
  drawGaugeChart()
}
