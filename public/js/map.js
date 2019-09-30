// On initialise la latitude et la longitude de Paris (centre de la carte)
var lat = 49.77003;
var lon = 4.71955;
var macarte = null;
var geolocation = null;
var MarkerLayer = null;

var UserD = {
    Marker: null,
    feature: null,
    Latitude: 0,
    Longitude: 0
}

var Markers = [
    {
        question_id: 44,
        lat: 49.76083,
        lng: 4.71370
    },
    {
        question_id: 45,
        lat: 49.76019,
        lng: 4.71931
    },
    {
        question_id: 46,
        lat: 49.76095,
        lng: 4.71582
    },
    {
        question_id: 47,
        lat: 49.76243,
        lng: 4.71331
    },
    {
        question_id: 48,
        lat: 49.76932,
        lng: 4.71931
    },
    {
        question_id: 49,
        lat: 49.77305,
        lng: 4.71846
    },
    {
        question_id: 50,
        lat: 49.76321,
        lng: 4.71908
    },
    {
        question_id: 51,
        lat: 49.77253,
        lng: 4.72165
    },
    {
        question_id: 52,
        lat: 49.77272,
        lng: 4.72145
    },
    {
        question_id: 53,
        lat: 49.77573,
        lng: 4.72205
    },
    {
        question_id: 54,
        lat: 49.77655,
        lng: 4.71974
    },
    {
        question_id: 55,
        lat: 49.77083,
        lng: 4.71946
    },
    {
        question_id: 56,
        lat: 49.77148,
        lng: 4.71953
    },
    {
        question_id: 57,
        lat: 49.77301,
        lng: 4.72048
    },
    {
        question_id: 58,
        lat: 49.77353,
        lng: 4.71985
    }
];

var attribution = new ol.control.Attribution({
    collapsible: false
});

function calcCrow(lat1, lon1, lat2, lon2) {
    var R = 6371; // km
    var dLat = toRad(lat2 - lat1);
    var dLon = toRad(lon2 - lon1);
    var lat1 = toRad(lat1);
    var lat2 = toRad(lat2);

    var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
        Math.sin(dLon / 2) * Math.sin(dLon / 2) * Math.cos(lat1) * Math.cos(lat2);
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    var d = R * c;
    return d;
}

function toRad(Value) {
    return Value * Math.PI / 180;
}

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

        Markers[i].Marker = iconFeature;
    }

    var vectorSource = new ol.source.Vector({
        features: features
    });

    var vectorLayer = new ol.layer.Vector({
        source: vectorSource
    });

    MarkerLayer = vectorLayer;
    macarte.addLayer(vectorLayer);
}

function deleteMarker(QuestionId) {
    var mDatas;
    for (var i = 0; i < Markers.length; i++) {
        var item = Markers[i];

        if (item.question_id == QuestionId) {
            mDatas = Markers[i];
        }
    }

    if (mDatas) {
        
    }
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

function checkDistance(QuestionId) {
    var mDatas;
    for (var i = 0; i < Markers.length; i++) {
        var item = Markers[i];
        
        if (item.question_id == QuestionId) {
            mDatas = Markers[i];
        }
    }

    if (mDatas) {
        var distance = calcCrow(mDatas.lat, mDatas.lng, UserD.Latitude, UserD.Longitude) * 1000
        return distance;
    }
}

$(document).keypress(function() {
    checkDistance(45);
});

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