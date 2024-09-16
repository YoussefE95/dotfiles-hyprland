<script setup>
import { getFlow, getMatrix, getRoute } from './script.js';
import { reactive, onMounted } from 'vue';
import leaflet from 'leaflet';

let map;
const pointGroup = leaflet.layerGroup();
const origins = [
    {
        point: {
            latitude: 34.019929,
            longitude: -118.503893
        }
    }
];
const destinations = [
    // {
    //     point: {
    //         latitude: 34.100328,
    //         longitude: -118.675746
    //     }
    // },
    {
        point: {
            latitude: 34.077416,
            longitude: -118.563882
        }
    },
    {
        point: {
            latitude: 34.077882,
            longitude: -118.490596
        }
    },
    {
        point: {
            latitude: 34.004186,
            longitude: -118.373013
        }
    },
    {
        point: {
            latitude: 34.055399,
            longitude: -118.393181
        }
    }
];
const data = reactive({
    routes: [],
    routeColors: [
        '#8f00fc',
        '#93fc00',
        '#00fcc9',
        '#fc7500'
    ],
    currentRoute: 0
});

const initMap = () => {
    const streetMaps = leaflet.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19
    });
    const tomTom = leaflet.tileLayer('https://api.tomtom.com/map/1/tile/sat/main/{z}/{x}/{y}.jpg?key=IixDo0rkv3xMZQTGgCpnzcGsW2kldjAe', {
        maxZoom: 19
    });

    map = leaflet.map('map', {
        zoom: 13.5,
        center: [34.04, -118.4600],
        layers: [tomTom, pointGroup]
    });
};

const plot = (point, color) => {
    leaflet.circleMarker(
        {
            lat: point.latitude,
            lng: point.longitude
        },
        {
            radius: 5,
            color,
            fill: true,
            fillOpacity: 1,
        }
    ).addTo(pointGroup);
};

const clear = () => {
    pointGroup.clearLayers();
};

const plotCurrentRoute = () => {
    clear();

    for (const point of data.routes[data.currentRoute].legs[0].points) {
        plot(point, data.routeColors[data.currentRoute]);
    }

    if (data.currentRoute === data.routes.length - 1) {
        data.currentRoute = 0;
    } else {
        data.currentRoute++;
    }
};

const plotAllRoutes = () => {
    clear();

    for (let i = 0; i < data.routes.length; i++) {
        for (const point of data.routes[i].legs[0].points) {
            plot(point, data.routeColors[i]);
        }
    }
};

onMounted(async () => {
    initMap();

    for (const destination of destinations) {
        data.routes.push(await getRoute(origins[0].point, destination.point));
    }

    map.on('click', async (event) => {
        const { lat, lng } = event.latlng;
        const flow = await getFlow(lat, lng);

        clear();

        for (const coord of flow.coordinates.coordinate) {
            plot(coord, '#8f00fc');
        }
    });
});
</script>

<template>
    <main>
        <button @click="plotAllRoutes">Plot Routes</button>
        <button @click="clear">Clear</button>
        <div id="map"></div>
    </main>
</template>

<style scoped>
#map {
    height: 98vh;
    width: 98vw;
}
</style>
