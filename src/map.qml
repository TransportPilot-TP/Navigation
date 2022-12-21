import QtQuick 2.15
import QtLocation 5.6
import QtPositioning 5.6
Rectangle {
    property double oldLat: 25.6585
    property double oldLng: 100.3658

    Plugin {
        id: mapPlugin
        name: "mapboxgl"
        PluginParameter { name: "mapboxgl.access_token"; value: "sk.eyJ1IjoiYmxja2xwdG4iLCJhIjoiY2xieGlyZmJmMTdrNTNvbnl0OWYwcjhxeCJ9.Qpps7mP0HL8C1Oo0d5p2tQ" }
        PluginParameter { name: "mapboxgl.mapping.use_fbo"; value: true}
        PluginParameter {name: "mapboxgl.mapping.items.insert_before"; value: "aerialway"}
        PluginParameter {
                    name: "mapboxgl.mapping.additional_style_urls";
                    value: "mapbox://styles/blcklptn/clbxjvf51000u14pceor4nohh/"
                }

    }

    Map {
        id: mapView
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(oldLat, oldLng);
        zoomLevel: 15
    }

    function setCenter(lat, lng){
        mapView.pan(oldLat - lat, oldLng - lng)
        oldLat = lat
        oldLng = lng
    }

}
