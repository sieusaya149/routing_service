## About Project
In this project, we have one Docker Compose file to manage three routing services:
* OSRM (Run with port: 8081)
* GraphHopper (Run with port: 8989)
* Open Route Service (Run with port: 8080)

With this project, we already used data from the Pennsylvania area. After starting Docker Compose, you can test getting route information from two points. You can test this with these two points:
* Start point: 40.31429910418606,-75.12132799635184
* End point: 40.3144394441488,-75.12988230830727
## Start Docker
    docker compose up    
## Test OSRM Service
    curl 'http://localhost:8081/route/v1/driving/-75.12132799635184,40.31429910418606;-75.12988230830727,40.3144394441488?overview=false&alternatives=true&steps=true'
## Test GraphHopper Service
    curl 'http://localhost:8989/route?point=40.31429910418606,-75.12132799635184&point=40.3144394441488,-75.12988230830727&type=json&profile=car&locale=de&calc_points=true'
## Test Open Route Service
    curl 'http://localhost:8080/ors/v2/directions/driving-car?start=-75.12132799635184,40.31429910418606&end=-75.12988230830727,40.3144394441488'


