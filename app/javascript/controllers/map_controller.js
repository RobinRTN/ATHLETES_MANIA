import { Controller } from "@hotwired/stimulus"
// import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {

    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/gabmonts/clav56enh00bq14ohwftavfrc"
    })

    this.#addMarkersToMap()

    if (this.markersValue.length > 1) {
      this.#fitMapToMarkers()}

    this.map.addControl(new mapboxgl.NavigationControl())
    this.#redirectToAthlete()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {

      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "cover"
      customMarker.style.backgroundPosition = "center"
      customMarker.style.borderRadius = "50%"
      customMarker.style.width = "50px"
      customMarker.style.height = "50px"
      customMarker.id = marker.id

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #redirectToAthlete() {
    const marker = document.querySelectorAll('.marker.mapboxgl-marker.mapboxgl-marker-anchor-center')
    const address = document.URL.split('?')[0]
    marker.forEach((div) => {
      div.addEventListener('click', (event) => {
      window.open(`${address}/${div.id}`);
    });
  });
}}
