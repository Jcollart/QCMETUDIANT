// On initialise la latitude et la longitude de Paris (centre de la carte)
var lat = 49.77003;
var lon = 4.71955;
var macarte = null;
var geolocation = null;

var UserD = {
    Marker: null,
    feature: null,
    Latitude: 0,
    Longitude: 0
}

var Markers = [
    {
        lat: 49.76083,
        lng: 4.71370
    },
    {
        lat: 49.76019,
        lng: 4.71931
    },
    {
        lat: 49.76095,
        lng: 4.71582
    },
    {
        lat: 49.76243,
        lng: 4.71331
    },
    {
        lat: 49.76932,
        lng: 4.71931
    },
    {
        lat: 49.77305,
        lng: 4.71846
    },
    {
        lat: 49.76321,
        lng: 4.71908
    },
    {
        lat: 49.77253,
        lng: 4.72165
    },
    {
        lat: 49.77272,
        lng: 4.72145
    },
    {
        lat: 49.77573,
        lng: 4.72205
    },
    {
        lat: 49.77655,
        lng: 4.71974
    },
    {
        lat: 49.77083,
        lng: 4.71946
    },
    {
        lat: 49.77148,
        lng: 4.71953
    },
    {
        lat: 49.77301,
        lng: 4.72048
    },
    {
        lat: 49.77353,
        lng: 4.71985
    }
];

var attribution = new ol.control.Attribution({
    collapsible: false
});

// Fonction d'initialisation de la carte
function initMap() {
    macarte = new ol.Map({
        controls: ol.control.defaults({attribution: false}).extend([attribution]),
        target: 'map',
        layers: [
            new ol.layer.Tile({
                source: new ol.source.OSM()
            })
        ],
        view: new ol.View({
            center: ol.proj.fromLonLat([lon, lat]),
            zoom: 14
        })
    });
}

function createMarkers() {
    var features = [];

    for (var i = 0; i < Markers.length; i++) {
        var item = Markers[i];
        var longitude = item.lng;
        var latitude = item.lat;

        var iconFeature = new ol.Feature({
            geometry: new ol.geom.Point(ol.proj.transform([longitude, latitude], 'EPSG:4326', 'EPSG:3857'))
        });

        var iconStyle = new ol.style.Style({
            image: new ol.style.Icon(({
                anchor: [0.5, 1],
                src: "http://cdn.mapmarker.io/api/v1/pin?size=32&hoffset=1&background=DB2B39"
            }))
        });

        iconFeature.setStyle(iconStyle);
        features.push(iconFeature);

    }

    var vectorSource = new ol.source.Vector({
        features: features
    });

    var vectorLayer = new ol.layer.Vector({
        source: vectorSource
    });
    macarte.addLayer(vectorLayer);
}

function createUserMarker(User) {
    var features = [];

    var item = User;
    var longitude = item.lng;
    var latitude = item.lat;

    var iconFeature = new ol.Feature({
        geometry: new ol.geom.Point(ol.proj.transform([longitude, latitude], 'EPSG:4326', 'EPSG:3857'))
    });

    var iconStyle = new ol.style.Style({
        image: new ol.style.Icon(({
            anchor: [0.5, 1],
            src: "http://cdn.mapmarker.io/api/v1/pin?size=32&hoffset=1&background=00ABE7"
        }))
    });

    iconFeature.setStyle(iconStyle);
    features.push(iconFeature);


    var vectorSource = new ol.source.Vector({
        features: features
    });

    var vectorLayer = new ol.layer.Vector({
        source: vectorSource
    });

    UserD.Latitude = User.lat;
    UserD.Longitude = User.lon;
    UserD.Marker = vectorLayer;
    UserD.feature = iconFeature;

    macarte.addLayer(vectorLayer);
}

$(document).ready(function() {
    initMap();
    createMarkers();

    var view = new ol.View({
        center: [lon, lat],
        zoom: 2
    });

    geolocation = new ol.Geolocation({
        trackingOptions: {
            enableHighAccuracy: false
        },
        projection: view.getProjection()
    });

    geolocation.setTracking(true);

    createUserMarker({
        lat: lat,
        lng: lon
    })

    geolocation.on('change:position', function () {
        var coords = geolocation.position_;

        macarte.setView(new ol.View({
            center: ol.proj.fromLonLat([coords[0], coords[1]]),
            zoom: 16
        }));

        var pos = { longitude: coords[0], latitude: coords[1] }
        UserD.Latitude = pos.latitude;
        UserD.Longitude = pos.longitude;

        UserD.feature.setGeometry(new ol.geom.Point(geolocation.getPosition()));
    });
});