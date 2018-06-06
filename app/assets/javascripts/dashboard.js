$(document).ready(() => {
  fetchPoliticalMatches();
});

const fetchPoliticalMatches = () => {
  fetch('api/v1/matches', {credentials: 'same-origin'})
    .then((response) => response.json())
    .then(data => {
      data.forEach(function(element) {
        $('#dashboard-matches').append(`
          <ul class="best-matches-card">
            <a href="/politicians/${element.model.id}">${element.model.title} ${element.model.first_name} ${element.model.last_name}</a>
            <li class="type">${element.profile.political_type}</li>
            <li class="preferred_party">${element.profile.preferred_party}</li>
            <li class="authority_rating">${element.profile.authority_rating}</li>
            <li class="social_rating">${element.profile.social_rating}</li>
            <li><h6>Overall Results:</h6></li>
            <ul class="overall">
                <li>${element.profile.overall}</li>
            </ul>
          </ul>`);
      })
    });
}
