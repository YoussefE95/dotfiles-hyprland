<script setup>
    import { getFlow, getMatrix, getRoute } from './script.js';
    import { reactive, onMounted } from 'vue';
    import leaflet from 'leaflet';

    let map;
    const data = reactive({
        origins: [
            {
                point: {
                    latitude: 34.019152,
                    longitude: -118.503969
                }
            },
        ],
        destinations: [
            {
                point: {
                    latitude: 34.066525,
                    longitude: -118.445333
                },
            },
            {
                point: {
                    latitude: 34.086671,
                    longitude: -118.405251
                },
            },
            {
                point: {
                    latitude: 34.012988,
                    longitude: -118.403482
                },
            },
            {
                point: {
                    latitude: 34.055399,
                    longitude: -118.393181
                }
            },
        ]
    });

    const initMap = () => {
        const streetMaps = 'https://tile.openstreetmap.org/{z}/{x}/{y}.png';
        const tomTom = 'https://api.tomtom.com/map/1/tile/sat/main/{z}/{x}/{y}.jpg?key=IixDo0rkv3xMZQTGgCpnzcGsW2kldjAe';

        map = leaflet.map('map').setView([34.02, -118.4600], 14);
        leaflet.tileLayer(tomTom, {
            maxZoom: 19
        }).addTo(map);
    };

    const plot = (point) => {
        leaflet.circleMarker(
            {
                lat: point.latitude,
                lng: point.longitude
            },
            {
                radius: 5,
                color: '#7cfc55',
                fill: true,
                fillOpacity: 1,
            }
        ).addTo(map);
    };

    onMounted(async () => {
        initMap();

        for (const destination of destinations) {
            const route = await getRoute(origins[0].point, destination.point);
            console.log(route.summary);

            for (const point of route.legs[0].points) {
                plot(point);
            }
        }

        map.on('click', async (event) => {
            const { lat, lng } = event.latlng;
            const flow = await getFlow(lat, lng);

            for (const coord of flow.coordinates.coordinate) {
                plot(coord);
            }
        });
    });
</script>

<template>
    <main>
        <div id="map"></div>
    </main>
</template>

<style scoped>
    #map {
        height: 98vh;
        width: 98vw;
    }
</style>
