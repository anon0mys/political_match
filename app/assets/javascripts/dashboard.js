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
          <div class="best-matches-card">
            <div class="matches-bg-bar"></div>
            <div class="politician-image" id="${element.model.propublica_id}">
              <span class="politician-image-id">${element.model.propublica_id}</span>
            </div>
            <ul class="matches-info">
              <a href="/politicians/${element.model.id}">${element.model.title} ${element.model.first_name} ${element.model.last_name}</a>
              <li class="type">Type: ${element.profile.political_type}</li>
              <li class="preferred_party">Preferred Party: ${element.profile.preferred_party}</li>
            </ul>
            <div class="gauge-charts">
              <div id="auth-chart-${element.model.id}"></div>
              <div id="soc-chart-${element.model.id}"></div>
            </div>
          </div>`);
        auth_attrs = {
          data: element.profile.authority_rating,
          location: `#auth-chart-${element.model.id}`,
          title: 'Authority Affinity'
        };
        soc_attrs = {
          data: element.profile.social_rating,
          location: `#soc-chart-${element.model.id}`,
          title: 'Social Affinity'
        };
        gauge_chart(auth_attrs);
        gauge_chart(soc_attrs);
      })
      fetchPoliticianPictures();
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
